package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_359:int = 1;
      
      public static const const_267:int = 2;
      
      public static const const_289:int = 3;
      
      public static const const_389:int = 4;
      
      public static const const_216:int = 5;
      
      public static const const_335:int = 1;
      
      public static const const_678:int = 2;
      
      public static const const_887:int = 3;
      
      public static const const_883:int = 4;
      
      public static const const_271:int = 5;
      
      public static const const_720:int = 6;
      
      public static const const_844:int = 7;
      
      public static const const_230:int = 8;
      
      public static const const_391:int = 9;
      
      public static const const_1959:int = 10;
      
      public static const const_854:int = 11;
      
      public static const const_466:int = 12;
       
      
      private var var_425:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_425 = new Array();
         this.var_425.push(new Tab(this._navigator,const_359,const_466,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_530));
         this.var_425.push(new Tab(this._navigator,const_267,const_335,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_530));
         this.var_425.push(new Tab(this._navigator,const_389,const_854,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1190));
         this.var_425.push(new Tab(this._navigator,const_289,const_271,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_530));
         this.var_425.push(new Tab(this._navigator,const_216,const_230,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_834));
         this.setSelectedTab(const_359);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_389;
      }
      
      public function get tabs() : Array
      {
         return this.var_425;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_425)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_425)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_425)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
