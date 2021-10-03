package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1103:Boolean;
      
      private var var_2613:int;
      
      private var var_2617:String;
      
      private var var_372:int;
      
      private var var_2614:int;
      
      private var var_2502:String;
      
      private var var_2615:String;
      
      private var var_2616:String;
      
      private var var_811:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_811 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1103 = false;
            return;
         }
         this.var_1103 = true;
         this.var_2613 = int(_loc2_);
         this.var_2617 = param1.readString();
         this.var_372 = int(param1.readString());
         this.var_2614 = param1.readInteger();
         this.var_2502 = param1.readString();
         this.var_2615 = param1.readString();
         this.var_2616 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_811.push(_loc5_);
            _loc4_++;
         }
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
      
      public function get ownerAvatarId() : int
      {
         return this.var_2613;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2617;
      }
      
      public function get flatId() : int
      {
         return this.var_372;
      }
      
      public function get eventType() : int
      {
         return this.var_2614;
      }
      
      public function get eventName() : String
      {
         return this.var_2502;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2615;
      }
      
      public function get creationTime() : String
      {
         return this.var_2616;
      }
      
      public function get tags() : Array
      {
         return this.var_811;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1103;
      }
   }
}
