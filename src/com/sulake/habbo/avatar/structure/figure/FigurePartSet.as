package com.sulake.habbo.avatar.structure.figure
{
   public class FigurePartSet implements IFigurePartSet
   {
       
      
      private var _type:String;
      
      private var _id:int;
      
      private var var_971:String;
      
      private var var_2182:int;
      
      private var var_1448:Boolean;
      
      private var var_2197:Boolean;
      
      private var _parts:Array;
      
      private var var_1422:Array;
      
      public function FigurePartSet(param1:XML, param2:String)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         super();
         this._type = param2;
         this._id = parseInt(param1.@id);
         this.var_971 = String(param1.@gender);
         this.var_2182 = parseInt(param1.@club);
         this.var_1448 = Boolean(parseInt(param1.@colorable));
         this.var_2197 = Boolean(parseInt(param1.@selectable));
         this._parts = new Array();
         this.var_1422 = new Array();
         for each(_loc3_ in param1.part)
         {
            _loc5_ = new FigurePart(_loc3_);
            _loc6_ = this.indexOfPartType(_loc5_);
            if(_loc6_ != -1)
            {
               this._parts.splice(_loc6_,0,_loc5_);
            }
            else
            {
               this._parts.push(_loc5_);
            }
         }
         for each(_loc4_ in param1.hiddenlayers.layer)
         {
            this.var_1422.push(String(_loc4_.@parttype));
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this._parts)
         {
            _loc1_.dispose();
         }
         this._parts = null;
         this.var_1422 = null;
      }
      
      private function indexOfPartType(param1:FigurePart) : int
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._parts.length)
         {
            _loc3_ = this._parts[_loc2_];
            if(_loc3_.type == param1.type && _loc3_.index < param1.index)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function getPart(param1:String, param2:int) : IFigurePart
      {
         var _loc3_:* = null;
         for each(_loc3_ in this._parts)
         {
            if(_loc3_.type == param1 && _loc3_.id == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get gender() : String
      {
         return this.var_971;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2182;
      }
      
      public function get isColorable() : Boolean
      {
         return this.var_1448;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2197;
      }
      
      public function get parts() : Array
      {
         return this._parts;
      }
      
      public function get hiddenLayers() : Array
      {
         return this.var_1422;
      }
   }
}
