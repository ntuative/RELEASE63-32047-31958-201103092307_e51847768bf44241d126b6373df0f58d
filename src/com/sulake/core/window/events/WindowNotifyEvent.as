package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1473:String = "WN_CRETAE";
      
      public static const const_1637:String = "WN_CREATED";
      
      public static const const_1222:String = "WN_DESTROY";
      
      public static const const_1012:String = "WN_DESTROYED";
      
      public static const const_1114:String = "WN_OPEN";
      
      public static const const_1132:String = "WN_OPENED";
      
      public static const const_1095:String = "WN_CLOSE";
      
      public static const const_1218:String = "WN_CLOSED";
      
      public static const const_1139:String = "WN_FOCUS";
      
      public static const const_1117:String = "WN_FOCUSED";
      
      public static const const_1074:String = "WN_UNFOCUS";
      
      public static const const_1017:String = "WN_UNFOCUSED";
      
      public static const const_1039:String = "WN_ACTIVATE";
      
      public static const const_392:String = "WN_ACTVATED";
      
      public static const const_1158:String = "WN_DEACTIVATE";
      
      public static const const_1077:String = "WN_DEACTIVATED";
      
      public static const const_484:String = "WN_SELECT";
      
      public static const const_352:String = "WN_SELECTED";
      
      public static const const_817:String = "WN_UNSELECT";
      
      public static const const_894:String = "WN_UNSELECTED";
      
      public static const const_1206:String = "WN_LOCK";
      
      public static const const_1073:String = "WN_LOCKED";
      
      public static const const_1215:String = "WN_UNLOCK";
      
      public static const const_1007:String = "WN_UNLOCKED";
      
      public static const const_1043:String = "WN_ENABLE";
      
      public static const const_726:String = "WN_ENABLED";
      
      public static const const_1093:String = "WN_DISABLE";
      
      public static const const_833:String = "WN_DISABLED";
      
      public static const const_684:String = "WN_RESIZE";
      
      public static const const_189:String = "WN_RESIZED";
      
      public static const const_1217:String = "WN_RELOCATE";
      
      public static const const_554:String = "WN_RELOCATED";
      
      public static const const_1111:String = "WN_MINIMIZE";
      
      public static const const_1152:String = "WN_MINIMIZED";
      
      public static const const_1147:String = "WN_MAXIMIZE";
      
      public static const const_997:String = "WN_MAXIMIZED";
      
      public static const const_1071:String = "WN_RESTORE";
      
      public static const const_987:String = "WN_RESTORED";
      
      public static const const_1919:String = "WN_ARRANGE";
      
      public static const const_1854:String = "WN_ARRANGED";
      
      public static const const_1872:String = "WN_UPDATE";
      
      public static const const_1815:String = "WN_UPDATED";
      
      public static const const_408:String = "WN_CHILD_ADDED";
      
      public static const const_858:String = "WN_CHILD_REMOVED";
      
      public static const const_286:String = "WN_CHILD_RESIZED";
      
      public static const const_320:String = "WN_CHILD_RELOCATED";
      
      public static const const_246:String = "WN_CHILD_ACTIVATED";
      
      public static const const_531:String = "WN_PARENT_ADDED";
      
      public static const const_1047:String = "WN_PARENT_REMOVED";
      
      public static const const_538:String = "WN_PARENT_RESIZED";
      
      public static const const_1174:String = "WN_PARENT_RELOCATED";
      
      public static const const_795:String = "WN_PARENT_ACTIVATED";
      
      public static const const_464:String = "WN_STATE_UPDATED";
      
      public static const const_515:String = "WN_STYLE_UPDATED";
      
      public static const const_500:String = "WN_PARAM_UPDATED";
      
      public static const const_1768:String = "";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_2025,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
