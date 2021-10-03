package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IOutfit;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class WardrobeSlot implements IOutfit, IAvatarImageListener
   {
       
      
      private var _controller:HabboAvatarEditor;
      
      private var _figure:String;
      
      private var var_971:String;
      
      private var var_1475:Boolean;
      
      private var var_17:IWindowContainer;
      
      private var var_379:IBitmapWrapperWindow;
      
      private var var_1908:int;
      
      private var var_693:Boolean;
      
      public function WardrobeSlot(param1:HabboAvatarEditor, param2:int, param3:Boolean, param4:String = null, param5:String = null)
      {
         super();
         this._controller = param1;
         this.var_1908 = param2;
         this.createView();
         this.update(param4,param5,param3);
      }
      
      public function get id() : int
      {
         return this.var_1908;
      }
      
      public function update(param1:String, param2:String, param3:Boolean) : void
      {
         switch(param2)
         {
            case FigureData.const_79:
            case "m":
            case "M":
               param2 = "null";
               break;
            case FigureData.FEMALE:
            case "f":
            case "F":
               param2 = "null";
         }
         this._figure = param1;
         this.var_971 = param2;
         this.var_1475 = param3;
         this.updateView();
      }
      
      private function createView() : void
      {
         var _loc1_:XmlAsset = this._controller.assets.getAssetByName("wardrobe_slot") as XmlAsset;
         if(!_loc1_)
         {
            return;
         }
         this.var_17 = this._controller.windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
         this.var_17.procedure = this.eventHandler;
         this.var_17.visible = false;
         this.var_379 = this.var_17.findChildByName("image") as IBitmapWrapperWindow;
      }
      
      public function dispose() : void
      {
         this._controller = null;
         this._figure = null;
         this.var_971 = null;
         this.var_379 = null;
         if(this.var_17)
         {
            this.var_17.dispose();
            this.var_17 = null;
         }
         this.var_693 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_693;
      }
      
      public function updateView() : void
      {
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Boolean = true;
         if(this._figure && this.var_1475)
         {
            _loc5_ = this._controller.avatarRenderManager.createAvatarImage(this.figure,AvatarScaleType.const_92,this.var_971,this);
            if(_loc5_)
            {
               _loc5_.setDirection(AvatarSetType.const_35,parseInt(FigureData.const_821));
               _loc1_ = _loc5_.getCroppedImage(AvatarSetType.const_35);
               _loc5_.dispose();
            }
         }
         else
         {
            _loc6_ = this._controller.assets.getAssetByName("wardrobe_empty_slot") as BitmapDataAsset;
            if(_loc6_)
            {
               _loc1_ = _loc6_.content as BitmapData;
               _loc2_ = false;
            }
         }
         if(!_loc1_)
         {
            return;
         }
         if(this.var_379)
         {
            if(this.var_379.bitmap)
            {
               this.var_379.bitmap.dispose();
            }
            this.var_379.bitmap = new BitmapData(this.var_379.width,this.var_379.height,true,0);
            _loc7_ = (this.var_379.width - _loc1_.width) / 2;
            _loc8_ = (this.var_379.height - _loc1_.height) / 2;
            this.var_379.bitmap.draw(_loc1_,new Matrix(1,0,0,1,_loc7_,_loc8_));
         }
         if(_loc2_)
         {
            _loc1_.dispose();
         }
         var _loc3_:IContainerButtonWindow = this.var_17.findChildByName("set_button") as IContainerButtonWindow;
         if(_loc3_)
         {
            _loc3_.visible = this.var_1475;
         }
         var _loc4_:IContainerButtonWindow = this.var_17.findChildByName("get_button") as IContainerButtonWindow;
         if(_loc4_)
         {
            _loc4_.visible = this.var_1475 && this._figure != null;
         }
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "set_button":
               this._figure = this._controller.figureData.getFigureString();
               this.var_971 = this._controller.gender;
               this._controller.handler.saveWardrobeOutfit(this.var_1908,this);
               this.updateView();
               break;
            case "get_button":
               if(this._figure)
               {
                  this._controller.loadAvatarInEditor(this._figure,this.var_971,this._controller.clubMemberLevel);
               }
         }
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get gender() : String
      {
         return this.var_971;
      }
      
      public function get view() : IWindowContainer
      {
         return this.var_17;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.updateView();
      }
   }
}
