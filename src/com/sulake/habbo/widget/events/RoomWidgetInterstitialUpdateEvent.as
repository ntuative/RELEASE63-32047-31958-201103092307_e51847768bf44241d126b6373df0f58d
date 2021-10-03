package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetInterstitialUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_107:String = "RWIUE_SHOW";
      
      public static const COMPLETE:String = "RWIUE_COMPLETE";
       
      
      private var var_45:BitmapData;
      
      private var var_1241:String;
      
      public function RoomWidgetInterstitialUpdateEvent(param1:String, param2:BitmapData, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this.var_45 = param2;
         this.var_1241 = param3;
      }
      
      public function get image() : BitmapData
      {
         return this.var_45;
      }
      
      public function get clickUrl() : String
      {
         return this.var_1241;
      }
   }
}
