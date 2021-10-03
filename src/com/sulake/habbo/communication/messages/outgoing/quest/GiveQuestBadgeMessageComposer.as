package com.sulake.habbo.communication.messages.outgoing.quest
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GiveQuestBadgeMessageComposer implements IMessageComposer
   {
       
      
      private var _data:Array;
      
      public function GiveQuestBadgeMessageComposer(param1:int, param2:int)
      {
         this._data = [];
         super();
         this._data.push(param1);
         this._data.push(param2);
      }
      
      public function getMessageArray() : Array
      {
         return this._data;
      }
      
      public function dispose() : void
      {
         this._data = null;
      }
   }
}
