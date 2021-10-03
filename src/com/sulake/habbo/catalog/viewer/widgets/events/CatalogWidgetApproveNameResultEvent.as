package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetApproveNameResultEvent extends Event
   {
       
      
      private var _result:int;
      
      public function CatalogWidgetApproveNameResultEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(WidgetEvent.const_641,param2,param3);
         this._result = param1;
      }
      
      public function get result() : int
      {
         return this._result;
      }
   }
}
