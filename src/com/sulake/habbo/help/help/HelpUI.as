package com.sulake.habbo.help.help
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.room.action.CallGuideBotMessageComposer;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.cfh.CallForHelpPendingItemView;
   import com.sulake.habbo.help.cfh.CallForHelpReportUserSelection;
   import com.sulake.habbo.help.cfh.CallForHelpSentView;
   import com.sulake.habbo.help.cfh.CallForHelpTextInput;
   import com.sulake.habbo.help.cfh.CallForHelpTopicSelection;
   import com.sulake.habbo.help.enum.CallForHelpResultEnum;
   import com.sulake.habbo.help.enum.HabboHelpTrackingEvent;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class HelpUI
   {
       
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_170:IHabboToolbar;
      
      private var _window:IWindowContainer;
      
      private var _component:HabboHelp;
      
      private var _defaultViewId:String = "HHVE_HELP_FRONTPAGE";
      
      private var var_362:String;
      
      private var var_501:Array;
      
      private var var_112:Map;
      
      private var var_2219:int = 0;
      
      private var var_2217:int = 0;
      
      private var var_361:IWindowContainer;
      
      private var var_610:Array;
      
      private var var_2555:Boolean = false;
      
      public function HelpUI(param1:HabboHelp, param2:IAssetLibrary, param3:IHabboWindowManager, param4:IHabboLocalizationManager, param5:IHabboToolbar)
      {
         this.var_362 = this._defaultViewId;
         this.var_501 = new Array();
         this.var_610 = new Array();
         super();
         this._component = param1;
         this._assetLibrary = param2;
         this._windowManager = param3;
         this._windowManager.registerLocalizationParameter("info.client.version","version",new String(201103092302));
         this.var_170 = param5;
         this.var_112 = new Map();
         this.var_112.add(HabboHelpViewEnum.const_1481,IHelpViewController(new PlaceholderView(this,this._windowManager,this._assetLibrary)));
         this.var_112.add(HabboHelpViewEnum.const_202,IHelpViewController(new HelpMainView(this,this._windowManager,this._assetLibrary)));
         this.var_112.add(HabboHelpViewEnum.const_564,IHelpViewController(new FaqBrowseTopView(this,this._windowManager,this._assetLibrary)));
         this.var_112.add(HabboHelpViewEnum.const_276,IHelpViewController(new FaqBrowseCategoryView(this,this._windowManager,this._assetLibrary)));
         this.var_112.add(HabboHelpViewEnum.const_219,IHelpViewController(new FaqBrowseEntry(this,this._windowManager,this._assetLibrary)));
         this.var_112.add(HabboHelpViewEnum.const_395,IHelpViewController(new CallForHelpTopicSelection(this,this._windowManager,this._assetLibrary)));
         this.var_112.add(HabboHelpViewEnum.const_843,IHelpViewController(new CallForHelpTextInput(this,this._windowManager,this._assetLibrary)));
         this.var_112.add(HabboHelpViewEnum.const_238,IHelpViewController(new CallForHelpSentView(this,this._windowManager,this._assetLibrary,"help_cfh_thanks")));
         this.var_112.add(HabboHelpViewEnum.const_1149,IHelpViewController(new CallForHelpSentView(this,this._windowManager,this._assetLibrary,"help_cfh_abusive")));
         this.var_112.add(HabboHelpViewEnum.const_1082,IHelpViewController(new CallForHelpPendingItemView(this,this._windowManager,this._assetLibrary)));
         this.var_112.add(HabboHelpViewEnum.const_751,IHelpViewController(new CallForHelpReportUserSelection(this,this._windowManager,this._assetLibrary)));
      }
      
      public function dispose() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this._window != null)
         {
            this._window.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClick);
         }
         var _loc1_:Array = this.var_112.getKeys();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_];
            _loc4_ = this.var_112.getValue(_loc3_) as IHelpViewController;
            if(_loc4_ != null)
            {
               _loc4_.dispose();
            }
            _loc2_++;
         }
         this.var_112.dispose();
         if(this.var_361 != null)
         {
            this.var_361.dispose();
            this.var_361 = null;
         }
      }
      
      public function toggleUI() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.hideUI();
         }
         else
         {
            this.showUI();
         }
      }
      
      public function showUI(param1:String = null, param2:Boolean = true) : void
      {
         if(param1 == null)
         {
            param1 = this.var_362;
         }
         var _loc3_:* = !this.visible;
         if(this._window == null)
         {
            this.createWindow();
            if(this._window == null)
            {
               return;
            }
            this._window.visible = true;
         }
         else
         {
            this.removeCurrentView();
         }
         if(param1 == this._defaultViewId)
         {
            this.var_501 = new Array();
         }
         else if(param2)
         {
            if(this.var_501.length == 0 || param1 != this.var_362)
            {
               this.var_501.push(this.var_362);
            }
         }
         this.var_362 = param1;
         var _loc4_:IHelpViewController = this.getViewController();
         if(_loc4_ == null)
         {
            Logger.log("* No view controller found for " + this.var_362);
            return;
         }
         var _loc5_:IWindowContainer = this._window.findChildByName("content_area") as IWindowContainer;
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:IItemListWindow = this._window.findChildByName("content_list") as IItemListWindow;
         if(_loc6_ == null)
         {
            return;
         }
         _loc6_.height = 0;
         _loc4_.render();
         var _loc7_:IWindow = _loc4_.getWindowContainer() as IWindow;
         if(_loc7_ != null)
         {
            _loc6_.addListItemAt(_loc7_,0);
         }
         this.addBackButtonWindow();
         this.updateWindowDimensions();
         if(_loc3_)
         {
            if(this.var_170 != null)
            {
               this.var_170.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_53,HabboToolbarIconEnum.HELP,this._window));
            }
         }
         this._component.events.dispatchEvent(new Event(HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_DEFAULT));
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_362 != param1)
         {
            return;
         }
         var _loc3_:IHelpViewController = this.getViewController();
         if(_loc3_ != null)
         {
            _loc3_.update(param2);
         }
      }
      
      public function get component() : HabboHelp
      {
         return this._component;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this._component.localization;
      }
      
      public function get visible() : Boolean
      {
         if(this._window == null)
         {
            return false;
         }
         return this._window.visible;
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         var message:String = param1;
         this._windowManager.alert("${help.cfh.reply.title}",message,0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         switch(param1)
         {
            case CallForHelpResultEnum.const_238:
               this.showUI(HabboHelpViewEnum.const_238);
               break;
            case CallForHelpResultEnum.const_1153:
               this.showUI(HabboHelpViewEnum.const_1082);
               break;
            case CallForHelpResultEnum.const_1004:
               this.showUI(HabboHelpViewEnum.const_1149);
         }
      }
      
      public function updateCallForGuideBotUI(param1:Boolean) : void
      {
         this.var_2555 = param1;
         var _loc2_:IHelpViewController = this.var_112.getValue(HabboHelpViewEnum.const_202) as IHelpViewController;
         if(_loc2_ != null && !_loc2_.disposed)
         {
            _loc2_.update();
         }
      }
      
      public function isCallForGuideBotEnabled() : Boolean
      {
         return this.var_2555;
      }
      
      public function handleCallGuideBot() : void
      {
         this.sendMessage(new CallGuideBotMessageComposer());
         this.hideUI();
         this._component.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_429));
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         this._component.sendMessage(param1);
      }
      
      public function getFaq() : FaqIndex
      {
         return this._component.getFaq();
      }
      
      public function getText(param1:String, param2:String = null) : String
      {
         if(param2 == null)
         {
            param2 = param1;
         }
         return this.localization.getKey(param1,param2);
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         return this._component.getConfigurationKey(param1,param2,param3);
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_112.length)
         {
            _loc3_ = this.var_112.getWithIndex(_loc2_) as IHelpViewController;
            if(_loc3_ != null)
            {
               _loc3_.roomSessionActive = param1;
               if(!_loc3_.disposed)
               {
                  _loc3_.update();
               }
            }
            _loc2_++;
         }
      }
      
      private function getViewController() : IHelpViewController
      {
         return this.var_112.getValue(this.var_362);
      }
      
      private function createWindow() : void
      {
         var _loc1_:ICoreWindowManager = ICoreWindowManager(this._windowManager);
         var _loc2_:XmlAsset = XmlAsset(this._assetLibrary.getAssetByName("help_frame_xml"));
         if(_loc2_ == null)
         {
            return;
         }
         this._window = _loc1_.buildFromXML(XML(_loc2_.content)) as IWindowContainer;
         if(this._window == null)
         {
            return;
         }
         this._window.setParamFlag(WindowParam.const_30);
         this._window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClick);
         var _loc3_:IWindow = this._window.findChildByTag("close");
         if(_loc3_ != null)
         {
            _loc3_.setParamFlag(WindowParam.const_30);
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClose);
         }
         var _loc4_:IItemListWindow = this._window.findChildByName("content_list") as IItemListWindow;
         if(_loc4_ == null)
         {
            return;
         }
         this.var_2219 = this._window.width - _loc4_.width;
         this.var_2217 = this._window.height;
      }
      
      private function removeCurrentView() : void
      {
         var _loc2_:* = null;
         if(this._window != null)
         {
            _loc2_ = this._window.findChildByName("content_list") as IItemListWindow;
            if(_loc2_ != null)
            {
               while(_loc2_.numListItems > 1)
               {
                  _loc2_.getListItemAt(0).dispose();
                  _loc2_.removeListItemAt(0);
               }
            }
         }
         var _loc1_:IHelpViewController = this.getViewController();
         if(_loc1_ != null)
         {
            _loc1_.dispose();
         }
      }
      
      public function updateWindowDimensions() : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc1_:IItemListWindow = this._window.findChildByName("content_list") as IItemListWindow;
         if(_loc1_ == null)
         {
            return;
         }
         this._window.height = _loc1_.height + this.var_2217;
         this._window.width = _loc1_.width + this.var_2219;
      }
      
      public function hideUI() : void
      {
         if(this._window != null)
         {
            this.removeCurrentView();
            this._window.dispose();
            this._window = null;
         }
         this.var_362 = this._defaultViewId;
         this._component.events.dispatchEvent(new Event(HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_CLOSED));
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         this.hideUI();
      }
      
      private function onBack(param1:WindowMouseEvent) : void
      {
         if(this.var_501.length > 0)
         {
            this.showUI(this.var_501.pop(),false);
         }
      }
      
      private function onMouseOut(param1:WindowMouseEvent) : void
      {
         this.setBackButtonActiveState(false);
      }
      
      private function onMouseOver(param1:WindowMouseEvent) : void
      {
         this.setBackButtonActiveState(true);
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         var _loc2_:IWindow = param1.target as IWindow;
         if(_loc2_.tags.indexOf("close") > -1)
         {
            this.hideUI();
            return;
         }
         if(_loc2_.tags.indexOf("back") > -1)
         {
            if(this.var_501.length > 0)
            {
               this.showUI(this.var_501.pop(),false);
            }
         }
      }
      
      private function setBackButtonActiveState(param1:Boolean = false) : void
      {
         var _loc3_:* = null;
         if(this.var_362 == HabboHelpViewEnum.const_202)
         {
            return;
         }
         if(this.var_610.length < 2)
         {
            _loc3_ = this._assetLibrary.getAssetByName("back_png") as BitmapDataAsset;
            this.var_610.push(_loc3_.content as BitmapData);
            _loc3_ = this._assetLibrary.getAssetByName("back_hi_png") as BitmapDataAsset;
            this.var_610.push(_loc3_.content as BitmapData);
         }
         var _loc2_:IBitmapWrapperWindow = this.var_361.findChildByName("back_image") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true);
         if(param1)
         {
            _loc2_.bitmap.copyPixels(this.var_610[1],this.var_610[1].rect,new Point(0,0));
         }
         else
         {
            _loc2_.bitmap.copyPixels(this.var_610[0],this.var_610[0].rect,new Point(0,0));
         }
      }
      
      private function addBackButtonWindow() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(this.var_362 == HabboHelpViewEnum.const_202 || this.var_501.length == 0)
         {
            return;
         }
         if(this.var_361 == null)
         {
            _loc2_ = ICoreWindowManager(this._windowManager);
            _loc3_ = XmlAsset(this._assetLibrary.getAssetByName("help_back_button_xml"));
            if(_loc3_ == null)
            {
               return;
            }
            this.var_361 = _loc2_.buildFromXML(XML(_loc3_.content)) as IWindowContainer;
            _loc4_ = this.var_361.findChildByName("back_image");
            if(_loc4_ != null)
            {
               _loc4_.setParamFlag(WindowParam.const_30);
               _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onBack);
               _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OUT,this.onMouseOut);
               _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onMouseOver);
            }
            _loc5_ = this.var_361.findChildByName("back_text");
            if(_loc5_ != null)
            {
               _loc5_.setParamFlag(WindowParam.const_30);
               _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onBack);
            }
         }
         var _loc1_:IItemListWindow = this._window.findChildByName("content_list") as IItemListWindow;
         if(_loc1_ == null || this.var_361 == null)
         {
            return;
         }
         if(_loc1_.getListItemIndex(this.var_361 as IWindow) > -1)
         {
            return;
         }
         _loc1_.addListItem(this.var_361 as IWindow);
         this.setBackButtonActiveState(false);
      }
   }
}
