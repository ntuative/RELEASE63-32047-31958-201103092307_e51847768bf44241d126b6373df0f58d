package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.GivableBadgeData;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetBadgeImageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserFigureUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserGivableBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserTagsUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class InfostandWidget extends RoomWidgetBase
   {
       
      
      private const const_1722:String = "infostand_user_view";
      
      private const const_1721:String = "infostand_furni_view";
      
      private const const_1720:String = "infostand_pet_view";
      
      private const const_1719:String = "infostand_bot_view";
      
      private var var_1175:InfoStandFurniView;
      
      private var var_132:InfoStandUserView;
      
      private var var_368:InfoStandPetView;
      
      private var var_426:InfoStandBotView;
      
      private var var_2582:Array;
      
      private var var_1423:InfostandUserData;
      
      private var var_625:InfostandFurniData;
      
      private var _petData:InfoStandPetData;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_159:Timer;
      
      private var _config:IHabboConfigurationManager;
      
      private var _catalog:IHabboCatalog;
      
      private const const_2004:int = 3000;
      
      public function InfostandWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:IHabboCatalog)
      {
         super(param1,param2,param3);
         this._config = param4;
         this._catalog = param5;
         this.var_1175 = new InfoStandFurniView(this,this.const_1721,this._catalog);
         this.var_132 = new InfoStandUserView(this,this.const_1722);
         this.var_368 = new InfoStandPetView(this,this.const_1720,this._catalog);
         this.var_426 = new InfoStandBotView(this,this.const_1719);
         this.var_1423 = new InfostandUserData();
         this.var_625 = new InfostandFurniData();
         this._petData = new InfoStandPetData();
         this.var_159 = new Timer(this.const_2004);
         this.var_159.addEventListener(TimerEvent.TIMER,this.onUpdateTimer);
         this.mainContainer.visible = false;
      }
      
      override public function get mainWindow() : IWindow
      {
         return this.mainContainer;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("infostand_main_container","",HabboWindowType.const_63,HabboWindowStyle.const_42,HabboWindowParam.const_42,new Rectangle(0,0,50,100)) as IWindowContainer;
            this._mainContainer.tags.push("room_widget_infostand");
            this._mainContainer.background = true;
            this._mainContainer.color = 0;
         }
         return this._mainContainer;
      }
      
      public function getXmlWindow(param1:String) : IWindow
      {
         var asset:IAsset = null;
         var xmlAsset:XmlAsset = null;
         var name:String = param1;
         var window:IWindow = null;
         try
         {
            asset = assets.getAssetByName(name);
            xmlAsset = XmlAsset(asset);
            window = windowManager.buildFromXML(XML(xmlAsset.content));
         }
         catch(e:Error)
         {
            Logger.log("[InfoStandWidget] Missing window XML: " + name);
         }
         return window;
      }
      
      override public function dispose() : void
      {
         if(this.var_159)
         {
            this.var_159.stop();
         }
         this.var_159 = null;
         if(this.var_132)
         {
            this.var_132.dispose();
         }
         this.var_132 = null;
         if(this.var_1175)
         {
            this.var_1175.dispose();
         }
         this.var_1175 = null;
         if(this.var_426)
         {
            this.var_426.dispose();
         }
         this.var_426 = null;
         if(this.var_368)
         {
            this.var_368.dispose();
         }
         this.var_368 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_373,this.onRoomObjectSelected);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_147,this.onClose);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_168,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_153,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_121,this.onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_132,this.onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.onBotInfo);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_302,this.onFurniInfo);
         param1.addEventListener(RoomWidgetUserTagsUpdateEvent.const_164,this.onUserTags);
         param1.addEventListener(RoomWidgetUserFigureUpdateEvent.const_160,this.onUserFigureUpdate);
         param1.addEventListener(RoomWidgetUserBadgesUpdateEvent.const_66,this.onUserBadges);
         param1.addEventListener(RoomWidgetUserGivableBadgesUpdateEvent.const_767,this.onUserGivableBadges);
         param1.addEventListener(RoomWidgetBadgeImageUpdateEvent.const_742,this.onBadgeImage);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.const_103,this.onPetInfo);
         param1.addEventListener(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_373,this.onRoomObjectSelected);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_147,this.onClose);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_168,this.onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_153,this.onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_121,this.onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_132,this.onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.onBotInfo);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_302,this.onFurniInfo);
         param1.removeEventListener(RoomWidgetUserTagsUpdateEvent.const_164,this.onUserTags);
         param1.removeEventListener(RoomWidgetUserFigureUpdateEvent.const_160,this.onUserFigureUpdate);
         param1.removeEventListener(RoomWidgetUserBadgesUpdateEvent.const_66,this.onUserBadges);
         param1.removeEventListener(RoomWidgetUserGivableBadgesUpdateEvent.const_767,this.onUserGivableBadges);
         param1.removeEventListener(RoomWidgetBadgeImageUpdateEvent.const_742,this.onBadgeImage);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.const_103,this.onPetInfo);
         param1.removeEventListener(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
      }
      
      public function get userData() : InfostandUserData
      {
         return this.var_1423;
      }
      
      public function get furniData() : InfostandFurniData
      {
         return this.var_625;
      }
      
      public function get petData() : InfoStandPetData
      {
         return this._petData;
      }
      
      private function onUpdateTimer(param1:TimerEvent) : void
      {
         if(this.var_368 == null)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_377,this.var_368.getCurrentPetId()));
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userData.setData(param1);
         this.var_132.update(param1);
         this.selectView(this.const_1722);
         if(this.var_159)
         {
            this.var_159.stop();
         }
      }
      
      private function onBotInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userData.setData(param1);
         this.var_426.update(param1);
         this.selectView(this.const_1719);
         if(this.var_159)
         {
            this.var_159.stop();
         }
      }
      
      private function onFurniInfo(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         this.furniData.setData(param1);
         this.var_1175.update(param1);
         this.selectView(this.const_1721);
         if(this.var_159)
         {
            this.var_159.stop();
         }
      }
      
      private function onPetInfo(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this.petData.setData(param1);
         this.userData.petRespectLeft = param1.petRespectLeft;
         this.var_368.update(this.petData);
         this.selectView(this.const_1720);
         if(this.var_159)
         {
            this.var_159.start();
         }
      }
      
      private function onPetCommands(param1:RoomWidgetPetCommandsUpdateEvent) : void
      {
         this.var_368.updateEnabledTrainingCommands(param1.id,new CommandConfiguration(param1.allCommands,param1.enabledCommands));
      }
      
      private function onUserTags(param1:RoomWidgetUserTagsUpdateEvent) : void
      {
         if(param1.isOwnUser)
         {
            this.var_2582 = param1.tags;
         }
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         if(param1.isOwnUser)
         {
            this.var_132.setTags(param1.tags);
         }
         else
         {
            this.var_132.setTags(param1.tags,this.var_2582);
         }
      }
      
      private function onUserFigureUpdate(param1:RoomWidgetUserFigureUpdateEvent) : void
      {
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         if(this.userData.isBot())
         {
            this.var_426.image = param1.image;
         }
         else
         {
            this.var_132.image = param1.image;
            this.var_132.setMotto(param1.customInfo,param1.isOwnUser);
            this.var_132.method_1 = param1.method_1;
         }
      }
      
      private function onUserBadges(param1:RoomWidgetUserBadgesUpdateEvent) : void
      {
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         this.userData.badges = param1.badges;
         this.var_132.clearBadges();
      }
      
      private function onUserGivableBadges(param1:RoomWidgetUserGivableBadgesUpdateEvent) : void
      {
         this.userData.givableBadges = param1.badges;
         this.var_132.updateGivableBadges();
      }
      
      private function onBadgeImage(param1:RoomWidgetBadgeImageUpdateEvent) : void
      {
         var _loc6_:* = null;
         var _loc2_:int = this.userData.badges.indexOf(param1.badgeID);
         if(_loc2_ >= 0)
         {
            if(this.userData.isBot())
            {
               this.var_426.setBadgeImage(_loc2_,param1.badgeImage);
            }
            else
            {
               this.var_132.setBadgeImage(_loc2_,param1.badgeImage);
            }
            return;
         }
         var _loc4_:* = [];
         var _loc5_:int = 0;
         for each(_loc6_ in this.userData.givableBadges)
         {
            if(param1.badgeID == _loc6_.achievementTypeName)
            {
               if(!this.userData.isBot())
               {
                  _loc4_.push(_loc5_);
               }
            }
            _loc5_++;
         }
         if(_loc4_.length > 0)
         {
            this.var_132.setGivableBadgeImage(_loc4_,param1.badgeImage);
            return;
         }
         if(param1.badgeID == this.userData.groupBadgeId)
         {
            this.var_132.setGroupBadgeImage(param1.badgeImage);
         }
      }
      
      private function onRoomObjectSelected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_350,param1.id,param1.category);
         messageListener.processWidgetMessage(_loc2_);
      }
      
      private function onRoomObjectRemoved(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:* = false;
         switch(param1.type)
         {
            case RoomWidgetRoomObjectUpdateEvent.const_153:
               _loc2_ = param1.id == this.var_625.id;
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_168:
               if(this.var_132 != null && this.var_132.window != null && this.var_132.window.visible)
               {
                  _loc2_ = param1.id == this.var_1423.userRoomId;
                  break;
               }
               if(this.var_368 != null && this.var_368.window != null && this.var_368.window.visible)
               {
                  _loc2_ = param1.id == this._petData.roomIndex;
                  break;
               }
               if(this.var_426 != null && this.var_426.window != null && this.var_426.window.visible)
               {
                  _loc2_ = param1.id == this.var_1423.userRoomId;
                  break;
               }
         }
         if(_loc2_)
         {
            this.close();
         }
      }
      
      public function close() : void
      {
         this.hideChildren();
         if(this.var_159)
         {
            this.var_159.stop();
         }
      }
      
      private function onClose(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         this.close();
         if(this.var_159)
         {
            this.var_159.stop();
         }
      }
      
      private function hideChildren() : void
      {
         var _loc1_:int = 0;
         if(this._mainContainer != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this._mainContainer.numChildren)
            {
               this._mainContainer.getChildAt(_loc1_).visible = false;
               _loc1_++;
            }
         }
      }
      
      private function selectView(param1:String) : void
      {
         this.hideChildren();
         var _loc2_:IWindow = this.mainContainer.getChildByName(param1) as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         this.mainContainer.visible = true;
         this.mainContainer.width = _loc2_.width;
         this.mainContainer.height = _loc2_.height;
      }
      
      public function refreshContainer() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.mainContainer.numChildren)
         {
            _loc1_ = this.mainContainer.getChildAt(_loc2_);
            if(_loc1_.visible)
            {
               this.mainContainer.width = _loc1_.width;
               this.mainContainer.height = _loc1_.height;
            }
            _loc2_++;
         }
      }
   }
}
