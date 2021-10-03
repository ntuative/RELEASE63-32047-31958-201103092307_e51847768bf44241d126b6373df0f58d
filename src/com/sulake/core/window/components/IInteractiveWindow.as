package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   
   public interface IInteractiveWindow extends IWindow
   {
       
      
      function set toolTipCaption(param1:String) : void;
      
      function get toolTipCaption() : String;
      
      function set toolTipDelay(param1:uint) : void;
      
      function get toolTipDelay() : uint;
      
      function showToolTip(param1:IToolTipWindow) : void;
      
      function hideToolTip() : void;
   }
}
