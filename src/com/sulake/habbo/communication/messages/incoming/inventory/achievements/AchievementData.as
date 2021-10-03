package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1269:int;
      
      private var var_282:String;
      
      private var var_2400:int;
      
      private var var_2109:int;
      
      private var var_1544:int;
      
      private var var_2399:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1269 = param1.readInteger();
         this.var_282 = param1.readString();
         this.var_2400 = param1.readInteger();
         this.var_2109 = param1.readInteger();
         this.var_1544 = param1.readInteger();
         this.var_2399 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_282;
      }
      
      public function get level() : int
      {
         return this.var_1269;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2400;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2109;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1544;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2399;
      }
   }
}
