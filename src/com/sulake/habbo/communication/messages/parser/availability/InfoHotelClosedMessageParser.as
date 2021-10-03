package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class InfoHotelClosedMessageParser implements IMessageParser
   {
       
      
      private var _openHour:int;
      
      private var var_1651:int;
      
      private var var_1943:Boolean;
      
      public function InfoHotelClosedMessageParser()
      {
         super();
      }
      
      public function get openHour() : int
      {
         return this._openHour;
      }
      
      public function get openMinute() : int
      {
         return this.var_1651;
      }
      
      public function get userThrownOutAtClose() : Boolean
      {
         return this.var_1943;
      }
      
      public function flush() : Boolean
      {
         this._openHour = 0;
         this.var_1651 = 0;
         this.var_1943 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._openHour = param1.readInteger();
         this.var_1651 = param1.readInteger();
         this.var_1943 = param1.readInteger() > 0;
         return true;
      }
   }
}
