package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1396:String = "WE_CREATE";
      
      public static const const_1446:String = "WE_CREATED";
      
      public static const const_1562:String = "WE_DESTROY";
      
      public static const const_292:String = "WE_DESTROYED";
      
      public static const const_1575:String = "WE_OPEN";
      
      public static const const_1519:String = "WE_OPENED";
      
      public static const const_1573:String = "WE_CLOSE";
      
      public static const const_1587:String = "WE_CLOSED";
      
      public static const const_1558:String = "WE_FOCUS";
      
      public static const const_298:String = "WE_FOCUSED";
      
      public static const const_1397:String = "WE_UNFOCUS";
      
      public static const const_1574:String = "WE_UNFOCUSED";
      
      public static const const_1535:String = "WE_ACTIVATE";
      
      public static const const_1614:String = "WE_ACTIVATED";
      
      public static const const_1640:String = "WE_DEACTIVATE";
      
      public static const const_807:String = "WE_DEACTIVATED";
      
      public static const const_476:String = "WE_SELECT";
      
      public static const const_59:String = "WE_SELECTED";
      
      public static const const_874:String = "WE_UNSELECT";
      
      public static const const_840:String = "WE_UNSELECTED";
      
      public static const const_1960:String = "WE_ATTACH";
      
      public static const const_1820:String = "WE_ATTACHED";
      
      public static const const_1852:String = "WE_DETACH";
      
      public static const const_1900:String = "WE_DETACHED";
      
      public static const const_1382:String = "WE_LOCK";
      
      public static const const_1570:String = "WE_LOCKED";
      
      public static const const_1417:String = "WE_UNLOCK";
      
      public static const const_1602:String = "WE_UNLOCKED";
      
      public static const const_700:String = "WE_ENABLE";
      
      public static const const_280:String = "WE_ENABLED";
      
      public static const const_809:String = "WE_DISABLE";
      
      public static const const_228:String = "WE_DISABLED";
      
      public static const const_1453:String = "WE_RELOCATE";
      
      public static const const_364:String = "WE_RELOCATED";
      
      public static const const_1506:String = "WE_RESIZE";
      
      public static const const_49:String = "WE_RESIZED";
      
      public static const const_1451:String = "WE_MINIMIZE";
      
      public static const const_1483:String = "WE_MINIMIZED";
      
      public static const const_1392:String = "WE_MAXIMIZE";
      
      public static const const_1438:String = "WE_MAXIMIZED";
      
      public static const const_1584:String = "WE_RESTORE";
      
      public static const const_1621:String = "WE_RESTORED";
      
      public static const const_1951:String = "WE_ARRANGE";
      
      public static const const_1922:String = "WE_ARRANGED";
      
      public static const const_110:String = "WE_UPDATE";
      
      public static const const_1802:String = "WE_UPDATED";
      
      public static const const_1858:String = "WE_CHILD_RELOCATE";
      
      public static const const_494:String = "WE_CHILD_RELOCATED";
      
      public static const const_1787:String = "WE_CHILD_RESIZE";
      
      public static const const_325:String = "WE_CHILD_RESIZED";
      
      public static const const_1818:String = "WE_CHILD_REMOVE";
      
      public static const const_575:String = "WE_CHILD_REMOVED";
      
      public static const const_1865:String = "WE_PARENT_RELOCATE";
      
      public static const const_1790:String = "WE_PARENT_RELOCATED";
      
      public static const const_1749:String = "WE_PARENT_RESIZE";
      
      public static const const_1447:String = "WE_PARENT_RESIZED";
      
      public static const const_187:String = "WE_OK";
      
      public static const const_782:String = "WE_CANCEL";
      
      public static const const_109:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_427:String = "WE_SCROLL";
      
      public static const const_158:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_2025:IWindow;
      
      protected var var_2026:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_2025 = param3;
         this.var_2026 = false;
         super(param1,param4,param5);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_2025;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_2026 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_2026;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}
