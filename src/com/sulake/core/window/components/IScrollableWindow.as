package com.sulake.core.window.components
{
   import com.sulake.core.runtime.IDisposable;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   
   public interface IScrollableWindow extends IDisposable, IEventDispatcher
   {
       
      
      function get scrollH() : Number;
      
      function get scrollV() : Number;
      
      function set scrollH(param1:Number) : void;
      
      function set scrollV(param1:Number) : void;
      
      function get scrollStepH() : Number;
      
      function get scrollStepV() : Number;
      
      function set scrollStepH(param1:Number) : void;
      
      function set scrollStepV(param1:Number) : void;
      
      function get maxScrollH() : int;
      
      function get maxScrollV() : int;
      
      function get visibleRegion() : Rectangle;
      
      function get scrollableRegion() : Rectangle;
   }
}
