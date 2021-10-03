package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCreatedMessageParser implements IMessageParser
   {
       
      
      private var var_372:int;
      
      private var var_1689:String;
      
      public function FlatCreatedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_372 = param1.readInteger();
         this.var_1689 = param1.readString();
         Logger.log("FLAT CREATED: " + this.var_372 + ", " + this.var_1689);
         return true;
      }
      
      public function get flatId() : int
      {
         return this.var_372;
      }
      
      public function get flatName() : String
      {
         return this.var_1689;
      }
   }
}
