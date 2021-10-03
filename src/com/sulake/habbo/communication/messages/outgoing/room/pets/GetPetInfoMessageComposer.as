package com.sulake.habbo.communication.messages.outgoing.room.pets
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GetPetInfoMessageComposer implements IMessageComposer
   {
       
      
      private var var_1528:int;
      
      public function GetPetInfoMessageComposer(param1:int)
      {
         super();
         this.var_1528 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1528];
      }
      
      public function dispose() : void
      {
      }
   }
}
