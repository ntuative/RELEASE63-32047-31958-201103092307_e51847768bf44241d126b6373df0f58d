package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_215:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2638:int = 0;
      
      private var var_2637:int = 0;
      
      private var var_2636:int = 0;
      
      private var var_2639:Boolean = false;
      
      private var var_2182:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_215,param6,param7);
         this.var_2638 = param1;
         this.var_2637 = param2;
         this.var_2636 = param3;
         this.var_2639 = param4;
         this.var_2182 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2638;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2637;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2636;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2639;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2182;
      }
   }
}
