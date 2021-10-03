package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1874:int;
      
      private var var_2629:int;
      
      private var var_1185:int;
      
      private var var_524:Number;
      
      private var var_2627:Boolean;
      
      private var var_2628:int;
      
      private var var_1875:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2629 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2628 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2627 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_1185;
         if(this.var_1185 == 1)
         {
            this.var_524 = param1;
            this.var_1874 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_1185);
            this.var_524 = this.var_524 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2627 && param3 - this.var_1874 >= this.var_2629 && this.var_1875 < this.var_2628)
         {
            _loc5_ = 1000 / this.var_524;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1875;
            this.var_1874 = param3;
            this.var_1185 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
