package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_347:int;
      
      private var var_2279:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_347 = param1;
         this.var_2279 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_347,this.var_2279];
      }
      
      public function dispose() : void
      {
      }
   }
}
