package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var _name:String = "";
      
      private var _type:String = "";
      
      private var _x:Number = 0;
      
      private var var_145:Number = 0;
      
      private var var_144:Number = 0;
      
      private var var_249:int = 0;
      
      private var var_528:int = 0;
      
      private var var_647:int = 0;
      
      private var var_174:Boolean = false;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function setReadOnly() : void
      {
         this.var_174 = true;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         if(!this.var_174)
         {
            this._type = param1;
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
      
      public function get sizeX() : int
      {
         return this.var_528;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_174)
         {
            this.var_528 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_647;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_174)
         {
            this.var_647 = param1;
         }
      }
   }
}
