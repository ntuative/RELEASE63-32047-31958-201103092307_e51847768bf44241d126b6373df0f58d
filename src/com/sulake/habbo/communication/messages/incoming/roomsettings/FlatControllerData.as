package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatControllerData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_189:Boolean;
      
      public function FlatControllerData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get selected() : Boolean
      {
         return this.var_189;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.var_189 = param1;
      }
   }
}
