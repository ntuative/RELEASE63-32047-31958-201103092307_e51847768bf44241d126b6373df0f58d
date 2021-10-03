package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.window.utils.IChildEntity;
   import flash.geom.Rectangle;
   
   public interface ISkinLayoutEntity extends IChildEntity
   {
       
      
      function get color() : uint;
      
      function get blend() : uint;
      
      function get region() : Rectangle;
      
      function get scaleH() : uint;
      
      function get scaleV() : uint;
      
      function dispose() : void;
   }
}
