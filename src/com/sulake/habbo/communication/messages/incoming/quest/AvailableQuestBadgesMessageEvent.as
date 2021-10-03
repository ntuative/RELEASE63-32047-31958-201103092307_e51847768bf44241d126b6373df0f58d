package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.quest.AvailableQuestBadgesMessageParser;
   
   public class AvailableQuestBadgesMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function AvailableQuestBadgesMessageEvent(param1:Function)
      {
         super(param1,AvailableQuestBadgesMessageParser);
      }
      
      public function getParser() : AvailableQuestBadgesMessageParser
      {
         return var_10 as AvailableQuestBadgesMessageParser;
      }
   }
}
