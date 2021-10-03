package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_548:uint = 0;
      
      public static const const_1569:uint = 1;
      
      public static const const_1918:int = 0;
      
      public static const const_1911:int = 1;
      
      public static const const_1805:int = 2;
      
      public static const const_1917:int = 3;
      
      public static const const_1644:int = 4;
      
      public static const const_357:int = 5;
      
      public static var var_1235:IMouseCursor;
      
      public static var var_383:IEventQueue;
      
      private static var var_600:IEventProcessor;
      
      private static var var_1793:uint = const_548;
      
      private static var stage:Stage;
      
      private static var var_165:IWindowRenderer;
       
      
      private var var_2485:EventProcessorState;
      
      private var var_2486:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_187:DisplayObjectContainer;
      
      protected var var_2834:Boolean = true;
      
      protected var var_1255:Error;
      
      protected var var_2017:int = -1;
      
      protected var var_1254:IInternalWindowServices;
      
      protected var var_1509:IWindowParser;
      
      protected var var_2775:IWindowFactory;
      
      protected var var_138:IDesktopWindow;
      
      protected var var_1510:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_535:Boolean = false;
      
      private var var_2487:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_165 = param2;
         this._localization = param4;
         this.var_187 = param5;
         this.var_1254 = new ServiceManager(this,param5);
         this.var_2775 = param3;
         this.var_1509 = new WindowParser(this);
         this.var_2486 = param7;
         if(!stage)
         {
            if(this.var_187 is Stage)
            {
               stage = this.var_187 as Stage;
            }
            else if(this.var_187.stage)
            {
               stage = this.var_187.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_138 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_187.addChild(this.var_138.getDisplayObject());
         this.var_187.doubleClickEnabled = true;
         this.var_187.addEventListener(Event.RESIZE,this.stageResizedHandler);
         if(var_1235 == null)
         {
            var_1235 = new MouseCursorControl(this.var_187);
         }
         this.var_2485 = new EventProcessorState(var_165,this.var_138,this.var_138,null,this.var_2486);
         inputMode = const_548;
         this.var_1510 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1793;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_383)
         {
            if(var_383 is IDisposable)
            {
               IDisposable(var_383).dispose();
            }
         }
         if(var_600)
         {
            if(var_600 is IDisposable)
            {
               IDisposable(var_600).dispose();
            }
         }
         switch(value)
         {
            case const_548:
               var_383 = new MouseEventQueue(stage);
               var_600 = new MouseEventProcessor(var_1235);
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1569:
               var_383 = new TabletEventQueue(stage);
               var_600 = new TabletEventProcessor(var_1235);
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_548;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_187.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_187.removeChild(IGraphicContextHost(this.var_138).getGraphicContext(true) as DisplayObject);
            this.var_138.destroy();
            this.var_138 = null;
            this.var_1510.destroy();
            this.var_1510 = null;
            if(this.var_1254 is IDisposable)
            {
               IDisposable(this.var_1254).dispose();
            }
            this.var_1254 = null;
            this.var_1509.dispose();
            this.var_1509 = null;
            var_165 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1255;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2017;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1255 = param2;
         this.var_2017 = param1;
         if(this.var_2834)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1255 = null;
         this.var_2017 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1254;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1509;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2775;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_138;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_138.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1644,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1510;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_138,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_138)
         {
            this.var_138 = null;
         }
         if(param1.state != WindowState.const_568)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_165.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_535 = true;
         if(this.var_1255)
         {
            throw this.var_1255;
         }
         var_600.process(this.var_2485,var_383);
         this.var_535 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2487 = true;
         var_165.update(param1);
         this.var_2487 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_138 != null && !this.var_138.disposed)
         {
            if(this.var_187 is Stage)
            {
               this.var_138.width = Stage(this.var_187).stageWidth;
               this.var_138.height = Stage(this.var_187).stageHeight;
            }
            else
            {
               this.var_138.width = this.var_187.width;
               this.var_138.height = this.var_187.height;
            }
         }
      }
   }
}
