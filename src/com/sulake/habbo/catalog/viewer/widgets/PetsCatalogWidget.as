package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.pets.IPetColor;
   import com.sulake.habbo.avatar.pets.IPetData;
   import com.sulake.habbo.avatar.pets.IPetDataListener;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSellablePetBreedsEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetsInitializedEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.SellablePetBreedData;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class PetsCatalogWidget extends CatalogWidget implements ICatalogWidget, IPetDataListener, IPetImageListener
   {
       
      
      private var _offers:Map;
      
      private var _name:String;
      
      private var var_455:int = -1;
      
      private var var_748:int = 0;
      
      private var var_498:int = 0;
      
      private var var_2118:String;
      
      private var var_828:Boolean = false;
      
      private var var_195:Array;
      
      private var var_356:Array;
      
      private var var_693:Boolean = false;
      
      public function PetsCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_693)
         {
            return;
         }
         if(page && false && page.viewer.catalog)
         {
            _loc1_ = page.viewer.catalog as HabboCatalog;
            if(_loc1_ && _loc1_.avatarRenderManager)
            {
               _loc1_.avatarRenderManager.removePetImageListener(this);
               if(_loc1_.avatarRenderManager.petDataManager)
               {
                  _loc1_.avatarRenderManager.petDataManager.removeListener(this);
               }
            }
         }
         this.var_828 = false;
         this._offers.dispose();
         this._offers = null;
         this.var_195 = null;
         this.var_356 = null;
         super.dispose();
         this.var_693 = true;
      }
      
      override public function init() : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(!super.init())
         {
            return false;
         }
         this.var_828 = false;
         var _loc1_:IWindow = window.findChildByName("ctlg_buy_button");
         var _loc2_:ITextFieldWindow = window.findChildByName("name_input_text") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return false;
         }
         _loc2_.addEventListener(WindowEvent.const_109,this.onTextWindowEvent);
         this._offers = new Map();
         if(page.offers.length == 0)
         {
            return false;
         }
         var _loc3_:Offer = page.offers[0];
         this.var_455 = this.getPetTypeIndexFromProduct(_loc3_.localizationId);
         if(this.var_455 >= 8)
         {
            return false;
         }
         this.updateAvailableBreeds(_loc3_.localizationId);
         this.var_2118 = _loc3_.localizationId;
         this.var_356 = [];
         if(page && false && page.viewer.catalog)
         {
            _loc4_ = page.viewer.catalog as HabboCatalog;
            if(_loc4_ && _loc4_.avatarRenderManager && _loc4_.avatarRenderManager.petDataManager)
            {
               _loc5_ = _loc4_.avatarRenderManager.petDataManager.getPetData(this.var_455,this);
               if(_loc5_)
               {
                  this.var_356 = _loc5_.colors;
                  if(this.var_356 == null)
                  {
                     this.var_356 = [];
                  }
               }
            }
         }
         this._offers.add(this.var_455,_loc3_);
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.CWE_COLOUR_INDEX,this.onColourIndex);
         events.addEventListener(WidgetEvent.const_641,this.onApproveNameResult);
         events.addEventListener(WidgetEvent.CWE_WIDGETS_INITIALIZED,this.onWidgetsInitialized);
         events.addEventListener(WidgetEvent.CWE_SELLABLE_PET_BREEDS,this.onSellablePetBreeds);
         return true;
      }
      
      private function onWidgetsInitialized(param1:CatalogWidgetsInitializedEvent = null) : void
      {
         var _loc4_:* = null;
         if(this.var_693)
         {
            return;
         }
         events.dispatchEvent(new CatalogWidgetPurchaseOverrideEvent(this.onPurchase));
         var _loc2_:Offer = this._offers.getWithIndex(0);
         if(_loc2_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc2_));
         }
         var _loc3_:* = [];
         for each(_loc4_ in this.var_356)
         {
            _loc3_.push(_loc4_.rgb);
         }
         events.dispatchEvent(new CatalogWidgetColoursEvent(_loc3_,"ctlg_clr_27x22_1","ctlg_clr_27x22_2","ctlg_clr_27x22_3"));
      }
      
      private function onPurchase(param1:WindowEvent) : void
      {
         if(this.var_828)
         {
            Logger.log("* Cannot buy a pet, pending previous name approval.");
         }
         if(this.getPurchaseParameters() == "")
         {
            return;
         }
         this.var_828 = true;
         (page.viewer.catalog as HabboCatalog).approveName(this._name,1);
      }
      
      public function onDropMenuEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowEvent.const_59)
         {
            _loc3_ = IDropMenuWindow(param2).selection;
            if(this.var_195 == null || _loc3_ >= this.var_195.length)
            {
               return;
            }
            this.var_748 = _loc3_;
            this.updateImage();
         }
      }
      
      private function onTextWindowEvent(param1:WindowEvent) : void
      {
         var _loc2_:ITextFieldWindow = param1.target as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         this._name = _loc2_.text;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.updateImage();
      }
      
      private function onColourIndex(param1:CatalogWidgetColourIndexEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.var_498 = param1.index;
         if(this.var_498 < 0 || this.var_498 > this.var_356.length)
         {
            this.var_498 = 0;
         }
         this.updateImage();
      }
      
      private function onApproveNameResult(param1:CatalogWidgetApproveNameResultEvent) : void
      {
         var event:CatalogWidgetApproveNameResultEvent = param1;
         if(event == null || !this.var_828)
         {
            return;
         }
         this.var_828 = false;
         switch(event.result)
         {
            case 1:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.long}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 2:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.short}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 3:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.chars}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 4:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.bobba}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            default:
               var p:String = this.getPurchaseParameters();
               if(p == "")
               {
                  Logger.log("* Not enough information to buy a pet!");
                  return;
               }
               Logger.log("* Will buy pet as " + p);
               (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this._offers.getWithIndex(0),page.pageId,p);
               return;
         }
      }
      
      private function onSellablePetBreeds(param1:CatalogWidgetSellablePetBreedsEvent) : void
      {
         if(param1.productCode == this.var_2118)
         {
            this.var_195 = this.parseSellableBreeds(param1.sellableBreeds);
            this.var_748 = 0;
            this.updateBreedSelections();
         }
      }
      
      private function parseSellableBreeds(param1:Array) : Array
      {
         var _loc3_:* = null;
         if(!param1)
         {
            return null;
         }
         var _loc2_:Array = new Array();
         for each(_loc3_ in param1)
         {
            if(_loc3_.type == this.var_455 && _loc3_.sellable)
            {
               _loc2_.push(_loc3_.breed);
            }
         }
         return _loc2_;
      }
      
      private function updateBreedSelections() : void
      {
         var _loc5_:int = 0;
         var _loc1_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var _loc2_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < this.var_195.length)
         {
            _loc5_ = this.var_195[_loc3_] as int;
            _loc2_.push(_loc1_.getKey(this.getRaceLocalizationKey(this.var_455,_loc5_),this.getRaceLocalizationKey(this.var_455,_loc5_)));
            _loc3_++;
         }
         var _loc4_:IDropMenuWindow = window.findChildByName("type_drop_menu") as IDropMenuWindow;
         if(_loc4_ == null)
         {
            return;
         }
         if(_loc2_.length > 1)
         {
            _loc4_.populate(_loc2_);
            _loc4_.selection = 0;
            _loc4_.procedure = this.onDropMenuEvent;
            _loc4_.visible = true;
         }
         else
         {
            _loc4_.visible = false;
         }
         this.updateImage();
      }
      
      private function updateImage() : void
      {
         var _loc7_:* = null;
         var _loc1_:Offer = this._offers.getWithIndex(0);
         if(_loc1_ == null)
         {
            return;
         }
         if(this.var_195 == null || this.var_748 >= this.var_195.length)
         {
            return;
         }
         var _loc2_:* = 0;
         if(this.var_498 >= 0 && this.var_498 < this.var_356.length)
         {
            _loc7_ = this.var_356[this.var_498] as IPetColor;
            if(_loc7_ != null)
            {
               _loc2_ = uint(_loc7_.rgb);
            }
         }
         var _loc3_:int = this.var_195[this.var_748] as int;
         var _loc4_:IAvatarImage = (page.viewer.catalog as HabboCatalog).avatarRenderManager.createPetImage(this.var_455,_loc3_,_loc2_,AvatarScaleType.const_57,this);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.initActionAppends();
         _loc4_.appendAction(AvatarAction.const_277,AvatarAction.const_617);
         _loc4_.endActionAppends();
         _loc4_.setDirection(AvatarSetType.const_35,2);
         this.setPreviewImage(_loc4_.getCroppedImage(AvatarSetType.const_35),true);
         _loc4_.dispose();
         var _loc5_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var _loc6_:ITextWindow = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         if(_loc6_ != null)
         {
            _loc5_.registerParameter("catalog.purchase.price.credits","credits",String(_loc1_.priceInCredits));
            _loc6_.caption = "${catalog.purchase.price.credits}";
         }
      }
      
      private function getPurchaseParameters() : String
      {
         if(this._name == null || this._name.length == 0)
         {
            page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.empty}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return "";
         }
         if(this.var_195 == null || this.var_748 >= this.var_195.length)
         {
            return "";
         }
         if(this.var_498 >= this.var_356.length)
         {
            return "";
         }
         var petColor:IPetColor = this.var_356[this.var_498] as IPetColor;
         var color:uint = petColor.rgb;
         var breed:int = this.var_195[this.var_748] as int;
         var p:String = this._name + String.fromCharCode(10) + breed + String.fromCharCode(10) + this.addZeroPadding(color.toString(16).toUpperCase(),6);
         return p;
      }
      
      private function setPreviewImage(param1:BitmapData, param2:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(true)
         {
            if(param1 == null)
            {
               param1 = new BitmapData(1,1);
               param2 = true;
            }
            _loc3_ = window.findChildByName("ctlg_teaserimg_1") as IBitmapWrapperWindow;
            if(_loc3_ != null)
            {
               if(_loc3_.bitmap == null)
               {
                  _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
               }
               _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
               _loc4_ = 2;
               _loc5_ = new BitmapData(param1.width * _loc4_,param1.height * _loc4_,true,16777215);
               _loc5_.draw(param1,new Matrix(_loc4_,0,0,_loc4_));
               _loc6_ = new Point((_loc3_.width - _loc5_.width) / 2,(_loc3_.height - _loc5_.height) / 2);
               _loc3_.bitmap.copyPixels(_loc5_,_loc5_.rect,_loc6_,null,null,true);
               _loc3_.invalidate();
               _loc5_.dispose();
            }
         }
         if(param2)
         {
            param1.dispose();
         }
      }
      
      private function getPetTypeIndexFromProduct(param1:String) : int
      {
         if(param1.length == 0)
         {
            return 0;
         }
         var _loc2_:int = 0;
         _loc2_ = param1.length - 1;
         while(_loc2_ >= 0)
         {
            if(isNaN(parseInt(param1.charAt(_loc2_))))
            {
               break;
            }
            _loc2_--;
         }
         if(_loc2_ > 0)
         {
            return int(param1.substring(_loc2_ + 1));
         }
         return -1;
      }
      
      private function getRaceLocalizationKey(param1:int, param2:int) : String
      {
         return "pet.breed." + param1 + "." + param2;
      }
      
      private function addZeroPadding(param1:String, param2:int) : String
      {
         while(param1.length < param2)
         {
            param1 = "0" + param1;
         }
         return param1;
      }
      
      private function updateAvailableBreeds(param1:String) : void
      {
         var _loc2_:* = null;
         if(this.var_195 == null)
         {
            _loc2_ = (page.viewer.catalog as HabboCatalog).getSellablePetBreeds(param1);
            this.var_195 = this.parseSellableBreeds(_loc2_);
            this.var_748 = 0;
            if(this.var_195 != null)
            {
               this.updateBreedSelections();
            }
         }
      }
      
      public function petImageReady(param1:String) : void
      {
         if(this.var_693)
         {
            return;
         }
         this.updateImage();
      }
      
      public function petDataReady() : void
      {
         if(this.var_693)
         {
            return;
         }
         this.init();
         this.onWidgetsInitialized();
      }
   }
}
