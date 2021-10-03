package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   import flash.events.Event;
   
   public class RoomObjectRoomAdEvent extends RoomObjectEvent
   {
      
      public static const const_288:String = "RORAE_ROOM_AD_FURNI_CLICK";
      
      public static const const_550:String = "RORAE_ROOM_AD_FURNI_DOUBLE_CLICK";
      
      public static const const_354:String = "RORAE_ROOM_AD_TOOLTIP_SHOW";
      
      public static const const_371:String = "RORAE_ROOM_AD_TOOLTIP_HIDE";
       
      
      private var var_1241:String = "";
      
      public function RoomObjectRoomAdEvent(param1:String, param2:int, param3:String, param4:String = "", param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param2,param3,param5,param6);
         this.var_1241 = param4;
      }
      
      public function get clickUrl() : String
      {
         return this.var_1241;
      }
      
      override public function clone() : Event
      {
         return new RoomObjectRoomAdEvent(type,objectId,objectType,this.clickUrl,bubbles,cancelable);
      }
   }
}
