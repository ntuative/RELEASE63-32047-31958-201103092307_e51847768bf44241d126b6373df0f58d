package com.sulake.habbo.widget.messages
{
   import com.sulake.core.window.IWindowContainer;
   
   public class RoomWidgetChatInputWidgetMessage extends RoomWidgetMessage
   {
      
      public static const const_1743:String = "RWCIW_MESSAGE_GET_INFO_FOR_CHAT_INPUT";
      
      public static const const_904:String = "RWCIW_MESSAGE_POSITION_WINDOW";
       
      
      private var _window:IWindowContainer;
      
      public function RoomWidgetChatInputWidgetMessage(param1:String, param2:IWindowContainer = null)
      {
         super(param1);
         this._window = param2;
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
   }
}
