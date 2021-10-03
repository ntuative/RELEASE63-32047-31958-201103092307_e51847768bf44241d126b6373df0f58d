package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_2018:String;
      
      protected var var_1446:Number;
      
      protected var var_2776:Boolean;
      
      protected var var_2777:Boolean;
      
      protected var var_2728:Boolean;
      
      protected var var_2608:Boolean;
      
      protected var var_2785:int;
      
      protected var var_2727:int;
      
      protected var var_2724:int;
      
      protected var var_2729:int;
      
      protected var var_1908:String;
      
      protected var var_2010:int;
      
      protected var var_926:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2728 = param5;
         this.var_2777 = param6;
         this.var_2776 = param7;
         this.var_2608 = param8;
         this.var_2018 = param9;
         this.var_1446 = param10;
         this.var_2785 = param11;
         this.var_2727 = param12;
         this.var_2724 = param13;
         this.var_2729 = param14;
         this.var_1908 = param15;
         this.var_2010 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_2018;
      }
      
      public function get extra() : Number
      {
         return this.var_1446;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2776;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2777;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2728;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2608;
      }
      
      public function get expires() : int
      {
         return this.var_2785;
      }
      
      public function get creationDay() : int
      {
         return this.var_2727;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2724;
      }
      
      public function get creationYear() : int
      {
         return this.var_2729;
      }
      
      public function get slotId() : String
      {
         return this.var_1908;
      }
      
      public function get songId() : int
      {
         return this.var_2010;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_926 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_926;
      }
   }
}
