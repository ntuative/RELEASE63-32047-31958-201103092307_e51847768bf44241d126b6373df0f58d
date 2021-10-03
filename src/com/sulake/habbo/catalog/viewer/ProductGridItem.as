package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class ProductGridItem implements IGridItem
   {
      
      private static const const_933:String = "bg";
       
      
      protected var var_17:IWindowContainer;
      
      private var var_233:IItemGrid;
      
      private var _icon:IBitmapWrapperWindow;
      
      private var _disposed:Boolean = false;
      
      public function ProductGridItem()
      {
         super();
      }
      
      public function get view() : IWindowContainer
      {
         return this.var_17;
      }
      
      public function set grid(param1:IItemGrid) : void
      {
         this.var_233 = param1;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         this.var_233 = null;
         this._icon = null;
         if(this.var_17 != null)
         {
            this.var_17.dispose();
            this.var_17 = null;
         }
         this._disposed = true;
      }
      
      public function activate() : void
      {
         this.var_17.getChildByName(const_933).style = HabboWindowStyle.const_31;
      }
      
      public function deActivate() : void
      {
         this.var_17.getChildByName(const_933).style = 3;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         if(!param1)
         {
            return;
         }
         this.var_17 = param1;
         this.var_17.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClick);
         this._icon = this.var_17.findChildByName("image") as IBitmapWrapperWindow;
         var _loc2_:IWindow = this.var_17.findChildByName("multiContainer");
         if(_loc2_)
         {
            _loc2_.visible = false;
         }
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         if(this.var_233 != null)
         {
            this.var_233.select(this);
         }
      }
      
      protected function setIconImage(param1:BitmapData) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this._icon == null)
         {
            return;
         }
         if(this._icon.disposed)
         {
            return;
         }
         var _loc2_:int = (this._icon.width - param1.width) / 2;
         var _loc3_:int = (this._icon.height - param1.height) / 2;
         if(this._icon.bitmap == null)
         {
            this._icon.bitmap = new BitmapData(this._icon.width,this._icon.height,true,16777215);
         }
         this._icon.bitmap.fillRect(this._icon.bitmap.rect,16777215);
         this._icon.bitmap.copyPixels(param1,param1.rect,new Point(_loc2_,_loc3_),null,null,false);
         this._icon.invalidate();
      }
   }
}
