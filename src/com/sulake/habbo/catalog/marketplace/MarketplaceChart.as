package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.geom.Matrix;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class MarketplaceChart
   {
       
      
      private var _x:Array;
      
      private var var_145:Array;
      
      private var var_1080:int;
      
      private var var_868:int;
      
      private var var_2797:int = -30;
      
      private var var_578:int;
      
      public function MarketplaceChart(param1:Array, param2:Array)
      {
         super();
         this._x = param1.slice();
         this.var_145 = param2.slice();
      }
      
      public function draw(param1:int, param2:int) : BitmapData
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc3_:BitmapData = new BitmapData(param1,param2);
         if(!this.available)
         {
            return _loc3_;
         }
         this.var_578 = 0;
         for each(_loc4_ in this.var_145)
         {
            if(_loc4_ > this.var_578)
            {
               this.var_578 = _loc4_;
            }
         }
         _loc5_ = Math.pow(10,int(this.var_578).toString().length - 1);
         this.var_578 = Math.ceil(this.var_578 / _loc5_) * _loc5_;
         _loc6_ = new TextField();
         _loc7_ = new TextFormat();
         _loc6_.embedFonts = true;
         _loc7_.font = "Volter";
         _loc7_.size = 9;
         _loc6_.defaultTextFormat = _loc7_;
         _loc6_.text = this.var_578.toString();
         _loc3_.draw(_loc6_);
         this.var_1080 = param1 - _loc6_.textWidth - 2;
         this.var_868 = param2 - _loc6_.textHeight;
         _loc8_ = _loc6_.textWidth;
         _loc6_.text = "0";
         _loc3_.draw(_loc6_,new Matrix(1,0,0,1,_loc8_ - _loc6_.textWidth + 1,param2 - _loc6_.textHeight - 1));
         _loc9_ = new Shape();
         _loc9_.graphics.lineStyle(1,13421772);
         _loc9_.graphics.moveTo(0,0);
         _loc9_.graphics.lineTo(0,this.var_868);
         _loc10_ = 0;
         while(_loc10_ <= 5)
         {
            _loc4_ = (this.var_868 - 1) / 5 * _loc10_;
            _loc9_.graphics.moveTo(0,_loc4_);
            _loc9_.graphics.lineTo(this.var_1080 - 1,_loc4_);
            _loc10_++;
         }
         _loc9_.graphics.lineStyle(2,255);
         _loc9_.graphics.moveTo(this.getX(0),this.getY(0));
         _loc10_ = 1;
         while(_loc10_ < this._x.length)
         {
            _loc9_.graphics.lineTo(this.getX(_loc10_),this.getY(_loc10_));
            _loc10_++;
         }
         _loc3_.draw(_loc9_,new Matrix(1,0,0,1,param1 - this.var_1080,(param2 - this.var_868) / 2));
         return _loc3_;
      }
      
      private function getX(param1:int) : Number
      {
         return this.var_1080 + this.var_1080 / -this.var_2797 * this._x[param1];
      }
      
      private function getY(param1:int) : Number
      {
         return this.var_868 - this.var_868 / this.var_578 * this.var_145[param1];
      }
      
      public function get available() : Boolean
      {
         return this._x && this.var_145 && this._x.length > 1;
      }
   }
}
