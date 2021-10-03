package com.sulake.habbo.communication.messages.outgoing.sound
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class GetSoundSettingsComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_32:Array;
      
      public function GetSoundSettingsComposer()
      {
         this.var_32 = new Array();
         super();
      }
      
      public function getMessageArray() : Array
      {
         return this.var_32;
      }
      
      public function dispose() : void
      {
         this.var_32 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
