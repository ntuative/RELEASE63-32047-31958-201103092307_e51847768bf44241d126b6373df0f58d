package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   import com.sulake.habbo.friendlist.IFriend;
   import flash.display.BitmapData;
   
   public class Friend implements IFriend, IDisposable
   {
      
      public static const const_1809:int = "F".charCodeAt(0);
      
      public static const const_1964:int = "M".charCodeAt(0);
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_971:int;
      
      private var var_730:Boolean;
      
      private var var_1543:Boolean;
      
      private var _figure:String;
      
      private var var_1541:String;
      
      private var var_1540:String;
      
      private var var_1292:int;
      
      private var var_189:Boolean;
      
      private var _disposed:Boolean;
      
      private var var_17:IWindowContainer;
      
      private var var_1026:BitmapData;
      
      private var var_1542:String;
      
      public function Friend(param1:FriendData)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this._id = param1.id;
         this._name = param1.name;
         this.var_971 = param1.gender;
         this.var_730 = param1.online;
         this.var_1543 = param1.followingAllowed && param1.online;
         this._figure = param1.figure;
         this.var_1541 = param1.motto;
         this.var_1540 = param1.lastAccess;
         this.var_1292 = param1.categoryId;
         this.var_1542 = param1.realName;
         Logger.log("Creating friend: " + this.id + ", " + this.name + ", " + this.gender + ", " + this.online + ", " + this.followingAllowed + ", " + this.figure + ", " + this.categoryId);
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         if(this.var_1026 != null)
         {
            this.var_1026.dispose();
            this.var_1026 = null;
         }
         this._disposed = true;
         this.var_17 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_971;
      }
      
      public function get online() : Boolean
      {
         return this.var_730;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1543;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get motto() : String
      {
         return this.var_1541;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1540;
      }
      
      public function get categoryId() : int
      {
         return this.var_1292;
      }
      
      public function get selected() : Boolean
      {
         return this.var_189;
      }
      
      public function get view() : IWindowContainer
      {
         return this.var_17;
      }
      
      public function get face() : BitmapData
      {
         return this.var_1026;
      }
      
      public function get realName() : String
      {
         return this.var_1542;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_971 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_730 = param1;
      }
      
      public function set followingAllowed(param1:Boolean) : void
      {
         this.var_1543 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this._figure = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1541 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1540 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1292 = param1;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.var_189 = param1;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         this.var_17 = param1;
      }
      
      public function set face(param1:BitmapData) : void
      {
         this.var_1026 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1542 = param1;
      }
   }
}
