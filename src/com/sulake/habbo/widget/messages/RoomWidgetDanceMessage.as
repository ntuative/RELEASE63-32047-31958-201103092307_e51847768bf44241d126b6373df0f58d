package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_902:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_999:int = 0;
      
      public static const const_1390:Array = [2,3,4];
       
      
      private var var_84:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_902);
         this.var_84 = param1;
      }
      
      public function get style() : int
      {
         return this.var_84;
      }
   }
}
