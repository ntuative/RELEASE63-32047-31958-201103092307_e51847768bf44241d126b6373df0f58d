package com.sulake.habbo.communication.messages.parser.inventory.trading
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TradingOpenParser implements IMessageParser
   {
       
      
      private var _userID:int;
      
      private var var_1697:Boolean;
      
      private var var_1698:int;
      
      private var _otherUserCanTrade:Boolean;
      
      public function TradingOpenParser()
      {
         super();
      }
      
      public function get userID() : int
      {
         return this._userID;
      }
      
      public function get userCanTrade() : Boolean
      {
         return this.var_1697;
      }
      
      public function get otherUserID() : int
      {
         return this.var_1698;
      }
      
      public function get otherUserCanTrade() : Boolean
      {
         return this._otherUserCanTrade;
      }
      
      public function flush() : Boolean
      {
         this._userID = -1;
         this.var_1697 = false;
         this.var_1698 = -1;
         this._otherUserCanTrade = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._userID = param1.readInteger();
         this.var_1697 = param1.readInteger() == 1;
         this.var_1698 = param1.readInteger();
         this._otherUserCanTrade = param1.readInteger() == 1;
         return true;
      }
   }
}
