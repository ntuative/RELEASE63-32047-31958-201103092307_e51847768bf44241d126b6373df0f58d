package com.sulake.habbo.avatar.geometry
{
   public class GeometryItem extends Node3D
   {
       
      
      private var _id:String;
      
      private var var_1364:Number;
      
      private var var_617:Vector3D;
      
      private var var_2331:Boolean = false;
      
      private var var_2330:Boolean = false;
      
      public function GeometryItem(param1:XML, param2:Boolean = false)
      {
         super(parseFloat(param1.@x),parseFloat(param1.@y),parseFloat(param1.@z));
         this._id = String(param1.@id);
         this.var_1364 = parseFloat(param1.@radius);
         this.var_617 = new Vector3D(parseFloat(param1.@nx),parseFloat(param1.@ny),parseFloat(param1.@nz));
         this.var_2331 = parseInt(param1.@double) as Boolean;
         this.var_2330 = param2;
      }
      
      public function getDistance(param1:Vector3D) : Number
      {
         var _loc2_:Number = Math.abs(param1.z - this.transformedLocation.z - this.var_1364);
         var _loc3_:Number = Math.abs(param1.z - this.transformedLocation.z + this.var_1364);
         return Math.min(_loc2_,_loc3_);
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get normal() : Vector3D
      {
         return this.var_617;
      }
      
      public function get isDoubleSided() : Boolean
      {
         return this.var_2331;
      }
      
      public function toString() : String
      {
         return this._id + ": " + this.location + " - " + this.transformedLocation;
      }
      
      public function get isDynamic() : Boolean
      {
         return this.var_2330;
      }
   }
}
