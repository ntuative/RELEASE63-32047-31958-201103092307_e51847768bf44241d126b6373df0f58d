package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.quest.ExpiredQuestCampaignsMessageParser;
   
   public class ExpiredQuestCampaignsMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function ExpiredQuestCampaignsMessageEvent(param1:Function)
      {
         super(param1,ExpiredQuestCampaignsMessageParser);
      }
      
      public function getParser() : ExpiredQuestCampaignsMessageParser
      {
         return var_10 as ExpiredQuestCampaignsMessageParser;
      }
   }
}
