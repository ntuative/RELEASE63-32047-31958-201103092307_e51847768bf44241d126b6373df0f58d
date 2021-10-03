package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGiveBadgeMessage extends RoomWidgetMessage
   {
      
      public static const GIVE_BADGE:String = "RWUAM_GIVE_BADGE";
       
      
      private var _userId:int = 0;
      
      private var var_282:int = 0;
      
      public function RoomWidgetGiveBadgeMessage(param1:int, param2:int)
      {
         super(GIVE_BADGE);
         this._userId = param1;
         this.var_282 = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get badgeId() : int
      {
         return this.var_282;
      }
   }
}
