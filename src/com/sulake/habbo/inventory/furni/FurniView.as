package com.sulake.habbo.inventory.furni
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.inventory.IInventoryView;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.items.FloorItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   
   public class FurniView implements IInventoryView, IGetImageListener
   {
       
      
      private const const_2028:int = 0;
      
      private const const_936:int = 1;
      
      private const const_1717:int = 2;
      
      private const const_1718:int = 3;
      
      private const const_1723:int = 42;
      
      private const const_1724:int = 120;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_17:IWindowContainer;
      
      private var var_67:FurniModel;
      
      private var var_661:MarketplaceModel;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_507:IHabboSoundManager;
      
      private var _disposed:Boolean = false;
      
      private var var_431:Map;
      
      private var var_430:String;
      
      private var var_2531:int = 0;
      
      private var var_621:Array;
      
      public function FurniView(param1:FurniModel, param2:MarketplaceModel, param3:IHabboWindowManager, param4:IAssetLibrary, param5:IRoomEngine, param6:IHabboSoundManager)
      {
         var _loc13_:* = null;
         this.var_621 = new Array();
         super();
         this.var_67 = param1;
         this.var_661 = param2;
         this._assetLibrary = param4;
         this._windowManager = param3;
         this._roomEngine = param5;
         this.var_507 = param6;
         this.var_507.events.addEventListener(SongInfoReceivedEvent.const_785,this.onSongInfoReceivedEvent);
         this.var_431 = new Map();
         this.var_431.add(FurniModel.const_43,new FurniGridView(this.var_67,FurniModel.const_43,this._windowManager,this._assetLibrary,this._roomEngine));
         this.var_431.add(FurniModel.const_50,new FurniGridView(this.var_67,FurniModel.const_50,this._windowManager,this._assetLibrary,this._roomEngine));
         var _loc7_:IAsset = this._assetLibrary.getAssetByName("inventory_furni_base_xml");
         var _loc8_:XmlAsset = XmlAsset(_loc7_);
         if(_loc8_ == null)
         {
            return;
         }
         this.var_17 = IWindowContainer(this._windowManager.buildFromXML(XML(_loc8_.content)));
         this.var_17.visible = false;
         this.var_17.procedure = this.windowEventProc;
         this.switchCategory(FurniModel.const_43);
         var _loc9_:IWindowContainer = this.var_17.findChildByName("preview_container") as IWindowContainer;
         if(_loc9_ != null)
         {
            _loc7_ = this._assetLibrary.getAssetByName("inventory_furni_preview_xml");
            _loc8_ = XmlAsset(_loc7_);
            _loc13_ = IWindowContainer(this._windowManager.buildFromXML(XML(_loc8_.content)));
            if(_loc13_ != null)
            {
               _loc9_.addChild(_loc13_);
            }
         }
         var _loc10_:IBitmapWrapperWindow = this.var_17.findChildByName("download_image") as IBitmapWrapperWindow;
         _loc10_.bitmap = new BitmapData(_loc10_.width,_loc10_.height);
         var _loc11_:BitmapData = this._assetLibrary.getAssetByName("download_icon_png").content as BitmapData;
         _loc10_.bitmap.copyPixels(_loc11_,_loc11_.rect,new Point((_loc10_.width - _loc11_.width) / 2,(_loc10_.height - _loc11_.height) / 2),null,null,true);
         _loc10_ = this.var_17.findChildByName("image") as IBitmapWrapperWindow;
         _loc10_.bitmap = new BitmapData(_loc10_.width,_loc10_.height);
         var _loc12_:BitmapData = this._assetLibrary.getAssetByName("inventory_empty_png").content as BitmapData;
         _loc10_.bitmap.copyPixels(_loc12_,_loc12_.rect,new Point((_loc10_.width - _loc12_.width) / 2,(_loc10_.height - _loc12_.height) / 2),null,null,true);
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
            this.var_67 = null;
            this.var_661 = null;
            this.var_17 = null;
            this._windowManager = null;
            this._roomEngine = null;
            if(this.var_507)
            {
               this.var_507.events.removeEventListener(SongInfoReceivedEvent.const_785,this.onSongInfoReceivedEvent);
               this.var_507 = null;
            }
            this.var_621 = null;
            this._disposed = true;
         }
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         var _loc2_:* = null;
         if(this.var_17 == null)
         {
            return null;
         }
         if(this.var_17.disposed)
         {
            return null;
         }
         var _loc1_:Boolean = this.var_67.isTradingOpen;
         _loc2_ = this.var_17.findChildByName("placeinroom_btn");
         if(_loc2_ != null)
         {
            _loc2_.visible = !_loc1_;
         }
         _loc2_ = this.var_17.findChildByName("offertotrade_btn");
         if(_loc2_ != null)
         {
            _loc2_.visible = _loc1_;
         }
         return this.var_17;
      }
      
      public function get visibleCategoryId() : String
      {
         return this.var_430;
      }
      
      public function switchCategory(param1:String) : void
      {
         if(this.var_17 == null)
         {
            return;
         }
         if(this.var_17.disposed)
         {
            return;
         }
         if(this.var_430 == param1)
         {
            return;
         }
         var _loc2_:ISelectorWindow = this.var_17.findChildByName("category_selector") as ISelectorWindow;
         switch(param1)
         {
            case FurniModel.const_50:
               _loc2_.setSelected(_loc2_.getSelectableByName("tab_wall"));
               this.var_430 = FurniModel.const_50;
               break;
            case FurniModel.const_43:
               _loc2_.setSelected(_loc2_.getSelectableByName("tab_floor"));
               this.var_430 = FurniModel.const_43;
               break;
            case FurniModel.const_402:
               _loc2_.setSelected(_loc2_.getSelectableByName("tab_pets"));
               this.var_430 = FurniModel.const_402;
               break;
            default:
               throw new Error("Unknown item category: \"" + param1 + "\"");
         }
         this.var_67.furniCategorySwitch();
         this.showCategoryGrid(this.var_430);
         this.setViewToState();
      }
      
      private function showCategoryGrid(param1:String = null) : void
      {
         var _loc4_:* = null;
         if(param1 == null)
         {
            param1 = this.var_430;
         }
         var _loc2_:IWindowContainer = this.var_17.findChildByName("grid_container") as IWindowContainer;
         _loc2_.removeChildAt(0);
         var _loc3_:FurniGridView = this.var_431.getValue(this.var_430);
         if(_loc3_)
         {
            _loc4_ = _loc3_.window;
            if(_loc4_ == null)
            {
               return;
            }
            _loc2_.addChild(_loc4_);
            _loc2_.invalidate();
            this.updateActionView();
         }
      }
      
      public function setViewToState() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Array = this.var_67.getCategoryContent(this.var_430);
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
         var _loc5_:IWindowContainer = this.var_17.findChildByName("furni_container") as IWindowContainer;
         switch(_loc2_)
         {
            case this.const_936:
               _loc3_.visible = true;
               _loc4_.visible = false;
               _loc5_.visible = false;
               break;
            case this.const_1717:
               _loc3_.visible = false;
               _loc4_.visible = true;
               _loc5_.visible = false;
               break;
            case this.const_1718:
               _loc3_.visible = false;
               _loc4_.visible = false;
               _loc5_.visible = true;
               this.showCategoryGrid();
         }
      }
      
      public function clearViews() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:Array = [FurniModel.const_43,FurniModel.const_50];
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.length)
         {
            _loc2_ = _loc1_[_loc4_];
            _loc3_ = this.var_431.getValue(_loc2_);
            if(_loc3_ != null)
            {
               _loc3_.clearGrid();
            }
            _loc4_++;
         }
         this.updateActionView();
      }
      
      public function updateItem(param1:String, param2:GroupItem, param3:int) : void
      {
         if(param2 == null)
         {
            return;
         }
         var _loc4_:FurniGridView = this.var_431.getValue(param1);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.updateItem(param3,param2.window);
         this.updateActionView();
      }
      
      public function addItemToBottom(param1:String, param2:GroupItem) : void
      {
         if(param2 == null)
         {
            return;
         }
         var _loc3_:FurniGridView = this.var_431.getValue(param1);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.addItemToBottom(param2.window);
      }
      
      public function addItemAt(param1:String, param2:GroupItem, param3:int) : void
      {
         if(param2 == null)
         {
            return;
         }
         var _loc4_:FurniGridView = this.var_431.getValue(param1);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.addItemAt(param2.window,param3);
      }
      
      public function removeItem(param1:String, param2:int) : void
      {
         var _loc3_:FurniGridView = this.var_431.getValue(param1);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:IWindow = _loc3_.removeItem(param2);
         if(_loc4_)
         {
            _loc4_.dispose();
         }
         this.updateActionView();
      }
      
      public function setGridLock(param1:String, param2:Boolean) : void
      {
         var _loc3_:FurniGridView = this.var_431.getValue(param1);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.setLock(param2);
      }
      
      public function updateActionView() : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc21_:* = null;
         var _loc22_:* = null;
         if(this.var_17 == null)
         {
            return;
         }
         if(this.var_17.disposed)
         {
            return;
         }
         var _loc1_:Boolean = false;
         var _loc3_:int = this.var_67.getSelectedItemIndex();
         _loc4_ = this.var_67.getGroupItemInIndex(_loc3_,this.var_430);
         if(_loc3_ > -1 && _loc4_ != null && _loc4_.peek() != null)
         {
            _loc5_ = _loc4_.peek();
            _loc1_ = true;
            if(_loc5_.category == FurniCategory.const_368)
            {
               _loc15_ = this._assetLibrary.getAssetByName("icon_wallpaper_png");
               if(_loc15_ != null)
               {
                  this.setPreviewImage(_loc15_.content as BitmapData);
               }
               _loc9_ = "${inventory.furni.item.wallpaper.name}";
               _loc10_ = "${inventory.furni.item.wallpaper.desc}";
            }
            else if(_loc5_.category == FurniCategory.const_385)
            {
               _loc15_ = this._assetLibrary.getAssetByName("icon_floor_png");
               if(_loc15_ != null)
               {
                  this.setPreviewImage(_loc15_.content as BitmapData);
               }
               _loc9_ = "${inventory.furni.item.floor.name}";
               _loc10_ = "${inventory.furni.item.floor.desc}";
            }
            else if(_loc5_.category == FurniCategory.const_381)
            {
               _loc15_ = this._assetLibrary.getAssetByName("icon_landscape_png");
               if(_loc15_ != null)
               {
                  this.setPreviewImage(_loc15_.content as BitmapData);
               }
               _loc9_ = "${inventory.furni.item.landscape.name}";
               _loc10_ = "${inventory.furni.item.landscape.desc}";
            }
            else
            {
               if(_loc5_.category == FurniCategory.const_169)
               {
                  _loc9_ = "${poster_" + _loc5_.stuffData + "_name}";
                  _loc10_ = "${poster_" + _loc5_.stuffData + "_desc}";
               }
               _loc20_ = 4294967295;
               if(_loc5_ is FloorItem)
               {
                  _loc19_ = this._roomEngine.getFurnitureImage(_loc4_.type,new Vector3d(180,0,0),64,this,_loc20_,String(_loc4_.extra));
               }
               else
               {
                  _loc19_ = this._roomEngine.getWallItemImage(_loc4_.type,new Vector3d(180,0,0),64,this,_loc20_,_loc4_.stuffData);
               }
               if(_loc19_ != null)
               {
                  _loc2_ = _loc19_.data;
               }
               this.setPreviewImage(_loc2_);
               _loc4_.previewCallbackId = _loc19_.id;
            }
            _loc6_ = this.var_17.findChildByName("tradeable_icon") as IBitmapWrapperWindow;
            _loc7_ = this.var_17.findChildByName("tradeable_number") as ITextWindow;
            _loc8_ = this.var_17.findChildByName("tradeable_info_region") as IRegionWindow;
            if(_loc6_ != null && _loc7_ != null && _loc8_ != null)
            {
               _loc18_ = _loc4_.getTradeableCount();
               if(_loc18_ == 0)
               {
                  _loc17_ = this._assetLibrary.getAssetByName("no_trade_icon_png");
                  _loc16_ = _loc17_.content as BitmapData;
                  _loc7_.visible = false;
                  _loc8_.toolTipCaption = "${inventory.furni.preview.not_tradeable}";
                  _loc7_.filters = [];
               }
               else
               {
                  _loc17_ = this._assetLibrary.getAssetByName("trade_icon_png");
                  _loc16_ = _loc17_.content as BitmapData;
                  _loc7_.visible = true;
                  _loc7_.text = String(_loc18_);
                  _loc8_.toolTipCaption = "${inventory.furni.preview.tradeable_amount}";
                  _loc7_.filters = [new GlowFilter(16777215,1,3,3,300)];
               }
               _loc6_.bitmap = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
               if(_loc16_ != null)
               {
                  _loc6_.bitmap.copyPixels(_loc16_,_loc16_.rect,new Point(0,0),null,null,true);
               }
               _loc6_.invalidate();
            }
            _loc6_ = this.var_17.findChildByName("recyclable_icon") as IBitmapWrapperWindow;
            _loc7_ = this.var_17.findChildByName("recyclable_number") as ITextWindow;
            _loc8_ = this.var_17.findChildByName("recyclable_info_region") as IRegionWindow;
            if(_loc6_ != null && _loc7_ != null && _loc8_ != null)
            {
               _loc18_ = _loc4_.getRecyclableCount();
               if(_loc18_ == 0)
               {
                  _loc17_ = this._assetLibrary.getAssetByName("no_recycle_icon_png");
                  _loc16_ = _loc17_.content as BitmapData;
                  _loc7_.visible = false;
                  _loc8_.toolTipCaption = "${inventory.furni.preview.not_recyclable}";
                  _loc7_.filters = [];
               }
               else
               {
                  _loc17_ = this._assetLibrary.getAssetByName("recycle_icon_png");
                  _loc16_ = _loc17_.content as BitmapData;
                  _loc7_.visible = true;
                  _loc7_.text = String(_loc18_);
                  _loc8_.toolTipCaption = "${inventory.furni.preview.recyclable_amount}";
                  _loc7_.filters = [new GlowFilter(16777215,1,3,3,300)];
               }
               _loc6_.bitmap = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
               if(_loc16_ != null)
               {
                  _loc6_.bitmap.copyPixels(_loc16_,_loc16_.rect,new Point(0,0),null,null,true);
               }
               _loc6_.invalidate();
            }
         }
         else
         {
            this.setPreviewImage(null);
            _loc6_ = this.var_17.findChildByName("tradeable_icon") as IBitmapWrapperWindow;
            _loc7_ = this.var_17.findChildByName("tradeable_number") as ITextWindow;
            _loc8_ = this.var_17.findChildByName("tradeable_info_region") as IRegionWindow;
            if(_loc6_ && _loc7_ && _loc8_)
            {
               _loc6_.bitmap = null;
               _loc7_.visible = false;
            }
            _loc6_ = this.var_17.findChildByName("recyclable_icon") as IBitmapWrapperWindow;
            _loc7_ = this.var_17.findChildByName("recyclable_number") as ITextWindow;
            _loc8_ = this.var_17.findChildByName("recyclable_info_region") as IRegionWindow;
            if(_loc6_ && _loc7_ && _loc8_)
            {
               _loc6_.bitmap = null;
               _loc7_.visible = false;
            }
         }
         var _loc12_:Boolean = this.var_67.isTradingOpen;
         _loc11_ = this.var_17.findChildByName("placeinroom_btn") as IButtonWindow;
         if(_loc11_)
         {
            if(_loc1_ && this.var_67.isPrivateRoom)
            {
               _loc11_.enable();
            }
            else
            {
               _loc11_.disable();
            }
            _loc11_.visible = !_loc12_;
         }
         _loc11_ = this.var_17.findChildByName("offertotrade_btn") as IButtonWindow;
         if(_loc11_)
         {
            if(_loc1_ && _loc4_ != null && _loc5_ != null && this.var_67.canUserOfferToTrade())
            {
               if(_loc4_.getUnlockedCount() && _loc5_.tradeable)
               {
                  _loc11_.enable();
               }
               else
               {
                  _loc11_.disable();
               }
            }
            else
            {
               _loc11_.disable();
            }
            _loc11_.visible = _loc12_;
         }
         _loc11_ = this.var_17.findChildByName("sell_btn") as IButtonWindow;
         if(_loc11_)
         {
            if(_loc1_ && this.var_661 && this.var_661.isEnabled && _loc5_.sellable)
            {
               _loc11_.enable();
            }
            else
            {
               _loc11_.disable();
            }
         }
         var _loc13_:ITextWindow = this.var_17.findChildByName("furni_name") as ITextWindow;
         if(_loc13_ != null)
         {
            if(_loc9_ != null)
            {
               _loc13_.text = _loc9_;
            }
            else if(_loc5_ != null)
            {
               _loc13_.text = "${roomItem.name." + _loc5_.type + "}";
            }
            else
            {
               _loc13_.text = "";
            }
            if(_loc5_ != null)
            {
               if(_loc5_.category == FurniCategory.const_1207)
               {
                  _loc21_ = this.var_507.musicController.getSongInfo(_loc5_.extra);
                  if(_loc21_ != null)
                  {
                     _loc13_.text = _loc21_.name;
                  }
                  else
                  {
                     this.var_507.musicController.requestSongInfoWithoutSamples(_loc5_.extra);
                     this.var_621.push(_loc5_.extra);
                  }
               }
            }
            Logger.log("Name width: " + [_loc13_.width,_loc13_.textWidth,_loc13_.height,_loc13_.textHeight]);
            _loc13_.height = _loc13_.textHeight;
         }
         var _loc14_:ITextWindow = this.var_17.findChildByName("furni_description") as ITextWindow;
         if(_loc14_ != null)
         {
            if(_loc10_ != null)
            {
               _loc14_.text = _loc10_;
            }
            else if(_loc5_ != null)
            {
               _loc14_.text = "${roomItem.desc." + _loc5_.type + "}";
            }
            else
            {
               _loc14_.text = "";
            }
            if(_loc5_ != null)
            {
               if(_loc5_.category == FurniCategory.const_1207)
               {
                  _loc22_ = this.var_507.musicController.getSongInfo(_loc5_.extra);
                  if(_loc22_ != null)
                  {
                     _loc14_.text = _loc22_.creator;
                  }
                  else
                  {
                     this.var_507.musicController.requestSongInfoWithoutSamples(_loc5_.extra);
                     this.var_621.push(_loc5_.extra);
                  }
               }
            }
            _loc14_.height = _loc14_.textHeight + 5;
         }
      }
      
      public function displayItemInfo(param1:GroupItem) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         if(this.var_17 == null)
         {
            return;
         }
         if(this.var_17.disposed)
         {
            return;
         }
         var _loc3_:IItem = param1.peek();
         if(_loc3_ is FloorItem)
         {
            _loc2_ = this._roomEngine.getFurnitureImage(param1.type,new Vector3d(2,0,0),64,this,0,String(param1.extra));
         }
         else
         {
            _loc2_ = this._roomEngine.getWallItemImage(param1.type,new Vector3d(2,0,0),64,this,0,param1.stuffData);
         }
         if(_loc2_ != null)
         {
            this.setPreviewImage(_loc2_.data);
         }
         _loc4_ = this.var_17.findChildByName("placeinroom_btn") as IButtonWindow;
         if(_loc4_)
         {
            _loc4_.disable();
         }
         _loc4_ = this.var_17.findChildByName("offertotrade_btn") as IButtonWindow;
         if(_loc4_)
         {
            _loc4_.disable();
         }
      }
      
      private function setPreviewImage(param1:BitmapData) : void
      {
         var _loc2_:IBitmapWrapperWindow = this.var_17.findChildByName("furni_preview_image") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            param1 = new BitmapData(20,20);
         }
         var _loc3_:int = param1.height;
         if(_loc3_ > this.const_1724)
         {
            _loc3_ = this.const_1724;
         }
         else if(_loc3_ < this.const_1723)
         {
            _loc3_ = this.const_1723;
         }
         else
         {
            _loc3_ = Math.ceil(_loc3_ / 10) * 10;
         }
         _loc2_.bitmap = new BitmapData(_loc2_.width,_loc3_,true,16777215);
         _loc2_.height = _loc3_;
         var _loc4_:Point = new Point((_loc2_.width - param1.width) / 2,(_loc3_ - param1.height) / 2);
         _loc2_.bitmap.copyPixels(param1,param1.rect,_loc4_,null,null,true);
         _loc2_.invalidate();
         var _loc5_:ITextWindow = this.var_17.findChildByName("furni_description") as ITextWindow;
         if(_loc5_ != null)
         {
            _loc5_.y = _loc2_.y + _loc2_.height + 5;
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:GroupItem = this.var_67.getGroupItemInIndex(this.var_67.getSelectedItemIndex());
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.previewCallbackId == param1)
         {
            this.setPreviewImage(param2);
         }
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "placeinroom_btn":
                  this.var_67.requestSelectedFurniPlacement(false);
                  break;
               case "offertotrade_btn":
                  this.var_67.requestSelectedFurniToTrading();
                  break;
               case "sell_btn":
                  this.var_67.requestSelectedFurniSelling();
                  break;
               case "open_catalog_btn":
                  this.var_67.requestCatalogOpen();
                  break;
               default:
                  this.var_67.cancelFurniInMover();
            }
         }
         else if(param1.type == WindowEvent.const_59)
         {
            switch(param2.name)
            {
               case "tab_floor":
                  this.switchCategory(FurniModel.const_43);
                  break;
               case "tab_wall":
                  this.switchCategory(FurniModel.const_50);
                  break;
               case "tab_pets":
                  this.switchCategory(FurniModel.const_402);
            }
         }
      }
      
      private function onSongInfoReceivedEvent(param1:SongInfoReceivedEvent) : void
      {
         if(this.var_621.indexOf(param1.id as Number) != -1)
         {
            this.updateActionView();
            while(this.var_621.indexOf(param1.id as Number) != -1)
            {
               this.var_621.splice(this.var_621.indexOf(param1.id as Number),1);
            }
         }
      }
   }
}
