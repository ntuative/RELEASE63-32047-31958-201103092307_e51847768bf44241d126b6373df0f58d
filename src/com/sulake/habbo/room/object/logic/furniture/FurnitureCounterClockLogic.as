package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectStateChangeEvent;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.events.MouseEvent;
   
   public class FurnitureCounterClockLogic extends FurnitureLogic
   {
       
      
      public function FurnitureCounterClockLogic()
      {
         super();
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc6_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         var _loc3_:int = object.getId();
         var _loc4_:String = object.getType();
         switch(param1.type)
         {
            case MouseEvent.DOUBLE_CLICK:
               switch(param1.spriteTag)
               {
                  case "start_stop":
                     _loc6_ = new RoomObjectStateChangeEvent(RoomObjectStateChangeEvent.ROOM_OBJECT_STATE_CHANGE,_loc3_,_loc4_,1);
                     break;
                  case "reset":
                     _loc6_ = new RoomObjectStateChangeEvent(RoomObjectStateChangeEvent.ROOM_OBJECT_STATE_CHANGE,_loc3_,_loc4_,2);
               }
         }
         if(eventDispatcher != null && _loc6_ != null)
         {
            eventDispatcher.dispatchEvent(_loc6_);
         }
         else
         {
            super.mouseEvent(param1,param2);
         }
      }
   }
}
