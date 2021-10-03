package com.sulake.habbo.widget.events
{
   public class RoomWidgetUserNotificationEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_424:String = "RWUNE_NOTIFICATION";
       
      
      private var _title:String;
      
      private var _message:String;
      
      private var var_1293:Array;
      
      public function RoomWidgetUserNotificationEvent(param1:String = null)
      {
         super(param1 != null ? param1 : const_424);
      }
      
      public function set title(param1:String) : void
      {
         this._title = param1;
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function set message(param1:String) : void
      {
         this._message = param1;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function set parameters(param1:Array) : void
      {
         this.var_1293 = param1;
      }
      
      public function get parameters() : Array
      {
         return this.var_1293;
      }
   }
}
