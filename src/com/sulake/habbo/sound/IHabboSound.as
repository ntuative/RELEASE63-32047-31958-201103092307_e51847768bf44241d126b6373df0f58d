package com.sulake.habbo.sound
{
   public interface IHabboSound
   {
       
      
      function play() : Boolean;
      
      function stop() : Boolean;
      
      function set volume(param1:Number) : void;
      
      function set position(param1:Number) : void;
      
      function get volume() : Number;
      
      function get position() : Number;
      
      function get length() : Number;
      
      function get ready() : Boolean;
      
      function get finished() : Boolean;
   }
}
