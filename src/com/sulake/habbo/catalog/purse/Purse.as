package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_195:int = 0;
       
      
      private var var_2151:int = 0;
      
      private var var_1354:Dictionary;
      
      private var var_1687:int = 0;
      
      private var var_1688:int = 0;
      
      private var var_2332:Boolean = false;
      
      private var var_2334:int = 0;
      
      private var var_2333:int = 0;
      
      public function Purse()
      {
         this.var_1354 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2151;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2151 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1687;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1687 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1688;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1688 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1687 > 0 || this.var_1688 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2332;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2332 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2334;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2334 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2333;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2333 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1354;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1354 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1354[param1];
      }
   }
}
