package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_372:int;
      
      private var var_708:Boolean;
      
      private var var_900:String;
      
      private var _ownerName:String;
      
      private var var_2058:int;
      
      private var var_2060:int;
      
      private var var_2056:int;
      
      private var var_1606:String;
      
      private var var_2054:int;
      
      private var var_2057:Boolean;
      
      private var var_709:int;
      
      private var var_1292:int;
      
      private var var_2059:String;
      
      private var var_811:Array;
      
      private var var_2061:RoomThumbnailData;
      
      private var var_2055:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_811 = new Array();
         super();
         this.var_372 = param1.readInteger();
         this.var_708 = param1.readBoolean();
         this.var_900 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2058 = param1.readInteger();
         this.var_2060 = param1.readInteger();
         this.var_2056 = param1.readInteger();
         this.var_1606 = param1.readString();
         this.var_2054 = param1.readInteger();
         this.var_2057 = param1.readBoolean();
         this.var_709 = param1.readInteger();
         this.var_1292 = param1.readInteger();
         this.var_2059 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_811.push(_loc4_);
            _loc3_++;
         }
         this.var_2061 = new RoomThumbnailData(param1);
         this.var_2055 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_811 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_372;
      }
      
      public function get event() : Boolean
      {
         return this.var_708;
      }
      
      public function get roomName() : String
      {
         return this.var_900;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2058;
      }
      
      public function get userCount() : int
      {
         return this.var_2060;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2056;
      }
      
      public function get description() : String
      {
         return this.var_1606;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2054;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2057;
      }
      
      public function get score() : int
      {
         return this.var_709;
      }
      
      public function get categoryId() : int
      {
         return this.var_1292;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2059;
      }
      
      public function get tags() : Array
      {
         return this.var_811;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2061;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2055;
      }
   }
}
