package com.sulake.habbo.widget.furniture.dimmer
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetDimmerStateUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDimmerUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDimmerUpdateEventPresetItem;
   import com.sulake.habbo.widget.messages.RoomWidgetDimmerChangeStateMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetDimmerPreviewMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetDimmerSavePresetMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class DimmerFurniWidget extends RoomWidgetBase
   {
      
      private static const const_1293:Array = new Array(7665141,21495,15161822,15353138,15923281,8581961,0);
      
      private static const const_1292:Array = new Array(int(76.5),int(76.5));
       
      
      private var var_17:DimmerView;
      
      private var _presets:Array;
      
      private var var_1100:int;
      
      private var _dimmerState:int;
      
      private var var_2099:int;
      
      private var var_1101:int;
      
      private var _color:uint = 16777215;
      
      private var var_1102:uint = 255;
      
      public function DimmerFurniWidget(param1:IHabboWindowManager, param2:IAssetLibrary = null, param3:IHabboLocalizationManager = null)
      {
         super(param1,param2,param3);
      }
      
      public function get dimmerState() : int
      {
         return this._dimmerState;
      }
      
      public function get presets() : Array
      {
         return this._presets;
      }
      
      public function get colors() : Array
      {
         return const_1293;
      }
      
      public function get minLights() : Array
      {
         return const_1292;
      }
      
      public function get selectedPresetIndex() : int
      {
         return this.var_1100;
      }
      
      public function set selectedPresetIndex(param1:int) : void
      {
         this.var_1100 = param1;
      }
      
      override public function dispose() : void
      {
         if(this.var_17 != null)
         {
            this.var_17.dispose();
            this.var_17 = null;
         }
         this._presets = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetDimmerUpdateEvent.const_714,this.onPresets);
         param1.addEventListener(RoomWidgetDimmerUpdateEvent.const_784,this.onHide);
         param1.addEventListener(RoomWidgetDimmerStateUpdateEvent.const_62,this.onDimmerState);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetDimmerUpdateEvent.const_714,this.onPresets);
         param1.removeEventListener(RoomWidgetDimmerUpdateEvent.const_784,this.onHide);
         param1.removeEventListener(RoomWidgetDimmerStateUpdateEvent.const_62,this.onDimmerState);
      }
      
      private function onPresets(param1:RoomWidgetDimmerUpdateEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         this.var_1100 = param1.selectedPresetId - 1;
         this._presets = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < param1.presets.length)
         {
            _loc3_ = param1.presets[_loc2_];
            _loc4_ = new DimmerFurniWidgetPresetItem(_loc3_.id,_loc3_.type,_loc3_.color,_loc3_.light);
            this._presets.push(_loc4_);
            _loc2_++;
         }
         this.showInterface();
      }
      
      private function onHide(param1:RoomWidgetDimmerUpdateEvent) : void
      {
         this.dispose();
      }
      
      private function onDimmerState(param1:RoomWidgetDimmerStateUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         this._dimmerState = param1.state;
         this.var_2099 = param1.presetId;
         this.var_1101 = param1.effectId;
         this._color = param1.color;
         this.var_1102 = param1.brightness;
         if(this.var_17 != null)
         {
            this.var_17.update();
         }
         if(!this.validateBrightness(this.var_1102,this.var_1101))
         {
            return;
         }
         _loc2_ = new RoomWidgetDimmerPreviewMessage(this._color,this.var_1102,this.var_1101 == 2);
         messageListener.processWidgetMessage(_loc2_);
      }
      
      private function showInterface() : void
      {
         if(this.var_17 == null)
         {
            this.var_17 = new DimmerView(this);
         }
         if(this.var_17 != null)
         {
            this.var_17.showInterface();
         }
      }
      
      public function storeCurrentSetting(param1:Boolean) : void
      {
         var _loc7_:* = null;
         if(this._dimmerState == 0)
         {
            return;
         }
         if(messageListener == null)
         {
            return;
         }
         var _loc2_:int = this.var_1100 + 1;
         if(this._presets == null || _loc2_ < 0 || _loc2_ > this._presets.length)
         {
            return;
         }
         var _loc3_:int = this.var_17.selectedType;
         var _loc4_:uint = this.colors[this.var_17.selectedColorIndex];
         var _loc5_:int = this.var_17.selectedBrightness;
         var _loc6_:DimmerFurniWidgetPresetItem = this._presets[this.var_1100] as DimmerFurniWidgetPresetItem;
         if(_loc6_ != null && _loc6_.type == _loc3_ && _loc6_.color == _loc4_ && _loc6_.light == _loc5_ && !param1)
         {
            return;
         }
         _loc6_.type = _loc3_;
         _loc6_.color = _loc4_;
         _loc6_.light = _loc5_;
         if(!this.validateBrightness(_loc5_,_loc3_))
         {
            return;
         }
         _loc7_ = new RoomWidgetDimmerSavePresetMessage(_loc2_,_loc3_,_loc4_,_loc5_,param1);
         messageListener.processWidgetMessage(_loc7_);
      }
      
      public function previewCurrentSetting() : void
      {
         var _loc1_:* = null;
         if(this._dimmerState == 0)
         {
            return;
         }
         if(messageListener == null)
         {
            return;
         }
         if(!this.validateBrightness(this.var_17.selectedBrightness,this.var_17.selectedType))
         {
            return;
         }
         _loc1_ = new RoomWidgetDimmerPreviewMessage(this.colors[this.var_17.selectedColorIndex],this.var_17.selectedBrightness,this.var_17.selectedType == 2);
         messageListener.processWidgetMessage(_loc1_);
      }
      
      public function changeRoomDimmerState() : void
      {
         var _loc1_:* = null;
         if(messageListener != null)
         {
            _loc1_ = new RoomWidgetDimmerChangeStateMessage();
            messageListener.processWidgetMessage(_loc1_);
         }
      }
      
      public function removePreview() : void
      {
         var _loc1_:* = null;
         if(messageListener == null)
         {
            return;
         }
         if(!this.validateBrightness(this.var_1102,this.var_1101))
         {
            return;
         }
         _loc1_ = new RoomWidgetDimmerPreviewMessage(this._color,this.var_1102,this.var_1101 == 2);
         messageListener.processWidgetMessage(_loc1_);
      }
      
      private function validateBrightness(param1:uint, param2:int) : Boolean
      {
         return true;
      }
   }
}
