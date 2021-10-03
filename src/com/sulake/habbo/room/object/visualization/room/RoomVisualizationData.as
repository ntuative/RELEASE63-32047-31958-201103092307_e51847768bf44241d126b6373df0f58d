package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_480:WallRasterizer;
      
      private var var_479:FloorRasterizer;
      
      private var var_716:WallAdRasterizer;
      
      private var var_478:LandscapeRasterizer;
      
      private var var_717:PlaneMaskManager;
      
      private var var_788:Boolean = false;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_480 = new WallRasterizer();
         this.var_479 = new FloorRasterizer();
         this.var_716 = new WallAdRasterizer();
         this.var_478 = new LandscapeRasterizer();
         this.var_717 = new PlaneMaskManager();
      }
      
      public function get initialized() : Boolean
      {
         return this.var_788;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_479;
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_480;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_716;
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_478;
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_717;
      }
      
      public function dispose() : void
      {
         if(this.var_480 != null)
         {
            this.var_480.dispose();
            this.var_480 = null;
         }
         if(this.var_479 != null)
         {
            this.var_479.dispose();
            this.var_479 = null;
         }
         if(this.var_716 != null)
         {
            this.var_716.dispose();
            this.var_716 = null;
         }
         if(this.var_478 != null)
         {
            this.var_478.dispose();
            this.var_478 = null;
         }
         if(this.var_717 != null)
         {
            this.var_717.dispose();
            this.var_717 = null;
         }
      }
      
      public function clearCache() : void
      {
         if(this.var_480 != null)
         {
            this.var_480.clearCache();
         }
         if(this.var_479 != null)
         {
            this.var_479.clearCache();
         }
         if(this.var_478 != null)
         {
            this.var_478.clearCache();
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_480.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_479.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_716.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_478.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_717.initialize(_loc11_);
         }
         return true;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_788)
         {
            return;
         }
         this.var_480.initializeAssetCollection(param1);
         this.var_479.initializeAssetCollection(param1);
         this.var_716.initializeAssetCollection(param1);
         this.var_478.initializeAssetCollection(param1);
         this.var_717.initializeAssetCollection(param1);
         this.var_788 = true;
      }
      
      protected function reset() : void
      {
      }
   }
}
