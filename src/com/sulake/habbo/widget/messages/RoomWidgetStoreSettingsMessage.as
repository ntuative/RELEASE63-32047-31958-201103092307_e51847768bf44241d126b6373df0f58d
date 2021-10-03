package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStoreSettingsMessage extends RoomWidgetMessage
   {
      
      public static const const_1500:String = "RWSSM_STORE_SETTINGS";
      
      public static const const_842:String = "RWSSM_STORE_SOUND";
      
      public static const const_908:String = "RWSSM_PREVIEW_SOUND";
       
      
      private var _volume:Number;
      
      public function RoomWidgetStoreSettingsMessage(param1:String)
      {
         super(param1);
      }
      
      public function get volume() : Number
      {
         return this._volume;
      }
      
      public function set volume(param1:Number) : void
      {
         this._volume = param1;
      }
   }
}
