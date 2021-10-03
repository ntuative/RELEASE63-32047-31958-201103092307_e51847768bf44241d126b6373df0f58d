package com.sulake.habbo.room.object.visualization.room.publicroom
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.visualization.room.RoomVisualization;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.utils.IRoomGeometry;
   
   public class PublicRoomVisualization extends RoomVisualization
   {
       
      
      protected var var_1248:int = 0;
      
      private var var_2325:Boolean = false;
      
      public function PublicRoomVisualization()
      {
         super();
      }
      
      override public function get floorRelativeDepth() : Number
      {
         return 131;
      }
      
      override public function get wallRelativeDepth() : Number
      {
         return 135;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         if(!param1 is PublicRoomVisualizationData)
         {
            return false;
         }
         return super.initialize(param1);
      }
      
      private function addSprites(param1:int) : void
      {
         createSprites(this.var_1248 + param1);
      }
      
      protected function get data() : PublicRoomVisualizationData
      {
         return _data as PublicRoomVisualizationData;
      }
      
      private function initializeLayout(param1:IRoomGeometry) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(this.var_2325)
         {
            return;
         }
         if(this.data != null)
         {
            this.var_1248 = spriteCount;
            _loc2_ = object.getModel();
            _loc3_ = _loc2_.getString(RoomObjectVariableEnum.const_1203);
            this.data.layoutRasterizer.layout = _loc3_;
            this.data.layoutRasterizer.initializeGeometry(param1);
            this.addSprites(this.data.layoutRasterizer.elementCount());
            _loc4_ = 0;
            while(_loc4_ < this.data.layoutRasterizer.elementCount())
            {
               this.data.layoutRasterizer.setElementToSprite(_loc4_,getSprite(_loc4_ + this.var_1248));
               _loc4_++;
            }
            this.data.layoutRasterizer.initializeAds(this.var_1248,this);
         }
         this.var_2325 = true;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         super.update(param1,param2,param3);
         var _loc4_:IRoomObject = object;
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         this.initializeLayout(param1);
         var _loc5_:IRoomObjectModel = object.getModel();
         var _loc6_:String = _loc5_.getString(RoomObjectVariableEnum.const_399);
         var _loc7_:* = !Boolean(_loc5_.getNumber(RoomObjectVariableEnum.const_526));
         if(_loc6_ != "" && this.data != null)
         {
            this.data.layoutRasterizer.showAd(this,_loc6_,_loc7_);
         }
      }
   }
}
