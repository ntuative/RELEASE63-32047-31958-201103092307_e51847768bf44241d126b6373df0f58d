package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCatMessageParser implements IMessageParser
   {
       
      
      private var var_372:int;
      
      private var var_1716:int;
      
      public function FlatCatMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_372 = param1.readInteger();
         this.var_1716 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_372 = 0;
         this.var_1716 = 0;
         return true;
      }
      
      public function get flatId() : int
      {
         return this.var_372;
      }
      
      public function get nodeId() : int
      {
         return this.var_1716;
      }
   }
}
