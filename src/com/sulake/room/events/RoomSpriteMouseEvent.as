package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1638:String = "";
      
      private var var_1894:String = "";
      
      private var var_2394:String = "";
      
      private var var_2396:Number = 0;
      
      private var var_2395:Number = 0;
      
      private var var_2393:Number = 0;
      
      private var var_2392:Number = 0;
      
      private var var_2388:Boolean = false;
      
      private var var_2387:Boolean = false;
      
      private var var_2389:Boolean = false;
      
      private var var_2390:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1638 = param2;
         this.var_1894 = param3;
         this.var_2394 = param4;
         this.var_2396 = param5;
         this.var_2395 = param6;
         this.var_2393 = param7;
         this.var_2392 = param8;
         this.var_2388 = param9;
         this.var_2387 = param10;
         this.var_2389 = param11;
         this.var_2390 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1638;
      }
      
      public function get canvasId() : String
      {
         return this.var_1894;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2394;
      }
      
      public function get screenX() : Number
      {
         return this.var_2396;
      }
      
      public function get screenY() : Number
      {
         return this.var_2395;
      }
      
      public function get localX() : Number
      {
         return this.var_2393;
      }
      
      public function get localY() : Number
      {
         return this.var_2392;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2388;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2387;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2389;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2390;
      }
   }
}
