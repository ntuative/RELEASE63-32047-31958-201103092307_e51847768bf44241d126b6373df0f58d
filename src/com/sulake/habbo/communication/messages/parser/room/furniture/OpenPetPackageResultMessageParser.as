package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_347:int = 0;
      
      private var var_1772:int = 0;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_347;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1772;
      }
      
      public function flush() : Boolean
      {
         this.var_347 = 0;
         this.var_1772 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_347 = param1.readInteger();
         this.var_1772 = param1.readInteger();
         return true;
      }
   }
}
