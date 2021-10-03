package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_859;
         param1["bitmap"] = const_758;
         param1["border"] = const_838;
         param1["border_notify"] = const_1521;
         param1["button"] = const_448;
         param1["button_thick"] = const_680;
         param1["button_icon"] = const_1489;
         param1["button_group_left"] = const_783;
         param1["button_group_center"] = const_897;
         param1["button_group_right"] = const_849;
         param1["canvas"] = const_900;
         param1["checkbox"] = const_768;
         param1["closebutton"] = const_1067;
         param1["container"] = const_345;
         param1["container_button"] = const_764;
         param1["display_object_wrapper"] = const_790;
         param1["dropmenu"] = const_523;
         param1["dropmenu_item"] = const_563;
         param1["frame"] = const_388;
         param1["frame_notify"] = const_1432;
         param1["header"] = const_760;
         param1["html"] = const_1196;
         param1["icon"] = const_1005;
         param1["itemgrid"] = const_1103;
         param1["itemgrid_horizontal"] = const_490;
         param1["itemgrid_vertical"] = const_815;
         param1["itemlist"] = const_1221;
         param1["itemlist_horizontal"] = const_337;
         param1["itemlist_vertical"] = const_341;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1469;
         param1["menu"] = const_1559;
         param1["menu_item"] = const_1504;
         param1["submenu"] = const_1059;
         param1["minimizebox"] = const_1467;
         param1["notify"] = const_1395;
         param1["null"] = const_796;
         param1["password"] = const_852;
         param1["radiobutton"] = const_634;
         param1["region"] = const_581;
         param1["restorebox"] = const_1578;
         param1["scaler"] = const_766;
         param1["scaler_horizontal"] = const_1567;
         param1["scaler_vertical"] = const_1659;
         param1["scrollbar_horizontal"] = const_536;
         param1["scrollbar_vertical"] = const_734;
         param1["scrollbar_slider_button_up"] = const_1019;
         param1["scrollbar_slider_button_down"] = const_1178;
         param1["scrollbar_slider_button_left"] = const_1185;
         param1["scrollbar_slider_button_right"] = const_1131;
         param1["scrollbar_slider_bar_horizontal"] = const_1177;
         param1["scrollbar_slider_bar_vertical"] = const_1229;
         param1["scrollbar_slider_track_horizontal"] = const_996;
         param1["scrollbar_slider_track_vertical"] = const_1064;
         param1["scrollable_itemlist"] = const_1497;
         param1["scrollable_itemlist_vertical"] = const_442;
         param1["scrollable_itemlist_horizontal"] = const_994;
         param1["selector"] = const_812;
         param1["selector_list"] = const_704;
         param1["submenu"] = const_1059;
         param1["tab_button"] = const_557;
         param1["tab_container_button"] = const_1006;
         param1["tab_context"] = const_460;
         param1["tab_content"] = const_1142;
         param1["tab_selector"] = const_637;
         param1["text"] = const_584;
         param1["input"] = const_876;
         param1["toolbar"] = const_1414;
         param1["tooltip"] = const_351;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
