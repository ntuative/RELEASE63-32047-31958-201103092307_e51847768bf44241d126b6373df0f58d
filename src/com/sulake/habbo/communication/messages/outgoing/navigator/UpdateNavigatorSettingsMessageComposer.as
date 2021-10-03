package com.sulake.habbo.communication.messages.outgoing.navigator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class UpdateNavigatorSettingsMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_32:Array;
      
      public function UpdateNavigatorSettingsMessageComposer(param1:int)
      {
         this.var_32 = new Array();
         super();
         this.var_32.push(param1);
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
