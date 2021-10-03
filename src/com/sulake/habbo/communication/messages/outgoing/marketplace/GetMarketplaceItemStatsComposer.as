package com.sulake.habbo.communication.messages.outgoing.marketplace
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class GetMarketplaceItemStatsComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_32:Array;
      
      public function GetMarketplaceItemStatsComposer(param1:int, param2:int)
      {
         this.var_32 = new Array();
         super();
         this.var_32.push(param1);
         this.var_32.push(param2);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_32;
      }
      
      public function dispose() : void
      {
         this.var_32 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
