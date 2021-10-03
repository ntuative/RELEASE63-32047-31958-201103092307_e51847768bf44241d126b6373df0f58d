package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.quest.QuestListMessageParser;
   
   public class QuestListMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function QuestListMessageEvent(param1:Function)
      {
         super(param1,QuestListMessageParser);
      }
      
      public function getParser() : QuestListMessageParser
      {
         return var_10 as QuestListMessageParser;
      }
   }
}
