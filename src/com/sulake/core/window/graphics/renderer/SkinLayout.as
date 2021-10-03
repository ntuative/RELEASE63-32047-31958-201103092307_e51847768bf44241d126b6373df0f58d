package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.window.utils.ChildEntityArray;
   import com.sulake.core.window.utils.IChildEntity;
   import com.sulake.core.window.utils.IChildEntityArray;
   import com.sulake.core.window.utils.IChildEntityArrayReader;
   import flash.geom.Rectangle;
   
   public class SkinLayout extends ChildEntityArray implements ISkinLayout
   {
       
      
      protected var _name:String;
      
      protected var _width:uint;
      
      protected var _height:uint;
      
      protected var var_2156:String;
      
      protected var var_2772:Boolean;
      
      protected var _placeholders:IChildEntityArray;
      
      public function SkinLayout(param1:String, param2:Boolean, param3:String, param4:IChildEntityArray)
      {
         super();
         this._name = param1;
         this._width = 0;
         this._height = 0;
         this.var_2156 = param3;
         this.var_2772 = param2;
         this._placeholders = param4;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get width() : uint
      {
         return this._width;
      }
      
      public function get height() : uint
      {
         return this._height;
      }
      
      public function get blendMode() : String
      {
         return this.var_2156;
      }
      
      public function get transparent() : Boolean
      {
         return this.var_2772;
      }
      
      public function get placeholders() : IChildEntityArrayReader
      {
         return this._placeholders;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc3_:* = null;
         var _loc2_:uint = numChildren;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            ISkinLayoutEntity(getChildAt(_loc1_)).dispose();
            _loc1_++;
         }
         for(_loc3_ in this._placeholders)
         {
            ISkinLayoutEntity(this._placeholders[_loc3_]).dispose();
            delete this._placeholders[_loc3_];
         }
      }
      
      public function calculateActualRect(param1:Rectangle) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:uint = numChildren;
         param1.x = 4294967295;
         param1.y = 4294967295;
         param1.width = 0;
         param1.height = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = getChildAt(_loc5_) as ISkinLayoutEntity;
            _loc2_ = _loc3_.region;
            if(_loc2_.left < param1.left)
            {
               param1.left = _loc2_.left;
            }
            if(_loc2_.top < param1.top)
            {
               param1.top = _loc2_.top;
            }
            if(_loc2_.right > param1.right)
            {
               param1.right = _loc2_.right;
            }
            if(_loc2_.bottom > param1.bottom)
            {
               param1.bottom = _loc2_.bottom;
            }
            _loc5_++;
         }
      }
      
      public function isFixedWidth() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:uint = numChildren;
         if(_loc1_ == 0)
         {
            return false;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            if(ISkinLayoutEntity(getChildAt(_loc2_)).scaleH != SkinLayoutEntity.const_433)
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      public function calculateWidth() : uint
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc1_:* = 0;
         var _loc3_:uint = numChildren;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = ISkinLayoutEntity(getChildAt(_loc4_)).region;
            if(_loc2_.right > _loc1_)
            {
               _loc1_ = uint(_loc2_.right);
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function isFixedHeight() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:uint = numChildren;
         if(_loc1_ == 0)
         {
            return false;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            if(ISkinLayoutEntity(getChildAt(_loc2_)).scaleV != SkinLayoutEntity.const_433)
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      public function calculateHeight() : uint
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc1_:* = 0;
         var _loc3_:uint = numChildren;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = ISkinLayoutEntity(getChildAt(_loc4_)).region;
            if(_loc2_.bottom > _loc1_)
            {
               _loc1_ = uint(_loc2_.bottom);
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function getDefaultRegion(param1:String, param2:Rectangle) : void
      {
         var _loc3_:ISkinLayoutEntity = getChildByName(param1) as ISkinLayoutEntity;
         if(_loc3_ == null)
         {
            _loc3_ = this._placeholders.getChildByName(param1) as ISkinLayoutEntity;
            if(_loc3_ == null)
            {
               throw new Error("Entity not found: " + param1 + "!");
            }
         }
         param2.x = _loc3_.region.x;
         param2.y = _loc3_.region.y;
         param2.width = _loc3_.region.width;
         param2.height = _loc3_.region.height;
      }
      
      override public function addChild(param1:IChildEntity) : IChildEntity
      {
         var _loc2_:ISkinLayoutEntity = ISkinLayoutEntity(param1);
         this._width = _loc2_.region.right > this._width ? uint(_loc2_.region.right) : uint(this._width);
         this._height = _loc2_.region.bottom > this._height ? uint(_loc2_.region.bottom) : uint(this._height);
         return super.addChild(param1);
      }
      
      override public function addChildAt(param1:IChildEntity, param2:int) : IChildEntity
      {
         var _loc3_:ISkinLayoutEntity = ISkinLayoutEntity(param1);
         this._width = _loc3_.region.right > this._width ? uint(_loc3_.region.right) : uint(this._width);
         this._height = _loc3_.region.bottom > this._height ? uint(_loc3_.region.bottom) : uint(this._height);
         return super.addChildAt(param1,param2);
      }
      
      override public function removeChild(param1:IChildEntity) : IChildEntity
      {
         super.removeChild(param1);
         this._width = this.calculateWidth();
         this._height = this.calculateHeight();
         return param1;
      }
      
      override public function removeChildAt(param1:int) : IChildEntity
      {
         var _loc2_:IChildEntity = super.removeChildAt(param1);
         this._width = this.calculateWidth();
         this._height = this.calculateHeight();
         return _loc2_;
      }
   }
}
