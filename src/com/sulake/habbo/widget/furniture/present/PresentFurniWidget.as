package com.sulake.habbo.widget.furniture.present
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetEcotronBoxDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPresentDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetPresentOpenMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class PresentFurniWidget extends RoomWidgetBase
   {
      
      private static const const_1279:Number = 100;
      
      private static const const_1278:Number = 100;
       
      
      private var _window:IWindowContainer;
      
      private var var_347:int = -1;
      
      private var _text:String;
      
      private var _controller:Boolean;
      
      private var var_346:Boolean = false;
      
      public function PresentFurniWidget(param1:IHabboWindowManager, param2:IAssetLibrary = null)
      {
         super(param1,param2);
      }
      
      override public function dispose() : void
      {
         this.hideInterface();
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetPresentDataUpdateEvent.const_73,this.onObjectUpdate);
         param1.addEventListener(RoomWidgetPresentDataUpdateEvent.const_93,this.onObjectUpdate);
         param1.addEventListener(RoomWidgetPresentDataUpdateEvent.const_513,this.onObjectUpdate);
         param1.addEventListener(RoomWidgetPresentDataUpdateEvent.const_519,this.onObjectUpdate);
         param1.addEventListener(RoomWidgetPresentDataUpdateEvent.const_456,this.onObjectUpdate);
         param1.addEventListener(RoomWidgetPresentDataUpdateEvent.const_549,this.onObjectUpdate);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_153,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetEcotronBoxDataUpdateEvent.const_73,this.onEcotronUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetPresentDataUpdateEvent.const_73,this.onObjectUpdate);
         param1.removeEventListener(RoomWidgetPresentDataUpdateEvent.const_93,this.onObjectUpdate);
         param1.removeEventListener(RoomWidgetPresentDataUpdateEvent.const_513,this.onObjectUpdate);
         param1.removeEventListener(RoomWidgetPresentDataUpdateEvent.const_519,this.onObjectUpdate);
         param1.removeEventListener(RoomWidgetPresentDataUpdateEvent.const_456,this.onObjectUpdate);
         param1.removeEventListener(RoomWidgetPresentDataUpdateEvent.const_549,this.onObjectUpdate);
         param1.removeEventListener(RoomWidgetEcotronBoxDataUpdateEvent.const_73,this.onEcotronUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_153,this.onRoomObjectRemoved);
      }
      
      private function onObjectUpdate(param1:RoomWidgetPresentDataUpdateEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetPresentDataUpdateEvent.const_73:
               this.hideInterface();
               this.var_346 = false;
               this.var_347 = param1.objectId;
               this._text = param1.text;
               this._controller = param1.controller;
               this.showInterface();
               break;
            case RoomWidgetPresentDataUpdateEvent.const_519:
               if(!this.var_346)
               {
                  return;
               }
               this.var_347 = param1.objectId;
               this._text = param1.text;
               this.showInterface();
               this.showCustomIcon("packagecard_icon_floor");
               break;
            case RoomWidgetPresentDataUpdateEvent.const_456:
               if(!this.var_346)
               {
                  return;
               }
               this.var_347 = param1.objectId;
               this._text = param1.text;
               this.showInterface();
               this.showCustomIcon("packagecard_icon_landscape");
               break;
            case RoomWidgetPresentDataUpdateEvent.const_549:
               if(!this.var_346)
               {
                  return;
               }
               this.var_347 = param1.objectId;
               this._text = param1.text;
               this.showInterface();
               this.showCustomIcon("packagecard_icon_wallpaper");
               break;
            case RoomWidgetPresentDataUpdateEvent.const_513:
               if(!this.var_346)
               {
                  return;
               }
               this.var_347 = param1.objectId;
               this._text = param1.text;
               this.showInterface();
               this.showCustomIcon("packagecard_icon_hc");
               break;
            case RoomWidgetPresentDataUpdateEvent.const_93:
               if(!this.var_346)
               {
                  return;
               }
               this.var_347 = param1.objectId;
               this._text = param1.text;
               this.showInterface();
               this.showIcon(param1.iconBitmapData);
               break;
         }
      }
      
      private function onRoomObjectRemoved(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         if(param1.id == this.var_347)
         {
            this.hideInterface();
         }
      }
      
      private function onEcotronUpdate(param1:RoomWidgetEcotronBoxDataUpdateEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetEcotronBoxDataUpdateEvent.const_73:
               this.hideInterface();
         }
      }
      
      private function showCustomIcon(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:BitmapDataAsset = assets.getAssetByName(param1) as BitmapDataAsset;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.content as BitmapData;
         }
         this.showIcon(_loc3_);
      }
      
      private function showIcon(param1:BitmapData) : void
      {
         if(param1 == null)
         {
            param1 = new BitmapData(1,1);
         }
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName("packagecard_flake") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true,0);
            _loc2_.bitmap.copyPixels(param1,param1.rect,new Point(0,0));
         }
         this.hideOpenButton();
      }
      
      private function showInterface() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this.var_347 < 0)
         {
            return;
         }
         var _loc1_:IAsset = assets.getAssetByName("packagecard");
         var _loc2_:XmlAsset = XmlAsset(_loc1_);
         if(_loc2_ == null)
         {
            return;
         }
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         this._window = windowManager.createWindow("presentcardui_container","",HabboWindowType.const_63,HabboWindowStyle.const_31,0 | 0,new Rectangle(const_1279,const_1278,2,2),null,0) as IWindowContainer;
         this._window.buildFromXML(XML(_loc2_.content));
         var _loc3_:BitmapDataAsset = assets.getAssetByName("packagecard_flake") as BitmapDataAsset;
         if(_loc3_ != null)
         {
            _loc6_ = _loc3_.content as BitmapData;
            if(_loc6_ != null)
            {
               this.showIcon(_loc6_);
            }
         }
         _loc4_ = this._window.findChildByName("packagecard_msg") as ITextWindow;
         if(_loc4_ != null && this._text != null)
         {
            _loc4_.caption = this._text;
         }
         _loc5_ = this._window.findChildByName("packagecard_btn_open");
         if(_loc5_ != null)
         {
            if(this._controller)
            {
               _loc5_.visible = true;
               _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseEvent);
            }
            else
            {
               _loc5_.visible = false;
            }
         }
         if(!this._controller)
         {
            this.hideOpenButton();
         }
         _loc5_ = this._window.findChildByTag("close");
         if(_loc5_ != null)
         {
            _loc5_.procedure = this.onWindowClose;
         }
         this._window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseEvent);
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_346 = false;
         this.hideInterface();
      }
      
      private function hideInterface() : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         if(!this.var_346)
         {
            this.var_347 = -1;
         }
         this._text = "";
         this._controller = false;
      }
      
      private function sendOpen() : void
      {
         var _loc1_:* = null;
         if(this.var_346 || this.var_347 == -1 || !this._controller)
         {
            return;
         }
         this.var_346 = true;
         if(messageListener != null)
         {
            _loc1_ = new RoomWidgetPresentOpenMessage(RoomWidgetPresentOpenMessage.const_163,this.var_347);
            messageListener.processWidgetMessage(_loc1_);
         }
      }
      
      private function hideOpenButton() : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc1_:IWindow = this._window.findChildByName("packagecard_btn_open");
         if(_loc1_ != null)
         {
            _loc1_.visible = false;
         }
      }
      
      private function onMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:IWindow = param1.target as IWindow;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "open":
            case "packagecard_btn_open":
               this.sendOpen();
               break;
            case "close":
            case "close_btn":
            default:
               this.var_346 = false;
               this.hideInterface();
         }
      }
   }
}
