package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import flash.events.Event;
   import flash.net.URLRequest;
   
   public class AvatarAssetDownloadLibrary extends EventDispatcher
   {
      
      private static var name_2:int = 0;
      
      private static var var_1852:int = 1;
      
      private static var name_3:int = 2;
       
      
      private var _state:int;
      
      private var var_935:String;
      
      private var _revision:String;
      
      private var var_1427:String;
      
      private var _assets:IAssetLibrary;
      
      public function AvatarAssetDownloadLibrary(param1:String, param2:String, param3:String, param4:IAssetLibrary)
      {
         super();
         this._state = name_2;
         this._assets = param4;
         this.var_935 = String(param1);
         this._revision = String(param2);
         this.var_1427 = param3 + this.var_935 + ".swf";
         this.var_1427 = this.var_1427.replace("%revision%",this._revision);
         var _loc5_:AssetLibraryCollection = this._assets as AssetLibraryCollection;
         var _loc6_:IAssetLibrary = _loc5_.getAssetLibraryByUrl(this.var_935 + ".swf");
         if(_loc6_ != null)
         {
            Logger.log("[AvatarAssetDownloadLibrary] Already Downloaded by Core: " + this.var_935);
            this._state = name_3;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function startDownloading() : void
      {
         this._state = var_1852;
         var _loc1_:URLRequest = new URLRequest(this.var_1427);
         var _loc2_:LibraryLoader = new LibraryLoader();
         this._assets.loadFromFile(_loc2_,true);
         _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.onLoaderComplete);
         _loc2_.load(_loc1_);
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.onLoaderComplete);
         this._state = name_3;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function get libraryName() : String
      {
         return this.var_935;
      }
      
      public function get isReady() : Boolean
      {
         return this._state == name_3;
      }
      
      public function toString() : String
      {
         var _loc1_:String = this.var_935;
         return _loc1_ + (!!this.isReady ? "[x]" : "[ ]");
      }
   }
}
