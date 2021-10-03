package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_797:int = 1;
      
      public static const const_814:int = 2;
      
      public static const const_691:int = 3;
      
      public static const const_1038:int = 4;
      
      public static const const_658:int = 5;
      
      public static const const_1148:int = 6;
       
      
      private var _type:int;
      
      private var var_1016:int;
      
      private var var_2430:String;
      
      private var var_2667:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1016 = param2;
         this.var_2430 = param3;
         this.var_2667 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2430;
      }
      
      public function get time() : String
      {
         return this.var_2667;
      }
      
      public function get senderId() : int
      {
         return this.var_1016;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
