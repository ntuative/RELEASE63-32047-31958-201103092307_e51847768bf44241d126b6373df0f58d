package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2220:int = 0;
      
      private var var_1479:String = "";
      
      private var var_1925:String = "";
      
      private var var_2578:String = "";
      
      private var var_2580:String = "";
      
      private var var_1846:int = 0;
      
      private var var_2579:int = 0;
      
      private var var_2581:int = 0;
      
      private var var_1477:int = 0;
      
      private var var_2577:int = 0;
      
      private var var_1478:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2220 = param1;
         this.var_1479 = param2;
         this.var_1925 = param3;
         this.var_2578 = param4;
         this.var_2580 = param5;
         if(param6)
         {
            this.var_1846 = 1;
         }
         else
         {
            this.var_1846 = 0;
         }
         this.var_2579 = param7;
         this.var_2581 = param8;
         this.var_1477 = param9;
         this.var_2577 = param10;
         this.var_1478 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2220,this.var_1479,this.var_1925,this.var_2578,this.var_2580,this.var_1846,this.var_2579,this.var_2581,this.var_1477,this.var_2577,this.var_1478];
      }
   }
}
