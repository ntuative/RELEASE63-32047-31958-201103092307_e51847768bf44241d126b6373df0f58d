package com.sulake.habbo.widget.events
{
   public class RoomWidgetDanceUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_808:String = "RWUE_DANCE";
       
      
      private var var_84:int;
      
      public function RoomWidgetDanceUpdateEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_808,param2,param3);
         this.var_84 = param1;
      }
      
      public function get style() : int
      {
         return this.var_84;
      }
   }
}
