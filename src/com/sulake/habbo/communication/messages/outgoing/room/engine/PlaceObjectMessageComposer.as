package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_347:int;
      
      private var var_2173:int;
      
      private var var_2172:String;
      
      private var _x:int = 0;
      
      private var var_145:int = 0;
      
      private var var_249:int = 0;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         this.var_347 = param1;
         this.var_2173 = param2;
         this.var_2172 = param3;
         this._x = param4;
         this.var_145 = param5;
         this.var_249 = param6;
         this._roomId = param7;
         this._roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(this.var_2173)
         {
            case RoomObjectCategoryEnum.const_29:
               return [this.var_347 + " " + this._x + " " + this.var_145 + " " + this.var_249];
            case RoomObjectCategoryEnum.const_26:
               return [this.var_347 + " " + this.var_2172];
            default:
               return [];
         }
      }
   }
}
