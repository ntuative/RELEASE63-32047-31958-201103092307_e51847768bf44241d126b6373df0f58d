package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetUserLocationMessage extends RoomWidgetMessage
   {
      
      public static const const_819:String = "RWGOI_MESSAGE_GET_USER_LOCATION";
       
      
      private var _userId:int;
      
      private var _userType:int;
      
      public function RoomWidgetGetUserLocationMessage(param1:int, param2:int)
      {
         super(const_819);
         this._userId = param1;
         this._userType = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userType() : int
      {
         return this._userType;
      }
   }
}
