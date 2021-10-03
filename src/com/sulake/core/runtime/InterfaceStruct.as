package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1356:IID;
      
      private var var_1696:String;
      
      private var var_102:IUnknown;
      
      private var var_725:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1356 = param1;
         this.var_1696 = getQualifiedClassName(this.var_1356);
         this.var_102 = param2;
         this.var_725 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1356;
      }
      
      public function get iis() : String
      {
         return this.var_1696;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_102;
      }
      
      public function get references() : uint
      {
         return this.var_725;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_102 == null;
      }
      
      public function dispose() : void
      {
         this.var_1356 = null;
         this.var_1696 = null;
         this.var_102 = null;
         this.var_725 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_725;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_725) : uint(0);
      }
   }
}
