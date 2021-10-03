package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1475:Boolean;
      
      private var var_2463:int;
      
      private var var_1783:int;
      
      private var var_1784:int;
      
      private var var_2462:int;
      
      private var var_2464:int;
      
      private var var_2461:int;
      
      private var var_2422:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1475;
      }
      
      public function get commission() : int
      {
         return this.var_2463;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1783;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1784;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2464;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2462;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2461;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2422;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1475 = param1.readBoolean();
         this.var_2463 = param1.readInteger();
         this.var_1783 = param1.readInteger();
         this.var_1784 = param1.readInteger();
         this.var_2464 = param1.readInteger();
         this.var_2462 = param1.readInteger();
         this.var_2461 = param1.readInteger();
         this.var_2422 = param1.readInteger();
         return true;
      }
   }
}
