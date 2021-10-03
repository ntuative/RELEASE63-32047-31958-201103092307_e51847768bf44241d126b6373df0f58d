package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2406:int;
      
      private var var_2408:int;
      
      private var var_2407:int;
      
      private var var_2405:String;
      
      private var var_1602:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2406 = param1.readInteger();
         this.var_2408 = param1.readInteger();
         this.var_2407 = param1.readInteger();
         this.var_2405 = param1.readString();
         this.var_1602 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2406;
      }
      
      public function get minute() : int
      {
         return this.var_2408;
      }
      
      public function get chatterId() : int
      {
         return this.var_2407;
      }
      
      public function get chatterName() : String
      {
         return this.var_2405;
      }
      
      public function get msg() : String
      {
         return this.var_1602;
      }
   }
}
