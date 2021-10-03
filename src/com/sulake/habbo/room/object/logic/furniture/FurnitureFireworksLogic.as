package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectStateChangeEvent;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.events.MouseEvent;
   
   public class FurnitureFireworksLogic extends FurnitureLogic
   {
       
      
      public function FurnitureFireworksLogic()
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
      
      override public function initialize(param1:XML) : void
      {
         var _loc3_:* = null;
         super.initialize(param1);
         if(param1 == null)
         {
            return;
         }
         var _loc2_:XMLList = param1.particlesystems;
         if(_loc2_.length() == 0)
         {
            return;
         }
         if(object != null)
         {
            _loc3_ = object.getModelController();
            if(_loc3_ != null)
            {
               _loc3_.setString(RoomObjectVariableEnum.const_1144,String(_loc2_));
            }
         }
      }
   }
}
