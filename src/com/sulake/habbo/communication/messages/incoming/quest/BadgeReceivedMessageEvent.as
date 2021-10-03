package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.quest.BadgeReceivedMessageParser;
   
   public class BadgeReceivedMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function BadgeReceivedMessageEvent(param1:Function)
      {
         super(param1,BadgeReceivedMessageParser);
      }
      
      public function getParser() : BadgeReceivedMessageParser
      {
         return var_10 as BadgeReceivedMessageParser;
      }
   }
}
