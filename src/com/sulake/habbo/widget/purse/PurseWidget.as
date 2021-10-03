package com.sulake.habbo.widget.purse
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetPurseData;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenCatalogMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class PurseWidget extends RoomWidgetBase
   {
       
      
      private var var_17:IWindowContainer;
      
      private var var_2151:int;
      
      private var var_2150:int;
      
      public function PurseWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager)
      {
         var _loc5_:* = null;
         super(param1,param2,param3);
         var _loc4_:XmlAsset = param2.getAssetByName("purse_widget") as XmlAsset;
         if(_loc4_)
         {
            this.var_17 = param1.buildFromXML(_loc4_.content as XML,1) as IWindowContainer;
            _loc5_ = this.var_17.desktop;
            this.var_17.x = _loc5_.width - this.var_17.width - 100;
            this.var_17.y = -5;
            this.var_17.visible = false;
            this.var_17.findChildByName("credits_container").addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onCreditsClick);
            this.var_17.findChildByName("pixels_container").addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPixelsClick);
         }
      }
      
      override public function initialize(param1:int = 0) : void
      {
         messageListener.processWidgetMessage(new RoomWidgetGetPurseData());
         if(this.var_17)
         {
            this.var_17.visible = true;
         }
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(this.var_17)
         {
            this.var_17.dispose();
            this.var_17 = null;
         }
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_69,this.onCreditBalance);
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_108,this.onPixelBalance);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_69,this.onCreditBalance);
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_108,this.onPixelBalance);
      }
      
      private function onCreditBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         this.var_2151 = param1.balance;
         if(this.var_17)
         {
            this.var_17.findChildByName("credits").caption = this.var_2151.toString();
         }
      }
      
      private function onPixelBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         this.var_2150 = param1.balance;
         if(this.var_17)
         {
            this.var_17.findChildByName("pixels").caption = this.var_2150.toString();
         }
      }
      
      private function onCreditsClick(param1:WindowMouseEvent) : void
      {
         messageListener.processWidgetMessage(new RoomWidgetOpenCatalogMessage(RoomWidgetOpenCatalogMessage.const_1191));
      }
      
      private function onPixelsClick(param1:WindowMouseEvent) : void
      {
         messageListener.processWidgetMessage(new RoomWidgetOpenCatalogMessage(RoomWidgetOpenCatalogMessage.const_1162));
      }
   }
}
