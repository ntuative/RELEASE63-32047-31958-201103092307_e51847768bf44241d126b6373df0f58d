package com.sulake.room.utils
{
   public class NumberBank
   {
       
      
      private var var_2644:int = 0;
      
      private var var_1110:Array;
      
      private var _freeNumbers:Array;
      
      public function NumberBank(param1:int)
      {
         this.var_1110 = [];
         this._freeNumbers = [];
         super();
         if(param1 < 0)
         {
            param1 = 0;
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1)
         {
            this._freeNumbers.push(_loc2_);
            _loc2_++;
         }
      }
      
      public function dispose() : void
      {
         this.var_1110 = null;
         this._freeNumbers = null;
         this.var_2644 = 0;
      }
      
      public function reserveNumber() : int
      {
         var _loc1_:int = 0;
         if(this._freeNumbers.length > 0)
         {
            _loc1_ = this._freeNumbers.pop() as int;
            this.var_1110.push(_loc1_);
            return _loc1_;
         }
         return -1;
      }
      
      public function freeNumber(param1:int) : void
      {
         var _loc2_:int = this.var_1110.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.var_1110.splice(_loc2_,1);
            this._freeNumbers.push(param1);
         }
      }
   }
}
