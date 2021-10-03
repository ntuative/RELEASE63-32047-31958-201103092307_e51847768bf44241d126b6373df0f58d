package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const ANIMATION_ID_ROLL:int = 3;
      
      private static const const_1267:int = 2;
      
      private static const const_1266:int = 1;
      
      private static const ANIMATION_DURATION:int = 15;
       
      
      private var var_302:Array;
      
      private var var_1040:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_302 = new Array();
         super();
      }
      
      override protected function method_2(param1:int) : void
      {
         if(param1 == const_1267)
         {
            this.var_302 = new Array();
            this.var_302.push(const_1266);
            this.var_1040 = ANIMATION_DURATION;
         }
         super.method_2(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(this.var_1040 > 0)
         {
            --this.var_1040;
         }
         if(this.var_1040 == 0)
         {
            if(this.var_302.length > 0)
            {
               super.method_2(this.var_302.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
