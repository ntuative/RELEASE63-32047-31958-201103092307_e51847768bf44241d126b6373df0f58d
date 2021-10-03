package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1716:int;
      
      private var var_2166:String;
      
      private var var_387:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1716 = param1.readInteger();
         this.var_2166 = param1.readString();
         this.var_387 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1716;
      }
      
      public function get nodeName() : String
      {
         return this.var_2166;
      }
      
      public function get visible() : Boolean
      {
         return this.var_387;
      }
   }
}
