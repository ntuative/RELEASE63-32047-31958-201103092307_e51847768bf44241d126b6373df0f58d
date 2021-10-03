package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class SellablePetBreedData
   {
       
      
      private var _type:int;
      
      private var var_1576:int;
      
      private var var_2608:Boolean;
      
      private var var_2607:Boolean;
      
      public function SellablePetBreedData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1576 = param1.readInteger();
         this.var_2608 = param1.readBoolean();
         this.var_2607 = param1.readBoolean();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get breed() : int
      {
         return this.var_1576;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2608;
      }
      
      public function get rare() : Boolean
      {
         return this.var_2607;
      }
   }
}
