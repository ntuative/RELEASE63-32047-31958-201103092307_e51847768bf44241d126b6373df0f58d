package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1269:int;
      
      private var var_1955:int;
      
      private var var_2109:int;
      
      private var var_1544:int;
      
      private var var_1270:int;
      
      private var var_2034:String = "";
      
      private var var_2111:String = "";
      
      private var var_2110:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1269 = param1.readInteger();
         this.var_2034 = param1.readString();
         this.var_1955 = param1.readInteger();
         this.var_2109 = param1.readInteger();
         this.var_1544 = param1.readInteger();
         this.var_1270 = param1.readInteger();
         this.var_2110 = param1.readInteger();
         this.var_2111 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1269;
      }
      
      public function get points() : int
      {
         return this.var_1955;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2109;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1544;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1270;
      }
      
      public function get badgeID() : String
      {
         return this.var_2034;
      }
      
      public function get achievementID() : int
      {
         return this.var_2110;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2111;
      }
   }
}
