package com.sulake.room
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.RoomObject;
   
   public class RoomObjectManager implements IRoomObjectManager
   {
       
      
      private var _objects:Map;
      
      public function RoomObjectManager()
      {
         super();
         this._objects = new Map();
      }
      
      public function dispose() : void
      {
         this.reset();
         if(this._objects != null)
         {
            this._objects.dispose();
            this._objects = null;
         }
      }
      
      public function createObject(param1:int, param2:uint) : IRoomObjectController
      {
         if(this._objects.getValue(String(param1)) != null)
         {
            return null;
         }
         var _loc3_:RoomObject = new RoomObject(param1,param2);
         this._objects.add(String(param1),_loc3_);
         return _loc3_;
      }
      
      public function getObject(param1:int) : IRoomObjectController
      {
         return this._objects.getValue(String(param1)) as IRoomObjectController;
      }
      
      public function getObjectWithIndex(param1:int) : IRoomObjectController
      {
         return this._objects.getWithIndex(param1) as IRoomObjectController;
      }
      
      public function getObjectCount() : int
      {
         return this._objects.length;
      }
      
      public function disposeObject(param1:int) : Boolean
      {
         var _loc2_:RoomObject = this._objects.remove(String(param1)) as RoomObject;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
            return true;
         }
         return false;
      }
      
      public function reset() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this._objects != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this._objects.length)
            {
               _loc2_ = this._objects.getWithIndex(_loc1_) as IRoomObjectController;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this._objects.reset();
         }
      }
   }
}
