package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_835:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_282:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_835);
         this.var_282 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_282;
      }
   }
}
