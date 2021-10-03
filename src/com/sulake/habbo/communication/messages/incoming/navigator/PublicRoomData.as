package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2350:String;
      
      private var var_2036:int;
      
      private var var_2035:int;
      
      private var var_2147:String;
      
      private var var_2619:int;
      
      private var var_1716:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2350 = param1.readString();
         this.var_2036 = param1.readInteger();
         this.var_2035 = param1.readInteger();
         this.var_2147 = param1.readString();
         this.var_2619 = param1.readInteger();
         this.var_1716 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2350;
      }
      
      public function get unitPort() : int
      {
         return this.var_2036;
      }
      
      public function get worldId() : int
      {
         return this.var_2035;
      }
      
      public function get castLibs() : String
      {
         return this.var_2147;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2619;
      }
      
      public function get nodeId() : int
      {
         return this.var_1716;
      }
   }
}
