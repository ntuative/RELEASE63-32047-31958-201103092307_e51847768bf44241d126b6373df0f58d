package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1932:int;
      
      private var var_2700:int;
      
      private var var_1484:int;
      
      private var var_2039:int;
      
      private var var_111:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1932 = param1.readInteger();
         this.var_2700 = param1.readInteger();
         this.var_1484 = param1.readInteger();
         this.var_2039 = param1.readInteger();
         this.var_111 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1932);
      }
      
      public function get callId() : int
      {
         return this.var_1932;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2700;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1484;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2039;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_111;
      }
   }
}
