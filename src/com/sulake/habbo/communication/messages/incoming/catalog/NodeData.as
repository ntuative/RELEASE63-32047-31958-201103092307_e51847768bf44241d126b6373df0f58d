package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class NodeData
   {
       
      
      private var var_2705:Boolean;
      
      private var _color:int;
      
      private var _icon:int;
      
      private var _pageId:int;
      
      private var _localization:String;
      
      private var var_1934:Boolean;
      
      private var var_1468:Array;
      
      public function NodeData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2705 = Boolean(param1.readInteger());
         this._color = param1.readInteger();
         this._icon = param1.readInteger();
         this._pageId = param1.readInteger();
         this._localization = param1.readString();
         this.var_1468 = new Array();
         this.var_1934 = Boolean(param1.readInteger());
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1468.push(new NodeData(param1));
            _loc3_++;
         }
      }
      
      public function get navigateable() : Boolean
      {
         return this.var_2705;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get icon() : int
      {
         return this._icon;
      }
      
      public function get pageId() : int
      {
         return this._pageId;
      }
      
      public function get localization() : String
      {
         return this._localization;
      }
      
      public function get nodes() : Array
      {
         return this.var_1468;
      }
      
      public function get disabled() : Boolean
      {
         return this.var_1934;
      }
   }
}
