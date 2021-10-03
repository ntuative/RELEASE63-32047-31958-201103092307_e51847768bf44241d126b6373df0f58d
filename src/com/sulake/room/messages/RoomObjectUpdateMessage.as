package com.sulake.room.messages
{
   import com.sulake.room.utils.IVector3d;
   
   public class RoomObjectUpdateMessage
   {
       
      
      protected var var_81:IVector3d;
      
      protected var var_249:IVector3d;
      
      public function RoomObjectUpdateMessage(param1:IVector3d, param2:IVector3d)
      {
         super();
         this.var_81 = param1;
         this.var_249 = param2;
      }
      
      public function get loc() : IVector3d
      {
         return this.var_81;
      }
      
      public function get dir() : IVector3d
      {
         return this.var_249;
      }
   }
}
