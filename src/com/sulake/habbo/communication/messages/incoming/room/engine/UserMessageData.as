package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1167:String = "M";
      
      public static const const_1431:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_145:Number = 0;
      
      private var var_144:Number = 0;
      
      private var var_249:int = 0;
      
      private var _name:String = "";
      
      private var _userType:int = 0;
      
      private var var_875:String = "";
      
      private var _figure:String = "";
      
      private var var_2191:String = "";
      
      private var var_2189:int;
      
      private var var_2186:int = 0;
      
      private var var_2187:String = "";
      
      private var var_2188:int = 0;
      
      private var var_2190:int = 0;
      
      private var var_2192:String = "";
      
      private var var_174:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_174 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_174)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_145;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_174)
         {
            this.var_145 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_144;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_174)
         {
            this.var_144 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_249;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_174)
         {
            this.var_249 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_174)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this._userType;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_174)
         {
            this._userType = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_875;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_174)
         {
            this.var_875 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_174)
         {
            this._figure = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2191;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_174)
         {
            this.var_2191 = param1;
         }
      }
      
      public function get method_1() : int
      {
         return this.var_2189;
      }
      
      public function set method_1(param1:int) : void
      {
         if(!this.var_174)
         {
            this.var_2189 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2186;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_174)
         {
            this.var_2186 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2187;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_174)
         {
            this.var_2187 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2188;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_174)
         {
            this.var_2188 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2190;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_174)
         {
            this.var_2190 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2192;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_174)
         {
            this.var_2192 = param1;
         }
      }
   }
}
