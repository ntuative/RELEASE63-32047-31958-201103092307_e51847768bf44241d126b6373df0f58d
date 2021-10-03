package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2073:int;
      
      private var var_1321:String;
      
      private var var_2730:int;
      
      private var var_2725:int;
      
      private var _category:int;
      
      private var var_2018:String;
      
      private var var_1446:int;
      
      private var var_2726:int;
      
      private var var_2727:int;
      
      private var var_2724:int;
      
      private var var_2729:int;
      
      private var var_2728:Boolean;
      
      private var var_2859:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2073 = param1;
         this.var_1321 = param2;
         this.var_2730 = param3;
         this.var_2725 = param4;
         this._category = param5;
         this.var_2018 = param6;
         this.var_1446 = param7;
         this.var_2726 = param8;
         this.var_2727 = param9;
         this.var_2724 = param10;
         this.var_2729 = param11;
         this.var_2728 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2073;
      }
      
      public function get itemType() : String
      {
         return this.var_1321;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2730;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2725;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2018;
      }
      
      public function get extra() : int
      {
         return this.var_1446;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2726;
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
      
      public function get groupable() : Boolean
      {
         return this.var_2728;
      }
      
      public function get songID() : int
      {
         return this.var_1446;
      }
   }
}
