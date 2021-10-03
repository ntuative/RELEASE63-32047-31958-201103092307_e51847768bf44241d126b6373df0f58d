package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.quest.AvailableQuestCampaignsMessageParser;
   
   public class AvailableQuestCampaignsMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function AvailableQuestCampaignsMessageEvent(param1:Function)
      {
         super(param1,AvailableQuestCampaignsMessageParser);
      }
      
      public function getParser() : AvailableQuestCampaignsMessageParser
      {
         return var_10 as AvailableQuestCampaignsMessageParser;
      }
   }
}
