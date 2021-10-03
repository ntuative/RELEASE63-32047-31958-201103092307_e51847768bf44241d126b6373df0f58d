package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_711:String = "";
      
      public static const const_447:int = 0;
      
      public static const const_543:int = 255;
      
      public static const const_830:Boolean = false;
      
      public static const const_518:int = 0;
      
      public static const const_578:int = 0;
      
      public static const const_532:int = 0;
      
      public static const const_1096:int = 1;
      
      public static const const_1112:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2157:String = "";
      
      private var var_1693:int = 0;
      
      private var var_2153:int = 255;
      
      private var var_2669:Boolean = false;
      
      private var var_2672:int = 0;
      
      private var var_2671:int = 0;
      
      private var var_2670:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2157 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2157;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1693 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1693;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2153 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2153;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2669 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2669;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2672 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2672;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2671 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2671;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2670 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2670;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
