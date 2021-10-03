package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_65:String = "HTE_INITIALIZED";
      
      public static const const_38:String = "HTE_TOOLBAR_CLICK";
      
      public static const const_572:String = "HTE_TOOLBAR_ORIENTATION";
      
      public static const const_1141:String = "HTE_TOOLBAR_RESIZED";
       
      
      private var var_726:String;
      
      private var var_496:String;
      
      private var var_1359:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_726 = param1;
      }
      
      public function get iconId() : String
      {
         return this.var_726;
      }
      
      public function set orientation(param1:String) : void
      {
         this.var_496 = param1;
      }
      
      public function get orientation() : String
      {
         return this.var_496;
      }
      
      public function set iconName(param1:String) : void
      {
         this.var_1359 = param1;
      }
      
      public function get iconName() : String
      {
         return this.var_1359;
      }
   }
}
