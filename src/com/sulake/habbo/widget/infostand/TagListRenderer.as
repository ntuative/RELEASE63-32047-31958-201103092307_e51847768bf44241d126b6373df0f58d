package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.geom.Rectangle;
   
   public class TagListRenderer
   {
       
      
      private const const_1974:int = 5;
      
      private const const_1975:int = 5;
      
      private var _widget:InfostandWidget;
      
      private var var_158:Function;
      
      private var _offsetX:int;
      
      private var var_1018:int;
      
      private var var_1017:Rectangle = null;
      
      private var var_2790:int = 0;
      
      private var var_1413:Array;
      
      public function TagListRenderer(param1:InfostandWidget, param2:Function)
      {
         super();
         this._widget = param1;
         this.var_158 = param2;
      }
      
      public function dispose() : void
      {
         this._widget = null;
         this.var_158 = null;
      }
      
      public function renderTags(param1:Array, param2:IWindowContainer, param3:Array) : int
      {
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         this.var_1413 = param3;
         if(this.var_1413 != null)
         {
            _loc8_ = [];
            while((_loc9_ = param1.pop()) != null)
            {
               if(param3.indexOf(_loc9_) != -1)
               {
                  _loc8_.unshift(_loc9_);
               }
               else
               {
                  _loc8_.push(_loc9_);
               }
            }
            param1 = _loc8_;
         }
         while(param2.removeChildAt(0) != null)
         {
         }
         this.var_2790 = 0;
         this._offsetX = 0;
         this.var_1018 = 0;
         this.var_1017 = param2.rectangle.clone();
         this.var_1017.height = 150;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = this.createTag(param1[_loc5_] as String);
            if(this.fit(_loc4_.rectangle))
            {
               param2.addChild(_loc4_);
            }
            else
            {
               _loc4_.dispose();
            }
            _loc5_++;
         }
         var _loc6_:int = param2.numChildren;
         if(_loc6_ == 0)
         {
            return 0;
         }
         var _loc7_:IWindow = param2.getChildAt(param2.numChildren - 1);
         return _loc7_.rectangle.bottom;
      }
      
      private function fit(param1:Rectangle) : Boolean
      {
         if(param1.width > this.var_1017.width)
         {
            return false;
         }
         if(this.var_1018 + param1.height > this.var_1017.height)
         {
            return false;
         }
         if(this._offsetX + param1.width > this.var_1017.width)
         {
            this._offsetX = 0;
            this.var_1018 += param1.height + this.const_1975;
            return this.fit(param1);
         }
         param1.offset(this._offsetX,this.var_1018);
         this._offsetX += param1.width + this.const_1974;
         return true;
      }
      
      private function createTag(param1:String) : ITextWindow
      {
         var _loc2_:* = null;
         if(this.var_1413 != null && this.var_1413.indexOf(param1) != -1)
         {
            _loc2_ = this._widget.assets.getAssetByName("user_tag_highlighted") as XmlAsset;
         }
         else
         {
            _loc2_ = this._widget.assets.getAssetByName("user_tag") as XmlAsset;
         }
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:ITextWindow = (this._widget.windowManager as ICoreWindowManager).buildFromXML(_loc2_.content as XML) as ITextWindow;
         if(_loc3_ == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_158);
         _loc3_.caption = param1;
         return _loc3_;
      }
   }
}
