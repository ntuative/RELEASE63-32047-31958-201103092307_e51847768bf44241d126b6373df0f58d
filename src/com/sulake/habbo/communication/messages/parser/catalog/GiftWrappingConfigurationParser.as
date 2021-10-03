package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2138:Boolean;
      
      private var var_2139:int;
      
      private var var_1562:Array;
      
      private var var_760:Array;
      
      private var var_759:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2138;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2139;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1562;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_760;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_759;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1562 = [];
         this.var_760 = [];
         this.var_759 = [];
         this.var_2138 = param1.readBoolean();
         this.var_2139 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1562.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_760.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_759.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
