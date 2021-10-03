package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class SaveRoomSettingsMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_32:Array;
      
      public function SaveRoomSettingsMessageComposer(param1:SaveableRoomSettingsData)
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         this.var_32 = new Array();
         super();
         this.var_32.push(param1.roomId);
         this.var_32.push(param1.name);
         this.var_32.push(param1.description);
         this.var_32.push(param1.doorMode);
         this.var_32.push(param1.password !== null ? param1.password : "");
         this.var_32.push(param1.maximumVisitors);
         this.var_32.push(param1.categoryId);
         if(param1.tags)
         {
            _loc2_ = [];
            for each(_loc3_ in param1.tags)
            {
               if(_loc3_ && _loc3_ !== "")
               {
                  _loc2_.push(_loc3_);
               }
            }
            this.var_32.push(_loc2_.length);
            for each(_loc4_ in _loc2_)
            {
               this.var_32.push(_loc4_);
            }
         }
         else
         {
            this.var_32.push(0);
         }
         this.var_32.push(param1.allowPets);
         this.var_32.push(param1.allowFoodConsume);
         this.var_32.push(param1.allowWalkThrough);
         this.var_32.push(param1.hideWalls);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_32;
      }
      
      public function dispose() : void
      {
         this.var_32 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
