package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class PetVisualization extends RoomObjectSpriteVisualization implements IPetImageListener
   {
      
      private static const const_928:int = 2;
      
      private static const const_1274:Array = [0,0,0];
       
      
      private var var_560:PetVisualizationData = null;
      
      private var var_459:Map;
      
      private var var_1047:int = 0;
      
      private var var_540:int = 0;
      
      private var var_843:Boolean;
      
      private var _figure:String;
      
      private var var_1046:int = 0;
      
      private var _updateTimes:Array;
      
      private var var_559:BitmapDataAsset;
      
      private var _experienceData:ExperienceData;
      
      private var var_693:Boolean = false;
      
      private var var_1596:Boolean = false;
      
      private const const_1988:int = 3;
      
      private var var_1637:int = -1;
      
      private const const_929:int = 0;
      
      private const const_1698:int = 1;
      
      private const const_1699:int = 2;
      
      private const const_1273:int = 3;
      
      private var var_58:IAvatarImage = null;
      
      private var var_239:String = "";
      
      private var _postureParameter:String = "";
      
      private var _isSleeping:Boolean = false;
      
      private var var_1306:Boolean = false;
      
      private var var_1609:Boolean = false;
      
      private var var_1056:Boolean = false;
      
      private var var_1595:Boolean = false;
      
      private var var_1297:String = "";
      
      private var var_1296:int = 0;
      
      private var var_2079:int = 0;
      
      private var var_1597:Number = NaN;
      
      private var var_1614:int = -1;
      
      private var var_1612:int = -1;
      
      public function PetVisualization()
      {
         super();
         this._updateTimes = new Array();
         this.var_459 = new Map();
         this.var_843 = false;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_693;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(this.var_459 != null)
         {
            _loc1_ = this.var_459.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = this.var_459.getValue(_loc2_) as IAvatarImage;
               _loc3_.dispose();
            }
         }
         this.var_459.dispose();
         if(this._experienceData)
         {
            this._experienceData.dispose();
         }
         this._experienceData = null;
         this.var_560 = null;
         this.var_693 = true;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_560 = param1 as PetVisualizationData;
         createSprites(this.const_1273);
         var _loc2_:BitmapData = (this.var_560.getAvatarRendererAsset("pet_experience_bubble_png") as BitmapDataAsset).content as BitmapData;
         this._experienceData = new ExperienceData(_loc2_.clone());
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_169)
         {
            this._isSleeping = param1.getNumber(RoomObjectVariableEnum.const_396) > 0;
            this.var_1297 = param1.getString(RoomObjectVariableEnum.const_231);
            this.var_239 = param1.getString(RoomObjectVariableEnum.const_374);
            this._postureParameter = param1.getString(RoomObjectVariableEnum.const_696);
            this.var_1597 = param1.getNumber(RoomObjectVariableEnum.const_300);
            this.var_1296 = param1.getNumber(RoomObjectVariableEnum.const_757);
            this.var_2079 = param1.getNumber(RoomObjectVariableEnum.const_779);
            this.validateActions();
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_185);
            if(this._figure != _loc3_)
            {
               this._figure = _loc3_;
               this.resetAvatarImages();
            }
            var_169 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      private function resetAvatarImages() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_459)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_459.reset();
         this.var_58 = null;
      }
      
      private function validateActions() : void
      {
         var _loc1_:int = 0;
         this.var_1595 = false;
         switch(this.var_239)
         {
            case AvatarAction.const_573:
            case AvatarAction.const_1072:
            case AvatarAction.const_1036:
            case AvatarAction.const_1085:
            case AvatarAction.const_1169:
            case AvatarAction.const_1192:
            case AvatarAction.const_648:
            case AvatarAction.const_304:
            case AvatarAction.const_225:
               this.var_1595 = true;
         }
         this.var_1609 = false;
         this.var_1056 = false;
         if(this.var_239 == "lay")
         {
            this.var_1056 = true;
            _loc1_ = int(this._postureParameter);
            if(_loc1_ < 0)
            {
               this.var_1609 = true;
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 || var_453 != param1.getUpdateID() || this.var_1637 != param2.updateId)
         {
            _loc4_ = param1.getDirection().x - param2.direction.x;
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = this.var_1597;
            if(isNaN(this.var_1597))
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
               _loc5_ = (_loc5_ % 360 + 360) % 360;
            }
            if(_loc4_ != this.var_1614 || param3)
            {
               this.var_1614 = _loc4_;
               _loc4_ -= 112.5;
               _loc4_ = (_loc4_ + 360) % 360;
               this.var_58.setDirectionAngle(AvatarSetType.const_35,_loc4_);
            }
            if(_loc5_ != this.var_1612 || param3)
            {
               this.var_1612 = _loc5_;
               _loc5_ -= 112.5;
               _loc5_ = (_loc5_ + 360) % 360;
               this.var_58.setDirectionAngle(AvatarSetType.const_51,_loc5_);
            }
            var_453 = param1.getUpdateID();
            this.var_1637 = param2.updateId;
            return true;
         }
         return false;
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = this.var_459.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = this.var_560.getAvatar(this._figure,param1,this);
            if(_loc3_ != null)
            {
               this.var_459.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1698);
         this.var_559 = null;
         _loc2_ = getSprite(this.const_1698);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 < 48)
         {
            this.var_559 = this.var_58.getAsset("sh_std_sd_1_0_0");
            _loc3_ = -8;
            _loc4_ = -3;
         }
         else
         {
            this.var_559 = this.var_58.getAsset("h_std_sd_1_0_0");
            _loc3_ = -17;
            _loc4_ = -7;
         }
         if(this.var_559)
         {
            _loc2_.asset = this.var_559.content as BitmapData;
            _loc2_.offsetX = _loc3_;
            _loc2_.offsetY = _loc4_;
            _loc2_.alpha = 50;
            _loc2_.relativeDepth = 1;
         }
         else
         {
            _loc2_.asset = null;
         }
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:* = null;
         var _loc4_:IRoomObject = object;
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_560 == null)
         {
            return;
         }
         var _loc5_:IRoomObjectModel = _loc4_.getModel();
         if(this.var_1596)
         {
            this.var_1596 = false;
            this.var_1047 = 0;
            this.var_1046 = 1;
            this.resetAvatarImages();
         }
         var _loc6_:Number = param1.scale;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = this.updateModel(_loc5_,_loc6_);
         if(_loc9_ || _loc6_ != var_188 || this.var_58 == null)
         {
            if(_loc6_ != var_188)
            {
               var_188 = _loc6_;
               _loc7_ = true;
            }
            if(_loc7_ || this.var_58 == null)
            {
               this.var_58 = this.getAvatarImage(_loc6_);
            }
            if(this.var_58 == null)
            {
               return;
            }
            if(_loc7_)
            {
               this.updateShadow(_loc6_);
            }
            _loc8_ = this.updateObject(_loc4_,param1,true);
            this.updateActions(this.var_58);
         }
         else
         {
            _loc8_ = this.updateObject(_loc4_,param1);
         }
         var _loc10_:Boolean = _loc8_ || _loc9_ || _loc7_;
         var _loc11_:Boolean = this.var_843 || this.var_1046 > 0 || this.var_1595;
         this._experienceData.alpha = 0;
         if(this.var_1296 > 0)
         {
            _loc12_ = param2 - this.var_1296;
            if(_loc12_ < AvatarAction.const_975)
            {
               this._experienceData.alpha = int(Math.sin(_loc12_ / 0 * 0) * 255);
               this._experienceData.setExperience(this.var_2079);
               this.var_1046 = this.const_1988;
            }
            else
            {
               this.var_1296 = 0;
            }
            _loc13_ = getSprite(this.const_1699);
            if(_loc13_ != null)
            {
               if(this._experienceData.alpha > 0)
               {
                  _loc13_.asset = this._experienceData.image;
                  _loc13_.offsetX = -20;
                  _loc13_.offsetY = -80;
                  _loc13_.alpha = this._experienceData.alpha;
                  _loc13_.visible = true;
               }
               else
               {
                  _loc13_.asset = null;
                  _loc13_.visible = false;
               }
            }
         }
         if(_loc10_ || _loc11_)
         {
            increaseUpdateId();
            --this.var_1046;
            ++this.var_540;
            --this.var_1047;
            if(!(this.var_1047 <= 0 || _loc7_))
            {
               return;
            }
            this.var_58.updateAnimationByFrames(1);
            this.var_1047 = const_928;
            this.var_843 = this.var_58.isAnimating();
            _loc14_ = this.var_58.getCanvasOffsets();
            if(_loc14_ == null || _loc14_.length < 3)
            {
               _loc14_ = const_1274;
            }
            _loc15_ = 0;
            if(object.getLocation().z > 0)
            {
               _loc15_ = Math.min(_loc6_ / 2.75,0);
            }
            _loc13_ = getSprite(this.const_929);
            if(_loc13_)
            {
               _loc18_ = this.var_58.getImage(AvatarSetType.const_35,false);
               if(_loc18_ != null)
               {
                  _loc13_.asset = _loc18_;
               }
               if(_loc6_ < 48)
               {
                  _loc13_.offsetX = -16 + _loc14_[0];
                  _loc13_.offsetY = -_loc13_.asset.height + 8 + _loc14_[1] + _loc15_;
               }
               else
               {
                  _loc13_.offsetX = -32 + _loc14_[0];
                  _loc13_.offsetY = -_loc13_.asset.height + 16 + _loc14_[1] + _loc15_;
               }
            }
            _loc16_ = this.const_1273;
            for each(_loc17_ in this.var_58.getSprites())
            {
               _loc13_ = getSprite(_loc16_);
               if(_loc13_ != null)
               {
                  _loc19_ = this.var_58.getLayerData(_loc17_);
                  _loc20_ = 0;
                  _loc21_ = _loc17_.getDirectionOffsetX(this.var_58.getDirection());
                  _loc22_ = _loc17_.getDirectionOffsetY(this.var_58.getDirection());
                  _loc23_ = _loc17_.getDirectionOffsetZ(this.var_58.getDirection());
                  _loc24_ = 0;
                  if(_loc17_.hasDirections)
                  {
                     _loc24_ = this.var_58.getDirection();
                  }
                  if(_loc19_ != null)
                  {
                     _loc20_ = _loc19_.animationFrame;
                     _loc21_ += _loc19_.dx;
                     _loc22_ += _loc19_.dy;
                     _loc24_ += _loc19_.directionOffset;
                  }
                  if(_loc6_ < 48)
                  {
                     _loc21_ /= 2;
                     _loc22_ /= 2;
                  }
                  if(_loc24_ < 0)
                  {
                     _loc24_ += 8;
                  }
                  if(_loc24_ > 7)
                  {
                     _loc24_ -= 8;
                  }
                  _loc25_ = this.var_58.getScale() + "_" + _loc17_.member + "_" + _loc24_ + "_" + _loc20_;
                  _loc26_ = this.var_58.getAsset(_loc25_);
                  if(_loc26_ != null)
                  {
                     _loc13_.asset = _loc26_.content as BitmapData;
                     _loc13_.offsetX = -1 * _loc26_.offset.x - _loc6_ / 2 + _loc21_;
                     _loc13_.offsetY = -1 * _loc26_.offset.y + _loc22_;
                     _loc13_.relativeDepth = -0.01 - 0.1 * _loc16_ * _loc23_;
                     if(_loc17_.ink == 33)
                     {
                        _loc13_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc13_.blendMode = BlendMode.NORMAL;
                     }
                     _loc16_++;
                  }
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_380,this.var_239,this._postureParameter);
         if(this.var_1297 != null && this.var_1297 != "")
         {
            param1.appendAction(AvatarAction.const_277,this.var_1297);
         }
         if(this._isSleeping || this.var_1306)
         {
            param1.appendAction(AvatarAction.const_558);
         }
         param1.endActionAppends();
         var _loc2_:int = param1.getSprites().length + this.const_1273;
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function imageReady() : void
      {
         this.var_1596 = true;
      }
      
      public function petImageReady(param1:String) : void
      {
         this.resetAvatarImages();
      }
   }
}
