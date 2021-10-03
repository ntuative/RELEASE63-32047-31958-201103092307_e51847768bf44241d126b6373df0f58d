package com.sulake.habbo.avatar.legs
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.common.AvatarEditorGridView;
   import com.sulake.habbo.avatar.common.CategoryBaseView;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.utils.Dictionary;
   
   public class LegsView extends CategoryBaseView implements IAvatarEditorCategoryView
   {
       
      
      public function LegsView(param1:IAvatarEditorCategoryModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super(param2,param3,param1);
      }
      
      override public function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!_window)
         {
            _loc1_ = _assetLibrary.getAssetByName("avatareditor_legs_base") as XmlAsset;
            if(_loc1_)
            {
               _window = IWindowContainer(_windowManager.buildFromXML(_loc1_.content as XML));
               _window.visible = false;
               _window.procedure = this.windowEventProc;
            }
         }
         if(!var_38)
         {
            var_38 = new Dictionary();
            var_38["null"] = new AvatarEditorGridView(var_67,FigureData.TROUSERS,_windowManager,_assetLibrary);
            var_38["null"] = new AvatarEditorGridView(var_67,FigureData.const_268,_windowManager,_assetLibrary);
            var_38["null"] = new AvatarEditorGridView(var_67,FigureData.const_255,_windowManager,_assetLibrary);
         }
         else
         {
            for each(_loc2_ in var_38)
            {
               _loc2_.initFromList();
            }
         }
         var_186 = true;
         attachImages();
         if(var_67 && var_137 == "")
         {
            var_67.switchCategory(FigureData.TROUSERS);
         }
      }
      
      public function switchCategory(param1:String) : void
      {
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         if(var_137 == param1)
         {
            return;
         }
         inactivateTab(var_46);
         switch(param1)
         {
            case FigureData.TROUSERS:
               var_46 = "tab_pants";
               break;
            case FigureData.const_268:
               var_46 = "tab_shoes";
               break;
            case FigureData.const_255:
               var_46 = "tab_belts";
               break;
            default:
               throw new Error("[LegsView] Unknown item category: \"" + param1 + "\"");
         }
         var_137 = param1;
         activateTab(var_46);
         if(!var_186)
         {
            this.init();
         }
         updateGridView();
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "tab_pants":
                  this.switchCategory(FigureData.TROUSERS);
                  break;
               case "tab_shoes":
                  this.switchCategory(FigureData.const_268);
                  break;
               case "tab_belts":
                  this.switchCategory(FigureData.const_255);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            switch(param2.name)
            {
               case "tab_pants":
               case "tab_shoes":
               case "tab_belts":
                  activateTab(param2.name);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OUT)
         {
            switch(param2.name)
            {
               case "tab_pants":
               case "tab_shoes":
               case "tab_belts":
                  if(var_46 != param2.name)
                  {
                     inactivateTab(param2.name);
                  }
            }
         }
      }
   }
}