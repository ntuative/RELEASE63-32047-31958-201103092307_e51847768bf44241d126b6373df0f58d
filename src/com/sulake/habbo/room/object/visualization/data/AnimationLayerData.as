package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationLayerData
   {
       
      
      private var var_217:Array;
      
      private var var_408:int = -1;
      
      private var _loopCount:int = 1;
      
      private var var_1691:int = 1;
      
      private var var_1692:Boolean = false;
      
      public function AnimationLayerData(param1:int, param2:int, param3:Boolean)
      {
         this.var_217 = [];
         super();
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param2 < 1)
         {
            param2 = 1;
         }
         this._loopCount = param1;
         this.var_1691 = param2;
         this.var_1692 = param3;
      }
      
      public function get frameCount() : int
      {
         if(this.var_408 < 0)
         {
            this.calculateLength();
         }
         return this.var_408;
      }
      
      public function dispose() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.var_217.length)
         {
            _loc2_ = this.var_217[_loc1_] as AnimationFrameSequenceData;
            if(_loc2_ != null)
            {
               _loc2_.dispose();
            }
            _loc1_++;
         }
         this.var_217 = [];
      }
      
      public function addFrameSequence(param1:int, param2:Boolean) : AnimationFrameSequenceData
      {
         var _loc3_:AnimationFrameSequenceData = new AnimationFrameSequenceData(param1,param2);
         this.var_217.push(_loc3_);
         return _loc3_;
      }
      
      public function calculateLength() : void
      {
         var _loc2_:* = null;
         this.var_408 = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.var_217.length)
         {
            _loc2_ = this.var_217[_loc1_] as AnimationFrameSequenceData;
            if(_loc2_ != null)
            {
               this.var_408 += _loc2_.frameCount;
            }
            _loc1_++;
         }
      }
      
      public function getFrame(param1:int) : AnimationFrame
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this.var_408 < 1)
         {
            return null;
         }
         var _loc2_:* = null;
         param1 /= this.var_1691;
         var _loc3_:Boolean = false;
         if(!this.var_1692)
         {
            _loc4_ = param1 / this.var_408;
            param1 %= this.var_408;
            if(this._loopCount > 0 && _loc4_ >= this._loopCount || this._loopCount <= 0 && this.var_408 == 1)
            {
               param1 = this.var_408 - 1;
               _loc3_ = true;
            }
            _loc5_ = 0;
            _loc6_ = 0;
            _loc6_ = 0;
            while(_loc6_ < this.var_217.length)
            {
               _loc2_ = this.var_217[_loc6_] as AnimationFrameSequenceData;
               if(_loc2_ != null)
               {
                  if(param1 < _loc5_ + _loc2_.frameCount)
                  {
                     break;
                  }
                  _loc5_ += _loc2_.frameCount;
               }
               _loc6_++;
            }
            return this.getFrameFromSpecificSequence(param1 - _loc5_,_loc2_,_loc3_,_loc6_);
         }
         _loc7_ = this.var_217.length * Math.random();
         _loc2_ = this.var_217[_loc7_] as AnimationFrameSequenceData;
         if(_loc2_.frameCount < 1)
         {
            return null;
         }
         param1 = 0;
         return this.getFrameFromSpecificSequence(param1,_loc2_,false,_loc7_);
      }
      
      public function getFrameFromSequence(param1:int, param2:int, param3:int) : AnimationFrame
      {
         if(param1 < 0 || param1 >= this.var_217.length)
         {
            return null;
         }
         var _loc4_:AnimationFrameSequenceData = this.var_217[param1] as AnimationFrameSequenceData;
         if(_loc4_ != null)
         {
            if(param2 >= _loc4_.frameCount)
            {
               return this.getFrame(param3);
            }
            return this.getFrameFromSpecificSequence(param2,_loc4_,false,param1);
         }
         return null;
      }
      
      private function getFrameFromSpecificSequence(param1:int, param2:AnimationFrameSequenceData, param3:Boolean, param4:int) : AnimationFrame
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Boolean = false;
         var _loc11_:* = null;
         if(param2 != null)
         {
            _loc5_ = param2.getFrame(param1);
            if(_loc5_ == null)
            {
               return null;
            }
            _loc6_ = _loc5_.x;
            _loc7_ = _loc5_.y;
            if(_loc5_.randomX != 0)
            {
               _loc6_ += _loc5_.randomX * Math.random();
            }
            if(_loc5_.randomY != 0)
            {
               _loc7_ += _loc5_.randomY * Math.random();
            }
            _loc8_ = _loc5_.repeats;
            if(_loc8_ > 1)
            {
               _loc8_ = param2.getRepeats(param1);
            }
            _loc9_ = this.var_1691 * _loc8_;
            if(param3)
            {
               _loc9_ = 0;
            }
            _loc10_ = false;
            if(!this.var_1692 && !param2.isRandom)
            {
               if(param4 == this.var_217.length - 1 && param1 == param2.frameCount - 1)
               {
                  _loc10_ = true;
               }
            }
            return new AnimationFrame(_loc5_.id,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,param4,param1);
         }
         return null;
      }
   }
}
