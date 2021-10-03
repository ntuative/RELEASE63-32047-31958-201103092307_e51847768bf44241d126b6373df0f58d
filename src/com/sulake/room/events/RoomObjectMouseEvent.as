package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_258:String = "ROE_MOUSE_CLICK";
      
      public static const const_1795:String = "ROE_MOUSE_ENTER";
      
      public static const const_522:String = "ROE_MOUSE_MOVE";
      
      public static const const_1893:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1792:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_583:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1638:String = "";
      
      private var var_2387:Boolean;
      
      private var var_2388:Boolean;
      
      private var var_2389:Boolean;
      
      private var var_2390:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1638 = param2;
         this.var_2387 = param5;
         this.var_2388 = param6;
         this.var_2389 = param7;
         this.var_2390 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1638;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2387;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2388;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2389;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2390;
      }
   }
}
