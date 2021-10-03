package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1078:int = 1;
      
      public static const const_856:int = 2;
      
      public static const const_753:int = 3;
      
      public static const const_1585:int = 4;
       
      
      private var _index:int;
      
      private var var_2358:String;
      
      private var var_2359:String;
      
      private var var_2361:Boolean;
      
      private var var_2360:String;
      
      private var var_826:String;
      
      private var var_2357:int;
      
      private var var_2060:int;
      
      private var _type:int;
      
      private var var_2157:String;
      
      private var var_890:GuestRoomData;
      
      private var var_891:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2358 = param1.readString();
         this.var_2359 = param1.readString();
         this.var_2361 = param1.readInteger() == 1;
         this.var_2360 = param1.readString();
         this.var_826 = param1.readString();
         this.var_2357 = param1.readInteger();
         this.var_2060 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1078)
         {
            this.var_2157 = param1.readString();
         }
         else if(this._type == const_753)
         {
            this.var_891 = new PublicRoomData(param1);
         }
         else if(this._type == const_856)
         {
            this.var_890 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_890 != null)
         {
            this.var_890.dispose();
            this.var_890 = null;
         }
         if(this.var_891 != null)
         {
            this.var_891.dispose();
            this.var_891 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2358;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2359;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2361;
      }
      
      public function get picText() : String
      {
         return this.var_2360;
      }
      
      public function get picRef() : String
      {
         return this.var_826;
      }
      
      public function get folderId() : int
      {
         return this.var_2357;
      }
      
      public function get tag() : String
      {
         return this.var_2157;
      }
      
      public function get userCount() : int
      {
         return this.var_2060;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_890;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_891;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1078)
         {
            return 0;
         }
         if(this.type == const_856)
         {
            return this.var_890.maxUserCount;
         }
         if(this.type == const_753)
         {
            return this.var_891.maxUsers;
         }
         return 0;
      }
   }
}
