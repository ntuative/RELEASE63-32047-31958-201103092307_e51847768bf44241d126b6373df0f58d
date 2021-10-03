package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_955:int = 3;
       
      
      private var var_2453:int = -1;
      
      private var var_2456:int = -2;
      
      private var var_353:Vector3d = null;
      
      private var var_417:Vector3d = null;
      
      private var var_2449:Boolean = false;
      
      private var var_2452:Boolean = false;
      
      private var var_2455:Boolean = false;
      
      private var var_2454:Boolean = false;
      
      private var var_2458:int = 0;
      
      private var var_2457:int = 0;
      
      private var var_2451:int = 0;
      
      private var var_2450:int = 0;
      
      private var var_1386:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_417;
      }
      
      public function get targetId() : int
      {
         return this.var_2453;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2456;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2449;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2452;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2455;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2454;
      }
      
      public function get screenWd() : int
      {
         return this.var_2458;
      }
      
      public function get screenHt() : int
      {
         return this.var_2457;
      }
      
      public function get roomWd() : int
      {
         return this.var_2451;
      }
      
      public function get roomHt() : int
      {
         return this.var_2450;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2453 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2456 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2449 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2452 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2455 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2454 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2458 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2457 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2451 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2450 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_353 == null)
         {
            this.var_353 = new Vector3d();
         }
         if(this.var_353.x != param1.x || this.var_353.y != param1.y || this.var_353.z != param1.z)
         {
            this.var_353.assign(param1);
            this.var_1386 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_353 = null;
         this.var_417 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_417 != null)
         {
            return;
         }
         this.var_417 = new Vector3d();
         this.var_417.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_353 != null && this.var_417 != null)
         {
            ++this.var_1386;
            _loc4_ = Vector3d.dif(this.var_353,this.var_417);
            if(_loc4_.length <= param2)
            {
               this.var_417 = this.var_353;
               this.var_353 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_955 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1386 <= const_955)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_417 = Vector3d.sum(this.var_417,_loc4_);
            }
         }
      }
   }
}
