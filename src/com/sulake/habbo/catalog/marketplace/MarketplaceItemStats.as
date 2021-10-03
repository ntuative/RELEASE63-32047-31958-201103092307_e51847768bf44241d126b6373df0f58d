package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2102:int;
      
      private var var_2507:int;
      
      private var var_2505:int;
      
      private var _dayOffsets:Array;
      
      private var var_1832:Array;
      
      private var var_1833:Array;
      
      private var var_2504:int;
      
      private var var_2506:int;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2102 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2507 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2505 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1832 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1833 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2504 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2506 = param1;
      }
   }
}
