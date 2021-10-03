package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1528:int;
      
      private var _name:String;
      
      private var var_1269:int;
      
      private var var_2078:int;
      
      private var var_2079:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var _figure:String;
      
      private var var_2080:int;
      
      private var var_2082:int;
      
      private var var_2083:int;
      
      private var var_2077:int;
      
      private var var_2081:int;
      
      private var _ownerName:String;
      
      private var var_483:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1528;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1269;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2078;
      }
      
      public function get experience() : int
      {
         return this.var_2079;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2080;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2082;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2083;
      }
      
      public function get respect() : int
      {
         return this.var_2077;
      }
      
      public function get ownerId() : int
      {
         return this.var_2081;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_483;
      }
      
      public function flush() : Boolean
      {
         this.var_1528 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1528 = param1.readInteger();
         this._name = param1.readString();
         this.var_1269 = param1.readInteger();
         this.var_2078 = param1.readInteger();
         this.var_2079 = param1.readInteger();
         this.var_2080 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2082 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2083 = param1.readInteger();
         this._figure = param1.readString();
         this.var_2077 = param1.readInteger();
         this.var_2081 = param1.readInteger();
         this.var_483 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
