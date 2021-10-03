package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_969:IAssetLoader;
      
      private var var_1536:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1536 = param1;
         this.var_969 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_1536;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_969;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_969 != null)
            {
               if(!this.var_969.disposed)
               {
                  this.var_969.dispose();
                  this.var_969 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
