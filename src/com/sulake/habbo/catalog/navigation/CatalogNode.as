package com.sulake.habbo.catalog.navigation
{
   import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
   import flash.display.BitmapData;
   
   public class CatalogNode implements ICatalogNode
   {
      
      private static const const_1324:Array = [4293190884,4293914607,4294957908,4289454682,4289431551,4285716709,4294016606,4293326172,4293694138,4285383659,4293082689,4288782753];
      
      private static const ICON_PREFIX:String = "icon_";
       
      
      private var var_1116:int = 0;
      
      private var var_2573:Boolean = false;
      
      private var _localization:String = "";
      
      private var _pageId:int = -1;
      
      private var _color:uint = 0;
      
      private var var_726:int = 0;
      
      private var _children:Array;
      
      private var _navigator:ICatalogNavigator;
      
      private var _parent:ICatalogNode;
      
      private var var_1934:Boolean = false;
      
      public function CatalogNode(param1:ICatalogNavigator, param2:NodeData, param3:int)
      {
         this._children = [];
         super();
         this.var_1116 = param3;
         this._navigator = param1;
         this.var_2573 = param2.navigateable;
         this._localization = param2.localization;
         this._pageId = param2.pageId;
         this._color = const_1324[param2.color];
         this.var_726 = param2.icon;
         this.var_1934 = param2.disabled;
         this._children = [];
      }
      
      public function get isOpen() : Boolean
      {
         return false;
      }
      
      public function get depth() : int
      {
         return this.var_1116;
      }
      
      public function get isBranch() : Boolean
      {
         return this._children.length > 0;
      }
      
      public function get isLeaf() : Boolean
      {
         return this._children.length == 0;
      }
      
      public function get isNavigateable() : Boolean
      {
         return this.var_2573;
      }
      
      public function get localization() : String
      {
         return this._localization;
      }
      
      public function get pageId() : int
      {
         return this._pageId;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get icon() : BitmapData
      {
         return null;
      }
      
      public function get children() : Array
      {
         return this._children;
      }
      
      public function get navigator() : ICatalogNavigator
      {
         return this._navigator;
      }
      
      public function get parent() : ICatalogNode
      {
         return this._parent;
      }
      
      public function get disabled() : Boolean
      {
         return this.var_1934;
      }
      
      public function set parent(param1:ICatalogNode) : void
      {
         this._parent = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this._children)
         {
            _loc1_.dispose();
         }
         this._children = null;
         this._navigator = null;
         this._parent = null;
      }
      
      public function hasChild(param1:ICatalogNode) : Boolean
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._children)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function addChild(param1:ICatalogNode) : void
      {
         if(param1 == null)
         {
            return;
         }
         this._children.push(param1);
         param1.parent = this;
      }
      
      public function activate() : void
      {
      }
      
      public function deActivate() : void
      {
      }
      
      public function open() : void
      {
      }
      
      public function close() : void
      {
      }
      
      protected function get iconName() : String
      {
         if(this.var_726 < 1)
         {
            return "";
         }
         return ICON_PREFIX + this.var_726.toString();
      }
   }
}
