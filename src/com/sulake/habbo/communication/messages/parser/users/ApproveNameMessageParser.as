package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ApproveNameMessageParser implements IMessageParser
   {
       
      
      private var _result:int;
      
      public function ApproveNameMessageParser()
      {
         super();
      }
      
      public function get result() : int
      {
         return this._result;
      }
      
      public function flush() : Boolean
      {
         this._result = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._result = param1.readInteger();
         return true;
      }
   }
}
