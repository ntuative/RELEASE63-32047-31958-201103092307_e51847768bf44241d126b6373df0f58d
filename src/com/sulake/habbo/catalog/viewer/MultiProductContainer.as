package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.room.IRoomEngine;
   
   public class MultiProductContainer extends SingleProductContainer implements IProductContainer
   {
       
      
      public function MultiProductContainer(param1:Offer, param2:Array)
      {
         super(param1,param2);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function initProductIcon(param1:IRoomEngine) : void
      {
         super.initProductIcon(param1);
         var _loc2_:IWindow = var_17.findChildByName("multiContainer");
         if(_loc2_)
         {
            _loc2_.visible = true;
         }
         var _loc3_:ITextWindow = var_17.findChildByName("multiCounter") as ITextWindow;
         if(_loc3_)
         {
            _loc3_.text = "xundefined";
         }
      }
   }
}
