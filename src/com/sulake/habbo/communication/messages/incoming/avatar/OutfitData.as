package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1908:int;
      
      private var var_2282:String;
      
      private var var_971:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1908 = param1.readInteger();
         this.var_2282 = param1.readString();
         this.var_971 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1908;
      }
      
      public function get figureString() : String
      {
         return this.var_2282;
      }
      
      public function get gender() : String
      {
         return this.var_971;
      }
   }
}
