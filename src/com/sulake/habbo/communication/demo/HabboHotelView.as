package com.sulake.habbo.communication.demo
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.habbo.communication.enum.HabboHotelViewEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.net.URLRequest;
   
   public class HabboHotelView implements IDisposable
   {
       
      
      private var _window:IWindowContainer;
      
      private var _disposed:Boolean = false;
      
      private var var_1083:Function;
      
      private var var_1084:Function;
      
      private var var_715:IAssetLibrary;
      
      private var var_1085:uint = 0;
      
      private var _events:IEventDispatcher;
      
      public function HabboHotelView(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IEventDispatcher)
      {
         var asset:IAsset = null;
         var layout:XML = null;
         var bmp:IBitmapWrapperWindow = null;
         var result:Array = null;
         var windowManager:IHabboWindowManager = param1;
         var assetLibrary:IAssetLibrary = param2;
         var events:IEventDispatcher = param3;
         super();
         this.var_715 = assetLibrary;
         this._events = events;
         var array:Array = new Array();
         asset = assetLibrary.getAssetByName("hotel_view_window");
         if(asset == null)
         {
            throw new Error("Missing asset; hotel view window layout!");
         }
         layout = XmlAsset(asset).content as XML;
         if(layout)
         {
            this._window = windowManager.buildFromXML(layout,0) as IWindowContainer;
            this._window.rectangle = this._window.desktop.rectangle;
            this._window.groupChildrenWithTag("bitmap",array,true);
            for each(bmp in array)
            {
               result = bmp.properties.filter(function(param1:*, param2:int, param3:Array):Boolean
               {
                  return PropertyStruct(param1).key == "bitmap_asset_name";
               });
               if(result.length)
               {
                  asset = assetLibrary.getAssetByName(PropertyStruct(result[0]).value as String);
                  if(asset && asset is BitmapDataAsset)
                  {
                     bmp.bitmap = BitmapDataAsset(asset).content as BitmapData;
                  }
               }
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this._window)
            {
               this._window.dispose();
               this._window = null;
            }
            this._disposed = true;
            this.var_1083 = null;
            this.var_1084 = null;
            this._events = null;
         }
      }
      
      public function loadHotelViewImage(param1:String, param2:Function = null) : void
      {
         var _loc3_:AssetLoaderStruct = this.var_715.loadAssetFromFile("hotelview_png",new URLRequest(param1),"image/png");
         if(param2 == null)
         {
            _loc3_.addEventListener(AssetLoaderEvent.const_27,this.hotelViewLoadedHandler);
            _loc3_.addEventListener(AssetLoaderEvent.const_47,this.hotelViewLoadedHandler);
         }
         else
         {
            this.var_1084 = param2;
            _loc3_.addEventListener(AssetLoaderEvent.const_27,this.hotelViewLoadedCallbackHandler);
            _loc3_.addEventListener(AssetLoaderEvent.const_47,this.hotelViewLoadedCallbackHandler);
         }
         ++this.var_1085;
      }
      
      private function hotelViewLoadedHandler(param1:AssetLoaderEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         var _loc3_:IAsset = this.var_715.getAssetByName(_loc2_.assetName);
         if(param1.type == AssetLoaderEvent.const_27)
         {
            _loc4_ = BitmapDataAsset(_loc3_).content as BitmapData;
            if(this._window && !this._window.disposed)
            {
               _loc5_ = this._window.findChildByTag("bitmap") as IBitmapWrapperWindow;
               if(_loc5_ != null)
               {
                  _loc5_.width = _loc4_.width;
                  _loc5_.height = _loc4_.height;
                  _loc5_.bitmap = _loc4_;
               }
            }
         }
         _loc2_.removeEventListener(AssetLoaderEvent.const_27,this.hotelViewLoadedHandler);
         _loc2_.removeEventListener(AssetLoaderEvent.const_47,this.hotelViewLoadedHandler);
      }
      
      private function hotelViewLoadedCallbackHandler(param1:AssetLoaderEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         var _loc3_:IAsset = this.var_715.getAssetByName(_loc2_.assetName);
         if(param1.type == AssetLoaderEvent.const_47)
         {
            if(this._events != null)
            {
               this._events.dispatchEvent(new Event(HabboHotelViewEvent.const_67));
            }
         }
         else if(param1.type == AssetLoaderEvent.const_27)
         {
            if(this._events != null)
            {
               this._events.dispatchEvent(new Event(HabboHotelViewEvent.const_505));
            }
            _loc4_ = BitmapDataAsset(_loc3_).content as BitmapData;
            if(this._window && !this._window.disposed)
            {
            }
            if(this.var_1084 != null)
            {
               this.var_1084(_loc4_);
               this.var_1084 = null;
            }
         }
         _loc2_.removeEventListener(AssetLoaderEvent.const_27,this.hotelViewLoadedCallbackHandler);
         _loc2_.removeEventListener(AssetLoaderEvent.const_47,this.hotelViewLoadedCallbackHandler);
      }
      
      public function loadBannerImage(param1:String, param2:Function) : void
      {
         var _loc3_:AssetLoaderStruct = this.var_715.loadAssetFromFile("hotel_view_banner_" + this.var_1085,new URLRequest(param1),"image/png");
         if(param2 == null)
         {
            _loc3_.addEventListener(AssetLoaderEvent.const_27,this.bannerLoadedHandler);
            _loc3_.addEventListener(AssetLoaderEvent.const_47,this.bannerLoadedHandler);
         }
         else
         {
            if(this._events != null)
            {
               this._events.dispatchEvent(new Event(HabboHotelViewEvent.const_657));
            }
            this.var_1083 = param2;
            _loc3_.addEventListener(AssetLoaderEvent.const_27,this.bannerLoadedCallbackHandler);
            _loc3_.addEventListener(AssetLoaderEvent.const_47,this.bannerLoadedCallbackHandler);
         }
         ++this.var_1085;
      }
      
      private function bannerLoadedHandler(param1:AssetLoaderEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         var _loc3_:IAsset = this.var_715.getAssetByName(_loc2_.assetName);
         if(param1.type == AssetLoaderEvent.const_27)
         {
            _loc4_ = BitmapDataAsset(_loc3_).content as BitmapData;
            if(this._window && !this._window.disposed)
            {
               _loc5_ = this._window.findChildByName("banner_placeholder") as IBitmapWrapperWindow;
               if(_loc5_)
               {
                  _loc5_.bitmap = _loc4_;
               }
            }
         }
         _loc2_.removeEventListener(AssetLoaderEvent.const_27,this.bannerLoadedHandler);
         _loc2_.removeEventListener(AssetLoaderEvent.const_47,this.bannerLoadedHandler);
      }
      
      private function bannerLoadedCallbackHandler(param1:AssetLoaderEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         var _loc3_:IAsset = this.var_715.getAssetByName(_loc2_.assetName);
         if(param1.type == AssetLoaderEvent.const_47)
         {
            if(this._events != null)
            {
               this._events.dispatchEvent(new Event(HabboHotelViewEvent.const_67));
            }
         }
         else if(param1.type == AssetLoaderEvent.const_27)
         {
            if(this._events != null)
            {
               this._events.dispatchEvent(new Event(HabboHotelViewEvent.const_505));
            }
            _loc4_ = BitmapDataAsset(_loc3_).content as BitmapData;
            if(this._window && !this._window.disposed)
            {
               _loc5_ = this._window.findChildByName("banner_placeholder") as IBitmapWrapperWindow;
               if(_loc5_)
               {
                  _loc5_.bitmap = _loc4_;
               }
            }
            if(this.var_1083 != null)
            {
               this.var_1083(_loc4_);
               this.var_1083 = null;
            }
         }
         _loc2_.removeEventListener(AssetLoaderEvent.const_27,this.bannerLoadedCallbackHandler);
         _loc2_.removeEventListener(AssetLoaderEvent.const_47,this.bannerLoadedCallbackHandler);
      }
      
      public function show() : void
      {
         if(this._window && !this._window.disposed)
         {
            this._window.visible = true;
         }
      }
      
      public function hide() : void
      {
         if(this._window && !this._window.disposed)
         {
            this._window.visible = false;
         }
      }
   }
}
