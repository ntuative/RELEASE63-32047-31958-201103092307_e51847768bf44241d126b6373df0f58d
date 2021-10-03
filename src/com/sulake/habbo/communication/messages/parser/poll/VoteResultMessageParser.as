package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1097:String;
      
      private var var_1362:Array;
      
      private var var_1042:Array;
      
      private var var_1710:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1097;
      }
      
      public function get choices() : Array
      {
         return this.var_1362.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1042.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1710;
      }
      
      public function flush() : Boolean
      {
         this.var_1097 = "";
         this.var_1362 = [];
         this.var_1042 = [];
         this.var_1710 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1097 = param1.readString();
         this.var_1362 = [];
         this.var_1042 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1362.push(param1.readString());
            this.var_1042.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1710 = param1.readInteger();
         return true;
      }
   }
}
