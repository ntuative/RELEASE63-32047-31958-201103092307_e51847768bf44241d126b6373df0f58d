package com.sulake.habbo.widget.events
{
   public class RoomWidgetPurseUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_69:String = "RWPUE_CREDIT_BALANCE";
      
      public static const const_108:String = "RWPUE_PIXEL_BALANCE";
       
      
      private var var_2029:int;
      
      public function RoomWidgetPurseUpdateEvent(param1:String, param2:int, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.var_2029 = param2;
      }
      
      public function get balance() : int
      {
         return this.var_2029;
      }
   }
}
