package com.sulake.habbo.widget.avatarinfo
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class AvatarInfoView
   {
       
      
      private var _window:IWindowContainer;
      
      private var _widget:AvatarInfoWidget;
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2245:Boolean;
      
      private var _userType:int;
      
      private var var_2244:int;
      
      public function AvatarInfoView(param1:AvatarInfoWidget, param2:int, param3:String, param4:int, param5:int, param6:Boolean = false)
      {
         super();
         this._widget = param1;
         this._userId = param2;
         this._userName = param3;
         this._userType = param5;
         this.var_2244 = param4;
         this.var_2245 = param6;
      }
      
      public function dispose() : void
      {
         this._widget = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      private function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      private function createWindow() : void
      {
         if(!this._widget || !this._widget.assets || !this._widget.windowManager)
         {
            return;
         }
         var _loc1_:XmlAsset = this._widget.assets.getAssetByName("avatar_info_widget") as XmlAsset;
         if(!_loc1_)
         {
            return;
         }
         this._window = this._widget.windowManager.buildFromXML(_loc1_.content as XML,0) as IWindowContainer;
         if(!this._window)
         {
            return;
         }
         var _loc2_:IWindow = this._window.findChildByName("name");
         _loc2_.caption = this._userName;
         this.setImageAsset(this._window.findChildByName("pointer") as IBitmapWrapperWindow,"arrow_down_gray");
         this.setImageAsset(this._window.findChildByName("pen_icon") as IBitmapWrapperWindow,"edit_pen_icon");
         if(!this.var_2245)
         {
            this._window.findChildByName("change_name_container").visible = false;
            this._window.findChildByName("border").height = 22;
            this._window.findChildByName("border").width = _loc2_.width + 16;
         }
         else
         {
            this.addMouseClickListener(this._window.findChildByName("change_name_container"),this.clickHandler);
         }
         this._window.visible = false;
      }
      
      private function clickHandler(param1:WindowMouseEvent) : void
      {
         this._widget.messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_707));
         this._widget.disposeView();
      }
      
      public function setImageAsset(param1:IBitmapWrapperWindow, param2:String) : void
      {
         if(!param1 || !this._widget || !this._widget.assets)
         {
            return;
         }
         var _loc3_:BitmapDataAsset = this._widget.assets.getAssetByName(param2) as BitmapDataAsset;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         if(!_loc4_)
         {
            return;
         }
         if(param1.bitmap)
         {
            param1.bitmap.dispose();
         }
         param1.bitmap = new BitmapData(param1.width,param1.height,true,0);
         param1.bitmap.draw(_loc4_);
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userType() : int
      {
         return this._userType;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2244;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function show() : void
      {
         if(this._window != null)
         {
            this._window.visible = true;
            this._window.activate();
         }
      }
      
      public function update(param1:Rectangle, param2:Number) : void
      {
         if(!param1)
         {
            return;
         }
         if(!this._window)
         {
            this.createWindow();
         }
         if(!this._window)
         {
            return;
         }
         var _loc3_:int = param1.height > 50 ? 25 : 0;
         this._window.x = param1.left + param1.width / 2 - this._window.width / 2;
         this._window.y = param1.top - this._window.height + _loc3_;
         this._window.blend = param2;
         this.show();
      }
   }
}
