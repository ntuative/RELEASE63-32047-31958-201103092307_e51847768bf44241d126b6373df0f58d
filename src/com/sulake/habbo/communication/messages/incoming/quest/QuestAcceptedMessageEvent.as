package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.quest.QuestAcceptedMessageParser;
   
   public class QuestAcceptedMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function QuestAcceptedMessageEvent(param1:Function)
      {
         super(param1,QuestAcceptedMessageParser);
      }
      
      public function getParser() : QuestAcceptedMessageParser
      {
         return var_10 as QuestAcceptedMessageParser;
      }
   }
}
