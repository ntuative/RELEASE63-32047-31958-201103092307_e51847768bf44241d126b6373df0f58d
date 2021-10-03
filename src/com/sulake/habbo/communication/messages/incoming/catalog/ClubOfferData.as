package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1566:String;
      
      private var var_1630:int;
      
      private var var_2241:Boolean;
      
      private var var_2240:Boolean;
      
      private var var_2237:int;
      
      private var var_2242:int;
      
      private var var_2236:int;
      
      private var var_2235:int;
      
      private var var_2238:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1566 = param1.readString();
         this.var_1630 = param1.readInteger();
         this.var_2241 = param1.readBoolean();
         this.var_2240 = param1.readBoolean();
         this.var_2237 = param1.readInteger();
         this.var_2242 = param1.readInteger();
         this.var_2236 = param1.readInteger();
         this.var_2235 = param1.readInteger();
         this.var_2238 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1566;
      }
      
      public function get price() : int
      {
         return this.var_1630;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2241;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2240;
      }
      
      public function get periods() : int
      {
         return this.var_2237;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2242;
      }
      
      public function get year() : int
      {
         return this.var_2236;
      }
      
      public function get month() : int
      {
         return this.var_2235;
      }
      
      public function get day() : int
      {
         return this.var_2238;
      }
   }
}
