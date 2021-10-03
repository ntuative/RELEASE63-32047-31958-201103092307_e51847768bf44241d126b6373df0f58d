package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_990:BigInteger;
      
      private var var_2142:BigInteger;
      
      private var var_1563:BigInteger;
      
      private var var_2141:BigInteger;
      
      private var var_1276:BigInteger;
      
      private var var_1564:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1276 = param1;
         this.var_1564 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1276.toString() + ",generator: " + this.var_1564.toString() + ",secret: " + param1);
         this.var_990 = new BigInteger();
         this.var_990.fromRadix(param1,param2);
         this.var_2142 = this.var_1564.modPow(this.var_990,this.var_1276);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1563 = new BigInteger();
         this.var_1563.fromRadix(param1,param2);
         this.var_2141 = this.var_1563.modPow(this.var_990,this.var_1276);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2142.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2141.toRadix(param1);
      }
   }
}
