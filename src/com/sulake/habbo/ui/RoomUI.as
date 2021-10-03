package com.sulake.habbo.ui
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.advertisement.IAdManager;
   import com.sulake.habbo.advertisement.events.AdEvent;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.IHabboAvatarEditor;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.moderation.IHabboModeration;
   import com.sulake.habbo.navigator.IHabboNavigator;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineDimmerStateEvent;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.events.RoomEngineRoomColorEvent;
   import com.sulake.habbo.roomevents.IHabboUserDefinedRoomEvents;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionChatEvent;
   import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent;
   import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
   import com.sulake.habbo.session.events.RoomSessionErrorMessageEvent;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.session.events.RoomSessionFriendRequestEvent;
   import com.sulake.habbo.session.events.RoomSessionPetPackageEvent;
   import com.sulake.habbo.session.events.RoomSessionPollEvent;
   import com.sulake.habbo.session.events.RoomSessionPresentEvent;
   import com.sulake.habbo.session.events.RoomSessionQueueEvent;
   import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
   import com.sulake.habbo.session.events.RoomSessionUserDataUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionUserGivableBadgesEvent;
   import com.sulake.habbo.session.events.RoomSessionUserNotificationEvent;
   import com.sulake.habbo.session.events.RoomSessionViralFurniStatusEvent;
   import com.sulake.habbo.session.events.RoomSessionVoteEvent;
   import com.sulake.habbo.session.events.RoomSessionWelcomeGiftEvent;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.tracking.IHabboTracking;
   import com.sulake.habbo.widget.IRoomWidgetFactory;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboAdManager;
   import com.sulake.iid.IIDHabboAvatarEditor;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboModeration;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboRoomWidget;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboTracking;
   import com.sulake.iid.IIDHabboUserDefinedRoomEvents;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class RoomUI extends Component implements IRoomUI, IUpdateReceiver
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_15:IRoomSessionManager;
      
      private var var_1166:IRoomWidgetFactory;
      
      private var var_316:ISessionDataManager;
      
      private var _friendList:IHabboFriendList;
      
      private var var_463:IAvatarRenderManager;
      
      private var _inventory:IHabboInventory;
      
      private var var_170:IHabboToolbar;
      
      private var _navigator:IHabboNavigator;
      
      private var var_1906:IHabboAvatarEditor = null;
      
      private var _catalog:IHabboCatalog;
      
      private var var_314:IAdManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_1096:IHabboHelp;
      
      private var var_970:IHabboModeration;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_507:IHabboSoundManager;
      
      private var var_315:Map;
      
      private var var_1474:int;
      
      private var _connection:IConnection;
      
      private var _habboTracking:IHabboTracking;
      
      private var var_1211:IHabboUserDefinedRoomEvents;
      
      public function RoomUI(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1474 = RoomDesktop.const_528;
         super(param1,param2,param3);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDRoomEngine(),this.onRoomEngineReady);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
         queueInterface(new IIDHabboRoomWidget(),this.onRoomWidgetFactoryReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
         queueInterface(new IIDHabboFriendList(),this.onFriendListReady);
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRenderManagerReady);
         queueInterface(new IIDHabboInventory(),this.onInventoryReady);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
         queueInterface(new IIDHabboNavigator(),this.onNavigatorReady);
         queueInterface(new IIDHabboAvatarEditor(),this.onAvatarEditorReady);
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
         queueInterface(new IIDHabboAdManager(),this.onAdManagerReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
         queueInterface(new IIDHabboHelp(),this.onHabboHelpReady);
         queueInterface(new IIDHabboModeration(),this.onHabboModerationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
         queueInterface(new IIDHabboSoundManager(),this.onSoundManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationReady);
         queueInterface(new IIDHabboUserDefinedRoomEvents(),this.onUserDefinedRoomEventsReady);
         this._habboTracking = IHabboTracking(queueInterface(new IIDHabboTracking()));
         this.var_315 = new Map();
         registerUpdateReceiver(this,0);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._windowManager != null)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._roomEngine != null)
         {
            this._roomEngine.release(new IIDRoomEngine());
            this._roomEngine = null;
         }
         if(this.var_15 != null)
         {
            this.var_15.release(new IIDHabboRoomSessionManager());
            this.var_15 = null;
         }
         if(this.var_1166 != null)
         {
            this.var_1166.release(new IIDHabboRoomWidget());
            this.var_1166 = null;
         }
         if(this._inventory != null)
         {
            this._inventory.release(new IIDHabboInventory());
            this._inventory = null;
         }
         if(this.var_170 != null)
         {
            this.var_170.release(new IIDHabboToolbar());
            this.var_170 = null;
         }
         if(this._config != null)
         {
            this._config.release(new IIDHabboConfigurationManager());
            this._config = null;
         }
         if(this.var_507 != null)
         {
            this.var_507.release(new IIDHabboSoundManager());
            this.var_507 = null;
         }
         if(this.var_314 != null)
         {
            this.var_314.release(new IIDHabboAdManager());
            this.var_314 = null;
         }
         if(this.var_463 != null)
         {
            this.var_463.release(new IIDAvatarRenderManager());
            this.var_463 = null;
         }
         if(this._catalog != null)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
         if(this._friendList != null)
         {
            this._friendList.release(new IIDHabboFriendList());
            this._friendList = null;
         }
         if(this.var_1096 != null)
         {
            this.var_1096.release(new IIDHabboHelp());
            this.var_1096 = null;
         }
         if(this._localization != null)
         {
            this._localization.release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         if(this.var_970 != null)
         {
            this.var_970.release(new IIDHabboModeration());
            this.var_970 = null;
         }
         if(this._navigator != null)
         {
            this._navigator.release(new IIDHabboNavigator());
            this._navigator = null;
         }
         if(this.var_316 != null)
         {
            this.var_316.release(new IIDSessionDataManager());
            this.var_316 = null;
         }
         if(this._habboTracking)
         {
            this._habboTracking.release(new IIDHabboTracking());
            this._habboTracking = null;
         }
         if(this.var_1211)
         {
            this.var_1211.release(new IIDHabboUserDefinedRoomEvents());
            this.var_1211 = null;
         }
         this.var_1906 = null;
         this._connection = null;
         if(this.var_315)
         {
            while(this.var_315.length > 0)
            {
               _loc1_ = this.var_315.getKey(0) as String;
               _loc2_ = this.var_315.remove(_loc1_) as RoomDesktop;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
            }
            this.var_315.dispose();
            this.var_315 = null;
         }
         removeUpdateReceiver(this);
         super.dispose();
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function onRoomWidgetFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1166 = param2 as IRoomWidgetFactory;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_15 = param2 as IRoomSessionManager;
         this.registerSessionEvents();
         if(this.var_15 != null && this._roomEngine != null && this._roomEngine.isInitialized)
         {
            this.var_15.roomEngineReady = true;
         }
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_316 = param2 as ISessionDataManager;
      }
      
      private function onFriendListReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._friendList = param2 as IHabboFriendList;
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_463 = param2 as IAvatarRenderManager;
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._inventory = param2 as IHabboInventory;
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_170 = param2 as IHabboToolbar;
      }
      
      private function onNavigatorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._navigator = param2 as IHabboNavigator;
      }
      
      private function onAvatarEditorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1906 = param2 as IHabboAvatarEditor;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._catalog = param2 as IHabboCatalog;
      }
      
      private function onAdManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_314 = param2 as IAdManager;
         if(this.var_314 != null && this.var_314.events != null)
         {
            this.var_314.events.addEventListener(AdEvent.const_510,this.adEventHandler);
            this.var_314.events.addEventListener(AdEvent.const_482,this.adEventHandler);
            this.var_314.events.addEventListener(AdEvent.const_556,this.adEventHandler);
         }
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._localization = param2 as IHabboLocalizationManager;
      }
      
      private function onHabboHelpReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1096 = param2 as IHabboHelp;
      }
      
      private function onHabboModerationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_970 = param2 as IHabboModeration;
         Logger.log("XXXX GOT HABBO MODERATION: " + this.var_970);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._config = param2 as IHabboConfigurationManager;
      }
      
      private function onSoundManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_507 = param2 as IHabboSoundManager;
      }
      
      private function registerSessionEvents() : void
      {
         if(this.var_15)
         {
            this.var_15.events.addEventListener(RoomSessionEvent.const_254,this.roomSessionStateEventHandler);
            this.var_15.events.addEventListener(RoomSessionEvent.const_91,this.roomSessionStateEventHandler);
            this.var_15.events.addEventListener(RoomSessionEvent.const_96,this.roomSessionStateEventHandler);
            this.var_15.events.addEventListener(RoomSessionChatEvent.const_180,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionChatEvent.const_469,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionUserBadgesEvent.const_66,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionUserGivableBadgesEvent.const_66,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionDoorbellEvent.const_114,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionDoorbellEvent.const_149,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionDoorbellEvent.const_46,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionPresentEvent.const_313,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionPetPackageEvent.const_571,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionPetPackageEvent.const_570,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionViralFurniStatusEvent.const_512,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionViralFurniStatusEvent.const_445,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_270,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_214,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_778,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_1075,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_1042,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_220,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_232,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_236,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_274,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_251,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_240,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_244,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_650,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_786,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_190,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_903,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionErrorMessageEvent.const_719,this.roomSessionDialogEventHandler);
            this.var_15.events.addEventListener(RoomSessionQueueEvent.const_552,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionVoteEvent.const_157,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionVoteEvent.const_137,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionPollEvent.const_152,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionPollEvent.const_67,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionPollEvent.const_129,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionDimmerPresetsEvent.const_454,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionFriendRequestEvent.const_144,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionUserNotificationEvent.const_117,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionWelcomeGiftEvent.const_116,this.roomSessionEventHandler);
            this.var_15.events.addEventListener(RoomSessionUserDataUpdateEvent.const_123,this.roomSessionEventHandler);
         }
      }
      
      private function roomSessionStateEventHandler(param1:RoomSessionEvent) : void
      {
         var _loc2_:* = null;
         if(this._roomEngine == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomSessionEvent.const_254:
               _loc2_ = this.createDesktop(param1.session);
               break;
            case RoomSessionEvent.const_91:
               break;
            case RoomSessionEvent.const_96:
               if(param1.session != null)
               {
                  this.disposeDesktop(this.getRoomIdentifier(param1.session.roomId,param1.session.roomCategory));
                  this.var_170.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_139,HabboToolbarIconEnum.ZOOM));
                  this.var_170.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_139,HabboToolbarIconEnum.MEMENU));
                  this.var_170.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_139,HabboToolbarIconEnum.INVENTORY));
               }
         }
      }
      
      private function roomSessionEventHandler(param1:RoomSessionEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._roomEngine == null)
         {
            return;
         }
         if(param1.session != null)
         {
            _loc2_ = this.getRoomIdentifier(param1.session.roomId,param1.session.roomCategory);
            _loc3_ = this.getDesktop(_loc2_);
            if(_loc3_ != null)
            {
               _loc3_.processEvent(param1);
            }
         }
      }
      
      private function roomSessionDialogEventHandler(param1:RoomSessionEvent) : void
      {
         var errorMessage:String = null;
         var event:RoomSessionEvent = param1;
         var errorTitle:String = "${error.title}";
         switch(event.type)
         {
            case RoomSessionErrorMessageEvent.const_270:
               errorMessage = "${room.error.cant_trade_stuff}";
               break;
            case RoomSessionErrorMessageEvent.const_214:
               errorMessage = "${room.error.cant_set_item}";
               break;
            case RoomSessionErrorMessageEvent.const_778:
               errorMessage = "${room.error.cant_set_not_owner}";
               break;
            case RoomSessionErrorMessageEvent.const_220:
               errorMessage = "${room.error.max_furniture}";
               break;
            case RoomSessionErrorMessageEvent.const_190:
               errorMessage = "${room.error.max_pets}";
               break;
            case RoomSessionErrorMessageEvent.const_232:
               errorMessage = "${room.error.max_queuetiles}";
               break;
            case RoomSessionErrorMessageEvent.const_236:
               errorMessage = "${room.error.max_soundfurni}";
               break;
            case RoomSessionErrorMessageEvent.const_274:
               errorMessage = "${room.error.max_stickies}";
               break;
            case RoomSessionErrorMessageEvent.const_251:
               errorMessage = "${room.error.kicked}";
               errorTitle = "${generic.alert.title}";
               break;
            case RoomSessionErrorMessageEvent.const_244:
               errorMessage = "${room.error.guide.not.available}";
               break;
            case RoomSessionErrorMessageEvent.const_240:
               errorMessage = "${room.error.guide.already.exists}";
               break;
            case RoomSessionErrorMessageEvent.const_650:
               errorMessage = "${room.error.pets.forbidden_in_hotel}";
               break;
            case RoomSessionErrorMessageEvent.const_786:
               errorMessage = "${room.error.pets.forbidden_in_flat}";
               break;
            case RoomSessionErrorMessageEvent.const_903:
               errorMessage = "${room.error.pets.no_free_tiles}";
               break;
            case RoomSessionErrorMessageEvent.const_719:
               errorMessage = "${room.error.pets.selected_tile_not_free}";
               break;
            default:
               return;
         }
         this._windowManager.alert(errorTitle,errorMessage,0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      private function adEventHandler(param1:AdEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = this.getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.processEvent(param1);
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._roomEngine = param2 as IRoomEngine;
         this.initializeRoomEngineEvents();
         if(this.var_15 != null && this._roomEngine != null && this._roomEngine.isInitialized)
         {
            this.var_15.roomEngineReady = true;
         }
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var _loc3_:IHabboCommunicationManager = param2 as IHabboCommunicationManager;
         if(_loc3_ != null)
         {
            this._connection = _loc3_.getHabboMainConnection(this.onConnectionReady);
            if(this._connection != null)
            {
               this.onConnectionReady(this._connection);
            }
         }
      }
      
      private function onUserDefinedRoomEventsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_1211 = param2 as IHabboUserDefinedRoomEvents;
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            this._connection = param1;
         }
      }
      
      private function initializeRoomEngineEvents() : void
      {
         if(this._roomEngine != null && this._roomEngine.events != null)
         {
            this._roomEngine.events.addEventListener(RoomEngineEvent.const_690,this.roomEngineEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineEvent.const_893,this.roomEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineEvent.const_895,this.roomEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineEvent.const_450,this.roomEngineEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineEvent.const_524,this.roomEngineEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineDimmerStateEvent.const_62,this.roomEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineRoomColorEvent.const_886,this.roomEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_736,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_521,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_310,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_848,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_222,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_800,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_133,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_145,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_146,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_142,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_143,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_154,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_156,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_562,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_444,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_561,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_459,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_104,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_128,this.roomObjectEventHandler);
         }
      }
      
      private function roomEngineEventHandler(param1:RoomEngineEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(param1.type == RoomEngineEvent.const_690)
         {
            if(this.var_15 != null)
            {
               this.var_15.roomEngineReady = true;
            }
         }
         else if(param1.type == RoomEngineEvent.const_524 || param1.type == RoomEngineEvent.const_450)
         {
            _loc2_ = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
            _loc3_ = this.getDesktop(_loc2_) as RoomDesktop;
            if(_loc3_ == null)
            {
               return;
            }
            _loc3_.roomEngineEventHandler(param1);
         }
      }
      
      private function roomEventHandler(param1:RoomEngineEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(this._roomEngine == null)
         {
            return;
         }
         var _loc2_:String = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = this.getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            if(this.var_15 == null)
            {
               return;
            }
            _loc4_ = this.var_15.getSession(param1.roomId,param1.roomCategory);
            if(_loc4_ != null)
            {
               _loc3_ = this.createDesktop(_loc4_) as RoomDesktop;
            }
         }
         if(_loc3_ == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomEngineEvent.const_893:
               _loc5_ = false;
               _loc3_.createRoomView(this.getActiveCanvasId(param1.roomId,param1.roomCategory));
               if(this._roomEngine != null)
               {
                  this._roomEngine.setActiveRoom(param1.roomId,param1.roomCategory);
                  if(!this._roomEngine.isPublicRoomWorldType(this._roomEngine.getWorldType(param1.roomId,param1.roomCategory)))
                  {
                     _loc7_ = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_87,HabboToolbarIconEnum.ZOOM);
                     _loc7_.iconState = "2";
                     this.var_170.events.dispatchEvent(_loc7_);
                  }
                  else
                  {
                     _loc5_ = true;
                  }
               }
               _loc3_.createWidget(RoomWidgetEnum.const_401);
               _loc3_.createWidget(RoomWidgetEnum.const_559);
               if(!_loc3_.session.isSpectatorMode)
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_495);
                  _loc3_.createWidget(RoomWidgetEnum.CHAT_INPUT_WIDGET);
                  _loc3_.createWidget(RoomWidgetEnum.const_144);
               }
               _loc3_.createWidget(RoomWidgetEnum.const_676);
               _loc3_.createWidget(RoomWidgetEnum.const_544);
               _loc3_.createWidget(RoomWidgetEnum.const_520);
               _loc3_.createWidget(RoomWidgetEnum.const_431);
               _loc3_.createWidget(RoomWidgetEnum.const_585);
               _loc3_.createWidget(RoomWidgetEnum.const_438);
               _loc3_.createWidget(RoomWidgetEnum.const_478);
               _loc3_.createWidget(RoomWidgetEnum.const_471);
               _loc3_.createWidget(RoomWidgetEnum.const_114);
               _loc3_.createWidget(RoomWidgetEnum.const_370);
               _loc3_.createWidget(RoomWidgetEnum.const_118);
               _loc3_.createWidget(RoomWidgetEnum.const_508);
               _loc3_.createWidget(RoomWidgetEnum.const_576);
               _loc3_.createWidget(RoomWidgetEnum.const_649);
               _loc3_.createWidget(RoomWidgetEnum.const_117);
               _loc3_.createWidget(RoomWidgetEnum.const_534);
               if(this._config.getKey("avatar.widget.enabled","0") == "1")
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_112);
               }
               if(this._config.getKey("purse.widget.enabled","0") == "1")
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_342);
                  _loc3_.initializeWidget(RoomWidgetEnum.const_342);
               }
               if(!_loc5_)
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_506);
               }
               _loc3_.createWidget(RoomWidgetEnum.const_324);
               if(this.var_1474 != RoomDesktop.const_528)
               {
                  _loc3_.initializeWidget(RoomWidgetEnum.const_324,this.var_1474);
               }
               if(this.var_314 != null)
               {
                  this.var_314.showRoomAd();
               }
               break;
            case RoomEngineEvent.const_895:
               this.disposeDesktop(_loc2_);
               break;
            case RoomEngineRoomColorEvent.const_886:
               _loc6_ = param1 as RoomEngineRoomColorEvent;
               if(_loc6_ == null)
               {
                  break;
               }
               if(_loc6_.bgOnly)
               {
                  _loc3_.setRoomViewColor(16777215,255);
               }
               else
               {
                  _loc3_.setRoomViewColor(_loc6_.color,_loc6_.brightness);
               }
               break;
            case RoomEngineDimmerStateEvent.const_62:
               _loc3_.processEvent(param1);
         }
      }
      
      private function roomObjectEventHandler(param1:RoomEngineObjectEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this._roomEngine == null)
         {
            return;
         }
         var _loc2_:String = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = this.getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.roomObjectEventHandler(param1);
      }
      
      public function processWidgetMessage(param1:int, param2:int, param3:RoomWidgetMessage) : void
      {
         if(param3 == null)
         {
            return;
         }
         if(this._roomEngine == null)
         {
            return;
         }
         var _loc4_:String = this.getRoomIdentifier(param1,param2);
         var _loc5_:RoomDesktop = this.getDesktop(_loc4_) as RoomDesktop;
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.processWidgetMessage(param3);
      }
      
      public function createDesktop(param1:IRoomSession) : IRoomDesktop
      {
         if(param1 == null)
         {
            return null;
         }
         if(this._roomEngine == null)
         {
            return null;
         }
         var _loc2_:String = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = this.getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         _loc3_ = new RoomDesktop(param1,assets,this._connection);
         _loc3_.roomEngine = this._roomEngine;
         _loc3_.windowManager = this._windowManager;
         _loc3_.roomWidgetFactory = this.var_1166;
         _loc3_.sessionDataManager = this.var_316;
         _loc3_.roomSessionManager = this.var_15;
         _loc3_.friendList = this._friendList;
         _loc3_.avatarRenderManager = this.var_463;
         _loc3_.inventory = this._inventory;
         _loc3_.toolbar = this.var_170;
         _loc3_.navigator = this._navigator;
         _loc3_.avatarEditor = this.var_1906;
         _loc3_.catalog = this._catalog;
         _loc3_.adManager = this.var_314;
         _loc3_.localization = this._localization;
         _loc3_.habboHelp = this.var_1096;
         _loc3_.moderation = this.var_970;
         _loc3_.config = this._config;
         _loc3_.soundManager = this.var_507;
         _loc3_.habboTracking = this._habboTracking;
         _loc3_.userDefinedRoomEvents = this.var_1211;
         var _loc4_:XmlAsset = assets.getAssetByName("room_desktop_layout_xml") as XmlAsset;
         if(_loc4_ != null)
         {
            _loc3_.layout = _loc4_.content as XML;
         }
         _loc3_.createWidget(RoomWidgetEnum.const_551);
         _loc3_.createWidget(RoomWidgetEnum.const_647);
         _loc3_.init();
         this.var_315.add(_loc2_,_loc3_);
         return _loc3_;
      }
      
      public function disposeDesktop(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc2_:RoomDesktop = this.var_315.remove(param1) as RoomDesktop;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getWidgetState(RoomWidgetEnum.const_324);
            if(_loc3_ != RoomDesktop.const_528)
            {
               this.var_1474 = _loc3_;
            }
            _loc2_.dispose();
         }
      }
      
      public function getDesktop(param1:String) : IRoomDesktop
      {
         return this.var_315.getValue(param1) as RoomDesktop;
      }
      
      public function getActiveCanvasId(param1:int, param2:int) : int
      {
         return 1;
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_315.length)
         {
            _loc3_ = this.var_315.getWithIndex(_loc2_) as RoomDesktop;
            if(_loc3_ != null)
            {
               _loc3_.update();
            }
            _loc2_++;
         }
      }
      
      private function getRoomIdentifier(param1:int, param2:int) : String
      {
         return "hard_coded_room_id";
      }
   }
}
