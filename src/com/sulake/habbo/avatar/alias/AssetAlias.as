package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var _name:String;
      
      private var var_1881:String;
      
      private var var_1349:Boolean;
      
      private var var_1348:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         this._name = String(param1.@name);
         this.var_1881 = String(param1.@link);
         this.var_1349 = Boolean(parseInt(param1.@fliph));
         this.var_1348 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get link() : String
      {
         return this.var_1881;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1349;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1348;
      }
   }
}
