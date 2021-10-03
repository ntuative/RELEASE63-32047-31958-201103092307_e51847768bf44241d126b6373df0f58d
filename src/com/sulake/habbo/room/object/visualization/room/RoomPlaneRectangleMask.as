package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2067:Number = 0.0;
      
      private var var_2068:Number = 0.0;
      
      private var var_2066:Number = 0.0;
      
      private var var_2069:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2067 = param1;
         this.var_2068 = param2;
         this.var_2066 = param3;
         this.var_2069 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2067;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2068;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2066;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2069;
      }
   }
}
