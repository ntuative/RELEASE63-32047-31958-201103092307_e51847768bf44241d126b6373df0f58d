package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInventoryMessageParser implements IMessageParser
   {
       
      
      private var var_403:Array;
      
      public function PetInventoryMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_403 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:* = null;
         this.var_403 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new PetData(param1);
            this.var_403.push(_loc4_);
            _loc3_++;
         }
         return true;
      }
      
      public function get pets() : Array
      {
         return this.var_403;
      }
   }
}
