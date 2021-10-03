package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TraxSongInfoMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _data:String;
      
      private var _length:int;
      
      private var var_2375:String;
      
      public function TraxSongInfoMessageParser()
      {
         super();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get length() : int
      {
         return this._length;
      }
      
      public function get author() : String
      {
         return this.var_2375;
      }
      
      public function flush() : Boolean
      {
         this._id = -1;
         this._name = "";
         this._data = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = param1.readInteger();
         this._name = param1.readString();
         this._data = param1.readString();
         this._length = param1.readInteger();
         this.var_2375 = param1.readString();
         return true;
      }
   }
}
