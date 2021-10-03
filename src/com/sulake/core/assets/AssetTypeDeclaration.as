package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2352:String;
      
      private var var_2353:Class;
      
      private var var_2351:Class;
      
      private var var_1709:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2352 = param1;
         this.var_2353 = param2;
         this.var_2351 = param3;
         if(rest == null)
         {
            this.var_1709 = new Array();
         }
         else
         {
            this.var_1709 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2352;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2353;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2351;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1709;
      }
   }
}
