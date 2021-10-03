package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2491:Number;
      
      private var var_1828:Number;
      
      private var var_910:Number;
      
      private var var_911:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2491 = param1;
         this.var_1828 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_910 = param1;
         this.var_911 = 0;
      }
      
      public function update() : void
      {
         this.var_910 += this.var_1828;
         this.var_911 += this.var_910;
         if(this.var_911 > 0)
         {
            this.var_911 = 0;
            this.var_910 = this.var_2491 * -1 * this.var_910;
         }
      }
      
      public function get location() : Number
      {
         return this.var_911;
      }
   }
}
