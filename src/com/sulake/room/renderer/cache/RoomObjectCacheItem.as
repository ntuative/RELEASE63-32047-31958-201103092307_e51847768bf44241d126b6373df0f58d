package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_911:RoomObjectLocationCacheItem = null;
      
      private var var_205:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_911 = new RoomObjectLocationCacheItem(param1);
         this.var_205 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_911;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_205;
      }
      
      public function dispose() : void
      {
         if(this.var_911 != null)
         {
            this.var_911.dispose();
            this.var_911 = null;
         }
         if(this.var_205 != null)
         {
            this.var_205.dispose();
            this.var_205 = null;
         }
      }
   }
}
