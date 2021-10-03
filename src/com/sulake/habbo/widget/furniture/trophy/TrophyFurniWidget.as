package com.sulake.habbo.widget.furniture.trophy
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetTrophyDataUpdateEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class TrophyFurniWidget extends RoomWidgetBase
   {
      
      private static const const_1715:Array = new Array("gold","silver","bronze");
      
      private static const const_1279:Number = 100;
      
      private static const const_1278:Number = 100;
       
      
      private var _window:IFrameWindow;
      
      private var _name:String;
      
      private var var_2380:String;
      
      private var _message:String = null;
      
      private var _color:Number;
      
      public function TrophyFurniWidget(param1:IHabboWindowManager, param2:IAssetLibrary = null)
      {
         super(param1,param2);
         this.mainWindow;
         this.hideInterface();
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         this.hideInterface();
         if(this._window != null && !this._window.disposed)
         {
            this._window.dispose();
            this._window = null;
         }
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetTrophyDataUpdateEvent.const_733,this.onObjectUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetTrophyDataUpdateEvent.const_733,this.onObjectUpdate);
      }
      
      private function onObjectUpdate(param1:RoomWidgetTrophyDataUpdateEvent) : void
      {
         this.hideInterface();
         this._name = param1.name;
         this.var_2380 = param1.date;
         this._message = param1.message;
         this._color = param1.color;
         this.showInterface();
      }
      
      private function showInterface() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:IFrameWindow = this.mainWindow as IFrameWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc2_ = _loc1_.findChildByTag("close");
         if(_loc2_ != null)
         {
            _loc2_.procedure = this.onWindowClose;
         }
         _loc3_ = _loc1_.findChildByName("greeting") as ITextWindow;
         if(_loc3_ != null)
         {
            this._message = this._message.replace(/\\r/g,"\n");
            _loc3_.text = this._message;
            _loc3_.procedure = this.onWindowClose;
         }
         _loc3_ = _loc1_.findChildByName("date") as ITextWindow;
         if(_loc3_ != null)
         {
            _loc3_.text = this.var_2380;
         }
         _loc3_ = _loc1_.findChildByName("name") as ITextWindow;
         if(_loc3_ != null)
         {
            _loc3_.text = this._name;
         }
         _loc1_.visible = true;
      }
      
      override public function get mainWindow() : IWindow
      {
         var _loc1_:* = null;
         if(this._window == null)
         {
            _loc1_ = assets.getAssetByName("trophy") as XmlAsset;
            if(_loc1_ == null)
            {
               return null;
            }
            this._window = windowManager.buildFromXML(_loc1_.content as XML) as IFrameWindow;
         }
         return this._window;
      }
      
      private function hideInterface() : void
      {
         if(this._window != null)
         {
            this._window.visible = false;
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInterface();
      }
   }
}
