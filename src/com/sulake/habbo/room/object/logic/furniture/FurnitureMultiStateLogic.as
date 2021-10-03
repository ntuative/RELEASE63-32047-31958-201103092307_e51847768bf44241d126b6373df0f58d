package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.utils.IRoomGeometry;
   
   public class FurnitureMultiStateLogic extends FurnitureLogic
   {
       
      
      public function FurnitureMultiStateLogic()
      {
         super();
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         var _loc3_:* = param1.type;
         switch(0)
         {
         }
         super.mouseEvent(param1,param2);
      }
   }
}
