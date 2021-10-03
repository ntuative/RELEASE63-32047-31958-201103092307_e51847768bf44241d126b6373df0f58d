package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1521:int;
      
      private var var_1811:int;
      
      private var var_1810:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1811 = param1.readInteger();
         this.var_1521 = param1.readInteger();
         this.var_1810 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1521 = 0;
         this.var_1811 = 0;
         this.var_1810 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1521;
      }
      
      public function get messageId() : int
      {
         return this.var_1811;
      }
      
      public function get timestamp() : String
      {
         return this.var_1810;
      }
   }
}
