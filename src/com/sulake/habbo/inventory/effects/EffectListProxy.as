package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   
   public class EffectListProxy implements IThumbListDataProvider
   {
       
      
      private var var_67:EffectsModel;
      
      private var var_359:int;
      
      public function EffectListProxy(param1:EffectsModel, param2:int)
      {
         super();
         this.var_67 = param1;
         this.var_359 = param2;
      }
      
      public function dispose() : void
      {
         this.var_67 = null;
      }
      
      public function getDrawableList() : Array
      {
         return this.var_67.getEffects(this.var_359);
      }
   }
}
