package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionWelcomeGiftEvent extends RoomSessionEvent
   {
      
      public static const const_116:String = "rswge_welcome_gift_status";
       
      
      private var var_1206:String;
      
      private var var_1463:Boolean;
      
      private var var_2261:Boolean;
      
      private var _furniId:int;
      
      public function RoomSessionWelcomeGiftEvent(param1:IRoomSession, param2:String, param3:Boolean, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_116,param1,param6,param7);
         this.var_1206 = param2;
         this.var_1463 = param3;
         this.var_2261 = param4;
         this._furniId = param5;
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
      
      public function get furniId() : int
      {
         return this._furniId;
      }
   }
}
