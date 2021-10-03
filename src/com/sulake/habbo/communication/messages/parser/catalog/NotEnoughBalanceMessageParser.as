package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1778:int = 0;
      
      private var var_1777:int = 0;
      
      private var var_1819:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1778;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1777;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1819;
      }
      
      public function flush() : Boolean
      {
         this.var_1778 = 0;
         this.var_1777 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1778 = param1.readInteger();
         this.var_1777 = param1.readInteger();
         this.var_1819 = param1.readInteger();
         return true;
      }
   }
}
