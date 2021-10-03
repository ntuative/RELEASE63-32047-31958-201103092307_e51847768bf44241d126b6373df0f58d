package com.sulake.habbo.communication.messages.outgoing.quest
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class ActivateQuestMessageComposer implements IMessageComposer
   {
       
      
      private var _data:Array;
      
      public function ActivateQuestMessageComposer(param1:int)
      {
         this._data = [];
         super();
         this._data.push(param1);
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
