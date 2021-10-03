package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1405:String = "pricing_model_unknown";
      
      public static const const_473:String = "pricing_model_single";
      
      public static const const_529:String = "pricing_model_multi";
      
      public static const const_504:String = "pricing_model_bundle";
      
      public static const const_1454:String = "price_type_none";
      
      public static const const_813:String = "price_type_credits";
      
      public static const const_1219:String = "price_type_activitypoints";
      
      public static const const_1010:String = "price_type_credits_and_activitypoints";
       
      
      private var var_753:String;
      
      private var var_1158:String;
      
      private var _offerId:int;
      
      private var var_1820:String;
      
      private var var_1159:int;
      
      private var var_1157:int;
      
      private var var_1819:int;
      
      private var var_398:ICatalogPage;
      
      private var var_752:IProductContainer;
      
      private var var_2534:int;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1820 = param1.localizationId;
         this.var_1159 = param1.priceInCredits;
         this.var_1157 = param1.priceInActivityPoints;
         this.var_1819 = param1.activityPointType;
         this.var_398 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.analyzePriceType();
         this.createProductContainer(_loc3_);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_398;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1820;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1159;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1157;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1819;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_752;
      }
      
      public function get pricingModel() : String
      {
         return this.var_753;
      }
      
      public function get priceType() : String
      {
         return this.var_1158;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2534;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2534 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1820 = "";
         this.var_1159 = 0;
         this.var_1157 = 0;
         this.var_1819 = 0;
         this.var_398 = null;
         if(this.var_752 != null)
         {
            this.var_752.dispose();
            this.var_752 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_753)
         {
            case const_473:
               this.var_752 = new SingleProductContainer(this,param1);
               break;
            case const_529:
               this.var_752 = new MultiProductContainer(this,param1);
               break;
            case const_504:
               this.var_752 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_753);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_753 = const_473;
            }
            else
            {
               this.var_753 = const_529;
            }
         }
         else if(param1.length > 1)
         {
            this.var_753 = const_504;
         }
         else
         {
            this.var_753 = const_1405;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1159 > 0 && this.var_1157 > 0)
         {
            this.var_1158 = const_1010;
         }
         else if(this.var_1159 > 0)
         {
            this.var_1158 = const_813;
         }
         else if(this.var_1157 > 0)
         {
            this.var_1158 = const_1219;
         }
         else
         {
            this.var_1158 = const_1454;
         }
      }
   }
}
