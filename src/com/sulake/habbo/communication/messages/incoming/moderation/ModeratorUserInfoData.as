package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2675:int;
      
      private var var_2678:int;
      
      private var var_730:Boolean;
      
      private var var_2673:int;
      
      private var var_2677:int;
      
      private var var_2674:int;
      
      private var var_2676:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2675 = param1.readInteger();
         this.var_2678 = param1.readInteger();
         this.var_730 = param1.readBoolean();
         this.var_2673 = param1.readInteger();
         this.var_2677 = param1.readInteger();
         this.var_2674 = param1.readInteger();
         this.var_2676 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2675;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2678;
      }
      
      public function get online() : Boolean
      {
         return this.var_730;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2673;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2677;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2674;
      }
      
      public function get banCount() : int
      {
         return this.var_2676;
      }
   }
}
