package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
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
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_927:String = "avatar";
      
      private static const const_594:Number = -0.01;
      
      private static const const_593:Number = -0.409;
      
      private static const const_928:int = 2;
      
      private static const const_1274:Array = [0,0,0];
      
      private static const const_1275:int = 3;
       
      
      private var var_560:AvatarVisualizationData = null;
      
      private var var_459:Map;
      
      private var var_460:Map;
      
      private var var_1047:int = 0;
      
      private var var_843:Boolean;
      
      private var _figure:String;
      
      private var var_971:String;
      
      private var var_1046:int = 0;
      
      private var var_559:BitmapDataAsset;
      
      private var var_850:BitmapDataAsset;
      
      private var var_1597:int = -1;
      
      private var var_1614:int = -1;
      
      private var var_1612:int = -1;
      
      private const const_929:int = 0;
      
      private const const_1698:int = 1;
      
      private const const_1699:int = 2;
      
      private const const_1700:int = 3;
      
      private const const_1273:int = 4;
      
      private var var_1637:int = -1;
      
      private var var_239:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_1613:Boolean = false;
      
      private var var_1611:Boolean = false;
      
      private var _isSleeping:Boolean = false;
      
      private var var_1306:Boolean = false;
      
      private var var_589:Boolean = false;
      
      private var var_1297:int = 0;
      
      private var var_1304:int = 0;
      
      private var var_2204:int = 0;
      
      private var var_701:int = 0;
      
      private var var_700:int = 0;
      
      private var var_561:int = 0;
      
      private var var_1305:int = 0;
      
      private var var_1056:Boolean = false;
      
      private var var_1609:Boolean = false;
      
      private var var_1054:int = 0;
      
      private var var_699:int = 0;
      
      private var var_1610:Boolean = false;
      
      private var var_1055:int = 0;
      
      private var var_58:IAvatarImage = null;
      
      private var var_693:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_459 = new Map();
         this.var_460 = new Map();
         this.var_843 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_459 != null)
         {
            this.resetImages();
            this.var_459.dispose();
            this.var_460.dispose();
            this.var_459 = null;
         }
         this.var_560 = null;
         this.var_559 = null;
         this.var_850 = null;
         super.dispose();
         this.var_693 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_693;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_560 = param1 as AvatarVisualizationData;
         createSprites(this.const_1273);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_169)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_252) > 0 && param3);
            if(_loc5_ != this.var_1613)
            {
               this.var_1613 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_390) > 0;
            if(_loc5_ != this.var_1611)
            {
               this.var_1611 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_396) > 0;
            if(_loc5_ != this._isSleeping)
            {
               this._isSleeping = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_716) > 0 && param3);
            if(_loc5_ != this.var_1306)
            {
               this.var_1306 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_1097) > 0;
            if(_loc5_ != this.var_589)
            {
               this.var_589 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_231);
            if(_loc6_ != this.var_1297)
            {
               this.var_1297 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_374);
            if(_loc7_ != this.var_239)
            {
               this.var_239 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_696);
            if(_loc7_ != this._postureParameter)
            {
               this._postureParameter = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_1069);
            if(_loc6_ != this.var_1304)
            {
               this.var_1304 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_579);
            if(_loc6_ != this.var_701)
            {
               this.var_701 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_493);
            if(_loc6_ != this.var_700)
            {
               this.var_700 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_348);
            if(_loc6_ != this.var_561)
            {
               this.var_561 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_300);
            if(_loc6_ != this.var_1597)
            {
               this.var_1597 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_700 > 0 && param1.getNumber(RoomObjectVariableEnum.const_348) > 0)
            {
               if(this.var_561 != this.var_700)
               {
                  this.var_561 = this.var_700;
                  _loc4_ = true;
               }
            }
            else if(this.var_561 != 0)
            {
               this.var_561 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_743);
            if(_loc6_ != this.var_1054)
            {
               this.var_1054 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_1166);
            if(_loc7_ != this.var_971)
            {
               this.var_971 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_185);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            var_169 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this._figure != param1)
         {
            this._figure = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_459)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_460)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_459.reset();
         this.var_460.reset();
         this.var_58 = null;
         _loc2_ = getSprite(this.const_929);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1306 = false;
         }
         if(this.var_239 == "sit" || this.var_239 == "lay")
         {
            this.var_1305 = param1 / 2;
         }
         else
         {
            this.var_1305 = 0;
         }
         this.var_1609 = false;
         this.var_1056 = false;
         if(this.var_239 == "lay")
         {
            this.var_1056 = true;
            _loc2_ = int(this._postureParameter);
            if(_loc2_ < 0)
            {
               this.var_1609 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_459.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_460.getValue(_loc4_) as IAvatarImage;
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_560.getAvatar(this._figure,param1,this.var_971,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_459.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_460.length >= const_1275)
                  {
                     this.var_460.remove(this.var_460.getKeys().shift());
                  }
                  this.var_460.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_453 != param1.getUpdateID() || this.var_1637 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1597;
            if(this.var_239 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1614 || param4)
            {
               _loc5_ = true;
               this.var_1614 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_58.setDirectionAngle(AvatarSetType.const_35,_loc6_);
            }
            if(_loc7_ != this.var_1612 || param4)
            {
               _loc5_ = true;
               this.var_1612 = _loc7_;
               if(this.var_1612 != this.var_1614)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_58.setDirectionAngle(AvatarSetType.const_51,_loc7_);
               }
            }
            var_453 = param1.getUpdateID();
            this.var_1637 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1698);
         this.var_559 = null;
         if(this.var_239 == "mv" || this.var_239 == "std")
         {
            _loc2_.visible = true;
            if(this.var_559 == null || param1 != var_188)
            {
               _loc3_ = 0;
               _loc4_ = 0;
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
               if(this.var_559 != null)
               {
                  _loc2_.asset = this.var_559.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_559 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_850 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1699);
         if(this.var_589)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_850 = this.var_560.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_850 = this.var_560.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_239 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_239 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_850 != null)
            {
               _loc2_.asset = this.var_850.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_1700);
         if(this.var_1054 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_560.getAvatarRendererAsset("number_" + this.var_1054 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_560.getAvatarRendererAsset("number_" + this.var_1054 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_239 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_239 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_699 = 1;
               this.var_1610 = true;
               this.var_1055 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_699 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1700);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_1610)
         {
            ++this.var_1055;
            if(this.var_1055 < 10)
            {
               return false;
            }
            if(this.var_699 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1055 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_699 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_699 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_699 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_699 = 0;
               this.var_1610 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:* = null;
         var _loc31_:* = null;
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
         var _loc6_:Number = param1.scale;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:int = this.var_701;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = this.updateModel(_loc5_,_loc6_,param3);
         if(this.animateNumberBubble(_loc6_))
         {
            increaseUpdateId();
         }
         if(_loc12_ || _loc6_ != var_188 || this.var_58 == null)
         {
            if(_loc6_ != var_188)
            {
               _loc8_ = true;
               this.validateActions(_loc6_);
            }
            if(_loc10_ != this.var_701)
            {
               _loc11_ = true;
            }
            if(_loc8_ || this.var_58 == null || _loc11_)
            {
               this.var_58 = this.getAvatarImage(_loc6_,this.var_701);
               if(this.var_58 == null)
               {
                  return;
               }
               _loc7_ = true;
               _loc15_ = getSprite(this.const_929);
               if(_loc15_ && this.var_58 && this.var_58.isPlaceholder())
               {
                  _loc15_.alpha = 150;
               }
               else if(_loc15_)
               {
                  _loc15_.alpha = 255;
               }
            }
            if(this.var_58 == null)
            {
               return;
            }
            this.updateShadow(_loc6_);
            if(_loc8_)
            {
               this.updateTypingBubble(_loc6_);
               this.updateNumberBubble(_loc6_);
            }
            _loc9_ = this.updateObject(_loc4_,param1,param3,true);
            this.updateActions(this.var_58);
            var_188 = _loc6_;
         }
         else
         {
            _loc9_ = this.updateObject(_loc4_,param1,param3);
         }
         var _loc13_:Boolean = _loc9_ || _loc12_ || _loc8_;
         var _loc14_:Boolean = (this.var_843 || this.var_1046 > 0) && param3;
         if(_loc13_)
         {
            this.var_1046 = const_928;
         }
         if(_loc13_ || _loc14_)
         {
            increaseUpdateId();
            --this.var_1046;
            --this.var_1047;
            if(!(this.var_1047 <= 0 || _loc8_ || _loc12_ || _loc7_))
            {
               return;
            }
            this.var_58.updateAnimationByFrames(1);
            this.var_1047 = const_928;
            _loc17_ = this.var_58.getCanvasOffsets();
            if(_loc17_ == null || _loc17_.length < 3)
            {
               _loc17_ = const_1274;
            }
            _loc16_ = getSprite(this.const_929);
            if(_loc16_ != null)
            {
               _loc20_ = this.var_58.getImage(AvatarSetType.const_35,false);
               if(_loc20_ != null)
               {
                  _loc16_.asset = _loc20_;
               }
               if(_loc16_.asset)
               {
                  _loc16_.offsetX = -1 * _loc6_ / 2 + _loc17_[0];
                  _loc16_.offsetY = -_loc16_.asset.height + _loc6_ / 4 + _loc17_[1] + this.var_1305;
               }
               if(this.var_1056)
               {
                  if(this.var_1609)
                  {
                     _loc16_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc16_.relativeDepth = const_593 + _loc17_[2];
                  }
               }
               else
               {
                  _loc16_.relativeDepth = const_594 + _loc17_[2];
               }
            }
            _loc16_ = getSprite(this.const_1699);
            if(_loc16_ != null && _loc16_.visible)
            {
               if(!this.var_1056)
               {
                  _loc16_.relativeDepth = const_594 - 0.01 + _loc17_[2];
               }
               else
               {
                  _loc16_.relativeDepth = const_593 - 0.01 + _loc17_[2];
               }
            }
            this.var_843 = this.var_58.isAnimating();
            _loc18_ = this.const_1273;
            for each(_loc19_ in this.var_58.getSprites())
            {
               if(_loc19_.id == const_927)
               {
                  _loc16_ = getSprite(this.const_929);
                  _loc21_ = this.var_58.getLayerData(_loc19_);
                  _loc22_ = _loc19_.getDirectionOffsetX(this.var_58.getDirection());
                  _loc23_ = _loc19_.getDirectionOffsetY(this.var_58.getDirection());
                  if(_loc21_ != null)
                  {
                     _loc22_ += _loc21_.dx;
                     _loc23_ += _loc21_.dy;
                  }
                  if(_loc6_ < 48)
                  {
                     _loc22_ /= 2;
                     _loc23_ /= 2;
                  }
                  _loc16_.offsetX += _loc22_;
                  _loc16_.offsetY += _loc23_;
               }
               else
               {
                  _loc16_ = getSprite(_loc18_);
                  if(_loc16_ != null)
                  {
                     _loc16_.capturesMouse = false;
                     _loc16_.visible = true;
                     _loc24_ = this.var_58.getLayerData(_loc19_);
                     _loc25_ = 0;
                     _loc26_ = _loc19_.getDirectionOffsetX(this.var_58.getDirection());
                     _loc27_ = _loc19_.getDirectionOffsetY(this.var_58.getDirection());
                     _loc28_ = _loc19_.getDirectionOffsetZ(this.var_58.getDirection());
                     _loc29_ = 0;
                     if(_loc19_.hasDirections)
                     {
                        _loc29_ = this.var_58.getDirection();
                     }
                     if(_loc24_ != null)
                     {
                        _loc25_ = _loc24_.animationFrame;
                        _loc26_ += _loc24_.dx;
                        _loc27_ += _loc24_.dy;
                        _loc29_ += _loc24_.directionOffset;
                     }
                     if(_loc6_ < 48)
                     {
                        _loc26_ /= 2;
                        _loc27_ /= 2;
                     }
                     if(_loc29_ < 0)
                     {
                        _loc29_ += 8;
                     }
                     else if(_loc29_ > 7)
                     {
                        _loc29_ -= 8;
                     }
                     _loc30_ = this.var_58.getScale() + "_" + _loc19_.member + "_" + _loc29_ + "_" + _loc25_;
                     _loc31_ = this.var_58.getAsset(_loc30_);
                     if(_loc31_ == null)
                     {
                        continue;
                     }
                     _loc16_.asset = _loc31_.content as BitmapData;
                     _loc16_.offsetX = -_loc31_.offset.x - _loc6_ / 2 + _loc26_;
                     _loc16_.offsetY = -_loc31_.offset.y + _loc27_ + this.var_1305;
                     if(this.var_1056)
                     {
                        _loc16_.relativeDepth = const_593 - 0.001 * spriteCount * _loc28_;
                     }
                     else
                     {
                        _loc16_.relativeDepth = const_594 - 0.001 * spriteCount * _loc28_;
                     }
                     if(_loc19_.ink == 33)
                     {
                        _loc16_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc16_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc18_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_380,this.var_239,this._postureParameter);
         if(this.var_1297 > 0)
         {
            param1.appendAction(AvatarAction.const_277,AvatarAction.const_1672[this.var_1297]);
         }
         if(this.var_1304 > 0)
         {
            param1.appendAction(AvatarAction.const_799,this.var_1304);
         }
         if(this.var_2204 > 0)
         {
            param1.appendAction(AvatarAction.const_667,this.var_2204);
         }
         if(this.var_700 > 0)
         {
            param1.appendAction(AvatarAction.const_618,this.var_700);
         }
         if(this.var_561 > 0)
         {
            param1.appendAction(AvatarAction.const_832,this.var_561);
         }
         if(this.var_1613)
         {
            param1.appendAction(AvatarAction.const_304);
         }
         if(this._isSleeping || this.var_1306)
         {
            param1.appendAction(AvatarAction.const_558);
         }
         if(this.var_1611)
         {
            param1.appendAction(AvatarAction.const_225);
         }
         if(this.var_701 > 0)
         {
            param1.appendAction(AvatarAction.const_282,this.var_701);
         }
         param1.endActionAppends();
         this.var_843 = param1.isAnimating();
         var _loc2_:int = this.const_1273;
         for each(_loc3_ in this.var_58.getSprites())
         {
            if(_loc3_.id != const_927)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
