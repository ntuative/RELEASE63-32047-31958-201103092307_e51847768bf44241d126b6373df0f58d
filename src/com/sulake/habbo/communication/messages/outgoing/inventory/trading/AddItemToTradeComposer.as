package com.sulake.habbo.communication.messages.outgoing.inventory.trading
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class AddItemToTradeComposer implements IMessageComposer
   {
       
      
      private var var_2073:int;
      
      public function AddItemToTradeComposer(param1:int)
      {
         super();
         this.var_2073 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2073];
      }
   }
}
