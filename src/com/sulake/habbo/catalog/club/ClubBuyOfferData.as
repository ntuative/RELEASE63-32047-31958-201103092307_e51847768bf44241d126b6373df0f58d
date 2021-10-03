package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1566:String;
      
      private var var_1630:int;
      
      private var var_2241:Boolean;
      
      private var var_2240:Boolean;
      
      private var var_2237:int;
      
      private var var_2242:int;
      
      private var var_398:ICatalogPage;
      
      private var var_2236:int;
      
      private var var_2235:int;
      
      private var var_2238:int;
      
      private var var_2239:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1566 = param2;
         this.var_1630 = param3;
         this.var_2241 = param4;
         this.var_2240 = param5;
         this.var_2237 = param6;
         this.var_2242 = param7;
         this.var_2236 = param8;
         this.var_2235 = param9;
         this.var_2238 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1566;
      }
      
      public function get price() : int
      {
         return this.var_1630;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2241;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2240;
      }
      
      public function get periods() : int
      {
         return this.var_2237;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2242;
      }
      
      public function get year() : int
      {
         return this.var_2236;
      }
      
      public function get month() : int
      {
         return this.var_2235;
      }
      
      public function get day() : int
      {
         return this.var_2238;
      }
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_195;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1630;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_398;
      }
      
      public function get priceType() : String
      {
         return Offer.const_813;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1566;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_398 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2239;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2239 = param1;
      }
   }
}
