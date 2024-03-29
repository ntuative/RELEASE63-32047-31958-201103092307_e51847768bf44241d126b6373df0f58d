package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1834:int = 1;
      
      public static const const_1791:int = 2;
      
      public static const const_1886:int = 3;
      
      public static const const_1740:int = 4;
      
      public static const const_1607:int = 5;
      
      public static const const_1765:int = 6;
      
      public static const const_1398:int = 7;
      
      public static const const_1466:int = 8;
      
      public static const const_1814:int = 9;
      
      public static const const_1645:int = 10;
      
      public static const const_1465:int = 11;
      
      public static const const_1461:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1521:int;
      
      private var var_1260:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1521 = param1.readInteger();
         this.var_1260 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1521;
      }
      
      public function get info() : String
      {
         return this.var_1260;
      }
   }
}
