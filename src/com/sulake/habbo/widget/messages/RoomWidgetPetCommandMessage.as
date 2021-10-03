package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPetCommandMessage extends RoomWidgetMessage
   {
      
      public static const const_879:String = "RWPCM_REQUEST_PET_COMMANDS";
      
      public static const const_546:String = "RWPCM_PET_COMMAND";
       
      
      private var var_1528:int = 0;
      
      private var var_171:String;
      
      public function RoomWidgetPetCommandMessage(param1:String, param2:int, param3:String = null)
      {
         super(param1);
         this.var_1528 = param2;
         this.var_171 = param3;
      }
      
      public function get petId() : int
      {
         return this.var_1528;
      }
      
      public function get value() : String
      {
         return this.var_171;
      }
   }
}
