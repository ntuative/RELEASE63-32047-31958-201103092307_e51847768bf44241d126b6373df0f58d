package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_898:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_589:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_898);
         this.var_589 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_589;
      }
   }
}
