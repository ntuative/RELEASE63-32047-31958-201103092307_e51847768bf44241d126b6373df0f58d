package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_27:String = "AssetLoaderEventComplete";
      
      public static const const_1118:String = "AssetLoaderEventProgress";
      
      public static const const_1003:String = "AssetLoaderEventUnload";
      
      public static const const_1128:String = "AssetLoaderEventStatus";
      
      public static const const_47:String = "AssetLoaderEventError";
      
      public static const const_1065:String = "AssetLoaderEventOpen";
       
      
      private var var_386:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         this.var_386 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return this.var_386;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,this.var_386);
      }
   }
}
