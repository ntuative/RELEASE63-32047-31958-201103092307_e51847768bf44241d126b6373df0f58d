package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OffenceData implements INamed
   {
       
      
      private var _name:String;
      
      private var var_1602:String;
      
      public function OffenceData(param1:IMessageDataWrapper)
      {
         super();
         this._name = param1.readString();
         this.var_1602 = param1.readString();
         Logger.log("READ OFF: " + this._name + ", " + this.var_1602);
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get msg() : String
      {
         return this.var_1602;
      }
   }
}
