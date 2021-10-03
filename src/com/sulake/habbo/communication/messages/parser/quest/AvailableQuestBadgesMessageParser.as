package com.sulake.habbo.communication.messages.parser.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.quest.AvailableQuestBadgeData;
   
   public class AvailableQuestBadgesMessageParser implements IMessageParser
   {
       
      
      private var var_266:Array;
      
      public function AvailableQuestBadgesMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_266 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:* = null;
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new AvailableQuestBadgeData(param1);
            this.var_266.push(_loc4_);
            _loc3_++;
         }
         return true;
      }
      
      public function get badges() : Array
      {
         return this.var_266;
      }
   }
}
