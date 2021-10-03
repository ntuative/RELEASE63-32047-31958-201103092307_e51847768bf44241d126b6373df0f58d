package com.sulake.habbo.inventory.pets
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   import com.sulake.habbo.inventory.IInventoryView;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class PetsView implements IInventoryView, IPetImageListener, IGetImageListener
   {
       
      
      private const const_2028:int = 0;
      
      private const const_936:int = 1;
      
      private const const_1717:int = 2;
      
      private const const_1718:int = 3;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_17:IWindowContainer;
      
      private var var_67:PetsModel;
      
      private var _disposed:Boolean = false;
      
      private var var_233:IItemGridWindow;
      
      private var _roomEngine:IRoomEngine;
      
      private var _avatarRenderer:IAvatarRenderManager;
      
      private var var_606:Map;
      
      private var var_358:PetsGridItem;
      
      private var var_2531:int = 0;
      
      public function PetsView(param1:PetsModel, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager, param5:IRoomEngine, param6:IAvatarRenderManager)
      {
         var _loc11_:* = null;
         super();
         this.var_67 = param1;
         this._assetLibrary = param3;
         this._windowManager = param2;
         this._roomEngine = param5;
         this._avatarRenderer = param6;
         this.var_606 = new Map();
         var _loc7_:XmlAsset = this._assetLibrary.getAssetByName("inventory_pets_view_xml") as XmlAsset;
         if(_loc7_ == null || _loc7_.content == null)
         {
            return;
         }
         this.var_17 = this._windowManager.buildFromXML(_loc7_.content as XML) as IWindowContainer;
         if(this.var_17 == null)
         {
            return;
         }
         this.var_17.visible = false;
         this.var_17.procedure = this.windowEventHandler;
         this.var_233 = this.var_17.findChildByName("grid") as IItemGridWindow;
         var _loc8_:IBitmapWrapperWindow = this.var_17.findChildByName("download_image") as IBitmapWrapperWindow;
         _loc8_.bitmap = new BitmapData(_loc8_.width,_loc8_.height);
         var _loc9_:BitmapData = this._assetLibrary.getAssetByName("download_icon_png").content as BitmapData;
         _loc8_.bitmap.copyPixels(_loc9_,_loc9_.rect,new Point((_loc8_.width - _loc9_.width) / 2,(_loc8_.height - _loc9_.height) / 2),null,null,true);
         _loc8_ = this.var_17.findChildByName("image") as IBitmapWrapperWindow;
         _loc8_.bitmap = new BitmapData(_loc8_.width,_loc8_.height);
         var _loc10_:BitmapData = this._assetLibrary.getAssetByName("inventory_empty_png").content as BitmapData;
         _loc8_.bitmap.copyPixels(_loc10_,_loc10_.rect,new Point((_loc8_.width - _loc10_.width) / 2,(_loc8_.height - _loc10_.height) / 2),null,null,true);
         _loc11_ = this.var_17.findChildByName("place_button") as IButtonWindow;
         if(_loc11_ != null)
         {
            _loc11_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.placeButtonClickHandler);
         }
         _loc11_ = this.var_17.findChildByName("open_catalog_btn") as IButtonWindow;
         if(_loc11_ != null)
         {
            _loc11_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.catalogButtonClickHandler);
         }
         this.selectPetsTab();
         this.updatePreview();
         this.setViewToState();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._windowManager = null;
            this.var_67 = null;
            this.var_17 = null;
            this._disposed = true;
         }
      }
      
      public function update() : void
      {
         this.updateGrid();
         this.updatePreview(this.var_358);
      }
      
      public function removePet(param1:int) : void
      {
         var _loc2_:PetsGridItem = this.var_606.remove(param1) as PetsGridItem;
         if(_loc2_ == null)
         {
            return;
         }
         this.var_233.removeGridItem(_loc2_.window);
         if(this.var_358 == _loc2_)
         {
            this.var_358 = null;
            this.selectFirst();
         }
      }
      
      private function selectFirst() : void
      {
         if(this.var_606 == null || this.var_606.length == 0)
         {
            this.updatePreview();
            return;
         }
         this.setSelectedGridItem(this.var_606.getWithIndex(0));
      }
      
      public function addPet(param1:PetData) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_606.getValue(param1.id) != null)
         {
            return;
         }
         var _loc2_:PetsGridItem = new PetsGridItem(this,param1,this._windowManager,this._assetLibrary,this._avatarRenderer);
         if(_loc2_ != null)
         {
            this.var_233.addGridItem(_loc2_.window);
            this.var_606.add(param1.id,_loc2_);
            if(this.var_358 == null)
            {
               this.selectFirst();
            }
         }
      }
      
      private function updateGrid() : void
      {
         var _loc2_:* = null;
         if(this.var_17 == null)
         {
            return;
         }
         this.var_233.removeGridItems();
         this.var_606.reset();
         var _loc1_:Map = this.var_67.pets;
         if(_loc1_ == null)
         {
            return;
         }
         for each(_loc2_ in _loc1_)
         {
            this.addPet(_loc2_);
         }
      }
      
      private function catalogButtonClickHandler(param1:WindowMouseEvent) : void
      {
         this.var_67.requestCatalogOpen();
      }
      
      private function placeButtonClickHandler(param1:WindowMouseEvent) : void
      {
         if(this.var_358 == null)
         {
            return;
         }
         var _loc2_:PetData = this.var_358.pet;
         if(_loc2_ == null)
         {
            return;
         }
         this.placePetToRoom(_loc2_.id);
      }
      
      public function placePetToRoom(param1:int, param2:Boolean = false) : void
      {
         this.var_67.placePetToRoom(param1,param2);
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(this.var_17 == null)
         {
            return null;
         }
         if(this.var_17.disposed)
         {
            return null;
         }
         return this.var_17;
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowEvent.const_59)
         {
            switch(param2.name)
            {
               case "tab_floor":
                  this.var_67.switchCategory(FurniModel.const_43);
                  break;
               case "tab_wall":
                  this.var_67.switchCategory(FurniModel.const_50);
            }
            this.selectPetsTab();
         }
      }
      
      private function selectPetsTab() : void
      {
         if(this.var_17 == null)
         {
            return;
         }
         var _loc1_:ISelectorWindow = this.var_17.findChildByName("category_selector") as ISelectorWindow;
         if(_loc1_ != null)
         {
            _loc1_.setSelected(_loc1_.getSelectableByName("tab_pets"));
         }
      }
      
      public function setSelectedGridItem(param1:PetsGridItem) : void
      {
         if(this.var_358 != null)
         {
            this.var_358.setSelected(false);
         }
         this.var_358 = param1;
         if(this.var_358 != null)
         {
            this.var_358.setSelected(true);
         }
         this.updatePreview(param1);
      }
      
      public function setViewToState() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Map = this.var_67.pets;
         if(!this.var_67.isListInited())
         {
            _loc2_ = this.const_936;
         }
         else if(!_loc1_ || _loc1_.length == 0)
         {
            _loc2_ = this.const_1717;
         }
         else
         {
            _loc2_ = this.const_1718;
         }
         if(this.var_2531 == _loc2_)
         {
            return;
         }
         this.var_2531 = _loc2_;
         var _loc3_:IWindowContainer = this.var_17.findChildByName("loading_container") as IWindowContainer;
         var _loc4_:IWindowContainer = this.var_17.findChildByName("empty_container") as IWindowContainer;
         var _loc5_:IWindowContainer = this.var_17.findChildByName("grid_container") as IWindowContainer;
         var _loc6_:IWindowContainer = this.var_17.findChildByName("preview_container") as IWindowContainer;
         switch(_loc2_)
         {
            case this.const_936:
               _loc3_.visible = true;
               _loc4_.visible = false;
               _loc5_.visible = false;
               _loc6_.visible = false;
               break;
            case this.const_1717:
               _loc3_.visible = false;
               _loc4_.visible = true;
               _loc5_.visible = false;
               _loc6_.visible = false;
               break;
            case this.const_1718:
               _loc3_.visible = false;
               _loc4_.visible = false;
               _loc5_.visible = true;
               _loc6_.visible = true;
               this.updateGrid();
               this.updatePreview();
         }
      }
      
      private function updatePreview(param1:PetsGridItem = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc12_:* = null;
         var _loc13_:* = null;
         if(this.var_17 == null)
         {
            return;
         }
         if(param1 == null || param1.pet == null)
         {
            _loc2_ = new BitmapData(1,1);
            _loc3_ = "";
            _loc4_ = "";
            _loc5_ = false;
         }
         else
         {
            _loc12_ = param1.pet;
            _loc3_ = _loc12_.name;
            _loc2_ = this.getPetImage(_loc12_.type,_loc12_.breed,_loc12_.color,4,true);
            _loc5_ = true;
         }
         var _loc6_:IBitmapWrapperWindow = this.var_17.findChildByName("preview_image") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc13_ = new BitmapData(_loc6_.width,_loc6_.height);
            _loc13_.fillRect(_loc13_.rect,0);
            _loc13_.copyPixels(_loc2_,_loc2_.rect,new Point(_loc13_.width / 2 - _loc2_.width / 2,_loc13_.height / 2 - _loc2_.height / 2));
            _loc6_.bitmap = _loc13_;
         }
         _loc2_.dispose();
         var _loc7_:ITextWindow = this.var_17.findChildByName("preview_text") as ITextWindow;
         if(_loc7_ != null)
         {
            _loc7_.caption = _loc3_;
         }
         _loc7_ = this.var_17.findChildByName("preview_description") as ITextWindow;
         if(_loc7_ != null)
         {
            _loc7_.caption = _loc4_;
         }
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         if(this.var_67.roomSession != null)
         {
            _loc8_ = this.var_67.roomSession.arePetsAllowed;
            _loc9_ = this.var_67.roomSession.isRoomOwner;
         }
         var _loc10_:String = "";
         if(!_loc9_)
         {
            if(_loc8_)
            {
               _loc10_ = "${inventory.pets.allowed}";
            }
            else
            {
               _loc10_ = "${inventory.pets.forbidden}";
            }
         }
         _loc7_ = this.var_17.findChildByName("preview_info") as ITextWindow;
         if(_loc7_ != null)
         {
            _loc7_.caption = _loc10_;
         }
         var _loc11_:IButtonWindow = this.var_17.findChildByName("place_button") as IButtonWindow;
         if(_loc11_ != null)
         {
            if(_loc5_ && (_loc9_ || _loc8_))
            {
               _loc11_.enable();
            }
            else
            {
               _loc11_.disable();
            }
         }
      }
      
      public function getPetImage(param1:int, param2:int, param3:String, param4:int, param5:Boolean) : BitmapData
      {
         var _loc7_:* = 0;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc6_:* = null;
         if(param1 < 8)
         {
            _loc7_ = uint(parseInt(param3,16));
            _loc8_ = this._avatarRenderer.createPetImage(param1,param2,_loc7_,AvatarScaleType.const_57,this);
            if(_loc8_ != null)
            {
               _loc8_.setDirection(AvatarSetType.const_35,param4);
               if(param5)
               {
                  _loc6_ = _loc8_.getCroppedImage(AvatarSetType.const_35);
               }
               else
               {
                  _loc6_ = _loc8_.getCroppedImage(AvatarSetType.const_51);
               }
               _loc8_.dispose();
            }
         }
         else
         {
            _loc9_ = 0;
            _loc10_ = this._roomEngine.getPetImage(param1,param2,new Vector3d(param4 * 45),64,this,_loc9_);
            if(_loc10_ != null)
            {
               _loc6_ = _loc10_.data;
            }
         }
         if(_loc6_ == null)
         {
            _loc6_ = new BitmapData(30,30,false,4289374890);
         }
         return _loc6_;
      }
      
      public function petImageReady(param1:String) : void
      {
         this.update();
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         param2.dispose();
         this.update();
      }
   }
}
