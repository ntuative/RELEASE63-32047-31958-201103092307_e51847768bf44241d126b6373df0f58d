package com.sulake.habbo.widget.avatarinfo
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarInfoEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetUserLocationMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class AvatarInfoWidget extends RoomWidgetBase implements IUpdateReceiver
   {
       
      
      private var _component:Component;
      
      private var var_17:AvatarInfoView;
      
      private var var_186:Boolean = false;
      
      private var var_1642:Boolean = false;
      
      private var var_1136:Timer;
      
      private var var_2810:int = 3000;
      
      private var var_1381:Boolean;
      
      private var var_905:Boolean;
      
      private var var_732:Number;
      
      private var var_1380:int;
      
      private var var_2809:int = 500;
      
      public function AvatarInfoWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:Component)
      {
         super(param1,param2,param3);
         this._component = param4;
         this.var_1381 = false;
         this.var_905 = false;
         this.var_1136 = new Timer(this.var_2810,1);
         this.var_1136.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this.var_905 = true;
         this.var_1380 = 0;
      }
      
      private function getOwnCharacterInfo() : void
      {
         messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_810,0,0));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(this._component)
         {
            this._component.removeUpdateReceiver(this);
            this._component = null;
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
         param1.addEventListener(RoomWidgetAvatarInfoEvent.const_112,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_121,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_132,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_147,this.updateEventHandler);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_302,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.const_103,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserDataUpdateEvent.const_123,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_168,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_88,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_406,this.updateEventHandler);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetAvatarInfoEvent.const_112,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_121,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_132,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_147,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_302,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.const_103,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserDataUpdateEvent.const_123,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_168,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_88,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_406,this.updateEventHandler);
      }
      
      private function updateEventHandler(param1:RoomWidgetUpdateEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(param1.type)
         {
            case RoomWidgetAvatarInfoEvent.const_112:
               _loc2_ = param1 as RoomWidgetAvatarInfoEvent;
               this.updateView(_loc2_.userId,_loc2_.userName,_loc2_.roomIndex,RoomObjectTypeEnum.const_175,_loc2_.allowNameChange);
               this.var_186 = true;
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_147:
            case RoomWidgetFurniInfoUpdateEvent.const_302:
               this.removeView();
               break;
            case RoomWidgetUserInfoUpdateEvent.const_121:
               this.getOwnCharacterInfo();
               break;
            case RoomWidgetUserInfoUpdateEvent.const_132:
               _loc3_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.updateView(_loc3_.webID,_loc3_.name,_loc3_.userRoomId,RoomObjectTypeEnum.const_175);
               break;
            case RoomWidgetUserInfoUpdateEvent.BOT:
               _loc4_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.updateView(_loc4_.webID,_loc4_.name,_loc4_.userRoomId,RoomObjectTypeEnum.const_689);
               break;
            case RoomWidgetPetInfoUpdateEvent.const_103:
               _loc5_ = param1 as RoomWidgetPetInfoUpdateEvent;
               this.updateView(_loc5_.id,_loc5_.name,_loc5_.roomIndex,RoomObjectTypeEnum.const_196);
               break;
            case RoomWidgetUserDataUpdateEvent.const_123:
               if(!this.var_186)
               {
                  this.getOwnCharacterInfo();
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_168:
               _loc6_ = param1 as RoomWidgetRoomObjectUpdateEvent;
               if(this.var_17 && this.var_17.roomIndex == _loc6_.id)
               {
                  this.disposeView();
               }
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_88:
               this.var_1642 = false;
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_406:
               this.var_1642 = true;
         }
         this.checkUpdateNeed();
      }
      
      private function updateView(param1:int, param2:String, param3:int, param4:int, param5:Boolean = false) : void
      {
         this.var_905 = false;
         if(this.var_1136.running)
         {
            this.var_1136.stop();
         }
         if(this.var_17 == null || this.var_17.userId != param1 || this.var_17.userName != param2 || this.var_17.roomIndex != param3 || this.var_17.userType != param4)
         {
            if(this.var_17)
            {
               this.disposeView();
            }
            if(!this.var_1642)
            {
               this.var_17 = new AvatarInfoView(this,param1,param2,param3,param4,param5);
            }
         }
      }
      
      public function disposeView() : void
      {
         if(this.var_17)
         {
            this.var_17.dispose();
            this.var_17 = null;
            this.var_1381 = true;
            this.var_905 = false;
         }
      }
      
      private function removeView() : void
      {
         if(!this.var_1381)
         {
            this.var_1381 = true;
            this.var_1136.start();
         }
         else if(!this.var_905)
         {
            this.disposeView();
         }
      }
      
      public function checkUpdateNeed() : void
      {
         if(!this._component)
         {
            return;
         }
         if(this.var_17)
         {
            this._component.registerUpdateReceiver(this,10);
         }
         else
         {
            this._component.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(!this.var_17)
         {
            return;
         }
         _loc2_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(this.var_17.userId,this.var_17.userType)) as RoomWidgetUserLocationUpdateEvent;
         if(!_loc2_)
         {
            return;
         }
         if(this.var_905)
         {
            this.var_1380 += param1;
            this.var_732 = 1 - this.var_1380 / Number(this.var_2809);
         }
         else
         {
            this.var_732 = 1;
         }
         if(this.var_732 <= 0)
         {
            this.disposeView();
            return;
         }
         this.var_17.update(_loc2_.rectangle,this.var_732);
         this.checkUpdateNeed();
      }
   }
}
