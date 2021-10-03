package com.sulake.habbo.quest
{
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class QuestUtils
   {
       
      
      public function QuestUtils()
      {
         super();
      }
      
      public static function setElementImage(param1:IBitmapWrapperWindow, param2:BitmapData, param3:int = 0) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param1.disposed)
         {
            return;
         }
         var _loc4_:int = param3 > 0 ? int(param3) : int(param1.height);
         var _loc5_:int = (param1.width - param2.width) / 2;
         var _loc6_:int = (_loc4_ - param2.height) / 2;
         if(param1.bitmap == null || param3 > 0)
         {
            param1.bitmap = new BitmapData(param1.width,_loc4_,true,16777215);
         }
         param1.bitmap.fillRect(param1.bitmap.rect,16777215);
         param1.bitmap.copyPixels(param2,param2.rect,new Point(_loc5_,_loc6_),null,null,false);
         param1.invalidate();
      }
   }
}
