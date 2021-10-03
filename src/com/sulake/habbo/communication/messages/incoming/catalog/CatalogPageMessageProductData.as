package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_85:String = "i";
      
      public static const const_89:String = "s";
      
      public static const const_264:String = "e";
       
      
      private var var_1779:String;
      
      private var var_2448:int;
      
      private var var_1388:String;
      
      private var var_1387:int;
      
      private var var_1781:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1779 = param1.readString();
         this.var_2448 = param1.readInteger();
         this.var_1388 = param1.readString();
         this.var_1387 = param1.readInteger();
         this.var_1781 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1779;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2448;
      }
      
      public function get extraParam() : String
      {
         return this.var_1388;
      }
      
      public function get productCount() : int
      {
         return this.var_1387;
      }
      
      public function get expiration() : int
      {
         return this.var_1781;
      }
   }
}
