package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_969:int = 20;
      
      private static const const_607:int = 9;
      
      private static const ANIMATION_ID_ROLL:int = -1;
       
      
      private var var_302:Array;
      
      private var var_729:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_302 = new Array();
         super();
      }
      
      override protected function method_2(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_729)
            {
               this.var_729 = true;
               this.var_302 = new Array();
               this.var_302.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_729)
            {
               this.var_729 = false;
               this.var_302 = new Array();
               this.var_302.push(const_969);
               this.var_302.push(const_607 + param1);
               this.var_302.push(param1);
               return;
            }
            super.method_2(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(0))
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
