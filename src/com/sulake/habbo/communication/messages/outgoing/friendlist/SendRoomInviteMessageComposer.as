package com.sulake.habbo.communication.messages.outgoing.friendlist
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class SendRoomInviteMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_937:Array;
      
      private var var_1602:String;
      
      public function SendRoomInviteMessageComposer(param1:String)
      {
         this.var_937 = new Array();
         super();
         this.var_1602 = param1;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(this.var_937.length);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_937.length)
         {
            _loc1_.push(this.var_937[_loc2_]);
            _loc2_++;
         }
         _loc1_.push(this.var_1602);
         return _loc1_;
      }
      
      public function addInvitedFriend(param1:int) : void
      {
         this.var_937.push(param1);
      }
      
      public function dispose() : void
      {
         this.var_937 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
