package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_880:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_986:String = "inventory_effects";
      
      public static const const_1049:String = "inventory_badges";
      
      public static const const_1389:String = "inventory_clothes";
      
      public static const const_1555:String = "inventory_furniture";
       
      
      private var var_2327:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_880);
         this.var_2327 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2327;
      }
   }
}
