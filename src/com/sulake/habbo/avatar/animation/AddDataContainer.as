package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var _id:String;
      
      private var var_1537:String;
      
      private var _base:String;
      
      private var var_1693:String;
      
      private var var_732:Number = 1;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         this._id = String(param1.@id);
         this.var_1537 = String(param1.@align);
         this._base = String(param1.@base);
         this.var_1693 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            this.var_732 = Number(_loc2_);
            if(this.var_732 > 1)
            {
               this.var_732 /= 100;
            }
         }
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get align() : String
      {
         return this.var_1537;
      }
      
      public function get base() : String
      {
         return this._base;
      }
      
      public function get ink() : String
      {
         return this.var_1693;
      }
      
      public function get blend() : Number
      {
         return this.var_732;
      }
      
      public function get isBlended() : Boolean
      {
         return this.var_732 != 1;
      }
   }
}
