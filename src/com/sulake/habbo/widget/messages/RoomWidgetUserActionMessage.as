package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_762:String = "RWUAM_WHISPER_USER";
      
      public static const const_889:String = "RWUAM_IGNORE_USER";
      
      public static const const_693:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_440:String = "RWUAM_KICK_USER";
      
      public static const const_864:String = "RWUAM_BAN_USER";
      
      public static const const_805:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_828:String = "RWUAM_RESPECT_USER";
      
      public static const const_630:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_706:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_769:String = "RWUAM_START_TRADING";
      
      public static const const_663:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_474:String = "RWUAM_KICK_BOT";
      
      public static const const_633:String = "RWUAM_REPORT";
      
      public static const const_540:String = "RWUAM_PICKUP_PET";
      
      public static const const_1548:String = "RWUAM_TRAIN_PET";
      
      public static const const_443:String = " RWUAM_RESPECT_PET";
      
      public static const const_377:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_707:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
