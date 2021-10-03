package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2843:String = "";
      
      public function TabletEventProcessor(param1:IMouseCursor)
      {
         super(param1);
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var_138 = param1.desktop;
         var_73 = param1.var_1234 as WindowController;
         var_168 = param1.var_1238 as WindowController;
         var_165 = param1.renderer;
         var_805 = param1.var_1237;
         param2.begin();
         param2.end();
         param1.desktop = var_138;
         param1.var_1234 = var_73;
         param1.var_1238 = var_168;
         param1.renderer = var_165;
         param1.var_1237 = var_805;
      }
   }
}
