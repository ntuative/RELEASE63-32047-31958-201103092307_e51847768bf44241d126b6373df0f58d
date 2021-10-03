package com.sulake.habbo.widget.doorbell
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetDoorbellEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetLetUserInMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class DoorbellWidget extends RoomWidgetBase
   {
      
      private static const const_1298:int = 50;
       
      
      private var _users:Array;
      
      private var var_17:DoorbellView;
      
      public function DoorbellWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager)
      {
         super(param1,param2,param3);
         this.var_17 = new DoorbellView(this);
         this._users = [];
      }
      
      override public function get mainWindow() : IWindow
      {
         return this.var_17.mainWindow;
      }
      
      public function get users() : Array
      {
         return this._users;
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(this.var_17)
         {
            this.var_17.dispose();
            this.var_17 = null;
         }
         this._users = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetDoorbellEvent.const_825,this.onDoorbellRinging);
         param1.addEventListener(RoomWidgetDoorbellEvent.const_149,this.onDoorbellHandled);
         param1.addEventListener(RoomWidgetDoorbellEvent.const_46,this.onDoorbellHandled);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetDoorbellEvent.const_825,this.onDoorbellRinging);
         param1.removeEventListener(RoomWidgetDoorbellEvent.const_149,this.onDoorbellHandled);
         param1.removeEventListener(RoomWidgetDoorbellEvent.const_46,this.onDoorbellHandled);
      }
      
      private function onDoorbellRinging(param1:RoomWidgetDoorbellEvent) : void
      {
         this.addUser(param1.userName);
      }
      
      private function onDoorbellHandled(param1:RoomWidgetDoorbellEvent) : void
      {
         this.removeUser(param1.userName);
      }
      
      public function addUser(param1:String) : void
      {
         if(this._users.indexOf(param1) != -1)
         {
            return;
         }
         if(this._users.length >= const_1298)
         {
            this.deny(param1);
            return;
         }
         this._users.push(param1);
         this.var_17.update();
      }
      
      public function removeUser(param1:String) : void
      {
         var _loc2_:int = this._users.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         this._users.splice(_loc2_,1);
         this.var_17.update();
      }
      
      public function accept(param1:String) : void
      {
         var _loc2_:RoomWidgetLetUserInMessage = new RoomWidgetLetUserInMessage(param1,true);
         messageListener.processWidgetMessage(_loc2_);
         this.removeUser(param1);
      }
      
      public function deny(param1:String) : void
      {
         var _loc2_:RoomWidgetLetUserInMessage = new RoomWidgetLetUserInMessage(param1,false);
         messageListener.processWidgetMessage(_loc2_);
         this.removeUser(param1);
      }
      
      public function denyAll() : void
      {
         while(this._users.length > 0)
         {
            this.deny(this._users[0]);
         }
      }
   }
}
