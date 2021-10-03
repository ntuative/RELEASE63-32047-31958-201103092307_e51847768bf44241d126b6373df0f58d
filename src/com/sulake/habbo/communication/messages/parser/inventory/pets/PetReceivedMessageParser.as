package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1912:Boolean;
      
      private var var_973:PetData;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1912 = param1.readBoolean();
         this.var_973 = new PetData(param1);
         Logger.log("Got PetReceived: " + this.var_1912 + ", " + this.var_973.id + ", " + this.var_973.name + ", " + this.var_973.type + ", " + this.var_973.breed + ", " + this.pet.color);
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return this.var_1912;
      }
      
      public function get pet() : PetData
      {
         return this.var_973;
      }
   }
}
