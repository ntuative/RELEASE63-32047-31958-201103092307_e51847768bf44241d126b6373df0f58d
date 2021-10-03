package com.sulake.habbo.messenger.domain
{
   import com.sulake.habbo.messenger.HabboMessenger;
   
   public class ConversationsDeps implements IConversationsDeps
   {
       
      
      private var var_131:HabboMessenger;
      
      public function ConversationsDeps(param1:HabboMessenger)
      {
         super();
         this.var_131 = param1;
      }
      
      public function getTabCount() : int
      {
         return this.var_131.messengerView.getTabCount();
      }
      
      public function getText(param1:String) : String
      {
         return this.var_131.getText(param1);
      }
      
      public function createConversation(param1:int) : Conversation
      {
         return this.var_131.createConversation(param1);
      }
      
      public function refresh(param1:Boolean) : void
      {
         this.var_131.messengerView.refresh();
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         this.var_131.messengerView.addMsgToView(param1,param2);
      }
   }
}
