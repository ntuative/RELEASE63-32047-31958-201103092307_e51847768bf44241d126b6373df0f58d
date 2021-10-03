package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1716:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_194:MsgWithRequestId;
      
      private var var_599:RoomEventData;
      
      private var var_2471:Boolean;
      
      private var var_2480:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2342:int;
      
      private var var_255:GuestRoomData;
      
      private var var_909:PublicRoomShortData;
      
      private var var_2477:int;
      
      private var var_2481:Boolean;
      
      private var var_2473:int;
      
      private var var_2478:Boolean;
      
      private var var_1791:int;
      
      private var var_2474:Boolean;
      
      private var var_1326:Array;
      
      private var var_1392:Array;
      
      private var var_2476:int;
      
      private var var_1393:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1147:Boolean;
      
      private var var_2472:int;
      
      private var var_2475:Boolean;
      
      private var var_2479:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1326 = new Array();
         this.var_1392 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_255 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_255 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_909 = null;
         this.var_255 = null;
         this._currentRoomOwner = false;
         if(param1.guestRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_909 = param1.publicSpace;
            this.var_599 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_599 != null)
         {
            this.var_599.dispose();
            this.var_599 = null;
         }
         if(this.var_909 != null)
         {
            this.var_909.dispose();
            this.var_909 = null;
         }
         if(this.var_255 != null)
         {
            this.var_255.dispose();
            this.var_255 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_255 != null)
         {
            this.var_255.dispose();
         }
         this.var_255 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_599 != null)
         {
            this.var_599.dispose();
         }
         this.var_599 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_194 != null && this.var_194 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_194 != null && this.var_194 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_194 != null && this.var_194 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_194 = param1;
         this.var_1147 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_194 = param1;
         this.var_1147 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_194 = param1;
         this.var_1147 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_194 == null)
         {
            return;
         }
         this.var_194.dispose();
         this.var_194 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_194 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_194 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_194 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_599;
      }
      
      public function get avatarId() : int
      {
         return this.var_2342;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2471;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2480;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_255;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_909;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2481;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2473;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1791;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2478;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2472;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2477;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2474;
      }
      
      public function get adIndex() : int
      {
         return this.var_2479;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2475;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2342 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2473 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2481 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2471 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2480 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2478 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1791 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2472 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2477 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2474 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2479 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2475 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1326 = param1;
         this.var_1392 = new Array();
         for each(_loc2_ in this.var_1326)
         {
            if(_loc2_.visible)
            {
               this.var_1392.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1326;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1392;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2476 = param1.limit;
         this.var_1393 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1393 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_255.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_255 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_255.flatId;
         return this.var_1791 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1393 >= this.var_2476;
      }
      
      public function startLoading() : void
      {
         this.var_1147 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1147;
      }
   }
}
