package com.sulake.habbo.widget.furniture.dimmer
{
   public class DimmerFurniWidgetPresetItem
   {
       
      
      private var _id:int = 0;
      
      private var _type:int = 0;
      
      private var _color:uint = 0;
      
      private var var_1745:uint = 0;
      
      public function DimmerFurniWidgetPresetItem(param1:int, param2:int, param3:uint, param4:uint)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._color = param3;
         this.var_1745 = param4;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get light() : uint
      {
         return this.var_1745;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function set color(param1:uint) : void
      {
         this._color = param1;
      }
      
      public function set light(param1:uint) : void
      {
         this.var_1745 = param1;
      }
   }
}
