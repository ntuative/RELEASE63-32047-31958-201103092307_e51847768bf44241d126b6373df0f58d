package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1916:IID;
      
      private var var_693:Boolean;
      
      private var var_1216:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1916 = param1;
         this.var_1216 = new Array();
         this.var_693 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1916;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_693;
      }
      
      public function get receivers() : Array
      {
         return this.var_1216;
      }
      
      public function dispose() : void
      {
         if(!this.var_693)
         {
            this.var_693 = true;
            this.var_1916 = null;
            while(this.var_1216.length > 0)
            {
               this.var_1216.pop();
            }
            this.var_1216 = null;
         }
      }
   }
}
