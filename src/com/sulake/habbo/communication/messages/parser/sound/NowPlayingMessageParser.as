package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1869:int;
      
      private var var_1868:int;
      
      private var var_1870:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get current() : int
      {
         return this.var_1869;
      }
      
      public function get next() : int
      {
         return this.var_1868;
      }
      
      public function get syncCount() : int
      {
         return this.var_1870;
      }
      
      public function flush() : Boolean
      {
         this.var_1869 = -1;
         this.var_1868 = -1;
         this.var_1870 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1869 = param1.readInteger();
         this.var_1868 = param1.readInteger();
         this.var_1870 = param1.readInteger();
         return true;
      }
   }
}
