package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2414:int;
      
      private var var_1321:String;
      
      private var _objId:int;
      
      private var var_1797:int;
      
      private var _category:int;
      
      private var var_2018:String;
      
      private var var_2586:Boolean;
      
      private var var_2587:Boolean;
      
      private var var_2585:Boolean;
      
      private var var_2232:Boolean;
      
      private var var_2263:int;
      
      private var var_1446:int;
      
      private var var_1908:String = "";
      
      private var var_2010:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2414 = param1;
         this.var_1321 = param2;
         this._objId = param3;
         this.var_1797 = param4;
         this._category = param5;
         this.var_2018 = param6;
         this.var_2586 = param7;
         this.var_2587 = param8;
         this.var_2585 = param9;
         this.var_2232 = param10;
         this.var_2263 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1908 = param1;
         this.var_1446 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2414;
      }
      
      public function get itemType() : String
      {
         return this.var_1321;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1797;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2018;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2586;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2587;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2585;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2232;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2263;
      }
      
      public function get slotId() : String
      {
         return this.var_1908;
      }
      
      public function get songId() : int
      {
         return this.var_2010;
      }
      
      public function get extra() : int
      {
         return this.var_1446;
      }
   }
}
