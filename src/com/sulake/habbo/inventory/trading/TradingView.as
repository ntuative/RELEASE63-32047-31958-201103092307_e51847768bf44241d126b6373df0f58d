package com.sulake.habbo.inventory.trading
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.inventory.IInventoryView;
   import com.sulake.habbo.inventory.ItemPopupCtrl;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.items.FloorItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.inventory.items.WallItem;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class TradingView implements IInventoryView, IGetImageListener
   {
      
      private static const const_964:uint = 4284532064;
      
      private static const const_965:uint = 2577770;
      
      public static const const_1013:int = 0;
      
      public static const const_1143:int = 1;
      
      public static const const_1138:int = 2;
       
      
      private var var_21:TradingModel;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_421:ItemPopupCtrl;
      
      private var _disposed:Boolean = false;
      
      private var var_387:Boolean;
      
      private var var_70:IWindowContainer;
      
      private var var_1824:IWindowContainer;
      
      private var var_196:Timer;
      
      private var var_920:GroupItem;
      
      private var var_2546:Boolean;
      
      public function TradingView(param1:TradingModel, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IRoomEngine, param5:IHabboLocalizationManager)
      {
         super();
         this.var_21 = param1;
         this._windowManager = param2;
         this._localization = param5;
         this._assetLibrary = param3;
         this._roomEngine = param4;
         this.var_387 = false;
         var _loc6_:IAsset = this._assetLibrary.getAssetByName("item_popup_xml");
         var _loc7_:XmlAsset = XmlAsset(_loc6_);
         var _loc8_:IWindowContainer = this._windowManager.buildFromXML(_loc7_.content as XML) as IWindowContainer;
         _loc8_.visible = false;
         this.var_421 = new ItemPopupCtrl(_loc8_,this._assetLibrary);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get visible() : Boolean
      {
         return this.var_387;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_70 && !this.var_70.disposed)
            {
               this.var_70.dispose();
               this.var_70 = null;
            }
            if(this.var_196)
            {
               this.var_196.removeEventListener(TimerEvent.TIMER,this.timerEventHandler);
               this.var_196.stop();
               this.var_196 = null;
            }
            if(this.var_421 != null)
            {
               this.var_421.dispose();
               this.var_421 = null;
            }
            this.var_21 = null;
            this._windowManager = null;
            this._roomEngine = null;
            this._localization = null;
            this._assetLibrary = null;
            this.var_920 = null;
            this.var_387 = false;
            this._disposed = true;
         }
      }
      
      public function setup(param1:int, param2:Boolean, param3:int, param4:Boolean) : void
      {
         this.setMinimized(false);
         this.hideOwnUserNotification();
         this.hideOtherUserNotification();
         if(!param2 && !param4)
         {
            this.showInfoMessage("${inventory.trading.warning.both_accounts_disabled}");
            this.showOwnUserNotification("");
            this.showOtherUserNotification("");
         }
         else
         {
            if(!param2)
            {
               this.showOwnUserNotification("${inventory.trading.warning.own_account_disabled}");
            }
            if(!param4)
            {
               this.showOtherUserNotification("${inventory.trading.warning.others_account_disabled}");
            }
         }
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(this.var_70 == null)
         {
            this.var_70 = this.createNormalWindow();
         }
         if(this.var_1824 == null)
         {
            this.var_1824 = this.createMinimizedWindow();
         }
         if(!this.var_2546)
         {
            return this.var_70;
         }
         return this.var_1824;
      }
      
      private function createNormalWindow() : IWindowContainer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc1_:XML = XmlAsset(this._assetLibrary.getAssetByName("inventory_trading_xml")).content as XML;
         var _loc2_:IWindowContainer = this._windowManager.buildFromXML(_loc1_) as IWindowContainer;
         _loc3_ = _loc2_.findChildByTag("OWN_USER_GRID") as IItemGridWindow;
         _loc6_ = 0;
         while(_loc6_ < _loc3_.numGridItems)
         {
            _loc4_ = _loc3_.getGridItemAt(_loc6_);
            _loc4_.id = _loc6_;
            _loc4_.procedure = this.ownThumbEventProc;
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.ownThumbEventProc);
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OUT,this.ownThumbEventProc);
            _loc6_++;
         }
         _loc3_ = _loc2_.findChildByTag("OTHER_USER_GRID") as IItemGridWindow;
         _loc6_ = 0;
         while(_loc6_ < _loc3_.numGridItems)
         {
            _loc4_ = _loc3_.getGridItemAt(_loc6_);
            _loc4_.id = _loc6_;
            _loc4_.procedure = this.othersThumbEventProc;
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.othersThumbEventProc);
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OUT,this.othersThumbEventProc);
            _loc6_++;
         }
         _loc2_.procedure = this.windowEventProc;
         return _loc2_;
      }
      
      private function createMinimizedWindow() : IWindowContainer
      {
         var _loc1_:XML = XmlAsset(this._assetLibrary.getAssetByName("inventory_trading_minimized_xml")).content as XML;
         var _loc2_:IWindowContainer = this._windowManager.buildFromXML(_loc1_) as IWindowContainer;
         _loc2_.procedure = this.windowMininizedEventProc;
         return _loc2_;
      }
      
      public function setMinimized(param1:Boolean = false) : void
      {
         this.var_2546 = param1;
      }
      
      protected function getOwnUsersItemGrid() : IItemGridWindow
      {
         return this.var_70.findChildByTag("OWN_USER_GRID") as IItemGridWindow;
      }
      
      protected function getOtherUsersItemGrid() : IItemGridWindow
      {
         return this.var_70.findChildByTag("OTHER_USER_GRID") as IItemGridWindow;
      }
      
      public function updateItemList(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc9_:* = param1 == this.var_21.otherUserId;
         var _loc10_:Map = !!_loc9_ ? this.var_21.otherUserItems : this.var_21.ownUserItems;
         var _loc11_:IItemGridWindow = !!_loc9_ ? this.getOtherUsersItemGrid() : this.getOwnUsersItemGrid();
         while(_loc2_ < _loc10_.length)
         {
            _loc3_ = _loc10_.getWithIndex(_loc2_) as GroupItem;
            _loc4_ = _loc11_.getGridItemAt(_loc2_) as IWindowContainer;
            if(_loc4_)
            {
               _loc4_.id = _loc2_;
               while(_loc4_.numChildren > 0)
               {
                  _loc4_.removeChildAt(0);
               }
               _loc4_.addChild(_loc3_.window);
               _loc3_.window.id = _loc2_;
            }
            _loc2_++;
         }
         while(_loc2_ < _loc11_.numGridItems)
         {
            _loc4_ = _loc11_.getGridItemAt(_loc2_) as IWindowContainer;
            if(_loc4_)
            {
               _loc4_.id = _loc2_;
               _loc4_.removeChildAt(0);
               _loc4_.invalidate();
            }
            _loc2_++;
         }
         this.updateActionState();
      }
      
      public function clearItemLists() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         _loc1_ = this.getOwnUsersItemGrid();
         _loc3_ = 0;
         while(_loc3_ < _loc1_.numGridItems)
         {
            _loc2_ = _loc1_.getGridItemAt(_loc3_) as IWindowContainer;
            if(_loc2_)
            {
               _loc2_.id = _loc3_;
               _loc2_.removeChildAt(0);
            }
            _loc3_++;
         }
         _loc1_ = this.getOtherUsersItemGrid();
         _loc3_ = 0;
         while(_loc3_ < _loc1_.numGridItems)
         {
            _loc2_ = _loc1_.getGridItemAt(_loc3_) as IWindowContainer;
            if(_loc2_)
            {
               _loc2_.id = _loc3_;
               _loc2_.removeChildAt(0);
            }
            _loc3_++;
         }
      }
      
      public function updateUserInterface() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_70)
         {
            this.updateActionState();
            _loc2_ = this.var_70.findChildByTag("OTHER_USER_NAME") as ITextWindow;
            if(_loc2_)
            {
               _loc2_.text = this.var_21.otherUserName;
            }
            _loc1_ = this.var_70.findChildByTag("OWN_USER_BORDER");
            if(_loc1_)
            {
               _loc1_.color = !!this.var_21.ownUserAccepts ? uint(const_964) : uint(const_965);
            }
            _loc3_ = this.var_70.findChildByTag("OWN_USER_LOCK") as IBitmapWrapperWindow;
            if(_loc3_)
            {
               if(_loc3_.bitmap == null)
               {
                  _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true);
               }
               _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
               _loc3_.bitmap.copyPixels(this._assetLibrary.getAssetByName(!!this.var_21.ownUserAccepts ? "trading_locked_icon_png" : "trading_unlocked_icon_png").content as BitmapData,_loc3_.bitmap.rect,new Point());
               _loc3_.invalidate();
            }
            _loc1_ = this.var_70.findChildByTag("OTHER_USER_BORDER");
            if(_loc1_)
            {
               _loc1_.color = !!this.var_21.otherUserAccepts ? uint(const_964) : uint(const_965);
            }
            _loc3_ = this.var_70.findChildByTag("OTHER_USER_LOCK") as IBitmapWrapperWindow;
            if(_loc3_)
            {
               if(_loc3_.bitmap == null)
               {
                  _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true);
               }
               _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
               _loc3_.bitmap.copyPixels(this._assetLibrary.getAssetByName(!!this.var_21.otherUserAccepts ? "trading_locked_icon_png" : "trading_unlocked_icon_png").content as BitmapData,_loc3_.bitmap.rect,new Point());
               _loc3_.invalidate();
            }
         }
      }
      
      public function updateActionState() : void
      {
         var _loc1_:* = null;
         if(this.var_70)
         {
            _loc1_ = this.var_70.findChildByName("button_accept");
            if(!_loc1_)
            {
               return;
            }
            switch(this.var_21.state)
            {
               case TradingModel.const_176:
                  if(this.var_21.otherUserItems.length > 0 || this.var_21.ownUserItems.length > 0)
                  {
                     _loc1_.enable();
                  }
                  else
                  {
                     _loc1_.disable();
                  }
                  _loc1_.caption = "${inventory.trading.accept}";
                  break;
               case TradingModel.const_199:
                  if(this.var_21.otherUserItems.length > 0 || this.var_21.ownUserItems.length > 0)
                  {
                     _loc1_.enable();
                  }
                  else
                  {
                     _loc1_.disable();
                  }
                  _loc1_.caption = !!this.var_21.ownUserAccepts ? "${inventory.trading.modify}" : "${inventory.trading.accept}";
                  this.showInfoMessage("${inventory.trading.info.add}");
                  break;
               case TradingModel.const_366:
                  _loc1_.disable();
                  _loc1_.caption = "${inventory.trading.countdown}";
                  this.showInfoMessage("${inventory.trading.info.confirm}");
                  break;
               case TradingModel.const_309:
                  _loc1_.enable();
                  _loc1_.caption = "${inventory.trading.confirm}";
                  this.showInfoMessage("${inventory.trading.info.confirm}");
                  break;
               case TradingModel.const_425:
                  _loc1_.disable();
                  this.showInfoMessage("${inventory.trading.info.waiting}");
                  break;
               case TradingModel.const_272:
                  _loc1_.disable();
                  _loc1_.caption = "${inventory.trading.accept}";
                  this.showInfoMessage("${inventory.trading.info.confirm}");
                  break;
               case TradingModel.TRADING_STATE_CANCELLED:
                  break;
               default:
                  throw new Error("Unknown trading progress state: \"" + this.var_21.state + "\"");
            }
         }
      }
      
      public function showInfoMessage(param1:String) : void
      {
         var _loc2_:ITextWindow = this.var_70.findChildByName("help_text") as ITextWindow;
         _loc2_.text = param1;
         _loc2_.visible = true;
      }
      
      public function showOwnUserNotification(param1:String) : void
      {
         var _loc2_:ITextWindow = this.var_70.findChildByName("info_text_0") as ITextWindow;
         _loc2_.text = param1;
         _loc2_.visible = true;
         var _loc3_:IItemGridWindow = this.var_70.findChildByName("item_grid_0") as IItemGridWindow;
         if(_loc3_)
         {
            _loc3_.visible = false;
         }
      }
      
      public function hideOwnUserNotification() : void
      {
         var _loc1_:ITextWindow = this.var_70.findChildByName("info_text_0") as ITextWindow;
         _loc1_.visible = false;
         var _loc2_:IItemGridWindow = this.var_70.findChildByName("item_grid_0") as IItemGridWindow;
         if(_loc2_)
         {
            _loc2_.visible = true;
         }
      }
      
      public function showOtherUserNotification(param1:String) : void
      {
         var _loc2_:ITextWindow = this.var_70.findChildByName("info_text_1") as ITextWindow;
         _loc2_.text = param1;
         _loc2_.visible = true;
         var _loc3_:IItemGridWindow = this.var_70.findChildByName("item_grid_1") as IItemGridWindow;
         if(_loc3_)
         {
            _loc3_.visible = false;
         }
      }
      
      public function hideOtherUserNotification() : void
      {
         var _loc1_:ITextWindow = this.var_70.findChildByName("info_text_1") as ITextWindow;
         _loc1_.visible = false;
         var _loc2_:IItemGridWindow = this.var_70.findChildByName("item_grid_1") as IItemGridWindow;
         if(_loc2_)
         {
            _loc2_.visible = true;
         }
      }
      
      public function alertPopup(param1:int) : void
      {
         switch(param1)
         {
            case const_1013:
               this._windowManager.alert("${inventory.trading.notification.title}","${inventory.trading.warning.other_not_offering}",0,this.onTradingAlert);
               break;
            case const_1143:
               this._windowManager.alert("${inventory.trading.notification.title}","${inventory.trading.info.closed}",0,this.onTradingAlert);
               break;
            case const_1138:
               this._windowManager.alert("${inventory.trading.notification.title}","${inventory.trading.info.already_open}",0,this.onTradingAlert);
         }
      }
      
      public function showAlertNotification(param1:String, param2:String, param3:Function) : void
      {
         var title:String = param1;
         var description:String = param2;
         var callback:Function = param3;
         this._windowManager.alert(title,description,0,callback != null ? callback : function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      public function startConfirmCountdown() : void
      {
         if(this.var_196 == null)
         {
            this.var_196 = new Timer(1000,3);
            this.var_196.addEventListener(TimerEvent.TIMER,this.timerEventHandler);
         }
         this.var_196.reset();
         this.var_196.repeatCount = 3;
         this.var_196.start();
         this._windowManager.registerLocalizationParameter("inventory.trading.countdown","counter","3");
         this.updateUserInterface();
      }
      
      public function cancelConfirmCountdown() : void
      {
         if(this.var_196 != null)
         {
            this.var_196.reset();
         }
      }
      
      private function timerEventHandler(param1:TimerEvent) : void
      {
         this._windowManager.registerLocalizationParameter("inventory.trading.countdown","counter",String(3 - this.var_196.currentCount));
         if(this.var_196.currentCount == 3)
         {
            this.var_21.confirmCountdownReady();
            this.var_196.reset();
         }
      }
      
      protected function resolveItemThumbnail(param1:GroupItem) : BitmapData
      {
         var _loc3_:* = null;
         var _loc2_:BitmapData = param1.iconImage;
         if(_loc2_ == null)
         {
            if(param1.peek() is FloorItem)
            {
               _loc3_ = this._roomEngine.getFurnitureIcon(param1.type,this);
            }
            else if(param1.peek() is WallItem)
            {
               _loc3_ = this._roomEngine.getWallItemIcon(param1.type,this,param1.stuffData);
            }
            if(_loc3_.id > 0)
            {
               param1.iconCallbackId = _loc3_.id;
            }
            _loc2_ = _loc3_.data;
            param1.iconImage = _loc2_;
         }
         return _loc2_;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         _loc5_ = this.var_21.ownUserItems;
         _loc6_ = false;
         _loc3_ = 0;
         while(_loc3_ < _loc5_.length)
         {
            _loc4_ = _loc5_.getWithIndex(_loc3_) as GroupItem;
            if(_loc4_.iconCallbackId == param1)
            {
               _loc4_.iconImage = param2;
               _loc6_ = true;
            }
            _loc3_++;
         }
         if(_loc6_)
         {
            this.updateItemList(this.var_21.ownUserId);
         }
         _loc5_ = this.var_21.otherUserItems;
         _loc6_ = false;
         _loc3_ = 0;
         while(_loc3_ < _loc5_.length)
         {
            _loc4_ = _loc5_[_loc3_] as GroupItem;
            if(_loc4_.iconCallbackId == param1)
            {
               _loc4_.iconImage = param2;
               _loc6_ = true;
            }
            _loc3_++;
         }
         if(_loc6_)
         {
            this.updateItemList(this.var_21.otherUserId);
         }
      }
      
      protected function createThumbnailContainer() : IWindowContainer
      {
         var _loc1_:XML = XmlAsset(this._assetLibrary.getAssetByName("inventory_thumb_xml")).content as XML;
         return this._windowManager.buildFromXML(_loc1_) as IWindowContainer;
      }
      
      protected function selectOwnTradeItem(param1:uint) : void
      {
         var _loc2_:* = null;
         if(this.var_21 == null || this.var_21.ownUserItems == null)
         {
            return;
         }
         if(param1 < this.var_21.ownUserItems.length)
         {
            _loc2_ = this.var_21.ownUserItems.getWithIndex(param1) as GroupItem;
            this.setSelection(_loc2_);
            if(_loc2_)
            {
               this.var_21.getFurniInventoryModel().displayItemInfo(_loc2_);
            }
         }
      }
      
      protected function selectOthersTradeItem(param1:uint) : void
      {
         var _loc2_:* = null;
         if(this.var_21 == null || this.var_21.otherUserItems == null)
         {
            return;
         }
         if(param1 < this.var_21.otherUserItems.length)
         {
            _loc2_ = this.var_21.otherUserItems.getWithIndex(param1) as GroupItem;
            this.setSelection(_loc2_);
            if(_loc2_)
            {
               this.var_21.getFurniInventoryModel().displayItemInfo(_loc2_);
            }
         }
      }
      
      public function setSelection(param1:GroupItem) : void
      {
         this.removeSelection();
         if(param1)
         {
            this.var_920 = param1;
            this.var_920.isSelected = true;
         }
      }
      
      public function removeSelection() : void
      {
         if(this.var_920)
         {
            this.var_920.isSelected = false;
            this.var_920 = null;
         }
      }
      
      public function updateItemImage(param1:int, param2:BitmapData) : void
      {
      }
      
      private function windowMininizedEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "button_continue":
                  this.var_21.requestFurniViewOpen();
                  break;
               case "button_cancel":
                  this.var_21.requestCancelTrading();
            }
         }
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "button_accept":
                  switch(this.var_21.state)
                  {
                     case TradingModel.const_199:
                        if(this.var_21.otherUserItems.length == 0 && !this.var_21.ownUserAccepts)
                        {
                           this.alertPopup(const_1013);
                        }
                        if(this.var_21.ownUserAccepts)
                        {
                           this.var_21.requestUnacceptTrading();
                        }
                        else
                        {
                           this.var_21.requestAcceptTrading();
                        }
                        break;
                     case TradingModel.const_309:
                        param2.disable();
                        this.var_21.requestConfirmAcceptTrading();
                  }
                  break;
               case "button_cancel":
                  switch(this.var_21.state)
                  {
                     case TradingModel.const_199:
                        this.var_21.requestCancelTrading();
                        break;
                     case TradingModel.const_309:
                        this.var_21.requestConfirmDeclineTrading();
                  }
            }
         }
      }
      
      private function ownThumbEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.var_21.requestRemoveItemFromTrading(param2.id);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            _loc3_ = this.var_21.ownUserItems.getWithIndex(param2.id);
            if(!_loc3_)
            {
               return;
            }
            _loc4_ = _loc3_.peek();
            _loc5_ = this.var_21.getItemImage(_loc4_);
            _loc6_ = "${roomItem.name." + _loc4_.type + "}";
            if(_loc4_.category == FurniCategory.const_169)
            {
               _loc6_ = "${poster_" + _loc4_.stuffData + "_name}";
            }
            if(_loc4_.category == FurniCategory.const_1046)
            {
               _loc7_ = _loc4_ as FloorItem;
               _loc8_ = new Date(_loc7_.creationYear,_loc7_.creationMonth,_loc7_.creationDay);
               _loc6_ = this._localization.getKey("roomItem.name." + _loc4_.type) + " " + _loc8_.toLocaleDateString();
            }
            this.var_421.updateContent(param2 as IWindowContainer,_loc6_,_loc5_,ItemPopupCtrl.const_487);
            this.var_421.show();
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OUT)
         {
            this.var_421.hideDelayed();
         }
      }
      
      private function othersThumbEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            _loc3_ = this.var_21.otherUserItems.getWithIndex(param2.id);
            if(_loc3_ == null)
            {
               return;
            }
            _loc4_ = _loc3_.peek();
            if(_loc4_ == null)
            {
               return;
            }
            _loc5_ = this.var_21.getItemImage(_loc4_);
            _loc6_ = "${roomItem.name." + _loc4_.type + "}";
            if(_loc4_.category == FurniCategory.const_169)
            {
               _loc6_ = "${poster_" + _loc4_.stuffData + "_name}";
            }
            if(_loc4_.category == FurniCategory.const_1046)
            {
               _loc7_ = _loc4_ as FloorItem;
               _loc8_ = new Date(_loc7_.creationYear,_loc7_.creationMonth,_loc7_.creationDay);
               _loc6_ = this._localization.getKey("roomItem.name." + _loc4_.type) + " " + _loc8_.toLocaleDateString();
            }
            this.var_421.updateContent(param2 as IWindowContainer,_loc6_,_loc5_,ItemPopupCtrl.const_487);
            this.var_421.show();
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OUT)
         {
            this.var_421.hideDelayed();
         }
      }
      
      public function onTradingAlert(param1:IAlertDialog, param2:WindowEvent) : void
      {
         if(param2.type == WindowEvent.const_187)
         {
            param1.dispose();
         }
      }
   }
}
