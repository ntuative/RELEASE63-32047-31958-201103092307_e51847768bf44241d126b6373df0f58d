package com.sulake.room
{
   import com.sulake.room.object.IRoomObjectController;
   
   public interface IRoomObjectManager
   {
       
      
      function dispose() : void;
      
      function createObject(param1:int, param2:uint) : IRoomObjectController;
      
      function getObject(param1:int) : IRoomObjectController;
      
      function disposeObject(param1:int) : Boolean;
      
      function getObjectCount() : int;
      
      function getObjectWithIndex(param1:int) : IRoomObjectController;
      
      function reset() : void;
   }
}
