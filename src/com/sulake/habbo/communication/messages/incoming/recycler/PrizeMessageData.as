package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_2297:String;
      
      private var var_1829:int;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2297 = param1.readString();
         this.var_1829 = param1.readInteger();
      }
      
      public function get productItemType() : String
      {
         return this.var_2297;
      }
      
      public function get productItemTypeId() : int
      {
         return this.var_1829;
      }
   }
}
