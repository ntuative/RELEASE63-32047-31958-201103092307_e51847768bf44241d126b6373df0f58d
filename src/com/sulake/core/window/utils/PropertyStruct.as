package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_155:String = "hex";
      
      public static const const_40:String = "int";
      
      public static const const_234:String = "uint";
      
      public static const const_259:String = "Number";
      
      public static const const_36:String = "Boolean";
      
      public static const const_54:String = "String";
      
      public static const const_257:String = "Point";
      
      public static const const_250:String = "Rectangle";
      
      public static const const_127:String = "Array";
      
      public static const const_266:String = "Map";
       
      
      private var var_547:String;
      
      private var var_171:Object;
      
      private var _type:String;
      
      private var var_2120:Boolean;
      
      private var var_2794:Boolean;
      
      private var var_2119:Array;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean, param5:Array = null)
      {
         super();
         this.var_547 = param1;
         this.var_171 = param2;
         this._type = param3;
         this.var_2120 = param4;
         this.var_2794 = param3 == const_266 || param3 == const_127 || param3 == const_257 || param3 == const_250;
         this.var_2119 = param5;
      }
      
      public function get key() : String
      {
         return this.var_547;
      }
      
      public function get value() : Object
      {
         return this.var_171;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2120;
      }
      
      public function get range() : Array
      {
         return this.var_2119;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_155:
               return "0x" + uint(this.var_171).toString(16);
            case const_36:
               return Boolean(this.var_171) == true ? "true" : "false";
            case const_257:
               return "Point(" + Point(this.var_171).x + ", " + Point(this.var_171).y + ")";
            case const_250:
               return "Rectangle(" + Rectangle(this.var_171).x + ", " + Rectangle(this.var_171).y + ", " + Rectangle(this.var_171).width + ", " + Rectangle(this.var_171).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_266:
               _loc3_ = this.var_171 as Map;
               _loc1_ = "<var key=\"" + this.var_547 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_127:
               _loc4_ = this.var_171 as Array;
               _loc1_ = "<var key=\"" + this.var_547 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_257:
               _loc5_ = this.var_171 as Point;
               _loc1_ = "<var key=\"" + this.var_547 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_250:
               _loc6_ = this.var_171 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_547 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_155:
               _loc1_ = "<var key=\"" + this.var_547 + "\" value=\"" + "0x" + uint(this.var_171).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_547 + "\" value=\"" + this.var_171 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
   }
}
