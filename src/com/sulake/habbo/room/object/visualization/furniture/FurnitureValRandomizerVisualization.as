package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_969:int = 20;
      
      private static const const_607:int = 10;
      
      private static const const_1329:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
       
      
      private var var_302:Array;
      
      private var var_729:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_302 = new Array();
         super();
         super.method_2(ANIMATION_ID_OFF);
      }
      
      override protected function method_2(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_729)
            {
               this.var_729 = true;
               this.var_302 = new Array();
               this.var_302.push(const_1329);
               this.var_302.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_607)
         {
            if(this.var_729)
            {
               this.var_729 = false;
               this.var_302 = new Array();
               if(_direction == 2)
               {
                  this.var_302.push(const_969 + 5 - param1);
                  this.var_302.push(const_607 + 5 - param1);
               }
               else
               {
                  this.var_302.push(const_969 + param1);
                  this.var_302.push(const_607 + param1);
               }
               this.var_302.push(ANIMATION_ID_OFF);
               return;
            }
            super.method_2(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
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
