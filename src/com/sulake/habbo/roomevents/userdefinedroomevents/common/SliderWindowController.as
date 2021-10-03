package com.sulake.habbo.roomevents.userdefinedroomevents.common
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class SliderWindowController extends EventDispatcher
   {
       
      
      private var var_902:Number = 0;
      
      private var _sliderContainer:IWindowContainer;
      
      private var var_901:Boolean = false;
      
      private var var_690:BitmapData;
      
      private var var_691:BitmapData;
      
      private var var_1586:int;
      
      private var _minValue:Number = 0.0;
      
      private var var_1133:Number = 1.0;
      
      private var var_592:Number = 0.0;
      
      public function SliderWindowController(param1:HabboUserDefinedRoomEvents, param2:IWindowContainer, param3:IAssetLibrary, param4:Number = 0.0, param5:Number = 1.0, param6:Number = 0.0)
      {
         super();
         this._sliderContainer = IWindowContainer(param1.getXmlWindow("ude_slider"));
         param2.addChild(this._sliderContainer);
         this._minValue = param4;
         this.var_1133 = param5;
         this.var_592 = param6;
         this.var_902 = 0;
         this.storeAssets(param3);
         this.displaySlider();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this._sliderContainer = null;
         this.var_690 = null;
         this.var_691 = null;
      }
      
      public function setValue(param1:Number, param2:Boolean = true) : void
      {
         param1 = Math.max(this._minValue,param1);
         param1 = Math.min(this.var_1133,param1);
         this.var_902 = param1;
         if(param2)
         {
            this.updateSliderPosition();
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function getValue() : Number
      {
         return this.var_902;
      }
      
      public function set min(param1:Number) : void
      {
         this._minValue = param1;
      }
      
      public function set max(param1:Number) : void
      {
         this.var_1133 = param1;
      }
      
      private function updateSliderPosition() : void
      {
         if(this._sliderContainer == null)
         {
            return;
         }
         var _loc1_:IWindow = this._sliderContainer.findChildByName("slider_button");
         if(_loc1_ != null)
         {
            _loc1_.x = this.getSliderPosition(this.var_902);
         }
         _loc1_.parent.invalidate();
      }
      
      private function getSliderPosition(param1:Number) : int
      {
         return int(this.var_1586 * (Number(param1 - this._minValue) / (this.var_1133 - this._minValue)));
      }
      
      private function getValueAtPosition(param1:Number) : Number
      {
         return param1 / this.var_1586 * (this.var_1133 - this._minValue) + this._minValue;
      }
      
      private function sliderProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1.type == WindowMouseEvent.const_45)
         {
            this.var_901 = true;
         }
         if(this.var_901)
         {
            if(param1.type == WindowMouseEvent.const_61 || param1.type == WindowMouseEvent.const_182)
            {
               this.var_901 = false;
            }
         }
         if(!this.var_901 || param1.type != WindowEvent.const_364)
         {
            return;
         }
         if(this.var_592 != 0)
         {
            _loc3_ = this.getValueAtPosition(param2.x);
            _loc4_ = Math.round(_loc3_ / this.var_592) * this.var_592;
            this.setValue(_loc4_,false);
         }
      }
      
      private function sliderButtonRightProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:Number = NaN;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.var_901 = false;
            if(this.var_592 != 0)
            {
               _loc3_ = this.var_902 + this.var_592;
               this.setValue(_loc3_);
            }
         }
      }
      
      private function sliderButtonLeftProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:Number = NaN;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.var_901 = false;
            if(this.var_592 != 0)
            {
               _loc3_ = this.var_902 - this.var_592;
               this.setValue(_loc3_);
            }
         }
      }
      
      private function displaySlider() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this._sliderContainer == null)
         {
            return;
         }
         _loc2_ = this._sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow;
         if(_loc2_ != null && this.var_690 != null)
         {
            _loc2_.bitmap = new BitmapData(this.var_690.width,this.var_690.height,true,16777215);
            _loc2_.bitmap.copyPixels(this.var_690,this.var_690.rect,new Point(0,0),null,null,true);
         }
         _loc1_ = this._sliderContainer.findChildByName("slider_movement_area") as IWindowContainer;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.findChildByName("slider_button") as IBitmapWrapperWindow;
            if(_loc2_ != null && this.var_691 != null)
            {
               _loc2_.bitmap = new BitmapData(this.var_691.width,this.var_691.height,true,16777215);
               _loc2_.bitmap.copyPixels(this.var_691,this.var_691.rect,new Point(0,0),null,null,true);
               _loc2_.procedure = this.sliderProcedure;
               this.var_1586 = _loc1_.width - _loc2_.width;
            }
         }
         _loc4_ = this._sliderContainer.findChildByName("slider_button_left") as IContainerButtonWindow;
         if(_loc4_)
         {
            _loc4_.procedure = this.sliderButtonLeftProcedure;
         }
         _loc3_ = this._sliderContainer.findChildByName("slider_button_right") as IContainerButtonWindow;
         if(_loc3_)
         {
            _loc3_.procedure = this.sliderButtonRightProcedure;
         }
      }
      
      private function storeAssets(param1:IAssetLibrary) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = BitmapDataAsset(param1.getAssetByName("slider_bg_png"));
         this.var_690 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("slider_obj_png"));
         this.var_691 = BitmapData(_loc2_.content);
      }
   }
}
