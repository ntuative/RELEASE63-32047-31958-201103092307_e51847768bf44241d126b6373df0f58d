package com.sulake.habbo.help.cfh.data
{
   public class CallForHelpData
   {
       
      
      private var var_2706:int;
      
      private var var_1484:int;
      
      private var var_1935:String = "";
      
      public function CallForHelpData()
      {
         super();
      }
      
      public function get topicIndex() : int
      {
         return this.var_2706;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1484;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_1935;
      }
      
      public function set topicIndex(param1:int) : void
      {
         this.var_2706 = param1;
      }
      
      public function set reportedUserId(param1:int) : void
      {
         this.var_1484 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         this.var_1935 = param1;
      }
      
      public function get userSelected() : Boolean
      {
         return this.var_1484 > 0;
      }
      
      public function getTopicKey(param1:int) : String
      {
         return (!!this.userSelected ? "help.cfh.topicwithharasser." : "help.cfh.topic.") + param1;
      }
      
      public function flush() : void
      {
         this.var_1484 = 0;
         this.var_1935 = "";
      }
   }
}
