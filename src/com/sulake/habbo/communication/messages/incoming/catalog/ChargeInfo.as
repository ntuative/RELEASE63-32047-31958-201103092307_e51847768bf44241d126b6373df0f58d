package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2130:int;
      
      private var var_2650:int;
      
      private var var_1159:int;
      
      private var var_1157:int;
      
      private var var_1819:int;
      
      private var var_2651:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2130 = param1.readInteger();
         this.var_2650 = param1.readInteger();
         this.var_1159 = param1.readInteger();
         this.var_1157 = param1.readInteger();
         this.var_1819 = param1.readInteger();
         this.var_2651 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2130;
      }
      
      public function get charges() : int
      {
         return this.var_2650;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1159;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1157;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2651;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1819;
      }
   }
}
