package com.sulake.habbo.avatar.torso
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   
   public class TorsoModel extends CategoryBaseModel implements IAvatarEditorCategoryModel
   {
       
      
      public function TorsoModel(param1:HabboAvatarEditor)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         initCategory(FigureData.const_256);
         initCategory(FigureData.const_193);
         initCategory(FigureData.CHEST_ACCESSORIES);
         initCategory(FigureData.const_229);
         var_186 = true;
         if(!var_17)
         {
            var_17 = new TorsoView(this,controller.windowManager,controller.assets);
            if(var_17)
            {
               var_17.init();
            }
         }
      }
   }
}
