package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ViralFurniStatusMessageParser implements IMessageParser
   {
       
      
      private var var_173:String;
      
      private var var_347:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1282:int = 0;
      
      private var var_386:int;
      
      private var _shareId:String;
      
      private var var_2112:String;
      
      public function ViralFurniStatusMessageParser()
      {
         super();
      }
      
      public function get campaignID() : String
      {
         return this.var_173;
      }
      
      public function get objectId() : int
      {
         return this.var_347;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1282;
      }
      
      public function get shareId() : String
      {
         return this._shareId;
      }
      
      public function get status() : int
      {
         return this.var_386;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2112;
      }
      
      public function flush() : Boolean
      {
         this._roomId = 0;
         this._roomCategory = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_173 = param1.readString();
         this.var_347 = param1.readInteger();
         this.var_386 = param1.readInteger();
         this._shareId = param1.readString();
         this.var_2112 = param1.readString();
         this.var_1282 = param1.readInteger();
         return true;
      }
   }
}
