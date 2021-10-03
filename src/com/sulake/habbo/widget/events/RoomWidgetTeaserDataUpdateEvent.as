package com.sulake.habbo.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_574:String = "RWTDUE_TEASER_DATA";
      
      public static const const_725:String = "RWTDUE_GIFT_DATA";
      
      public static const const_686:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_347:int;
      
      private var _data:String;
      
      private var var_386:int;
      
      private var var_173:String;
      
      private var var_2112:String;
      
      private var var_2113:Boolean;
      
      private var var_1282:int = 0;
      
      private var var_2205:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_347;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_386;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2112;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2113;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2205;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1282;
      }
      
      public function set status(param1:int) : void
      {
         this.var_386 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2112 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2113 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2205 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_347 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_173;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_173 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1282 = param1;
      }
   }
}
