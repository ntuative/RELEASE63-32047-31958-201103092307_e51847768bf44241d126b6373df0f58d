package com.sulake.habbo.inventory.effects
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.inventory.IInventoryView;
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   import com.sulake.habbo.inventory.common.ThumbListManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class EffectsView implements IInventoryView
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_17:IWindowContainer;
      
      private var var_67:EffectsModel;
      
      private var var_660:ThumbListManager;
      
      private var var_659:ThumbListManager;
      
      private var _disposed:Boolean = false;
      
      public function EffectsView(param1:EffectsModel, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager, param5:IThumbListDataProvider, param6:IThumbListDataProvider)
      {
         super();
         this.var_67 = param1;
         this._assetLibrary = param3;
         this._windowManager = param2;
         var _loc7_:IAsset = this._assetLibrary.getAssetByName("inventory_effects_xml");
         var _loc8_:XmlAsset = XmlAsset(_loc7_);
         var _loc9_:ICoreWindowManager = ICoreWindowManager(this._windowManager);
         this.var_17 = IWindowContainer(_loc9_.buildFromXML(XML(_loc8_.content)));
         this.var_17.visible = false;
         this.var_17.procedure = this.windowEventProc;
         this.var_660 = new ThumbListManager(this._assetLibrary,param5,"thumb_bg_png","thumb_bg_selected_png",this.getActiveThumbListImageWidth(),this.getActiveThumbListImageHeight());
         this.var_659 = new ThumbListManager(this._assetLibrary,param6,"thumb_bg_png","thumb_bg_selected_png",this.getActiveThumbListImageWidth(),this.getActiveThumbListImageHeight());
         var _loc10_:IBitmapWrapperWindow = this.var_17.findChildByName("active_items_image") as IBitmapWrapperWindow;
         _loc10_.procedure = this.activeThumbListEventProc;
         var _loc11_:IBitmapWrapperWindow = this.var_17.findChildByName("inactive_items_image") as IBitmapWrapperWindow;
         _loc11_.procedure = this.inactiveThumbListEventProc;
         this.var_17.procedure = this.windowEventProc;
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
            if(this.var_660 != null)
            {
               this.var_660.dispose();
               this.var_660 = null;
            }
            if(this.var_659 != null)
            {
               this.var_659.dispose();
               this.var_659 = null;
            }
            this._disposed = true;
         }
      }
      
      public function getActiveThumbListImageWidth() : int
      {
         var _loc1_:IBitmapWrapperWindow = this.var_17.findChildByName("active_items_image") as IBitmapWrapperWindow;
         if(_loc1_ == null)
         {
            return 0;
         }
         return _loc1_.width;
      }
      
      public function getActiveThumbListImageHeight() : int
      {
         var _loc1_:IBitmapWrapperWindow = this.var_17.findChildByName("active_items_image") as IBitmapWrapperWindow;
         if(_loc1_ == null)
         {
            return 0;
         }
         return _loc1_.height;
      }
      
      public function getInactiveThumbListImageWidth() : int
      {
         var _loc1_:IBitmapWrapperWindow = this.var_17.findChildByName("inactive_items_image") as IBitmapWrapperWindow;
         if(_loc1_ == null)
         {
            return 0;
         }
         return _loc1_.width;
      }
      
      public function getInactiveThumbListImageHeight() : int
      {
         var _loc1_:IBitmapWrapperWindow = this.var_17.findChildByName("inactive_items_image") as IBitmapWrapperWindow;
         if(_loc1_ == null)
         {
            return 0;
         }
         return _loc1_.height;
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
      
      public function updateListViews() : void
      {
         if(this.var_17 == null)
         {
            return;
         }
         if(this.var_17.disposed)
         {
            return;
         }
         this.var_659.updateImageFromList();
         this.var_660.updateImageFromList();
         var _loc1_:IBitmapWrapperWindow = this.var_17.findChildByName("inactive_items_image") as IBitmapWrapperWindow;
         var _loc2_:BitmapData = this.var_659.getListImage();
         _loc1_.bitmap = _loc2_;
         _loc1_.width = _loc2_.width;
         _loc1_.height = _loc2_.height;
         _loc1_.invalidate();
         var _loc3_:IBitmapWrapperWindow = this.var_17.findChildByName("active_items_image") as IBitmapWrapperWindow;
         var _loc4_:BitmapData = this.var_660.getListImage();
         _loc3_.bitmap = _loc4_;
         _loc3_.width = _loc4_.width;
         _loc3_.height = _loc4_.height;
         _loc3_.invalidate();
      }
      
      public function updateActionView() : void
      {
         if(this.var_17 == null)
         {
            return;
         }
         if(this.var_17.disposed)
         {
            return;
         }
         var _loc1_:IButtonWindow = this.var_17.findChildByName("activateEffect_button") as IButtonWindow;
         var _loc2_:ITextWindow = this.var_17.findChildByName("effectDescriptionText") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Effect = this.var_67.getSelectedEffect(-1);
         if(_loc3_ == null)
         {
            _loc1_.disable();
            this.setEffectDescriptionImage(null);
            _loc2_.text = "${inventory.effects.defaultdescription}";
         }
         else if(_loc3_.isActive)
         {
            _loc1_.disable();
            this.setEffectDescriptionImage(_loc3_.iconImage);
            _loc2_.text = "${inventory.effects.active}";
            this._windowManager.registerLocalizationParameter("inventory.effects.active","timeleft",this.convertSecondsToTime(_loc3_.secondsLeft));
            this._windowManager.registerLocalizationParameter("inventory.effects.active","duration",this.convertSecondsToTime(_loc3_.duration));
            this._windowManager.registerLocalizationParameter("inventory.effects.active","itemcount",String(_loc3_.effectsInInventory));
         }
         else
         {
            _loc1_.enable();
            this.setEffectDescriptionImage(_loc3_.iconImage);
            _loc2_.text = "${inventory.effects.inactive}";
            this._windowManager.registerLocalizationParameter("inventory.effects.inactive","duration",this.convertSecondsToTime(_loc3_.duration));
            this._windowManager.registerLocalizationParameter("inventory.effects.inactive","itemcount",String(_loc3_.effectsInInventory));
         }
      }
      
      private function setEffectDescriptionImage(param1:BitmapData) : void
      {
         if(this.var_17 == null)
         {
            return;
         }
         if(this.var_17.disposed)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = this.var_17.findChildByName("effectDescriptionImage") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.bitmap == null)
         {
            _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,false);
         }
         if(param1 == null)
         {
            param1 = new BitmapData(_loc2_.width,_loc2_.height);
         }
         var _loc3_:Point = new Point((_loc2_.width - param1.width) / 2,(_loc2_.height - param1.height) / 2);
         _loc2_.bitmap.copyPixels(param1,param1.rect,_loc3_,null,null,false);
         _loc2_.invalidate();
      }
      
      private function convertSecondsToTime(param1:int) : String
      {
         var _loc2_:int = Math.floor(param1 / 60 / 60);
         var _loc3_:int = Math.floor((param1 - _loc2_ * 60 * 60) / 60);
         var _loc4_:int = param1 - _loc2_ * 60 * 60 - _loc3_ * 60;
         var _loc5_:* = "";
         if(_loc2_ > 0)
         {
            _loc5_ = _loc2_ + ":";
         }
         _loc5_ = _loc3_ < 10 ? _loc5_ + "0" + _loc3_ : _loc5_ + _loc3_;
         _loc5_ += ":";
         return _loc4_ < 10 ? _loc5_ + "0" + _loc4_ : _loc5_ + _loc4_;
      }
      
      private function activeThumbListEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _loc3_ = new Point(WindowMouseEvent(param1).localX,WindowMouseEvent(param1).localY);
            _loc4_ = this.var_660.resolveIndexFromImageLocation(_loc3_);
            _loc5_ = this.var_67.getItemInIndex(_loc4_,1);
            if(_loc5_ != null)
            {
               this.var_67.toggleEffectSelected(_loc5_.type);
            }
         }
      }
      
      private function inactiveThumbListEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _loc3_ = new Point(WindowMouseEvent(param1).localX,WindowMouseEvent(param1).localY);
            _loc4_ = this.var_659.resolveIndexFromImageLocation(_loc3_);
            _loc5_ = this.var_67.getItemInIndex(_loc4_,0);
            if(_loc5_ != null)
            {
               this.var_67.toggleEffectSelected(_loc5_.type);
            }
         }
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "activateEffect_button")
            {
               _loc3_ = this.var_67.getSelectedEffect(0);
               if(_loc3_ != null)
               {
                  this.var_67.requestEffectActivated(_loc3_.type);
               }
            }
         }
      }
   }
}
