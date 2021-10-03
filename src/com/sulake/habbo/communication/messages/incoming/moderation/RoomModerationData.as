package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_372:int;
      
      private var var_2060:int;
      
      private var var_2289:Boolean;
      
      private var var_2081:int;
      
      private var _ownerName:String;
      
      private var var_111:RoomData;
      
      private var var_708:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_372 = param1.readInteger();
         this.var_2060 = param1.readInteger();
         this.var_2289 = param1.readBoolean();
         this.var_2081 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_111 = new RoomData(param1);
         this.var_708 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_111 != null)
         {
            this.var_111.dispose();
            this.var_111 = null;
         }
         if(this.var_708 != null)
         {
            this.var_708.dispose();
            this.var_708 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_372;
      }
      
      public function get userCount() : int
      {
         return this.var_2060;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2289;
      }
      
      public function get ownerId() : int
      {
         return this.var_2081;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_111;
      }
      
      public function get event() : RoomData
      {
         return this.var_708;
      }
   }
}
