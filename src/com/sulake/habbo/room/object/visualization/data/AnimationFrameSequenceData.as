package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationFrameSequenceData
   {
       
      
      private var _frames:Array;
      
      private var var_424:Array;
      
      private var var_992:Array;
      
      private var var_1692:Boolean = false;
      
      private var _loopCount:int = 1;
      
      public function AnimationFrameSequenceData(param1:int, param2:Boolean)
      {
         this._frames = [];
         this.var_424 = [];
         this.var_992 = [];
         super();
         if(param1 < 1)
         {
            param1 = 1;
         }
         this._loopCount = param1;
         this.var_1692 = param2;
      }
      
      public function get isRandom() : Boolean
      {
         return this.var_1692;
      }
      
      public function get frameCount() : int
      {
         return this.var_424.length * this._loopCount;
      }
      
      public function dispose() : void
      {
         this._frames = [];
      }
      
      public function initialize() : void
      {
         var _loc1_:int = 1;
         var _loc2_:int = -1;
         var _loc3_:int = this.var_424.length - 1;
         while(_loc3_ >= 0)
         {
            if(this.var_424[_loc3_] == _loc2_)
            {
               _loc1_++;
            }
            else
            {
               _loc2_ = this.var_424[_loc3_];
               _loc1_ = 1;
            }
            this.var_992[_loc3_] = _loc1_;
            _loc3_--;
         }
      }
      
      public function addFrame(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:* = null;
         var _loc7_:int = 1;
         if(this._frames.length > 0)
         {
            _loc6_ = this._frames[this._frames.length - 1];
            if(_loc6_.id == param1 && _loc6_.x == param2 && _loc6_.y == param3 && _loc6_.randomX == param4 && param4 == 0 && _loc6_.randomY == param5 && param5 == 0)
            {
               _loc7_ += _loc6_.repeats;
               this._frames.pop();
            }
         }
         var _loc8_:AnimationFrameData = new AnimationFrameData(param1,param2,param3,param4,param5,_loc7_);
         this._frames.push(_loc8_);
         this.var_424.push(this._frames.length - 1);
         this.var_992.push(1);
      }
      
      public function getFrame(param1:int) : AnimationFrameData
      {
         if(this._frames.length == 0 || param1 < 0 || param1 >= this.frameCount)
         {
            return null;
         }
         if(this.var_1692)
         {
            param1 = Math.random() * this.var_424.length;
            if(param1 == this.var_424.length)
            {
               param1--;
            }
         }
         param1 = this.var_424[param1 % this.var_424.length];
         return this._frames[param1] as AnimationFrameData;
      }
      
      public function getRepeats(param1:int) : int
      {
         if(param1 < 0 || param1 >= this.frameCount)
         {
            return 0;
         }
         return this.var_992[param1 % this.var_992.length];
      }
   }
}
