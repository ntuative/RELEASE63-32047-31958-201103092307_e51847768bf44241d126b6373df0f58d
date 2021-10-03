package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1528:int;
      
      private var var_2279:String;
      
      private var var_1269:int;
      
      private var var_1164:int;
      
      private var var_1576:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1528 = param1.readInteger();
         this.var_2279 = param1.readString();
         this.var_1269 = param1.readInteger();
         this.var_1164 = param1.readInteger();
         this.var_1576 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1528;
      }
      
      public function get petName() : String
      {
         return this.var_2279;
      }
      
      public function get level() : int
      {
         return this.var_1269;
      }
      
      public function get petType() : int
      {
         return this.var_1164;
      }
      
      public function get breed() : int
      {
         return this.var_1576;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
