package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarSelectedMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_189:Boolean;
      
      public function RoomObjectAvatarSelectedMessage(param1:Boolean)
      {
         super();
         this.var_189 = param1;
      }
      
      public function get selected() : Boolean
      {
         return this.var_189;
      }
   }
}
