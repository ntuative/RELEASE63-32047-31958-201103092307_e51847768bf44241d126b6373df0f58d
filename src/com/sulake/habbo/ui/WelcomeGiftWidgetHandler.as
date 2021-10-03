package com.sulake.habbo.ui
{
   import com.sulake.habbo.communication.messages.outgoing.room.furniture.OpenWelcomeGiftComposer;
   import com.sulake.habbo.session.events.RoomSessionWelcomeGiftEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetEmailUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWelcomeGiftUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChangeEmailMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniActionMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   
   public class WelcomeGiftWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      public function WelcomeGiftWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._container = null;
            this._disposed = true;
         }
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_534;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetFurniActionMessage.const_763);
         _loc1_.push(RoomWidgetChangeEmailMessage.const_644);
         return _loc1_;
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionWelcomeGiftEvent.const_116];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!param1)
         {
            return null;
         }
         switch(param1.type)
         {
            case RoomWidgetFurniActionMessage.const_763:
               _loc2_ = param1 as RoomWidgetFurniActionMessage;
               this._container.connection.send(new OpenWelcomeGiftComposer(_loc2_.furniId));
               break;
            case RoomWidgetChangeEmailMessage.const_644:
               _loc3_ = Math.random() > 0.5 ? "null" : RoomWidgetEmailUpdateEvent.const_542;
               _loc4_ = new RoomWidgetEmailUpdateEvent(_loc3_);
               this._container.events.dispatchEvent(_loc4_);
         }
         return null;
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         switch(param1.type)
         {
            case RoomSessionWelcomeGiftEvent.const_116:
               _loc2_ = param1 as RoomSessionWelcomeGiftEvent;
               _loc3_ = new RoomWidgetWelcomeGiftUpdateEvent();
               _loc3_.email = _loc2_.email;
               _loc3_.isVerified = _loc2_.isVerified;
               _loc3_.allowEmailChange = _loc2_.allowEmailChange;
               _loc3_.furniId = _loc2_.furniId;
               this._container.events.dispatchEvent(_loc3_);
         }
      }
      
      public function update() : void
      {
      }
   }
}
