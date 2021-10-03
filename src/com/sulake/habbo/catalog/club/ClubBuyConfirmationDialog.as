package com.sulake.habbo.catalog.club
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.purse.IPurse;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.session.product.IProductData;
   
   public class ClubBuyConfirmationDialog
   {
       
      
      private var var_90:ClubBuyOfferData;
      
      private var _controller:ClubBuyController;
      
      private var var_17:IFrameWindow;
      
      private var _pageId:int;
      
      public function ClubBuyConfirmationDialog(param1:ClubBuyController, param2:ClubBuyOfferData, param3:int)
      {
         super();
         this.var_90 = param2;
         this._controller = param1;
         this._pageId = param3;
         this.showConfirmation();
      }
      
      public function dispose() : void
      {
         this._controller = null;
         this.var_90 = null;
         if(this.var_17)
         {
            this.var_17.dispose();
            this.var_17 = null;
         }
      }
      
      public function showConfirmation() : void
      {
         var _loc3_:* = null;
         if(!this.var_90 || !this._controller)
         {
            return;
         }
         this.var_17 = this.createWindow("club_buy_confirmation") as IFrameWindow;
         if(!this.var_17)
         {
            return;
         }
         this.var_17.procedure = this.windowEventHandler;
         this.var_17.center();
         var _loc1_:ITextWindow = this.var_17.findChildByName("item_name") as ITextWindow;
         if(_loc1_)
         {
            _loc1_.text = this.getProductName();
         }
         if(this.var_90.vip)
         {
            (this.var_17.findChildByName("icon") as IIconWindow).style = 18;
         }
         else
         {
            (this.var_17.findChildByName("icon") as IIconWindow).style = 17;
         }
         var _loc2_:ICoreLocalizationManager = this._controller.localization;
         var _loc4_:* = "";
         var _loc5_:int = this._controller.getClubType();
         var _loc6_:* = "catalog.club.buy.confirm.desc.";
         switch(_loc5_)
         {
            case HabboClubLevelEnum.const_52:
               _loc6_ += "none.";
               break;
            case HabboClubLevelEnum.const_41:
               _loc6_ += "hc.";
               break;
            case HabboClubLevelEnum.const_44:
               _loc6_ += "vip.";
         }
         _loc6_ += !!this.var_90.vip ? "vip" : "hc";
         _loc6_ += !!this.var_90.upgrade ? ".period" : "";
         _loc3_ = _loc2_.getLocalization(_loc6_);
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.value;
            _loc4_ += "\n\n";
         }
         var _loc7_:IPurse = this._controller.getPurse();
         var _loc8_:int = _loc7_.clubDays;
         var _loc9_:int = _loc7_.clubPeriods;
         var _loc10_:int = _loc9_ * 31 + _loc8_;
         var _loc11_:String = !!this.var_90.vip ? "vip" : "hc";
         var _loc12_:String = _loc2_.getLocalization("catalog.club." + _loc11_).value;
         var _loc13_:int = this.var_90.periods == 0 ? 1 : int(this.var_90.periods);
         _loc2_.registerParameter("catalog.club.buy.confirm.price","price",String(this.var_90.price));
         _loc2_.registerParameter("catalog.club.buy.confirm.product","days",String(_loc13_ * 31));
         _loc2_.registerParameter("catalog.club.buy.confirm.product","club",_loc12_);
         _loc2_.registerParameter("catalog.club.buy.confirm.amount","day",String(this.var_90.day));
         _loc2_.registerParameter("catalog.club.buy.confirm.amount","month",String(this.var_90.month));
         _loc2_.registerParameter("catalog.club.buy.confirm.amount","year",String(this.var_90.year));
         _loc2_.registerParameter("catalog.club.buy.confirm.before","days",String(_loc10_));
         _loc2_.registerParameter("catalog.club.buy.confirm.after","days",String(this.var_90.daysLeftAfterPurchase));
         if(this.var_90.upgrade)
         {
            _loc4_ += _loc2_.getLocalization("catalog.club.buy.confirm.price").value + "\n";
            _loc4_ += _loc2_.getLocalization("catalog.club.buy.confirm.before").value + "\n";
            _loc4_ += _loc2_.getLocalization("catalog.club.buy.confirm.after").value + "\n";
            _loc4_ += _loc2_.getLocalization("catalog.club.buy.confirm.amount").value + "\n";
            this.var_17.height = 240;
            this.var_17.findChildByName("description").height = 150;
         }
         else
         {
            _loc4_ += _loc2_.getLocalization("catalog.club.buy.confirm.price").value + "\n";
            _loc4_ += _loc2_.getLocalization("catalog.club.buy.confirm.product").value + "\n";
            _loc4_ += _loc2_.getLocalization("catalog.club.buy.confirm.amount").value + "\n";
         }
         this.var_17.findChildByName("description").caption = _loc4_;
      }
      
      private function getProductName() : String
      {
         var _loc1_:* = null;
         if(this.var_90 && this.var_90.productContainer && this.var_90.productContainer.firstProduct)
         {
            _loc1_ = this.var_90.productContainer.firstProduct.productData;
            if(_loc1_)
            {
               return _loc1_.name;
            }
         }
         return "";
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(!param1 || !param2 || !this._controller || !this.var_90)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "select_button":
               this._controller.confirmSelection(this.var_90,this._pageId);
               break;
            case "header_button_close":
            case "cancel_button":
               this._controller.closeConfirmation();
         }
      }
      
      private function createWindow(param1:String) : IWindow
      {
         if(!this._controller || !this._controller.assets || !this._controller.windowManager)
         {
            return null;
         }
         var _loc2_:XmlAsset = this._controller.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc2_ || !_loc2_.content)
         {
            return null;
         }
         var _loc3_:XML = _loc2_.content as XML;
         if(!_loc3_)
         {
            return null;
         }
         return this._controller.windowManager.buildFromXML(_loc3_);
      }
   }
}
