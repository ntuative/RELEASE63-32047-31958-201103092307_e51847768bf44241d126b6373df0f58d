package com.sulake.habbo.widget.events
{
   public class RoomWidgetWelcomeGiftUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_116:String = "rwwgue_welcome_gift_widget_status";
       
      
      private var var_1206:String;
      
      private var var_1463:Boolean;
      
      private var var_2261:Boolean;
      
      private var var_2296:Boolean;
      
      private var _furniId:int;
      
      public function RoomWidgetWelcomeGiftUpdateEvent(param1:Boolean = false, param2:Boolean = false)
      {
         super(const_116,param1,param2);
      }
      
      public function get email() : String
      {
         return this.var_1206;
      }
      
      public function get isVerified() : Boolean
      {
         return this.var_1463;
      }
      
      public function get allowEmailChange() : Boolean
      {
         return this.var_2261;
      }
      
      public function get update() : Boolean
      {
         return this.var_2296;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function set email(param1:String) : void
      {
         this.var_1206 = param1;
      }
      
      public function set isVerified(param1:Boolean) : void
      {
         this.var_1463 = param1;
      }
      
      public function set allowEmailChange(param1:Boolean) : void
      {
         this.var_2261 = param1;
      }
      
      public function set update(param1:Boolean) : void
      {
         this.var_2296 = param1;
      }
      
      public function set furniId(param1:int) : void
      {
         this._furniId = param1;
      }
   }
}
