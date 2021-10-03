package com.sulake.habbo.messenger.domain
{
   import com.sulake.core.runtime.IDisposable;
   
   public class Conversation implements IDisposable
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_1543:Boolean;
      
      private var _figure:String;
      
      private var var_1336:Array;
      
      private var var_1337:Boolean;
      
      private var var_189:Boolean;
      
      private var _disposed:Boolean;
      
      public function Conversation(param1:int, param2:String, param3:String, param4:Boolean)
      {
         this.var_1336 = new Array();
         super();
         this._id = param1;
         this._name = param2;
         this._figure = param3;
         this.var_1543 = param4;
      }
      
      public function addMessage(param1:Message) : void
      {
         this.var_1336.push(param1);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         if(param1)
         {
            this.var_1337 = false;
         }
         this.var_189 = param1;
      }
      
      public function setNewMessageArrived(param1:Boolean) : void
      {
         if(this.var_189)
         {
            this.var_1337 = false;
         }
         else
         {
            this.var_1337 = param1;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1336 = null;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get selected() : Boolean
      {
         return this.var_189;
      }
      
      public function get messages() : Array
      {
         return this.var_1336;
      }
      
      public function get newMessageArrived() : Boolean
      {
         return this.var_1337;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1543;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function set followingAllowed(param1:Boolean) : void
      {
         this.var_1543 = param1;
      }
   }
}
