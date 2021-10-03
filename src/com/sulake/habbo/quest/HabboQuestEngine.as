package com.sulake.habbo.quest
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.quest.OpenQuestListForCampaignMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   import flash.net.URLRequest;
   import iid.IIDHabboWindowManager;
   
   public class HabboQuestEngine extends Component implements IHabboQuestEngine
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_177:IHabboConfigurationManager;
      
      private var var_1301:IncomingMessages;
      
      private var _controller:QuestController;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_170:IHabboToolbar;
      
      private var _catalog:IHabboCatalog;
      
      private var var_316:ISessionDataManager;
      
      private var var_2320:String;
      
      private var var_1096:IHabboHelp;
      
      public function HabboQuestEngine(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this._controller = new QuestController(this);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationComponentInit);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDRoomEngine(),this.onRoomEngineReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
         queueInterface(new IIDHabboHelp(),this.onHabboHelpReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.var_170)
         {
            this.var_170.release(new IIDHabboToolbar());
            this.var_170 = null;
         }
         if(this._catalog != null)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
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
         if(this.var_177 != null)
         {
            this.var_177.release(new IIDHabboConfigurationManager());
            this.var_177 = null;
         }
         if(this._localization != null)
         {
            this._localization.release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         if(this._communication != null)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_316 != null)
         {
            this.var_316.release(new IIDSessionDataManager());
            this.var_316 = null;
         }
         if(this.var_1301)
         {
            this.var_1301.dispose();
         }
         if(this.var_1096 != null)
         {
            this.var_1096.release(new IIDHabboHelp());
            this.var_1096 = null;
         }
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
            window = this._windowManager.buildFromXML(XML(xmlAsset.content));
         }
         catch(e:Error)
         {
         }
         return window;
      }
      
      private function onCommunicationComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         this._communication = IHabboCommunicationManager(param2);
         this.var_1301 = new IncomingMessages(this);
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._roomEngine = param2 as IRoomEngine;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return this._roomEngine;
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._localization = IHabboLocalizationManager(param2);
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         this.var_177 = param2 as IHabboConfigurationManager;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._catalog = param2 as IHabboCatalog;
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_316 = param2 as ISessionDataManager;
      }
      
      private function onHabboHelpReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1096 = param2 as IHabboHelp;
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return this._communication;
      }
      
      public function get habboHelp() : IHabboHelp
      {
         return this.var_1096;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this._localization;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_177;
      }
      
      public function get controller() : QuestController
      {
         return this._controller;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this.var_170;
      }
      
      public function openCatalog(param1:String) : void
      {
         this._catalog.openCatalogPage(param1,true);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_170 = IHabboToolbar(param2) as IHabboToolbar;
         this.var_170.events.addEventListener(HabboToolbarEvent.const_38,this.onHabboToolbarEvent);
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_38)
         {
            if(param1.iconId == HabboToolbarIconEnum.QUESTS)
            {
               this.onQuestsToolBarIconClick();
               return;
            }
         }
      }
      
      private function onQuestsToolBarIconClick() : void
      {
         var _loc1_:Boolean = this._controller.isVisible();
         if(_loc1_)
         {
            this._controller.close();
         }
         else
         {
            this._controller.show();
         }
      }
      
      public function getQuestCampaign(param1:String) : void
      {
         this._communication.getHabboMainConnection(null).send(new OpenQuestListForCampaignMessageComposer(param1));
      }
      
      public function setImageFromAsset(param1:IBitmapWrapperWindow, param2:String, param3:Function) : void
      {
         if(!param2 || !assets)
         {
            return;
         }
         var _loc4_:BitmapDataAsset = assets.getAssetByName(param2) as BitmapDataAsset;
         if(_loc4_ == null)
         {
            this.retrievePreviewAsset(param2,param3);
            return;
         }
         if(param1)
         {
            QuestUtils.setElementImage(param1,_loc4_.content as BitmapData);
         }
      }
      
      private function retrievePreviewAsset(param1:String, param2:Function) : void
      {
         if(!param1 || !assets)
         {
            return;
         }
         var _loc3_:String = this.var_177.getKey("image.library.questing.url");
         var _loc4_:* = _loc3_ + param1 + ".png";
         Logger.log("[HabboQuestEngine] Retrieve Product Preview Asset: " + _loc4_);
         var _loc5_:URLRequest = new URLRequest(_loc4_);
         var _loc6_:AssetLoaderStruct = assets.loadAssetFromFile(param1,_loc5_,"image/png");
         if(!_loc6_)
         {
            return;
         }
         _loc6_.addEventListener(AssetLoaderEvent.const_27,param2);
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         if(!this._catalog)
         {
            return 0;
         }
         return this._catalog.getPurse().getActivityPointsForType(param1);
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_316;
      }
      
      public function get defaultCampaignCode() : String
      {
         return this.var_2320;
      }
      
      public function set defaultCampaignCode(param1:String) : void
      {
         this.var_2320 = param1;
      }
   }
}
