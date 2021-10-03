package com.sulake.habbo.avatar.promo
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.ISideContentModel;
   
   public class ClubPromoModel implements ISideContentModel
   {
       
      
      private var _controller:HabboAvatarEditor;
      
      private var var_17:ClubPromoView;
      
      public const const_2029:String = "try_club";
      
      public const const_2031:String = "buy_club";
      
      public function ClubPromoModel(param1:HabboAvatarEditor)
      {
         super();
         this._controller = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_17)
         {
            this.var_17.dispose();
            this.var_17 = null;
         }
      }
      
      public function reset() : void
      {
      }
      
      private function init() : void
      {
         if(!this.var_17)
         {
            this.var_17 = new ClubPromoView(this);
         }
      }
      
      public function tryClubClothes() : void
      {
         this.var_17.showBuyView();
         if(this.controller)
         {
            this.controller.useClubClothing();
         }
      }
      
      public function get controller() : HabboAvatarEditor
      {
         return this._controller;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         this.init();
         if(this.var_17)
         {
            return this.var_17.getWindowContainer();
         }
         return null;
      }
   }
}
