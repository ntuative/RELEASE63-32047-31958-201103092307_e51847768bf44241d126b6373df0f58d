package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_708:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2370:int;
      
      private var var_2373:int;
      
      private var _color:uint;
      
      private var var_1102:int;
      
      private var var_2754:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_708);
         this.var_2370 = param1;
         this.var_2373 = param2;
         this._color = param3;
         this.var_1102 = param4;
         this.var_2754 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2370;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2373;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1102;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2754;
      }
   }
}
