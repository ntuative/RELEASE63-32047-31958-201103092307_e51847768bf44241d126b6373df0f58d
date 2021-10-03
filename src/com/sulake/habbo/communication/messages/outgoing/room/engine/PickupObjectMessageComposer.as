package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PickupObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_347:int;
      
      private var var_2173:int;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      public function PickupObjectMessageComposer(param1:int, param2:int, param3:int = 0, param4:int = 0)
      {
         super();
         this.var_347 = param1;
         this.var_2173 = param2;
         this._roomId = param3;
         this._roomCategory = param4;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:int = 0;
         switch(this.var_2173)
         {
            case RoomObjectCategoryEnum.const_29:
               _loc1_ = 2;
               break;
            case RoomObjectCategoryEnum.const_26:
               _loc1_ = 1;
               break;
            default:
               return [];
         }
         return [_loc1_,this.var_347];
      }
   }
}
