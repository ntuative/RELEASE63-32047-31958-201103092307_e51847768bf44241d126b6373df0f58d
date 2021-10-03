package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class InventoryMainView
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_16:IFrameWindow;
      
      private var var_665:String;
      
      private var var_1529:IWindowContainer;
      
      private var var_664:String;
      
      private var var_2791:IWindowContainer;
      
      private var _controller:HabboInventory;
      
      private var var_170:IHabboToolbar;
      
      private var var_1019:Boolean = true;
      
      public function InventoryMainView(param1:HabboInventory, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super();
         this._controller = param1;
         this._assetLibrary = param3;
         this._windowManager = param2;
         var _loc4_:IAsset = this._assetLibrary.getAssetByName("inventory_xml");
         var _loc5_:XmlAsset = XmlAsset(_loc4_);
         var _loc6_:ICoreWindowManager = ICoreWindowManager(this._windowManager);
         this.var_16 = _loc6_.buildFromXML(XML(_loc5_.content)) as IFrameWindow;
         if(this.var_16 != null)
         {
            this.var_16.visible = false;
            this.var_16.procedure = this.windowEventProc;
            this.setCreditBalance(0);
            this.setPixelBalance(0);
            this.setClubStatus(0,0);
         }
      }
      
      public function get isVisible() : Boolean
      {
         return !!this.var_16 ? Boolean(this.var_16.visible) : false;
      }
      
      public function dispose() : void
      {
         this._controller = null;
         this.var_16 = null;
         this.var_1529 = null;
         if(this.var_170)
         {
            if(this.var_170.events)
            {
               this.var_170.events.removeEventListener(HabboToolbarEvent.const_65,this.onHabboToolbarEvent);
               this.var_170.events.removeEventListener(HabboToolbarEvent.const_38,this.onHabboToolbarEvent);
            }
            this.var_170 = null;
         }
         this._windowManager = null;
      }
      
      public function getWindow() : IFrameWindow
      {
         return this.var_16;
      }
      
      public function getCategoryViewId() : String
      {
         return this.var_665;
      }
      
      public function getSubCategoryViewId() : String
      {
         return this.var_664;
      }
      
      public function hideInventory() : void
      {
         this._controller.closingInventoryView();
         var _loc1_:IWindow = this.getWindow();
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = false;
      }
      
      public function showInventory() : void
      {
         var _loc1_:IWindow = this.getWindow();
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = true;
         if(this.var_170 != null && this.var_1019)
         {
            this.var_170.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_53,HabboToolbarIconEnum.INVENTORY,_loc1_ as IWindowContainer));
            this.var_1019 = false;
         }
         this._controller.inventoryViewOpened(this.var_664);
      }
      
      public function toggleCategoryView(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:IWindow = this.getWindow();
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.visible)
         {
            if(this.var_665 == param1)
            {
               if(param2)
               {
                  _loc3_.visible = false;
               }
            }
            else
            {
               this.setViewToCategory(param1);
            }
         }
         else
         {
            _loc3_.visible = true;
            _loc3_.activate();
            if(param1 != this.var_665 || !this._controller.isInventoryCategoryInit(param1))
            {
               this.setViewToCategory(param1);
            }
            if(this.var_170 != null && this.var_1019)
            {
               this.var_170.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_53,HabboToolbarIconEnum.INVENTORY,_loc3_ as IWindowContainer));
               this.var_1019 = false;
            }
            this._controller.inventoryViewOpened(param1);
         }
      }
      
      public function toggleSubCategoryView(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:IWindow = this.getWindow();
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.visible)
         {
            if(this.var_664 == param1)
            {
               if(param2)
               {
                  _loc3_.visible = false;
               }
            }
            else
            {
               this.setSubViewToCategory(param1);
            }
         }
         else
         {
            _loc3_.visible = true;
            if(param1 != this.var_664)
            {
               this.setSubViewToCategory(param1);
            }
            if(this.var_170 != null && this.var_1019)
            {
               this.var_170.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_53,HabboToolbarIconEnum.INVENTORY,_loc3_ as IWindowContainer));
            }
         }
      }
      
      public function updateSubCategoryView() : void
      {
         if(this.var_664 == null)
         {
            return;
         }
         this.setSubViewToCategory(this.var_664);
      }
      
      public function setCreditBalance(param1:int) : void
      {
         this._windowManager.registerLocalizationParameter("inventory.purse.creditbalance","balance",String(param1));
      }
      
      public function setPixelBalance(param1:int) : void
      {
         this._windowManager.registerLocalizationParameter("inventory.purse.pixelbalance","balance",String(param1));
      }
      
      public function setClubStatus(param1:int, param2:int) : void
      {
         this._windowManager.registerLocalizationParameter("inventory.purse.clubdays","months",String(param1));
         this._windowManager.registerLocalizationParameter("inventory.purse.clubdays","days",String(param2));
      }
      
      public function setToolbar(param1:IHabboToolbar) : void
      {
         this.var_170 = param1;
         this.var_170.events.addEventListener(HabboToolbarEvent.const_65,this.onHabboToolbarEvent);
         this.var_170.events.addEventListener(HabboToolbarEvent.const_38,this.onHabboToolbarEvent);
      }
      
      public function setHabboToolbarIcon() : void
      {
         if(this.var_170 != null)
         {
            this.var_170.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_131,HabboToolbarIconEnum.INVENTORY));
         }
      }
      
      private function setViewToCategory(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1 == "")
         {
            return;
         }
         this._controller.checkCategoryInitilization(param1);
         var _loc2_:ITabContextWindow = this.var_16.findChildByName("contentArea") as ITabContextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.container.removeChild(this.var_1529);
         _loc2_.invalidate();
         var _loc3_:IWindowContainer = this._controller.getCategoryWindowContainer(param1);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.visible = true;
         _loc2_.container.addChild(_loc3_);
         this.var_1529 = _loc3_;
         this.var_665 = param1;
         _loc2_.selector.setSelected(_loc2_.selector.getSelectableByName(param1));
      }
      
      private function setSubViewToCategory(param1:String) : void
      {
         if(param1 == null || param1 == "")
         {
            return;
         }
         this._controller.checkCategoryInitilization(param1);
         var _loc2_:IWindowContainer = this.var_16.findChildByName("subContentArea") as IWindowContainer;
         while(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         var _loc3_:IWindowContainer = this._controller.getCategorySubWindowContainer(param1);
         if(_loc3_ != null)
         {
            _loc2_.visible = true;
            _loc3_.visible = true;
            _loc2_.height = _loc3_.height;
            _loc2_.addChild(_loc3_);
         }
         else
         {
            _loc2_.visible = false;
            _loc2_.height = 0;
         }
         this.var_16.resizeToFitContent();
         if(this.var_16.parent != null)
         {
            if(this.var_16.x + this.var_16.width > this.var_16.parent.width)
            {
               this.var_16.x = this.var_16.parent.width - this.var_16.width;
            }
            if(this.var_16.y + this.var_16.height > this.var_16.parent.height)
            {
               this.var_16.y = this.var_16.parent.height - this.var_16.height;
            }
         }
         this.var_2791 = _loc3_;
         this.var_664 = param1;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_65)
         {
         }
         if(param1.iconId != HabboToolbarIconEnum.INVENTORY)
         {
            return;
         }
         if(param1.type == HabboToolbarEvent.const_38)
         {
            if(this.var_665 == InventoryCategory.const_150)
            {
               this.toggleCategoryView(InventoryCategory.const_150);
            }
            else if(this.var_665 == InventoryCategory.const_76)
            {
               this.toggleCategoryView(InventoryCategory.const_76);
            }
            else if(this._controller != null)
            {
               this._controller.toggleInventoryPage(InventoryCategory.const_76);
            }
         }
      }
      
      public function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type == WindowEvent.const_59)
         {
            _loc3_ = ITabContextWindow(param2).selector.getSelected().name;
            if(_loc3_ != this.var_665)
            {
               this._controller.toggleInventoryPage(_loc3_);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "header_button_close")
            {
               this.hideInventory();
            }
         }
      }
   }
}
