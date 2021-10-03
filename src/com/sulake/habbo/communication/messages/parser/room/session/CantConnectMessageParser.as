package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1643:int = 1;
      
      public static const const_1894:int = 2;
      
      public static const const_1590:int = 3;
      
      public static const const_1536:int = 4;
       
      
      private var var_1483:int = 0;
      
      private var var_1482:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1483 = 0;
         this.var_1482 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1483 = param1.readInteger();
         if(this.var_1483 == 3)
         {
            this.var_1482 = param1.readString();
         }
         else
         {
            this.var_1482 = "";
         }
         return true;
      }
      
      public function get reason() : int
      {
         return this.var_1483;
      }
      
      public function get parameter() : String
      {
         return this.var_1482;
      }
   }
}
