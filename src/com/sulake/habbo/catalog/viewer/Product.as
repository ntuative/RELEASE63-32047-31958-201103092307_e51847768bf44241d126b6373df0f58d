package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import flash.display.BitmapData;
   
   public class Product extends ProductGridItem implements IProduct, IGetImageListener
   {
       
      
      private var var_1779:String;
      
      private var var_1780:int;
      
      private var var_1388:String;
      
      private var var_1387:int;
      
      private var var_1781:int;
      
      private var var_1782:IProductData;
      
      private var _furnitureData:IFurnitureData;
      
      public function Product(param1:CatalogPageMessageProductData, param2:IProductData, param3:IFurnitureData)
      {
         super();
         this.var_1779 = param1.productType;
         this.var_1780 = param1.furniClassId;
         this.var_1388 = param1.extraParam;
         this.var_1387 = param1.productCount;
         this.var_1781 = param1.expiration;
         this.var_1782 = param2;
         this._furnitureData = param3;
      }
      
      public function get productType() : String
      {
         return this.var_1779;
      }
      
      public function get productClassId() : int
      {
         return this.var_1780;
      }
      
      public function get extraParam() : String
      {
         return this.var_1388;
      }
      
      public function get productCount() : int
      {
         return this.var_1387;
      }
      
      public function get expiration() : int
      {
         return this.var_1781;
      }
      
      public function get productData() : IProductData
      {
         return this.var_1782;
      }
      
      public function get furnitureData() : IFurnitureData
      {
         return this._furnitureData;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_1779 = "";
         this.var_1780 = 0;
         this.var_1388 = "";
         this.var_1387 = 0;
         this.var_1781 = 0;
         this.var_1782 = null;
      }
      
      public function initIcon(param1:IProductContainer, param2:IGetImageListener = null) : BitmapData
      {
         var _loc6_:* = null;
         var _loc3_:* = null;
         if(param2 == null)
         {
            param2 = {};
         }
         var _loc4_:IRoomEngine = (param1 as ProductContainer).offer.page.viewer.roomEngine;
         var _loc5_:IHabboCatalog = (param1 as ProductContainer).offer.page.viewer.catalog;
         switch(this.productType)
         {
            case ProductTypeEnum.const_89:
               _loc6_ = _loc4_.getFurnitureIcon(this.productClassId,param2);
               break;
            case ProductTypeEnum.const_85:
               _loc6_ = _loc4_.getWallItemIcon(this.productClassId,param2,this.var_1388);
               break;
            case ProductTypeEnum.const_264:
               _loc3_ = _loc5_.getPixelEffectIcon(this.productClassId);
               break;
            case ProductTypeEnum.const_336:
               _loc3_ = _loc5_.getSubscriptionProductIcon(this.productClassId);
               break;
            default:
               Logger.log("[Product] Can not yet handle this type of product: " + this.productType);
         }
         if(_loc6_ != null)
         {
            _loc3_ = _loc6_.data;
            if(param2 == this)
            {
               this.setIconImage(_loc3_);
            }
         }
         return _loc3_;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         Logger.log("[Product] Bundle Icon Image Ready!" + param1);
         setIconImage(param2);
      }
      
      override public function set view(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!param1)
         {
            return;
         }
         super.view = param1;
         if(this.var_1387 > 1)
         {
            _loc2_ = var_17.findChildByName("multiContainer");
            if(_loc2_)
            {
               _loc2_.visible = true;
            }
            _loc3_ = var_17.findChildByName("multiCounter") as ITextWindow;
            if(_loc3_)
            {
               _loc3_.text = "x" + this.productCount;
            }
         }
      }
   }
}
