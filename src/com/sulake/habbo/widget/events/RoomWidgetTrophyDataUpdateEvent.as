package com.sulake.habbo.widget.events
{
   public class RoomWidgetTrophyDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_733:String = "RWTDUE_TROPHY_DATA";
       
      
      private var _color:Number;
      
      private var _name:String;
      
      private var var_2380:String;
      
      private var _message:String;
      
      public function RoomWidgetTrophyDataUpdateEvent(param1:String, param2:Number, param3:String, param4:String, param5:String, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this._color = param2;
         this._name = param3;
         this.var_2380 = param4;
         this._message = param5;
      }
      
      public function get color() : Number
      {
         return this._color;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get date() : String
      {
         return this.var_2380;
      }
      
      public function get message() : String
      {
         return this._message;
      }
   }
}
