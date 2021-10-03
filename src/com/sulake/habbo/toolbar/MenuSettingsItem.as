package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2072:String;
      
      private var var_2071:Array;
      
      private var var_2070:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2072 = param1;
         this.var_2071 = param2;
         this.var_2070 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2072;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2071;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2070;
      }
   }
}
