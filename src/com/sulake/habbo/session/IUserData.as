package com.sulake.habbo.session
{
   public interface IUserData
   {
       
      
      function get id() : int;
      
      function get name() : String;
      
      function get custom() : String;
      
      function get method_1() : int;
      
      function get type() : int;
      
      function get figure() : String;
      
      function get sex() : String;
      
      function get groupID() : String;
      
      function get groupStatus() : int;
      
      function get xp() : int;
      
      function get webID() : int;
      
      function set figure(param1:String) : void;
      
      function set name(param1:String) : void;
      
      function set sex(param1:String) : void;
      
      function set custom(param1:String) : void;
      
      function set method_1(param1:int) : void;
   }
}
