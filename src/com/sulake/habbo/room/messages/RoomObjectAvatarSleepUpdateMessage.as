package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarSleepUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var _isSleeping:Boolean;
      
      public function RoomObjectAvatarSleepUpdateMessage(param1:Boolean = false)
      {
         super();
         this._isSleeping = param1;
      }
      
      public function get isSleeping() : Boolean
      {
         return this._isSleeping;
      }
   }
}
