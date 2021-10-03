package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2102:int;
      
      private var var_2507:int;
      
      private var var_2505:int;
      
      private var _dayOffsets:Array;
      
      private var var_1832:Array;
      
      private var var_1833:Array;
      
      private var var_2504:int;
      
      private var var_2506:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2102;
      }
      
      public function get offerCount() : int
      {
         return this.var_2507;
      }
      
      public function get historyLength() : int
      {
         return this.var_2505;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1832;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1833;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2504;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2506;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2102 = param1.readInteger();
         this.var_2507 = param1.readInteger();
         this.var_2505 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1832 = [];
         this.var_1833 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1832.push(param1.readInteger());
            this.var_1833.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2506 = param1.readInteger();
         this.var_2504 = param1.readInteger();
         return true;
      }
   }
}
