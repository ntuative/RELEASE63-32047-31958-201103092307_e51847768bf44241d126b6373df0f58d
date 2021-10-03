package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_204;
         param1["bound_to_parent_rect"] = const_94;
         param1["child_window"] = const_1035;
         param1["embedded_controller"] = const_1014;
         param1["resize_to_accommodate_children"] = const_72;
         param1["input_event_processor"] = const_30;
         param1["internal_event_handling"] = const_749;
         param1["mouse_dragging_target"] = const_235;
         param1["mouse_dragging_trigger"] = const_353;
         param1["mouse_scaling_target"] = const_323;
         param1["mouse_scaling_trigger"] = const_455;
         param1["horizontal_mouse_scaling_trigger"] = const_242;
         param1["vertical_mouse_scaling_trigger"] = const_248;
         param1["observe_parent_input_events"] = const_1099;
         param1["optimize_region_to_layout_size"] = const_457;
         param1["parent_window"] = const_1060;
         param1["relative_horizontal_scale_center"] = const_203;
         param1["relative_horizontal_scale_fixed"] = const_138;
         param1["relative_horizontal_scale_move"] = const_393;
         param1["relative_horizontal_scale_strech"] = const_363;
         param1["relative_scale_center"] = const_1134;
         param1["relative_scale_fixed"] = const_793;
         param1["relative_scale_move"] = const_1231;
         param1["relative_scale_strech"] = const_1183;
         param1["relative_vertical_scale_center"] = const_198;
         param1["relative_vertical_scale_fixed"] = const_134;
         param1["relative_vertical_scale_move"] = const_386;
         param1["relative_vertical_scale_strech"] = const_318;
         param1["on_resize_align_left"] = const_669;
         param1["on_resize_align_right"] = const_502;
         param1["on_resize_align_center"] = const_472;
         param1["on_resize_align_top"] = const_624;
         param1["on_resize_align_bottom"] = const_501;
         param1["on_resize_align_middle"] = const_477;
         param1["on_accommodate_align_left"] = const_1126;
         param1["on_accommodate_align_right"] = const_569;
         param1["on_accommodate_align_center"] = const_841;
         param1["on_accommodate_align_top"] = const_1062;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_901;
         param1["route_input_events_to_parent"] = const_545;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_989;
         param1["scalable_with_mouse"] = const_1116;
         param1["reflect_horizontal_resize_to_parent"] = const_458;
         param1["reflect_vertical_resize_to_parent"] = const_426;
         param1["reflect_resize_to_parent"] = const_303;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1200;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
