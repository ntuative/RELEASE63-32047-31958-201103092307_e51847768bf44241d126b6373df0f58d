package com.sulake.habbo.communication.messages.outgoing.marketplace
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class MakeOfferMessageComposer implements IMessageComposer, IDisposable
   {
      
      public static const const_1824:int = 1;
      
      public static const const_1761:int = 2;
       
      
      private var var_32:Array;
      
      public function MakeOfferMessageComposer(param1:int, param2:int, param3:int)
      {
         this.var_32 = new Array();
         super();
         this.var_32.push(param1);
         this.var_32.push(param2);
         this.var_32.push(param3);
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
