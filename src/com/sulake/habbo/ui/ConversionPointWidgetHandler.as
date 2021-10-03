package com.sulake.habbo.ui
{
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetConversionPointMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   
   public class ConversionPointWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var var_693:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      public function ConversionPointWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this.var_693;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_118;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
      }
      
      public function dispose() : void
      {
         this.var_693 = true;
         this._container = null;
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetConversionPointMessage.const_692];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case RoomWidgetConversionPointMessage.const_692:
               _loc2_ = param1 as RoomWidgetConversionPointMessage;
               if(_loc2_ == null)
               {
                  return null;
               }
               this._container.roomSession.sendConversionPoint(_loc2_.category,_loc2_.pointType,_loc2_.action,_loc2_.extra);
               break;
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function update() : void
      {
      }
   }
}
