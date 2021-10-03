package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_971:int;
      
      private var var_730:Boolean;
      
      private var var_1543:Boolean;
      
      private var _figure:String;
      
      private var var_1292:int;
      
      private var var_1541:String;
      
      private var var_1540:String;
      
      private var var_1542:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_971 = param1.readInteger();
         this.var_730 = param1.readBoolean();
         this.var_1543 = param1.readBoolean();
         this._figure = param1.readString();
         this.var_1292 = param1.readInteger();
         this.var_1541 = param1.readString();
         this.var_1540 = param1.readString();
         this.var_1542 = param1.readString();
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
      
      public function get categoryId() : int
      {
         return this.var_1292;
      }
      
      public function get motto() : String
      {
         return this.var_1541;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1540;
      }
      
      public function get realName() : String
      {
         return this.var_1542;
      }
   }
}
