package com.sulake.habbo.avatar.promo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.common.ISideContentView;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   
   public class ClubPromoView implements ISideContentView
   {
       
      
      private var var_67:ClubPromoModel;
      
      private var _window:IWindowContainer;
      
      public function ClubPromoView(param1:ClubPromoModel)
      {
         var _loc2_:* = null;
         super();
         this.var_67 = param1;
         if(this.var_67 && this.var_67.controller && this.var_67.controller.assets)
         {
            _loc2_ = this.var_67.controller.assets.getAssetByName("avatareditor_club_promo_try") as XmlAsset;
            if(_loc2_)
            {
               this._window = this.var_67.controller.windowManager.buildFromXML(_loc2_.content as XML) as IWindowContainer;
               this._window.visible = false;
               this._window.procedure = this.windowEventProc;
            }
         }
      }
      
      public function dispose() : void
      {
         this.var_67 = null;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return this._window;
      }
      
      public function showBuyView() : void
      {
         var _loc1_:* = null;
         if(this.var_67 && this.var_67.controller && this.var_67.controller.assets)
         {
            _loc1_ = this.var_67.controller.assets.getAssetByName("avatareditor_club_promo_buy") as XmlAsset;
            if(_loc1_)
            {
               this._window = this.var_67.controller.windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
               this._window.visible = false;
               this._window.procedure = this.windowEventProc;
            }
         }
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "try_clothes_btn":
                  if(this.var_67)
                  {
                     this.var_67.tryClubClothes();
                  }
                  break;
               case "club_info_btn":
                  if(this.var_67 && this.var_67.controller && this.var_67.controller.catalog)
                  {
                     this.var_67.controller.catalog.openCatalogPage(CatalogPageName.const_181,true);
                  }
                  break;
               default:
                  Logger.log("No event proc for element in Club Promo View");
            }
         }
      }
   }
}
