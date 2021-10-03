package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2163:int;
      
      private var var_2164:int;
      
      private var var_2165:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2163 = param1;
         this.var_2164 = param2;
         this.var_2165 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2163,this.var_2164,this.var_2165];
      }
      
      public function dispose() : void
      {
      }
   }
}
