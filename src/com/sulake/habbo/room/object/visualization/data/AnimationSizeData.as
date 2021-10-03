package com.sulake.habbo.room.object.visualization.data
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.utils.XMLValidator;
   
   public class AnimationSizeData extends SizeData
   {
       
      
      private var var_283:Map = null;
      
      public function AnimationSizeData(param1:int, param2:int)
      {
         super(param1,param2);
         this.var_283 = new Map();
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         super.dispose();
         if(this.var_283 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_283.length)
            {
               _loc2_ = this.var_283.getWithIndex(_loc1_) as AnimationData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this.var_283.dispose();
            this.var_283 = null;
         }
      }
      
      public function defineAnimations(param1:XML) : Boolean
      {
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         if(param1 == null)
         {
            return true;
         }
         var _loc2_:* = ["id"];
         var _loc3_:* = null;
         var _loc4_:XMLList = param1.animation;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length())
         {
            _loc6_ = _loc4_[_loc5_];
            if(!XMLValidator.checkRequiredAttributes(_loc6_,_loc2_))
            {
               return false;
            }
            _loc7_ = int(_loc6_.@id);
            _loc3_ = _loc6_.@transitionTo;
            if(_loc3_.length() == 1)
            {
               _loc9_ = int(_loc3_);
               _loc7_ = AnimationData.getTransitionToAnimationId(_loc9_);
            }
            _loc3_ = _loc6_.@transitionFrom;
            if(_loc3_.length() == 1)
            {
               _loc10_ = int(_loc3_);
               _loc7_ = AnimationData.getTransitionFromAnimationId(_loc10_);
            }
            _loc8_ = this.createAnimationData();
            if(!_loc8_.initialize(_loc6_))
            {
               _loc8_.dispose();
               return false;
            }
            _loc3_ = _loc6_.@immediateChangeFrom;
            if(_loc3_.length() == 1)
            {
               _loc11_ = String(_loc3_).split(",");
               _loc12_ = [];
               for each(_loc13_ in _loc11_)
               {
                  _loc14_ = int(_loc13_);
                  if(_loc12_.indexOf(_loc14_) < 0)
                  {
                     _loc12_.push(_loc14_);
                  }
               }
               _loc8_.setImmediateChanges(_loc12_);
            }
            this.var_283.add(_loc7_,_loc8_);
            _loc5_++;
         }
         return true;
      }
      
      protected function createAnimationData() : AnimationData
      {
         return new AnimationData();
      }
      
      public function hasAnimation(param1:int) : Boolean
      {
         if(this.var_283.getValue(param1) != null)
         {
            return true;
         }
         return false;
      }
      
      public function isImmediateChange(param1:int, param2:int) : Boolean
      {
         var _loc3_:AnimationData = this.var_283.getValue(param1) as AnimationData;
         if(_loc3_ != null)
         {
            _loc3_.isImmediateChange(param2);
         }
         return false;
      }
      
      public function getStartFrame(param1:int, param2:int) : int
      {
         var _loc3_:AnimationData = this.var_283.getValue(param1) as AnimationData;
         if(_loc3_ != null)
         {
            return _loc3_.getStartFrame(param2);
         }
         return 0;
      }
      
      public function getFrame(param1:int, param2:int, param3:int, param4:int) : AnimationFrame
      {
         var _loc6_:* = null;
         var _loc5_:AnimationData = this.var_283.getValue(param1) as AnimationData;
         if(_loc5_ != null)
         {
            return _loc5_.getFrame(param2,param3,param4);
         }
         return null;
      }
      
      public function getFrameFromSequence(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : AnimationFrame
      {
         var _loc8_:* = null;
         var _loc7_:AnimationData = this.var_283.getValue(param1) as AnimationData;
         if(_loc7_ != null)
         {
            return _loc7_.getFrameFromSequence(param2,param3,param4,param5,param6);
         }
         return null;
      }
   }
}
