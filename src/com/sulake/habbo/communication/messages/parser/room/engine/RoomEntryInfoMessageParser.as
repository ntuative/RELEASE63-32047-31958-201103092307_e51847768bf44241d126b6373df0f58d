package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1741:Boolean;
      
      private var var_2383:int;
      
      private var var_435:Boolean;
      
      private var var_1119:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1741;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2383;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1119;
      }
      
      public function get owner() : Boolean
      {
         return this.var_435;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1119 != null)
         {
            this.var_1119.dispose();
            this.var_1119 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1741 = param1.readBoolean();
         if(this.var_1741)
         {
            this.var_2383 = param1.readInteger();
            this.var_435 = param1.readBoolean();
         }
         else
         {
            this.var_1119 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
