package com.sulake.habbo.avatar.alias
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAsset;
   import com.sulake.habbo.avatar.AvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarRenderAssetErrorEvent;
   import flash.utils.Dictionary;
   
   public class AssetAliasCollection
   {
       
      
      private var _assets:AssetLibraryCollection;
      
      private var var_611:Dictionary;
      
      private var var_463:AvatarRenderManager;
      
      public function AssetAliasCollection(param1:AvatarRenderManager, param2:AssetLibraryCollection)
      {
         super();
         this.var_463 = param1;
         this.var_611 = new Dictionary();
         this._assets = param2;
      }
      
      public function dispose() : void
      {
         this._assets = null;
         this.var_611 = null;
      }
      
      public function reset() : void
      {
         this.init();
      }
      
      public function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = this._assets.getManifests();
         for each(_loc2_ in _loc1_)
         {
            for each(_loc3_ in _loc2_.library.aliases.alias)
            {
               _loc4_ = String(_loc3_.@name);
               _loc5_ = new AssetAlias(_loc3_);
               this.var_611[_loc4_] = _loc5_;
            }
         }
      }
      
      public function addAlias(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false) : void
      {
         var _loc5_:XML = <alias name="" link="" fliph="0" flipv="0"/>;
         _loc5_.@name = param1;
         _loc5_.@link = param2;
         var _loc6_:AssetAlias = new AssetAlias(_loc5_);
         this.var_611[param1] = _loc6_;
      }
      
      public function hasAlias(param1:String) : Boolean
      {
         var _loc2_:AssetAlias = this.var_611[param1] as AssetAlias;
         return _loc2_ != null;
      }
      
      public function getAliasByName(param1:String) : AssetAlias
      {
         return this.var_611[param1] as AssetAlias;
      }
      
      public function getAssetByName(param1:String) : IAsset
      {
         var _loc4_:* = null;
         var _loc2_:int = 5;
         while(this.hasAlias(param1) && _loc2_ >= 0)
         {
            _loc4_ = this.var_611[param1] as AssetAlias;
            param1 = _loc4_.link;
            _loc2_--;
         }
         var _loc3_:IAsset = this._assets.getAssetByName(param1);
         if(_loc3_ == null)
         {
            this.var_463.events.dispatchEvent(new AvatarRenderAssetErrorEvent(param1));
         }
         return _loc3_;
      }
   }
}
