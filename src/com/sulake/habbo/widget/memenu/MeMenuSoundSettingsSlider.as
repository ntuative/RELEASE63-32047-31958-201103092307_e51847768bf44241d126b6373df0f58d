package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MeMenuSoundSettingsSlider
   {
       
      
      private var var_1156:MeMenuSoundSettingsView;
      
      private var _sliderContainer:IWindowContainer;
      
      private var var_690:BitmapData;
      
      private var var_691:BitmapData;
      
      private var var_1586:int;
      
      private var _minValue:Number = 0.0;
      
      private var var_1133:Number = 1.0;
      
      public function MeMenuSoundSettingsSlider(param1:MeMenuSoundSettingsView, param2:IWindowContainer, param3:IAssetLibrary, param4:Number = 0.0, param5:Number = 1.0)
      {
         super();
         this.var_1156 = param1;
         this._sliderContainer = param2;
         this._minValue = param4;
         this.var_1133 = param5;
         this.storeAssets(param3);
         this.displaySlider();
      }
      
      public function dispose() : void
      {
         this.var_1156 = null;
         this._sliderContainer = null;
         this.var_690 = null;
         this.var_691 = null;
      }
      
      public function setValue(param1:Number) : void
      {
         if(this._sliderContainer == null)
         {
            return;
         }
         var _loc2_:IWindow = this._sliderContainer.findChildByName("slider_button");
         if(_loc2_ != null)
         {
            _loc2_.x = this.getSliderPosition(param1);
         }
      }
      
      public function set min(param1:Number) : void
      {
         this._minValue = param1;
         this.setValue(this.var_1156.volume);
      }
      
      public function set max(param1:Number) : void
      {
         this.var_1133 = param1;
         this.setValue(this.var_1156.volume);
      }
      
      private function getSliderPosition(param1:Number) : int
      {
         return int(this.var_1586 * (Number(param1 - this._minValue) / (this.var_1133 - this._minValue)));
      }
      
      private function getValue(param1:Number) : Number
      {
         return param1 / this.var_1586 * (this.var_1133 - this._minValue) + this._minValue;
      }
      
      private function buttonProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_364)
         {
            return;
         }
         this.var_1156.saveVolume(this.getValue(param2.x),false);
      }
      
      private function displaySlider() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._sliderContainer == null)
         {
            return;
         }
         _loc3_ = this._sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow;
         if(_loc3_ != null && this.var_690 != null)
         {
            _loc3_.bitmap = new BitmapData(this.var_690.width,this.var_690.height,true,16777215);
            _loc3_.bitmap.copyPixels(this.var_690,this.var_690.rect,new Point(0,0),null,null,true);
         }
         _loc1_ = this._sliderContainer.findChildByName("slider_movement_area") as IWindowContainer;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.findChildByName("slider_button") as IWindowContainer;
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.findChildByName("slider_bitmap") as IBitmapWrapperWindow;
               if(_loc3_ != null && this.var_691 != null)
               {
                  _loc3_.bitmap = new BitmapData(this.var_691.width,this.var_691.height,true,16777215);
                  _loc3_.bitmap.copyPixels(this.var_691,this.var_691.rect,new Point(0,0),null,null,true);
                  _loc2_.procedure = this.buttonProcedure;
                  this.var_1586 = _loc1_.width - _loc3_.width;
               }
            }
         }
      }
      
      private function storeAssets(param1:IAssetLibrary) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_base"));
         this.var_690 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_button"));
         this.var_691 = BitmapData(_loc2_.content);
      }
   }
}
