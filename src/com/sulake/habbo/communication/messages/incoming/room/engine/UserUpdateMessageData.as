package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_145:Number = 0;
      
      private var var_144:Number = 0;
      
      private var var_2526:Number = 0;
      
      private var var_2528:Number = 0;
      
      private var var_2527:Number = 0;
      
      private var var_2529:Number = 0;
      
      private var var_249:int = 0;
      
      private var var_2227:int = 0;
      
      private var var_321:Array;
      
      private var var_2525:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_321 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_145 = param3;
         this.var_144 = param4;
         this.var_2526 = param5;
         this.var_249 = param6;
         this.var_2227 = param7;
         this.var_2528 = param8;
         this.var_2527 = param9;
         this.var_2529 = param10;
         this.var_2525 = param11;
         this.var_321 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_145;
      }
      
      public function get z() : Number
      {
         return this.var_144;
      }
      
      public function get localZ() : Number
      {
         return this.var_2526;
      }
      
      public function get targetX() : Number
      {
         return this.var_2528;
      }
      
      public function get targetY() : Number
      {
         return this.var_2527;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2529;
      }
      
      public function get dir() : int
      {
         return this.var_249;
      }
      
      public function get dirHead() : int
      {
         return this.var_2227;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2525;
      }
      
      public function get actions() : Array
      {
         return this.var_321.slice();
      }
   }
}
