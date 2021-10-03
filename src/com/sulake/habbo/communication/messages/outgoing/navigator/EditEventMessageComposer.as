package com.sulake.habbo.communication.messages.outgoing.navigator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class EditEventMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_32:Array;
      
      public function EditEventMessageComposer(param1:int, param2:String, param3:String, param4:Array)
      {
         var _loc5_:* = null;
         this.var_32 = new Array();
         super();
         this.var_32.push(param1);
         this.var_32.push(param2);
         this.var_32.push(param3);
         this.var_32.push(param4.length);
         for each(_loc5_ in param4)
         {
            this.var_32.push(_loc5_);
         }
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
