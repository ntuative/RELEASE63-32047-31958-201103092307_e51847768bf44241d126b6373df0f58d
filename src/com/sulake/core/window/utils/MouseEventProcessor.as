package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContextStateListener;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.enum.MouseCursorType;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MouseEventProcessor implements IEventProcessor, IDisposable
   {
      
      protected static var var_325:Array;
      
      protected static var var_280:Array;
       
      
      protected var var_654:Point;
      
      protected var var_168:WindowController;
      
      protected var var_73:WindowController;
      
      protected var var_165:IWindowRenderer;
      
      protected var var_138:IDesktopWindow;
      
      protected var var_1508:IMouseCursor;
      
      protected var var_805:IWindowContextStateListener;
      
      private var _disposed:Boolean = false;
      
      public function MouseEventProcessor(param1:IMouseCursor)
      {
         super();
         this.var_654 = new Point();
         this.var_1508 = param1;
         if(var_325 == null)
         {
            var_325 = new Array();
            var_325[0] = MouseCursorType.const_290;
            var_325[1] = MouseCursorType.const_31;
            var_325[2] = MouseCursorType.const_290;
            var_325[3] = MouseCursorType.const_290;
            var_325[4] = MouseCursorType.const_290;
            var_325[5] = MouseCursorType.const_31;
            var_325[6] = MouseCursorType.const_290;
         }
         if(var_280 == null)
         {
            var_280 = new Array();
            var_280[0] = WindowState.const_106;
            var_280[1] = WindowState.const_81;
            var_280[2] = WindowState.const_97;
            var_280[3] = WindowState.const_64;
            var_280[4] = WindowState.const_55;
            var_280[5] = WindowState.const_95;
            var_280[6] = WindowState.const_84;
         }
      }
      
      public static function setMouseCursorByState(param1:uint, param2:uint) : void
      {
         var _loc3_:int = var_280.indexOf(param1);
         if(_loc3_ > -1)
         {
            var_325[_loc3_] = param2;
         }
      }
      
      public static function getMouseCursorByState(param1:uint) : uint
      {
         var _loc2_:int = 0;
         while(_loc2_-- > 0)
         {
            if((param1 & 0) > 0)
            {
               return var_325[_loc2_];
            }
         }
         return MouseCursorType.const_31;
      }
      
      protected static function convertMouseEventType(param1:MouseEvent, param2:IWindow, param3:IWindow) : WindowMouseEvent
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         _loc5_ = new Point(param1.stageX,param1.stageY);
         param2.convertPointFromGlobalToLocalSpace(_loc5_);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_MOVE:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_OVER:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_OUT:
               _loc4_ = "null";
               break;
            case MouseEvent.ROLL_OUT:
               _loc4_ = "null";
               break;
            case MouseEvent.ROLL_OVER:
               _loc4_ = "null";
               break;
            case MouseEvent.CLICK:
               _loc4_ = "null";
               break;
            case MouseEvent.DOUBLE_CLICK:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_UP:
               _loc6_ = _loc5_.x > -1 && _loc5_.y > -1 && _loc5_.x < param2.width && _loc5_.y < param2.height;
               _loc4_ = !!_loc6_ ? "null" : WindowMouseEvent.const_182;
               break;
            case MouseEvent.MOUSE_WHEEL:
               _loc4_ = "null";
               break;
            default:
               _loc4_ = "null";
         }
         return new WindowMouseEvent(_loc4_,param2,param3,_loc5_.x,_loc5_.y,param1.stageX,param1.stageY,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown,param1.delta,false,true);
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
         }
      }
      
      public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var event:MouseEvent = null;
         var index:int = 0;
         var child:WindowController = null;
         var array:Array = null;
         var temp:IWindow = null;
         var state:EventProcessorState = param1;
         var eventQueue:IEventQueue = param2;
         this.var_138 = state.desktop;
         this.var_73 = state.var_1234 as WindowController;
         this.var_168 = state.var_1238 as WindowController;
         this.var_165 = state.renderer;
         this.var_805 = state.var_1237;
         eventQueue.begin();
         var point:Point = new Point();
         this.var_654.x = -1;
         this.var_654.y = -1;
         while(true)
         {
            event = eventQueue.next() as MouseEvent;
            if(event == null)
            {
               break;
            }
            if(event.stageX != this.var_654.x || event.stageY != this.var_654.y)
            {
               this.var_654.x = event.stageX;
               this.var_654.y = event.stageY;
               array = new Array();
               this.var_138.groupParameterFilteredChildrenUnderPoint(this.var_654,array,WindowParam.const_30);
            }
            index = array != null ? int(array.length) : 0;
            this.var_1508.type = MouseCursorType.const_31;
            if(index == 0)
            {
               if(event.type == MouseEvent.MOUSE_MOVE)
               {
                  if(this.var_73 != this.var_138 && !this.var_73.disposed)
                  {
                     this.var_73.getGlobalPosition(point);
                     this.var_73.update(this.var_73,new WindowMouseEvent(WindowMouseEvent.WINDOW_EVENT_MOUSE_OUT,this.var_73,null,event.stageX - point.x,event.stageY - point.y,event.stageX,event.stageY,event.altKey,event.ctrlKey,event.shiftKey,event.buttonDown,event.delta));
                     this.var_73 = WindowController(this.var_138);
                  }
               }
            }
            while(--index > -1)
            {
               child = this.passMouseEvent(WindowController(array[index]),event);
               if(child != null && child.visible)
               {
                  if(event.type == MouseEvent.MOUSE_MOVE)
                  {
                     if(child != this.var_73)
                     {
                        if(!this.var_73.disposed)
                        {
                           this.var_73.getGlobalPosition(point);
                           this.var_73.update(this.var_73,new WindowMouseEvent(WindowMouseEvent.WINDOW_EVENT_MOUSE_OUT,this.var_73,child,event.stageX - point.x,event.stageY - point.y,event.stageX,event.stageY,event.altKey,event.ctrlKey,event.shiftKey,event.buttonDown,event.delta));
                        }
                        if(!child.disposed)
                        {
                           child.getGlobalPosition(point);
                           child.update(child,new WindowMouseEvent(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,child,null,event.stageX - point.x,event.stageY - point.y,event.stageX,event.stageY,event.altKey,event.ctrlKey,event.shiftKey,event.buttonDown,event.delta));
                        }
                        if(!child.disposed)
                        {
                           this.var_73 = child;
                        }
                     }
                  }
                  else if(event.type == MouseEvent.MOUSE_UP || event.type == MouseEvent.CLICK)
                  {
                     if(this.var_73 && !this.var_73.disposed)
                     {
                        if(this.var_805 != null)
                        {
                           this.var_805.mouseEventReceived(event.type,this.var_73);
                        }
                     }
                  }
                  temp = child.parent;
                  while(temp && !temp.disposed)
                  {
                     if(temp is IInputProcessorRoot)
                     {
                        IInputProcessorRoot(temp).process(convertMouseEventType(event,temp,child));
                        break;
                     }
                     temp = temp.parent;
                  }
                  if(event.altKey)
                  {
                     if(this.var_73)
                     {
                        Logger.log("HOVER: " + this.var_73.name);
                     }
                  }
                  if(this.var_73 is IInteractiveWindow)
                  {
                     try
                     {
                        this.var_1508.type = getMouseCursorByState(this.var_73.state);
                     }
                     catch(e:Error)
                     {
                        var_1508.type = MouseCursorType.const_31;
                     }
                  }
                  if(child != this.var_138)
                  {
                     event.stopPropagation();
                     eventQueue.remove();
                  }
                  break;
               }
            }
         }
         eventQueue.end();
         state.desktop = this.var_138;
         state.var_1234 = this.var_73;
         state.var_1238 = this.var_168;
         state.renderer = this.var_165;
         state.var_1237 = this.var_805;
      }
      
      private function passMouseEvent(param1:WindowController, param2:MouseEvent, param3:Boolean = false) : WindowController
      {
         if(param1.disposed)
         {
            return null;
         }
         if(param1.testStateFlag(WindowState.const_84))
         {
            return null;
         }
         var _loc4_:Point = new Point(param2.stageX,param2.stageY);
         param1.convertPointFromGlobalToLocalSpace(_loc4_);
         if(param2.type == MouseEvent.MOUSE_UP)
         {
            if(param1 != this.var_168)
            {
               if(this.var_168 && !this.var_168.disposed)
               {
                  this.var_168.update(this.var_168,convertMouseEventType(new MouseEvent(MouseEvent.MOUSE_UP,false,true,param2.localX,param2.localY,null,param2.ctrlKey,param2.altKey,param2.shiftKey,param2.buttonDown,param2.delta),this.var_168,param1));
                  this.var_168 = null;
               }
            }
         }
         var _loc5_:BitmapData = this.var_165.getDrawBufferForRenderable(param1);
         if(!param1.validateLocalPointIntersection(_loc4_,_loc5_))
         {
            return null;
         }
         if(param1.testParamFlag(WindowParam.const_545))
         {
            if(param1.parent != null)
            {
               return this.passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         if(!param3)
         {
            switch(param2.type)
            {
               case MouseEvent.MOUSE_DOWN:
                  this.var_168 = param1;
                  break;
               case MouseEvent.CLICK:
                  if(this.var_168 != param1)
                  {
                     return null;
                  }
                  this.var_168 = null;
                  break;
               case MouseEvent.DOUBLE_CLICK:
                  if(this.var_168 != param1)
                  {
                     return null;
                  }
                  this.var_168 = null;
                  break;
            }
         }
         if(!param1.update(param1,convertMouseEventType(param2,param1,null)) && !param3)
         {
            if(param1.parent)
            {
               return this.passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         return param1;
      }
   }
}
