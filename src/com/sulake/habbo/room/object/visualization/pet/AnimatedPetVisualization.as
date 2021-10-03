package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.visualization.data.AnimationData;
   import com.sulake.habbo.room.object.visualization.data.AnimationFrame;
   import com.sulake.habbo.room.object.visualization.data.AnimationStateData;
   import com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualization;
   import com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualizationData;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   
   public class AnimatedPetVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_609:int = 1;
      
      private static const const_975:int = 1000;
      
      private static const const_1337:String = "pet_experience_bubble_png";
      
      private static const const_1338:int = 0;
      
      private static const const_1339:int = 1;
      
      private static const ANIMATION_INDEX_COUNT:int = 2;
       
      
      private var var_239:String = "";
      
      private var var_1297:String = "";
      
      private var _isSleeping:Boolean = false;
      
      private var var_1597:Number = NaN;
      
      private var _experienceData:ExperienceData;
      
      private var var_1296:int = 0;
      
      private var var_2079:int = 0;
      
      private var var_303:AnimatedPetVisualizationData = null;
      
      private var var_2631:String = "";
      
      private var var_1876:int = -1;
      
      private var var_117:Array;
      
      private var var_1514:Boolean = false;
      
      public function AnimatedPetVisualization()
      {
         this.var_117 = [];
         super();
         while(this.var_117.length < ANIMATION_INDEX_COUNT)
         {
            this.var_117.push(new AnimationStateData());
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         super.dispose();
         if(this.var_117 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_117.length)
            {
               _loc2_ = this.var_117[_loc1_] as AnimationStateData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this.var_117 = null;
         }
         if(this._experienceData)
         {
            this._experienceData.dispose();
            this._experienceData = null;
         }
      }
      
      override protected function getAnimationId(param1:AnimationStateData) : int
      {
         return param1.animationId;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         var _loc3_:* = null;
         if(!(param1 is AnimatedPetVisualizationData))
         {
            return false;
         }
         this.var_303 = param1 as AnimatedPetVisualizationData;
         var _loc2_:* = null;
         if(this.var_303.commonAssets != null)
         {
            _loc3_ = this.var_303.commonAssets.getAssetByName(const_1337) as BitmapDataAsset;
            if(_loc3_ != null)
            {
               _loc2_ = (_loc3_.content as BitmapData).clone();
               this._experienceData = new ExperienceData(_loc2_);
            }
         }
         if(super.initialize(param1))
         {
            return true;
         }
         return false;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         super.update(param1,param2,param3);
         this.updateExperienceBubble(param2);
      }
      
      override protected function updateModel(param1:Number) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
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
         if(_loc3_.getUpdateID() != var_169)
         {
            _loc4_ = _loc3_.getString(RoomObjectVariableEnum.const_374);
            _loc5_ = _loc3_.getString(RoomObjectVariableEnum.const_231);
            this.validateActions(_loc4_,_loc5_);
            this._isSleeping = _loc3_.getNumber(RoomObjectVariableEnum.const_396) > 0;
            this.var_1597 = _loc3_.getNumber(RoomObjectVariableEnum.const_300);
            this.var_1296 = _loc3_.getNumber(RoomObjectVariableEnum.const_757);
            this.var_2079 = _loc3_.getNumber(RoomObjectVariableEnum.const_779);
            _loc6_ = _loc3_.getNumber(RoomObjectVariableEnum.PET_PALETTE_INDEX);
            if(_loc6_ != this.var_1876)
            {
               this.var_1876 = _loc6_;
               this.var_2631 = this.var_1876.toString();
            }
            var_169 = _loc3_.getUpdateID();
            return true;
         }
         return false;
      }
      
      private function updateExperienceBubble(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(this._experienceData != null)
         {
            this._experienceData.alpha = 0;
            if(this.var_1296 > 0)
            {
               _loc2_ = param1 - this.var_1296;
               if(_loc2_ < const_975)
               {
                  this._experienceData.alpha = int(Math.sin(_loc2_ / const_975 * 0) * 255);
                  this._experienceData.setExperience(this.var_2079);
               }
               else
               {
                  this.var_1296 = 0;
               }
               _loc3_ = getSprite(spriteCount - 1);
               if(_loc3_ != null)
               {
                  if(this._experienceData.alpha > 0)
                  {
                     _loc3_.asset = this._experienceData.image;
                     _loc3_.offsetX = -20;
                     _loc3_.offsetY = -80;
                     _loc3_.alpha = this._experienceData.alpha;
                     _loc3_.visible = true;
                  }
                  else
                  {
                     _loc3_.asset = null;
                     _loc3_.visible = false;
                  }
               }
            }
         }
      }
      
      private function validateActions(param1:String, param2:String) : void
      {
         var _loc3_:int = 0;
         if(param1 != this.var_239)
         {
            this.var_239 = param1;
            _loc3_ = this.var_303.getAnimationForPosture(var_188,param1);
            this.setAnimationForIndex(const_1338,_loc3_);
         }
         if(param2 != this.var_1297)
         {
            this.var_1297 = param2;
            _loc3_ = this.var_303.getAnimationForGesture(var_188,param2);
            this.setAnimationForIndex(const_1339,_loc3_);
         }
      }
      
      override protected function getAdditionalSpriteCount() : int
      {
         return super.getAdditionalSpriteCount() + const_609;
      }
      
      override protected function method_2(param1:int) : void
      {
      }
      
      private function getAnimationStateData(param1:int) : AnimationStateData
      {
         var _loc2_:* = null;
         if(param1 >= 0 && param1 < this.var_117.length)
         {
            return this.var_117[param1];
         }
         return null;
      }
      
      private function setAnimationForIndex(param1:int, param2:int) : void
      {
         var _loc3_:AnimationStateData = this.getAnimationStateData(param1);
         if(_loc3_ != null)
         {
            if(setSubAnimation(_loc3_,param2))
            {
               this.var_1514 = false;
            }
         }
      }
      
      override protected function resetAllAnimationFrames() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = this.var_117.length - 1;
         while(_loc1_ >= 0)
         {
            _loc2_ = this.var_117[_loc1_];
            if(_loc2_ != null)
            {
               _loc2_.setLayerCount(layerCount);
            }
            _loc1_--;
         }
      }
      
      override protected function updateAnimations(param1:Number) : Array
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(this.var_1514)
         {
            return null;
         }
         var _loc2_:Boolean = true;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         while(_loc5_ < this.var_117.length)
         {
            _loc6_ = this.var_117[_loc5_];
            if(_loc6_ != null)
            {
               if(!_loc6_.animationOver)
               {
                  _loc7_ = updateFramesForAnimation(_loc6_,param1);
                  if(_loc3_ == null || _loc3_.length == 0)
                  {
                     _loc3_ = _loc7_;
                  }
                  else
                  {
                     if(_loc4_ == null)
                     {
                        _loc4_ = [];
                        _loc9_ = 0;
                        while(_loc9_ < layerCount)
                        {
                           _loc4_.push(false);
                           _loc9_++;
                        }
                        for each(_loc8_ in _loc3_)
                        {
                           _loc4_[_loc8_] = true;
                        }
                        _loc3_ = [];
                     }
                     for each(_loc8_ in _loc7_)
                     {
                        _loc4_[_loc8_] = true;
                     }
                  }
                  if(!_loc6_.animationOver)
                  {
                     _loc2_ = false;
                  }
                  else if(AnimationData.isTransitionFromAnimation(_loc6_.animationId) || AnimationData.isTransitionToAnimation(_loc6_.animationId))
                  {
                     this.setAnimationForIndex(_loc5_,_loc6_.animationAfterTransitionId);
                     _loc2_ = false;
                  }
               }
            }
            _loc5_++;
         }
         if(_loc4_ != null)
         {
            _loc3_ = null;
            _loc10_ = 0;
            while(_loc10_ < layerCount)
            {
               if(_loc4_[_loc10_])
               {
                  if(_loc3_ == null)
                  {
                     _loc3_ = [_loc10_];
                  }
                  else
                  {
                     _loc3_.push(_loc10_);
                  }
               }
               _loc10_++;
            }
         }
         this.var_1514 = _loc2_;
         return _loc3_;
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:int = this.var_117.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = this.var_117[_loc3_];
            if(_loc4_ != null)
            {
               _loc5_ = _loc4_.getFrame(param2);
               if(_loc5_ != null)
               {
                  return _loc5_.id;
               }
            }
            _loc3_--;
         }
         return super.getFrameNumber(param1,param2);
      }
      
      override protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc4_:int = super.getSpriteXOffset(param1,param2,param3);
         var _loc5_:int = this.var_117.length - 1;
         while(_loc5_ >= 0)
         {
            _loc6_ = this.var_117[_loc5_];
            if(_loc6_ != null)
            {
               _loc7_ = _loc6_.getFrame(param3);
               if(_loc7_ != null)
               {
                  _loc4_ += _loc7_.x;
               }
            }
            _loc5_--;
         }
         return _loc4_;
      }
      
      override protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc4_:int = super.getSpriteYOffset(param1,param2,param3);
         var _loc5_:int = this.var_117.length - 1;
         while(_loc5_ >= 0)
         {
            _loc6_ = this.var_117[_loc5_];
            if(_loc6_ != null)
            {
               _loc7_ = _loc6_.getFrame(param3);
               if(_loc7_ != null)
               {
                  _loc4_ += _loc7_.y;
               }
            }
            _loc5_--;
         }
         return _loc4_;
      }
      
      override protected function getAsset(param1:String) : IGraphicAsset
      {
         var _loc2_:* = null;
         if(assetCollection != null)
         {
            _loc2_ = assetCollection.getAssetWithPalette(param1,this.var_2631);
            if(_loc2_ == null)
            {
            }
            return _loc2_;
         }
         return null;
      }
      
      override protected function getSpriteAssetName(param1:int, param2:int) : String
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc3_:int = spriteCount;
         if(param2 < _loc3_ - const_609)
         {
            _loc4_ = getSize(param1);
            if(param2 < _loc3_ - (1 + const_609))
            {
               if(_data == null || param2 >= FurnitureVisualizationData.const_525.length)
               {
                  return null;
               }
               _loc5_ = FurnitureVisualizationData.const_525[param2];
               if(_loc4_ == 1)
               {
                  return _type + "_icon_" + _loc5_;
               }
               return _type + "_" + _loc4_ + "_" + _loc5_ + "_" + _direction + "_" + this.getFrameNumber(_loc4_,param2);
            }
            return _type + "_" + _loc4_ + "_sd_" + _direction + "_0";
         }
         return null;
      }
   }
}
