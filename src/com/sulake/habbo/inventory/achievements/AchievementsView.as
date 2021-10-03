package com.sulake.habbo.inventory.achievements
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementData;
   import com.sulake.habbo.inventory.IInventoryView;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class AchievementsView implements IInventoryView
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_316:ISessionDataManager;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_17:IWindowContainer;
      
      private var var_67:AchievementsModel;
      
      private var var_1182:Dictionary;
      
      private var var_60:IItemListWindow;
      
      private var var_429:Timer;
      
      private var _disposed:Boolean = false;
      
      public function AchievementsView(param1:AchievementsModel, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager, param5:ISessionDataManager)
      {
         this.var_1182 = new Dictionary();
         super();
         this.var_67 = param1;
         this._assetLibrary = param3;
         this._windowManager = param2;
         this.var_316 = param5;
         this._localization = param4;
         var _loc6_:IAsset = this._assetLibrary.getAssetByName("inventory_achievements_xml");
         var _loc7_:XmlAsset = XmlAsset(_loc6_);
         var _loc8_:ICoreWindowManager = ICoreWindowManager(this._windowManager);
         this.var_17 = IWindowContainer(_loc8_.buildFromXML(XML(_loc7_.content)));
         this.var_17.visible = false;
         this.var_60 = IItemListWindow(this.var_17.getChildByName("achievements_itemlist"));
         this.var_429 = new Timer(1000,1);
         this.var_429.addEventListener(TimerEvent.TIMER,this.doBadgeRefresh);
         this.var_316.events.addEventListener(BadgeImageReadyEvent.const_136,this.onBadgeImageReady);
      }
      
      public static function hideChildren(param1:IWindowContainer) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            param1.getChildAt(_loc2_).visible = false;
            _loc2_++;
         }
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
            this.var_60 = null;
            this._assetLibrary = null;
            this._localization = null;
            this.var_1182 = null;
            if(this.var_316 != null)
            {
               this.var_316.events.removeEventListener(BadgeImageReadyEvent.const_136,this.onBadgeImageReady);
               this.var_316 = null;
            }
            if(this.var_429)
            {
               this.var_429.removeEventListener(TimerEvent.TIMER,this.doBadgeRefresh);
               this.var_429.reset();
               this.var_429 = null;
            }
            this._disposed = true;
         }
      }
      
      public function updateList() : void
      {
         var _loc3_:Boolean = false;
         if(this.var_17 == null)
         {
            return;
         }
         if(this.var_17.disposed)
         {
            return;
         }
         var _loc1_:Array = this.var_67.getAchievements();
         this.var_60.autoArrangeItems = false;
         var _loc2_:int = 0;
         while(true)
         {
            if(_loc2_ < _loc1_.length)
            {
               this.refreshEntry(true,_loc2_,_loc1_[_loc2_]);
            }
            else
            {
               _loc3_ = this.refreshEntry(false,_loc2_,null);
               if(_loc3_)
               {
                  break;
               }
            }
            _loc2_++;
         }
         this.var_60.autoArrangeItems = true;
      }
      
      private function refreshEntry(param1:Boolean, param2:int, param3:AchievementData) : Boolean
      {
         var _loc4_:IWindowContainer = IWindowContainer(this.var_60.getListItemAt(param2));
         if(_loc4_ == null)
         {
            if(!param1)
            {
               return true;
            }
            _loc4_ = this.getListEntry(param2);
            this.var_60.addListItem(_loc4_);
         }
         hideChildren(_loc4_);
         if(param1)
         {
            this.refreshEntryDetails(_loc4_,param3);
            _loc4_.visible = true;
         }
         else
         {
            _loc4_.height = 0;
            _loc4_.visible = false;
         }
         return false;
      }
      
      public function refreshEntryDetails(param1:IWindowContainer, param2:AchievementData) : void
      {
         this.refreshBadgeImage(param1,param2);
         var _loc3_:ITextWindow = param1.findChildByName("achievement_name") as ITextWindow;
         _loc3_.text = this._localization.getAchievementName(param2.badgeId);
         _loc3_.visible = true;
         var _loc4_:ITextWindow = param1.findChildByName("achievement_description") as ITextWindow;
         _loc4_.text = this._localization.getAchievementDesc(param2.badgeId,param2.scoreLimit);
         _loc4_.visible = true;
         var _loc5_:String = this._localization.getKey("inventory.achievements.unit." + param2.type,"");
         var _loc6_:String = "inventory.achievements.entrydetails." + param2.levelRewardPointType;
         var _loc7_:ITextWindow = param1.findChildByName("achievement_details") as ITextWindow;
         this._localization.registerParameter(_loc6_,"currentpoints","" + param2.currentPoints);
         this._localization.registerParameter(_loc6_,"scorelimit","" + param2.scoreLimit);
         this._localization.registerParameter(_loc6_,"levelrewardpoints","" + param2.levelRewardPoints);
         this._localization.registerParameter(_loc6_,"unit","" + _loc5_);
         _loc7_.text = this._localization.getKey(_loc6_);
         _loc7_.visible = true;
         _loc4_.height = _loc4_.textHeight + 5;
         _loc7_.height = _loc7_.textHeight + 5;
         _loc7_.y = _loc4_.y + _loc4_.height;
         param1.height = _loc7_.y + _loc7_.height + 5;
      }
      
      private function getListEntry(param1:int) : IWindowContainer
      {
         var _loc2_:IAsset = this._assetLibrary.getAssetByName("inventory_achievement_item_xml");
         var _loc3_:XmlAsset = XmlAsset(_loc2_);
         var _loc4_:ICoreWindowManager = ICoreWindowManager(this._windowManager);
         var _loc5_:IWindowContainer = IWindowContainer(_loc4_.buildFromXML(XML(_loc3_.content)));
         var _loc6_:IBitmapWrapperWindow = _loc5_.findChildByName("achievement_image") as IBitmapWrapperWindow;
         _loc5_.background = true;
         _loc5_.color = param1 % 2 != 0 ? 4294967295 : uint(4292797682);
         _loc6_.bitmap = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
         return _loc5_;
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
      
      public function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         Logger.log("Got badge: " + param1.badgeId + ", " + this.var_429.running);
         this.var_1182[param1.badgeId] = param1.badgeImage;
         if(!this.var_429.running)
         {
            this.var_429.start();
         }
      }
      
      private function refreshBadgeImage(param1:IWindowContainer, param2:AchievementData) : void
      {
         var _loc3_:IBitmapWrapperWindow = param1.findChildByName("achievement_image") as IBitmapWrapperWindow;
         var _loc4_:BitmapData = this.var_1182[param2.badgeId];
         if(_loc4_ == null)
         {
            _loc4_ = this.var_316.getBadgeImage(param2.badgeId);
            this.var_1182[param2.badgeId] = _loc4_;
         }
         var _loc5_:Point = new Point((_loc3_.width - _loc4_.width) / 2,(_loc3_.height - _loc4_.height) / 2);
         _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
         _loc3_.bitmap.copyPixels(_loc4_,_loc4_.rect,_loc5_,null,null,true);
         _loc3_.visible = true;
      }
      
      private function doBadgeRefresh(param1:TimerEvent) : void
      {
         this.var_429.reset();
         this.updateList();
         Logger.log("Now updating list...");
      }
   }
}
