package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetMultiColoursEvent extends Event
   {
       
      
      private var var_995:Array;
      
      private var var_2206:String;
      
      private var var_2207:String;
      
      private var var_2208:String;
      
      public function CatalogWidgetMultiColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_MULTI_COLOUR_ARRAY,param5,param6);
         this.var_995 = param1;
         this.var_2206 = param2;
         this.var_2207 = param3;
         this.var_2208 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_995;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2206;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2207;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2208;
      }
   }
}
