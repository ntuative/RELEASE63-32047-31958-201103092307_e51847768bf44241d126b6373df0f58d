package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_121:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_132:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_1091:int = 2;
      
      public static const const_993:int = 3;
      
      public static const const_1662:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1541:String = "";
      
      private var var_2189:int;
      
      private var var_2186:int = 0;
      
      private var var_2190:int = 0;
      
      private var _figure:String = "";
      
      private var var_45:BitmapData = null;
      
      private var var_266:Array;
      
      private var var_1794:Array;
      
      private var var_1303:int = 0;
      
      private var var_2488:String = "";
      
      private var var_2490:int = 0;
      
      private var var_2489:int = 0;
      
      private var var_1897:Boolean = false;
      
      private var var_1542:String = "";
      
      private var var_2719:Boolean = false;
      
      private var var_2716:Boolean = true;
      
      private var var_1115:int = 0;
      
      private var var_2714:Boolean = false;
      
      private var var_2718:Boolean = false;
      
      private var var_2713:Boolean = false;
      
      private var var_2717:Boolean = false;
      
      private var var_2721:Boolean = false;
      
      private var var_2720:Boolean = false;
      
      private var var_2715:int = 0;
      
      private var var_1899:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_266 = [];
         this.var_1794 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1541 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1541;
      }
      
      public function set method_1(param1:int) : void
      {
         this.var_2189 = param1;
      }
      
      public function get method_1() : int
      {
         return this.var_2189;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2186 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2186;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2190 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2190;
      }
      
      public function set figure(param1:String) : void
      {
         this._figure = param1;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_45 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_45;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_266 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_266;
      }
      
      public function get givableBadges() : Array
      {
         return this.var_1794;
      }
      
      public function set givableBadges(param1:Array) : void
      {
         this.var_1794 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1303 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1303;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2488 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2488;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2719 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2719;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1115 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1115;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2714 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2714;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2718 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2718;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2713 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2713;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2717 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2717;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2721 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2721;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2720 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2720;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2715 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2715;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2716 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2716;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1899 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1899;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2490 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2490;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2489 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2489;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1897 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1897;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1542 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1542;
      }
   }
}
