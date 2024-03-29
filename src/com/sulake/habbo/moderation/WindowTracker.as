package com.sulake.habbo.moderation
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class WindowTracker
   {
      
      public static const const_1522:int = 1;
      
      public static const const_1515:int = 2;
      
      public static const const_1180:int = 3;
      
      public static const const_905:int = 4;
      
      public static const const_1001:int = 5;
      
      public static const const_1654:int = 6;
      
      public static const const_1671:int = 7;
      
      public static const TYPE_ISSUEHANDLER:int = 8;
      
      public static const const_1572:int = 9;
       
      
      private var var_1921:Dictionary;
      
      public function WindowTracker()
      {
         this.var_1921 = new Dictionary();
         super();
      }
      
      public function show(param1:TrackedWindow, param2:IFrameWindow, param3:Boolean, param4:Boolean, param5:Boolean) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc6_:TrackedWindow = this.removeWindow(param1.getType(),param1.getId());
         if(_loc6_ != null && !_loc6_.disposed)
         {
            if(param5)
            {
               param1.dispose();
               _loc6_.dispose();
               return;
            }
            param1.show();
            _loc7_ = _loc6_.getFrame().rectangle;
            param1.getFrame().x = _loc7_.x;
            param1.getFrame().y = _loc7_.y;
            param1.getFrame().width = _loc7_.width;
            param1.getFrame().height = _loc7_.height;
            this.getWindowsForType(param1.getType())[param1.getId()] = param1;
            _loc6_.dispose();
         }
         else if(!param4)
         {
            param1.show();
            if(param2 != null)
            {
               _loc8_ = 5;
               if(param3)
               {
                  param1.getFrame().x = param2.x;
                  param1.getFrame().y = param2.y + param2.height + _loc8_;
               }
               else
               {
                  param1.getFrame().x = param2.x + param2.width + _loc8_;
                  param1.getFrame().y = param2.y;
               }
            }
            else
            {
               _loc9_ = param1.getFrame().desktop;
               param1.getFrame().x = _loc9_.width / 2 - param1.getFrame().width / 2;
               param1.getFrame().y = _loc9_.height / 2 - param1.getFrame().height / 2;
            }
            param1.getFrame().x = Math.max(0,Math.min(param1.getFrame().x,param1.getFrame().desktop.width - param1.getFrame().width));
            param1.getFrame().y = Math.max(0,Math.min(param1.getFrame().y,param1.getFrame().desktop.height - param1.getFrame().height));
            this.getWindowsForType(param1.getType())[param1.getId()] = param1;
         }
      }
      
      private function removeWindow(param1:int, param2:String) : TrackedWindow
      {
         var _loc3_:Dictionary = this.getWindowsForType(param1);
         var _loc4_:TrackedWindow = _loc3_[param2];
         _loc3_[param2] = null;
         return _loc4_;
      }
      
      private function getWindowsForType(param1:int) : Dictionary
      {
         var _loc2_:Dictionary = this.var_1921[param1];
         if(_loc2_ == null)
         {
            _loc2_ = new Dictionary();
            this.var_1921[param1] = _loc2_;
         }
         return _loc2_;
      }
   }
}
