package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationFrame
   {
      
      public static const const_509:int = -1;
      
      public static const const_1155:int = -1;
       
      
      private var _id:int = 0;
      
      private var _x:int = 0;
      
      private var var_145:int = 0;
      
      private var var_2275:int = 1;
      
      private var var_992:int = 1;
      
      private var var_1957:int = 1;
      
      private var var_2759:int = -1;
      
      private var var_2761:int = 0;
      
      private var var_2760:Boolean = false;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int = -1, param8:int = 0)
      {
         super();
         this._id = param1;
         this._x = param2;
         this.var_145 = param3;
         this.var_2760 = param6;
         if(param4 < 1)
         {
            param4 = 1;
         }
         this.var_2275 = param4;
         if(param5 < 0)
         {
            param5 = const_509;
         }
         this.var_992 = param5;
         this.var_1957 = param5;
         if(param7 >= 0)
         {
            this.var_2759 = param7;
            this.var_2761 = param8;
         }
      }
      
      public function get id() : int
      {
         if(this._id >= 0)
         {
            return this._id;
         }
         return -this._id * Math.random();
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this.var_145;
      }
      
      public function get repeats() : int
      {
         return this.var_2275;
      }
      
      public function get frameRepeats() : int
      {
         return this.var_992;
      }
      
      public function get isLastFrame() : Boolean
      {
         return this.var_2760;
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(this.var_992 < 0)
         {
            return const_509;
         }
         return this.var_1957;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this.var_992 > 0 && param1 > this.var_992)
         {
            param1 = this.var_992;
         }
         this.var_1957 = param1;
      }
      
      public function get activeSequence() : int
      {
         return this.var_2759;
      }
      
      public function get activeSequenceOffset() : int
      {
         return this.var_2761;
      }
   }
}
