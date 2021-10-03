package com.sulake.habbo.avatar.animation
{
   public class CanvasDataContainer
   {
       
      
      private var _id:String;
      
      private var _width:int;
      
      private var _height:int;
      
      public function CanvasDataContainer(param1:XML)
      {
         super();
         this._id = String(param1.@id);
         this._width = parseInt(param1.@width);
         this._height = parseInt(param1.@height);
      }
   }
}
