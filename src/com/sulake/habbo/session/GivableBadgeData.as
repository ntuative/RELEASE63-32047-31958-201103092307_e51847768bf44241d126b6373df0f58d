package com.sulake.habbo.session
{
   public class GivableBadgeData
   {
       
      
      private var var_282:int;
      
      private var var_2302:String;
      
      public function GivableBadgeData(param1:int, param2:String)
      {
         super();
         this.var_282 = param1;
         this.var_2302 = param2;
      }
      
      public function get badgeId() : int
      {
         return this.var_282;
      }
      
      public function get achievementTypeName() : String
      {
         return this.var_2302;
      }
   }
}
