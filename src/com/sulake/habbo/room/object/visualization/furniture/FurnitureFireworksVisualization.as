package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.utils.Dictionary;
   
   public class FurnitureFireworksVisualization extends AnimatedFurnitureVisualization
   {
       
      
      private var var_552:Dictionary;
      
      private var var_212:FurnitureParticleSystem;
      
      public function FurnitureFireworksVisualization()
      {
         super();
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         super.dispose();
         this.var_212 = null;
         if(this.var_552)
         {
            for each(_loc1_ in this.var_552)
            {
               _loc1_.dispose();
            }
            this.var_552 = null;
         }
      }
      
      override protected function updateObject(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Boolean = false;
         if(super.updateObject(param1,param2))
         {
            _loc3_ = false;
            if(!this.var_552)
            {
               this.readDefinition();
               this.var_212 = this.var_552[param1];
               _loc3_ = true;
            }
            else if(param1 != var_188)
            {
               if(this.var_212)
               {
                  this.var_212.reset();
               }
               this.var_212 = this.var_552[param1];
               _loc3_ = true;
            }
            return true;
         }
         return false;
      }
      
      override protected function updateSprites(param1:int, param2:Boolean, param3:Array) : void
      {
         super.updateSprites(param1,param2,param3);
         if(this.var_212)
         {
            this.var_212.updateSprites();
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(this.var_212)
         {
            this.var_212.updateAnimation();
         }
         return super.updateAnimation(param1);
      }
      
      override protected function method_2(param1:int) : void
      {
         if(this.var_212)
         {
            this.var_212.method_2(param1);
         }
         super.method_2(param1);
      }
      
      override protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         if(this.var_212 && this.var_212.controlsSprite(param3))
         {
            return this.var_212.getSpriteYOffset(param1,param2,param3);
         }
         return super.getSpriteYOffset(param1,param2,param3);
      }
      
      private function readDefinition() : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc1_:IRoomObject = object;
         if(_loc1_ == null)
         {
            return false;
         }
         var _loc2_:IRoomObjectModel = _loc1_.getModel();
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:String = _loc2_.getString(RoomObjectVariableEnum.const_1144);
         if(_loc3_.length == 0)
         {
            Logger.log("No Particle System Data Found.");
            return false;
         }
         var _loc4_:XML = XML(_loc3_);
         this.var_552 = new Dictionary();
         for each(_loc7_ in _loc4_.particlesystem)
         {
            if(!_loc7_.hasOwnProperty("@size"))
            {
               Logger.log("Particle System does not have size property!");
            }
            else
            {
               _loc6_ = _loc7_.@size;
               _loc5_ = new FurnitureParticleSystem(this);
               _loc5_.parseData(_loc7_);
               this.var_552[_loc6_] = _loc5_;
            }
         }
         return true;
      }
   }
}
