package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_699:String = "RWFUAM_ROTATE";
      
      public static const const_218:String = "RWFAM_MOVE";
      
      public static const const_724:String = "RWFAM_PICKUP";
      
      public static const const_763:String = "RWFAM_OPEN_WELCOME_GIFT";
       
      
      private var _furniId:int = 0;
      
      private var var_2116:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         this._furniId = param2;
         this.var_2116 = param3;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniCategory() : int
      {
         return this.var_2116;
      }
   }
}
