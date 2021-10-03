package com.sulake.habbo.room.object.visualization.room.publicroom
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.utils.IRoomGeometry;
   
   public class PublicRoomParkVisualization extends PublicRoomVisualization
   {
       
      
      private var var_1605:Boolean;
      
      public function PublicRoomParkVisualization()
      {
         super();
         this.var_1605 = false;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         var _loc8_:* = null;
         var _loc9_:int = 0;
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
         var _loc5_:IRoomObjectModel = object.getModel();
         var _loc6_:int = _loc5_.getNumber(RoomObjectVariableEnum.const_1080);
         var _loc7_:Boolean = Boolean(_loc6_);
         if(data != null)
         {
            if(this.var_1605 != _loc7_)
            {
               _loc8_ = "";
               if(_loc7_)
               {
                  data.layoutRasterizer.changeElementAlpha("bus",0);
                  data.layoutRasterizer.changeElementAlpha("bus_oviopen_hidden",255);
               }
               else
               {
                  data.layoutRasterizer.changeElementAlpha("bus",255);
                  data.layoutRasterizer.changeElementAlpha("bus_oviopen_hidden",0);
               }
               this.var_1605 = _loc7_;
            }
            if(data.layoutRasterizer.graphicsChanged)
            {
               _loc9_ = 0;
               while(_loc9_ < data.layoutRasterizer.elementCount())
               {
                  data.layoutRasterizer.setElementToSprite(_loc9_,getSprite(_loc9_ + var_1248));
                  _loc9_++;
               }
            }
         }
      }
   }
}
