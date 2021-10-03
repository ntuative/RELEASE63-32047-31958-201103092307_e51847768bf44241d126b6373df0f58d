package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.visualization.data.ColorData;
   import com.sulake.habbo.room.object.visualization.data.LayerData;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class FurnitureVisualization extends RoomObjectSpriteVisualization
   {
      
      protected static const const_1679:Number = Math.sqrt(0.5);
       
      
      protected var _direction:int;
      
      protected var var_2770:Number = NaN;
      
      protected var var_2771:int = -1;
      
      protected var _alphaMultiplier:Number = 1.0;
      
      protected var var_1241:String = null;
      
      protected var _data:FurnitureVisualizationData = null;
      
      protected var _type:String = "";
      
      private var var_837:Array;
      
      private var var_838:Array;
      
      private var var_2160:Number = 0.0;
      
      private var var_2162:int = -1;
      
      private var var_2161:int = -1;
      
      private var var_679:Array;
      
      private var var_684:Array;
      
      private var var_680:Array;
      
      private var var_682:Array;
      
      private var var_685:Array;
      
      private var var_686:Array;
      
      private var var_683:Array;
      
      private var var_681:Array;
      
      private var var_1574:Boolean = true;
      
      private var var_542:int = 0;
      
      private var var_1573:int = -1;
      
      public function FurnitureVisualization()
      {
         this.var_837 = [];
         this.var_838 = [];
         this.var_679 = [];
         this.var_684 = [];
         this.var_680 = [];
         this.var_682 = [];
         this.var_685 = [];
         this.var_686 = [];
         this.var_683 = [];
         this.var_681 = [];
         super();
         this.reset();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this._data = null;
         this.var_837 = null;
         this.var_838 = null;
         this.var_679 = null;
         this.var_684 = null;
         this.var_680 = null;
         this.var_682 = null;
         this.var_685 = null;
         this.var_686 = null;
         this.var_683 = null;
         this.var_681 = null;
      }
      
      override protected function reset() : void
      {
         super.reset();
         this._direction = -1;
         this._data = null;
         this.var_837 = [];
         this.var_838 = [];
         this.var_679 = [];
         this.var_684 = [];
         this.var_680 = [];
         this.var_682 = [];
         this.var_685 = [];
         this.var_686 = [];
         this.var_683 = [];
         this.var_681 = [];
         this.createSprites(0);
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.reset();
         if(param1 == null || !(param1 is FurnitureVisualizationData))
         {
            return false;
         }
         this._data = param1 as FurnitureVisualizationData;
         this._type = this._data.getType();
         return true;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc4_:Boolean = false;
         var _loc5_:Number = param1.scale;
         if(this.updateObject(_loc5_,param1.direction.x))
         {
            _loc4_ = true;
         }
         if(this.updateModel(_loc5_))
         {
            _loc4_ = true;
         }
         var _loc6_:Array = this.updateAnimation(_loc5_);
         if(_loc4_ || _loc6_ != null && _loc6_.length > 0)
         {
            this.updateSprites(_loc5_,_loc4_,_loc6_);
            var_188 = _loc5_;
            increaseUpdateId();
         }
      }
      
      protected function updateSprites(param1:int, param2:Boolean, param3:Array) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this.var_542 != spriteCount)
         {
            createSprites(this.var_542);
         }
         var _loc4_:Boolean = false;
         if(this.var_1241 != null)
         {
            _loc4_ = true;
         }
         if(param2)
         {
            _loc5_ = spriteCount - 1;
            while(_loc5_ >= 0)
            {
               this.updateSprite(param1,_loc5_,_loc4_);
               _loc5_--;
            }
         }
         else
         {
            for each(_loc6_ in param3)
            {
               this.updateSprite(param1,_loc6_,_loc4_);
            }
         }
         this.var_1574 = false;
      }
      
      private function updateSprite(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = NaN;
         var _loc8_:int = 0;
         var _loc4_:String = this.getSpriteAssetName(param1,param2);
         var _loc5_:IRoomObjectSprite = getSprite(param2);
         if(_loc5_ != null && _loc4_ != null)
         {
            _loc6_ = this.getAsset(_loc4_);
            if(_loc6_ != null && _loc6_.asset != null)
            {
               _loc5_.visible = true;
               _loc5_.asset = _loc6_.asset.content as BitmapData;
               _loc5_.flipH = _loc6_.flipH;
               _loc5_.flipV = _loc6_.flipV;
               _loc7_ = 0;
               if(param2 != this.var_1573)
               {
                  _loc5_.tag = this.getSpriteTag(param1,this._direction,param2);
                  _loc5_.alpha = this.getSpriteAlpha(param1,this._direction,param2);
                  _loc5_.color = this.getSpriteColor(param1,param2,this.var_2771);
                  _loc5_.offsetX = _loc6_.offsetX + this.getSpriteXOffset(param1,this._direction,param2);
                  _loc5_.offsetY = _loc6_.offsetY + this.getSpriteYOffset(param1,this._direction,param2);
                  _loc5_.capturesMouse = this.getSpriteMouseCapture(param1,this._direction,param2);
                  _loc5_.blendMode = this.getBlendMode(this.getSpriteInk(param1,this._direction,param2));
                  _loc7_ = Number(this.getSpriteZOffset(param1,this._direction,param2));
                  _loc7_ -= param2 * 0.001;
               }
               else
               {
                  _loc5_.offsetX = _loc6_.offsetX;
                  _loc5_.offsetY = _loc6_.offsetY;
                  _loc8_ = 48;
                  _loc8_ *= this._alphaMultiplier;
                  _loc5_.alpha = _loc8_;
                  _loc5_.capturesMouse = false;
                  _loc7_ = 1;
               }
               _loc7_ *= const_1679;
               _loc5_.relativeDepth = _loc7_;
               _loc5_.assetName = _loc6_.assetName;
               _loc5_.clickHandling = param3;
            }
            else
            {
               this.resetSprite(_loc5_);
            }
         }
         else if(_loc5_ != null)
         {
            this.resetSprite(_loc5_);
         }
      }
      
      private function resetSprite(param1:IRoomObjectSprite) : void
      {
         param1.asset = null;
         param1.assetName = "";
         param1.tag = "";
         param1.flipH = false;
         param1.flipV = false;
         param1.offsetX = 0;
         param1.offsetY = 0;
         param1.relativeDepth = 0;
         param1.clickHandling = false;
      }
      
      protected function getBlendMode(param1:int) : String
      {
         var _loc2_:String = "null";
         switch(param1)
         {
            case LayerData.const_1096:
               _loc2_ = "null";
               break;
            case LayerData.INK_DARKEN:
               _loc2_ = "null";
               break;
            case LayerData.const_1112:
               _loc2_ = "null";
         }
         return _loc2_;
      }
      
      protected function updateObject(param1:Number, param2:Number) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return false;
         }
         if(var_453 != _loc3_.getUpdateID() || param1 != var_188 || param2 != this.var_2770)
         {
            _loc4_ = _loc3_.getDirection().x - (param2 + 135);
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            if(this._data != null)
            {
               _loc5_ = this._data.getDirectionValue(param1,_loc4_);
               this._direction = _loc5_;
            }
            var_453 = _loc3_.getUpdateID();
            this.var_2770 = param2;
            this.updateAssetAndSpriteCache(param1,this._direction);
            return true;
         }
         return false;
      }
      
      protected function updateModel(param1:Number) : Boolean
      {
         var _loc4_:* = NaN;
         var _loc2_:IRoomObject = object;
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:IRoomObjectModel = _loc2_.getModel();
         if(_loc3_ == null)
         {
            return false;
         }
         if(var_169 != _loc3_.getUpdateID())
         {
            this.var_2771 = _loc3_.getNumber(RoomObjectVariableEnum.const_265);
            _loc4_ = Number(_loc3_.getNumber(RoomObjectVariableEnum.const_301));
            if(isNaN(_loc4_))
            {
               _loc4_ = 1;
            }
            if(_loc4_ != this._alphaMultiplier)
            {
               this._alphaMultiplier = _loc4_;
               this.var_1574 = true;
            }
            this.var_1241 = _loc3_.getString(RoomObjectVariableEnum.const_404);
            if(this.var_1241 == null || this.var_1241.indexOf("http") != 0)
            {
               this.var_1241 = null;
            }
            var_169 = _loc3_.getUpdateID();
            return true;
         }
         return false;
      }
      
      protected function updateAnimation(param1:Number) : Array
      {
         return null;
      }
      
      private function updateAssetAndSpriteCache(param1:Number, param2:int) : void
      {
         if(this.var_2161 != param2 || this.var_2160 != param1)
         {
            this.var_837 = [];
            this.var_838 = [];
            this.var_679 = [];
            this.var_684 = [];
            this.var_680 = [];
            this.var_682 = [];
            this.var_685 = [];
            this.var_686 = [];
            this.var_683 = [];
            this.var_681 = [];
            this.var_2161 = param2;
            this.var_2160 = param1;
            this.var_2162 = this.getSize(param1);
            this.var_542 = this._data.getLayerCount(param1) + this.getAdditionalSpriteCount();
            this.var_1573 = this.var_542 - this.getAdditionalSpriteCount();
         }
      }
      
      protected function getAdditionalSpriteCount() : int
      {
         return 1;
      }
      
      protected function getFrameNumber(param1:int, param2:int) : int
      {
         return 0;
      }
      
      protected function getAsset(param1:String) : IGraphicAsset
      {
         var _loc2_:* = null;
         if(assetCollection != null)
         {
            return assetCollection.getAsset(param1);
         }
         return null;
      }
      
      protected function getSpriteAssetName(param1:int, param2:int) : String
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(this._data == null || param2 >= FurnitureVisualizationData.const_525.length)
         {
            return "";
         }
         var _loc3_:String = this.var_837[param2];
         var _loc4_:Boolean = this.var_838[param2];
         if(_loc3_ == null || _loc3_.length == 0)
         {
            _loc5_ = this.var_2162;
            _loc3_ = this._type;
            _loc6_ = "";
            if(param2 != this.var_1573)
            {
               _loc6_ = FurnitureVisualizationData.const_525[param2];
            }
            else
            {
               _loc6_ = "sd";
            }
            if(_loc5_ == 1)
            {
               _loc3_ += "_icon_" + _loc6_;
               _loc4_ = false;
            }
            else
            {
               _loc3_ += "_" + _loc5_ + "_" + _loc6_ + "_" + this._direction;
               _loc4_ = true;
            }
            this.var_837[param2] = _loc3_;
            this.var_838[param2] = _loc4_;
         }
         if(_loc4_)
         {
            _loc7_ = this.getFrameNumber(param1,param2);
            _loc3_ += "_" + _loc7_;
         }
         return _loc3_;
      }
      
      protected function getSpriteTag(param1:int, param2:int, param3:int) : String
      {
         if(this.var_679[param3] != null)
         {
            return this.var_679[param3];
         }
         if(this._data == null)
         {
            return "";
         }
         var _loc4_:String = this._data.getTag(param1,param2,param3);
         this.var_679[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteAlpha(param1:int, param2:int, param3:int) : int
      {
         if(this.var_684[param3] != null && !this.var_1574)
         {
            return this.var_684[param3];
         }
         if(this._data == null)
         {
            return LayerData.const_543;
         }
         var _loc4_:int = this._data.getAlpha(param1,param2,param3);
         _loc4_ *= this._alphaMultiplier;
         this.var_684[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteColor(param1:int, param2:int, param3:int) : int
      {
         if(this.var_680[param2] != null)
         {
            return this.var_680[param2];
         }
         if(this._data == null)
         {
            return ColorData.const_80;
         }
         var _loc4_:int = this._data.getColor(param1,param2,param3);
         this.var_680[param2] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         if(this.var_682[param3] != null)
         {
            return this.var_682[param3];
         }
         if(this._data == null)
         {
            return LayerData.const_518;
         }
         var _loc4_:int = this._data.getXOffset(param1,param2,param3);
         this.var_682[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         if(this.var_685[param3] != null)
         {
            return this.var_685[param3];
         }
         if(this._data == null)
         {
            return LayerData.const_578;
         }
         var _loc4_:int = this._data.getYOffset(param1,param2,param3);
         this.var_685[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteMouseCapture(param1:int, param2:int, param3:int) : Boolean
      {
         if(this.var_683[param3] != null)
         {
            return this.var_683[param3];
         }
         if(this._data == null)
         {
            return true;
         }
         var _loc4_:* = !this._data.getIgnoreMouse(param1,param2,param3);
         this.var_683[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteInk(param1:int, param2:int, param3:int) : int
      {
         if(this.var_681[param3] != null)
         {
            return this.var_681[param3];
         }
         if(this._data == null)
         {
            return LayerData.const_447;
         }
         var _loc4_:int = this._data.getInk(param1,param2,param3);
         this.var_681[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteZOffset(param1:int, param2:int, param3:int) : Number
      {
         if(this.var_686[param3] != null)
         {
            return this.var_686[param3];
         }
         if(this._data == null)
         {
            return LayerData.const_532;
         }
         var _loc4_:Number = this._data.getZOffset(param1,param2,param3);
         this.var_686[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSize(param1:int) : int
      {
         if(this._data != null)
         {
            return this._data.getSize(param1);
         }
         return param1;
      }
   }
}
