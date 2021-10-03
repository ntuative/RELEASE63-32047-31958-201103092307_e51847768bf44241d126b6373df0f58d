package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_1134:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         this.var_1134 = new Array();
         this.var_1134.push(param1.length);
         this.var_1134 = this.var_1134.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return this.var_1134;
      }
   }
}
