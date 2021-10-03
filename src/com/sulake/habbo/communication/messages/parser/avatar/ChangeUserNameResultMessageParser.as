package com.sulake.habbo.communication.messages.parser.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ChangeUserNameResultMessageParser implements IMessageParser
   {
       
      
      private var var_1578:int = -1;
      
      private var _name:String;
      
      private var var_1288:Array;
      
      public function ChangeUserNameResultMessageParser()
      {
         super();
      }
      
      public function get resultCode() : int
      {
         return this.var_1578;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get nameSuggestions() : Array
      {
         return this.var_1288;
      }
      
      public function flush() : Boolean
      {
         this.var_1578 = -1;
         this._name = "";
         this.var_1288 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1578 = param1.readInteger();
         this._name = param1.readString();
         var _loc2_:int = param1.readInteger();
         this.var_1288 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1288.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
   }
}
