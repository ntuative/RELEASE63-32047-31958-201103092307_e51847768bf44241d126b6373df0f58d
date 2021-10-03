package com.sulake.habbo.avatar.enum
{
   import flash.events.Event;
   
   public class AvatarRenderAssetErrorEvent extends Event
   {
      
      public static const AVATAR_RENDER_ASSET_ERROR:String = "AVATAR_RENDER_ASSET_ERROR";
       
      
      private var var_1536:String;
      
      public function AvatarRenderAssetErrorEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_1536 = param1;
         super(AVATAR_RENDER_ASSET_ERROR,param2,param3);
      }
      
      public function get assetName() : String
      {
         return this.var_1536;
      }
   }
}
