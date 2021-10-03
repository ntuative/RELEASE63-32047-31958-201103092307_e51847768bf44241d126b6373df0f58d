package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2342:int;
      
      private var var_1727:String;
      
      private var var_2368:String;
      
      private var var_2563:Boolean;
      
      private var var_2561:Boolean;
      
      private var var_2564:int;
      
      private var var_2369:String;
      
      private var var_2562:String;
      
      private var var_1542:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2342 = param1.readInteger();
         this.var_1727 = param1.readString();
         this.var_2368 = param1.readString();
         this.var_2563 = param1.readBoolean();
         this.var_2561 = param1.readBoolean();
         param1.readString();
         this.var_2564 = param1.readInteger();
         this.var_2369 = param1.readString();
         this.var_2562 = param1.readString();
         this.var_1542 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2342;
      }
      
      public function get avatarName() : String
      {
         return this.var_1727;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2368;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2563;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2561;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2564;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2369;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2562;
      }
      
      public function get realName() : String
      {
         return this.var_1542;
      }
   }
}
