package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2370:int;
      
      private var var_2373:int;
      
      private var var_2372:String;
      
      private var var_2374:int;
      
      private var var_2371:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2370 = param1;
         this.var_2373 = param2;
         this.var_2372 = param3;
         this.var_2374 = param4;
         this.var_2371 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2370,this.var_2373,this.var_2372,this.var_2374,int(this.var_2371)];
      }
      
      public function dispose() : void
      {
      }
   }
}
