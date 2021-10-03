package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1258:IHabboTracking;
      
      private var var_1666:Boolean = false;
      
      private var var_2193:int = 0;
      
      private var var_1588:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1258 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1258 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1666 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2193 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1666)
         {
            return;
         }
         ++this.var_1588;
         if(this.var_1588 <= this.var_2193)
         {
            this.var_1258.track("toolbar",param1);
         }
      }
   }
}
