package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.utils.profiler.tracking.TrackedBitmapData;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.BitmapSkinParser;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.IBitmapDrawable;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class BitmapSkinRenderer extends SkinRenderer implements ISkinRenderer
   {
      
      private static var var_35:Rectangle = new Rectangle();
      
      private static const TOP_LEFT:Point = new Point();
       
      
      protected var var_807:Dictionary;
      
      protected var var_806:Dictionary;
      
      private var var_907:Matrix;
      
      public function BitmapSkinRenderer(param1:String)
      {
         super(param1);
         this.var_807 = new Dictionary(false);
         this.var_806 = new Dictionary(false);
         this.var_907 = new Matrix();
      }
      
      override public function parse(param1:IAsset, param2:XMLList, param3:IAssetLibrary) : void
      {
         BitmapSkinParser.parseSkinDescription(param1.content as XML,param2,this,name,param3);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!disposed)
         {
            super.dispose();
            this.var_907 = null;
            for(_loc1_ in this.var_807)
            {
               _loc2_ = this.var_807[_loc1_] as BitmapData;
               _loc2_.dispose();
               delete this.var_807[_loc1_];
            }
            this.var_807 = null;
            for(_loc1_ in this.var_806)
            {
               _loc2_ = this.var_806[_loc1_] as BitmapData;
               _loc2_.dispose();
               delete this.var_806[_loc1_];
            }
            this.var_806 = null;
         }
      }
      
      override public function isStateDrawable(param1:uint) : Boolean
      {
         return false;
      }
      
      override public function draw(param1:IWindow, param2:IBitmapDrawable, param3:Rectangle, param4:uint, param5:Boolean) : void
      {
         var _loc9_:* = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:* = null;
         var _loc31_:* = null;
         var _loc6_:BitmapData = param2 as BitmapData;
         var _loc7_:ISkinLayout = var_448[param4];
         var _loc8_:ISkinTemplate = _templatesByState[param4];
         if(_loc7_ == null)
         {
            Logger.log("LAYOUT NULL " + param4);
            _loc7_ = var_448["null"];
            _loc8_ = _templatesByState["null"];
         }
         _loc9_ = uint(_loc7_.numChildren);
         if(_loc7_ != null && _loc9_ > 0)
         {
            _loc14_ = param3.width - _loc7_.width;
            _loc15_ = param3.height - _loc7_.height;
            _loc16_ = 0;
            while(_loc16_ < _loc9_)
            {
               _loc10_ = _loc7_.getChildAt(_loc16_) as ISkinLayoutEntity;
               _loc11_ = _loc8_.getChildByName(_loc10_.name) as ISkinTemplateEntity;
               if(_loc11_ != null)
               {
                  _loc17_ = this.getBitmapFromCache(_loc8_,_loc10_.name);
                  _loc18_ = this.getAlphaFromCache(_loc8_,_loc10_.name);
                  _loc12_ = false;
                  _loc13_ = false;
                  var_35.x = _loc10_.region.x + param3.x;
                  var_35.y = _loc10_.region.y + param3.y;
                  var_35.width = _loc10_.region.width;
                  var_35.height = _loc10_.region.height;
                  if(_loc10_.scaleH == SkinLayoutEntity.const_311)
                  {
                     var_35.x += _loc14_;
                  }
                  else if(_loc10_.scaleH == SkinLayoutEntity.const_535)
                  {
                     _loc12_ = true;
                     var_35.right += _loc14_;
                     if(true)
                     {
                        break;
                     }
                  }
                  else if(_loc10_.scaleH == SkinLayoutEntity.const_287)
                  {
                     _loc12_ = true;
                     var_35.right += _loc14_;
                     if(true)
                     {
                        break;
                     }
                  }
                  if(_loc10_.scaleV == SkinLayoutEntity.const_311)
                  {
                     var_35.y += _loc15_;
                  }
                  else if(_loc10_.scaleV == SkinLayoutEntity.const_535)
                  {
                     _loc13_ = true;
                     var_35.bottom += _loc15_;
                     if(true)
                     {
                        break;
                     }
                  }
                  else if(_loc10_.scaleV == SkinLayoutEntity.const_287)
                  {
                     _loc13_ = true;
                     var_35.bottom += _loc15_;
                     if(true)
                     {
                        break;
                     }
                  }
                  if(!_loc12_ && !_loc13_)
                  {
                     _loc6_.copyPixels(_loc17_,_loc17_.rect,var_35.topLeft,_loc18_,TOP_LEFT,true);
                  }
                  else if(_loc10_.scaleV == SkinLayoutEntity.const_287 || _loc10_.scaleH == SkinLayoutEntity.const_287)
                  {
                     _loc19_ = _loc17_.width;
                     _loc20_ = _loc17_.height;
                     _loc21_ = 0 / _loc19_;
                     _loc22_ = 0 / _loc20_;
                     _loc23_ = 0 % _loc19_;
                     _loc24_ = 0 % _loc20_;
                     _loc25_ = new Point(var_35.x,var_35.y);
                     _loc26_ = new Rectangle(0,0,_loc23_,_loc17_.height);
                     _loc27_ = new Rectangle(0,0,_loc17_.width,_loc24_);
                     _loc28_ = 0;
                     while(_loc28_ < _loc22_)
                     {
                        _loc25_.x = var_35.x;
                        _loc29_ = 0;
                        while(_loc29_ < _loc21_)
                        {
                           _loc6_.copyPixels(_loc17_,_loc17_.rect,_loc25_,_loc18_,TOP_LEFT,true);
                           _loc25_.x += _loc19_;
                           _loc29_++;
                        }
                        if(_loc23_ > 0)
                        {
                           _loc6_.copyPixels(_loc17_,_loc26_,_loc25_,_loc18_,TOP_LEFT,true);
                        }
                        _loc25_.y += _loc20_;
                        _loc28_++;
                     }
                     if(_loc24_ > 0)
                     {
                        _loc25_.x = var_35.x;
                        _loc28_ = 0;
                        while(_loc28_ < _loc21_)
                        {
                           _loc6_.copyPixels(_loc17_,_loc27_,_loc25_,_loc18_,TOP_LEFT,true);
                           _loc25_.x += _loc19_;
                           _loc28_++;
                        }
                     }
                  }
                  else if(_loc17_.width == 1 && _loc17_.height == 1)
                  {
                     _loc6_.fillRect(var_35,_loc17_.getPixel(0,0) | _loc18_.getPixel32(0,0) & 4278190080);
                  }
                  else
                  {
                     this.var_907.a = 0 / _loc17_.width;
                     this.var_907.d = 0 / _loc17_.height;
                     _loc30_ = new BitmapData(var_35.width,var_35.height,false);
                     _loc30_.draw(_loc17_,this.var_907);
                     _loc31_ = new BitmapData(var_35.width,var_35.height,true,0);
                     _loc31_.draw(_loc18_,this.var_907,null);
                     _loc6_.copyPixels(_loc30_,_loc30_.rect,var_35.topLeft,_loc31_,TOP_LEFT,true);
                     _loc31_.dispose();
                     _loc30_.dispose();
                  }
               }
               _loc16_++;
            }
         }
      }
      
      protected function drawStaticLayoutEntity(param1:BitmapData, param2:Rectangle, param3:ISkinLayout, param4:ISkinLayoutEntity, param5:ISkinTemplate, param6:ISkinTemplateEntity) : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc7_:Rectangle = param4.region.clone();
         _loc7_.x += param2.x;
         _loc7_.y += param2.y;
         switch(param6.type)
         {
            case "bitmap":
               _loc8_ = this.getBitmapFromCache(param5,param4.name);
               _loc9_ = this.getAlphaFromCache(param5,param4.name);
               if(param4.scaleH == SkinLayoutEntity.const_311)
               {
                  _loc7_.x += param2.width - param3.width;
               }
               if(param4.scaleV == SkinLayoutEntity.const_311)
               {
                  _loc7_.y += param2.height - param3.height;
               }
               param1.copyPixels(_loc8_,_loc8_.rect,_loc7_.topLeft,_loc9_,new Point(),true);
               break;
            case "fill":
               param1.fillRect(_loc7_,param4.color);
         }
      }
      
      private function getBitmapFromCache(param1:ISkinTemplate, param2:String) : BitmapData
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:String = param2 + "@" + param1.name;
         var _loc4_:BitmapData = this.var_807[_loc3_];
         if(_loc4_ == null)
         {
            _loc5_ = param1.getChildByName(param2) as ISkinTemplateEntity;
            if(_loc5_ == null)
            {
               throw new Error("Template entity" + param2 + "not found!");
            }
            _loc6_ = BitmapDataAsset(param1.asset).content as BitmapData;
            if(_loc6_ == null)
            {
               throw new Error("Asset " + param1.asset + " not found!");
            }
            _loc4_ = new TrackedBitmapData(this,_loc5_.region.width,_loc5_.region.height,false);
            _loc4_.copyPixels(_loc6_,_loc5_.region,_loc4_.rect.topLeft);
            this.var_807[_loc3_] = _loc4_;
         }
         return _loc4_;
      }
      
      private function getAlphaFromCache(param1:ISkinTemplate, param2:String) : BitmapData
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:String = param2 + "@" + param1.name;
         var _loc4_:BitmapData = this.var_806[_loc3_];
         if(_loc4_ == null)
         {
            _loc5_ = param1.getChildByName(param2) as ISkinTemplateEntity;
            if(_loc5_ == null)
            {
               throw new Error("Template entity" + param2 + "not found!");
            }
            _loc6_ = BitmapDataAsset(param1.asset).content as BitmapData;
            if(_loc6_ == null)
            {
               throw new Error("Asset " + param1.asset + " not found!");
            }
            _loc4_ = new TrackedBitmapData(this,_loc5_.region.width,_loc5_.region.height,true);
            _loc4_.copyChannel(_loc6_,_loc5_.region,_loc4_.rect.topLeft,BitmapDataChannel.ALPHA,BitmapDataChannel.ALPHA);
            this.var_806[_loc3_] = _loc4_;
         }
         return _loc4_;
      }
      
      private function drawBorders(param1:BitmapData, param2:Rectangle, param3:uint) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = param2.bottom - 1;
         _loc4_ = param2.left;
         while(_loc4_ < param2.right - 1)
         {
            param1.setPixel32(_loc4_,0,param3);
            param1.setPixel32(_loc4_,_loc5_,param3);
            _loc4_++;
         }
         _loc5_ = param2.top;
         while(_loc5_ < param2.bottom - 1)
         {
            param1.setPixel32(0,_loc5_,param3);
            param1.setPixel32(_loc4_,_loc5_,param3);
            _loc5_++;
         }
      }
   }
}
