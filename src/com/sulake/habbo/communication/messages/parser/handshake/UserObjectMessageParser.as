package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _figure:String;
      
      private var var_875:String;
      
      private var var_2708:String;
      
      private var var_1542:String;
      
      private var var_2707:int;
      
      private var var_2710:String;
      
      private var var_2711:int;
      
      private var var_2709:int;
      
      private var var_2184:int;
      
      private var var_1115:int;
      
      private var var_731:int;
      
      private var var_2379:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this._figure = param1.readString();
         this.var_875 = param1.readString();
         this.var_2708 = param1.readString();
         this.var_1542 = param1.readString();
         this.var_2707 = param1.readInteger();
         this.var_2710 = param1.readString();
         this.var_2711 = param1.readInteger();
         this.var_2709 = param1.readInteger();
         this.var_2184 = param1.readInteger();
         this.var_1115 = param1.readInteger();
         this.var_731 = param1.readInteger();
         this.var_2379 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get sex() : String
      {
         return this.var_875;
      }
      
      public function get customData() : String
      {
         return this.var_2708;
      }
      
      public function get realName() : String
      {
         return this.var_1542;
      }
      
      public function get tickets() : int
      {
         return this.var_2707;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2710;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2711;
      }
      
      public function get directMail() : int
      {
         return this.var_2709;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2184;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1115;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_731;
      }
      
      public function get identityId() : int
      {
         return this.var_2379;
      }
   }
}
