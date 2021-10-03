package com.sulake.habbo.moderation
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.ChatlineData;
   import com.sulake.habbo.communication.messages.incoming.moderation.RoomChatlogData;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class ChatlogCtrl implements IDisposable, TrackedWindow
   {
      
      private static var var_848:Array = [];
      
      private static var var_1601:int = 1000;
      
      private static var var_847:Array = [];
      
      private static var var_1603:int = 200;
       
      
      private var _type:int;
      
      private var _id:int;
      
      private var var_1602:IMessageComposer;
      
      private var var_34:ModerationManager;
      
      private var _frame:IFrameWindow;
      
      private var var_60:IItemListWindow;
      
      private var var_113:Array;
      
      private var _disposed:Boolean;
      
      private var var_695:IWindowContainer;
      
      private var var_694:IWindowContainer;
      
      private var var_1604:Dictionary;
      
      private var var_456:Timer;
      
      private var var_1299:Map;
      
      private var var_1298:Array;
      
      private var var_1300:Array;
      
      public function ChatlogCtrl(param1:IMessageComposer, param2:ModerationManager, param3:int, param4:int)
      {
         this.var_1298 = [];
         this.var_1300 = [];
         super();
         this.var_34 = param2;
         this._type = param3;
         this._id = param4;
         this.var_1602 = param1;
         this.var_1299 = new Map();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function show() : void
      {
         this.var_695 = IWindowContainer(this.var_34.getXmlWindow("chatlog_roomheader"));
         this.var_694 = IWindowContainer(this.var_34.getXmlWindow("chatlog_chatline"));
         this.var_456 = new Timer(1000,1);
         this.var_456.addEventListener(TimerEvent.TIMER,this.onResizeTimer);
         this._frame = IFrameWindow(this.var_34.getXmlWindow("chatlog_frame"));
         this.var_60 = IItemListWindow(this._frame.findChildByName("chatline_list"));
         this._frame.procedure = this.onWindow;
         var _loc1_:IWindow = this._frame.findChildByTag("close");
         _loc1_.procedure = this.onClose;
         this.var_34.connection.send(this.var_1602);
         this.var_34.messageHandler.addChatlogListener(this);
      }
      
      public function onChatlog(param1:String, param2:int, param3:int, param4:Array, param5:Dictionary) : void
      {
         if(param2 != this._type || param3 != this._id || this._disposed)
         {
            return;
         }
         this.var_34.messageHandler.removeChatlogListener(this);
         this._frame.caption = param1;
         this.var_113 = param4;
         this.var_1604 = param5;
         this.populate();
         this.onResizeTimer(null);
         this._frame.visible = true;
      }
      
      public function getType() : int
      {
         return this._type;
      }
      
      public function getId() : String
      {
         return "" + this._id;
      }
      
      public function getFrame() : IFrameWindow
      {
         return this._frame;
      }
      
      private function populate() : void
      {
         var _loc1_:* = null;
         this.var_60.autoArrangeItems = false;
         for each(_loc1_ in this.var_113)
         {
            this.populateRoomChat(_loc1_);
         }
         this.var_60.autoArrangeItems = true;
      }
      
      private function populateRoomChat(param1:RoomChatlogData) : void
      {
         var _loc5_:* = null;
         var _loc2_:IWindowContainer = this.getChatHeaderWindow();
         var _loc3_:ITextWindow = ITextWindow(_loc2_.findChildByName("room_name_txt"));
         if(param1.roomId > 0)
         {
            _loc3_.caption = param1.roomName;
            _loc3_.underline = true;
            new OpenRoomTool(this._frame,this.var_34,_loc3_,param1.isPublic,param1.roomId);
         }
         else
         {
            _loc3_.caption = "Not in room";
            _loc3_.underline = false;
         }
         this.addHeaderLineToList(_loc2_,this.var_60);
         var _loc4_:* = true;
         for each(_loc5_ in param1.chatlog)
         {
            this.populateChatline(this.var_60,_loc5_,_loc4_);
            _loc4_ = !_loc4_;
         }
      }
      
      private function addChatLineToList(param1:IWindowContainer, param2:IItemListWindow) : void
      {
         param2.addListItem(param1);
         this.var_1298.push(param1);
      }
      
      private function addHeaderLineToList(param1:IWindowContainer, param2:IItemListWindow) : void
      {
         param2.addListItem(param1);
         this.var_1300.push(param1);
      }
      
      private function getChatLineWindow() : IWindowContainer
      {
         if(false)
         {
            return var_848.pop() as IWindowContainer;
         }
         return IWindowContainer(this.var_694.clone());
      }
      
      private function storeChatLineWindow(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         if(var_848.length < var_1601)
         {
            _loc2_ = ITextWindow(param1.findChildByName("chatter_txt"));
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onChatLogUserClick);
            param1.width = this.var_694.width;
            param1.height = this.var_694.height;
            var_848.push(param1);
         }
         else
         {
            param1.dispose();
         }
      }
      
      private function getChatHeaderWindow() : IWindowContainer
      {
         if(false)
         {
            return var_847.pop() as IWindowContainer;
         }
         return IWindowContainer(this.var_695.clone());
      }
      
      private function storeChatHeaderWindow(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         if(var_847.length < var_1603)
         {
            _loc2_ = ITextWindow(param1.findChildByName("room_name_txt"));
            _loc2_.procedure = null;
            param1.width = this.var_695.width;
            param1.height = this.var_695.height;
            var_847.push(param1);
         }
         else
         {
            param1.dispose();
         }
      }
      
      private function populateChatline(param1:IItemListWindow, param2:ChatlineData, param3:Boolean) : void
      {
         var _loc4_:IWindowContainer = this.getChatLineWindow();
         _loc4_.color = this.var_1604[param2.chatterId] != null ? (!!param3 ? 4294623571 : uint(4294959680)) : (!!param3 ? 4288861930 : uint(4294967295));
         var _loc5_:ITextWindow = ITextWindow(_loc4_.findChildByName("time_txt"));
         _loc5_.text = RoomVisitsCtrl.getFormattedTime(param2.hour,param2.minute);
         var _loc6_:ITextWindow = ITextWindow(_loc4_.findChildByName("chatter_txt"));
         _loc6_.color = _loc4_.color;
         if(param2.chatterId > 0)
         {
            _loc6_.text = param2.chatterName;
            _loc6_.underline = true;
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onChatLogUserClick);
            if(!this.var_1299.getValue(param2.chatterName))
            {
               this.var_1299.add(param2.chatterName,param2.chatterId);
            }
         }
         else if(param2.chatterId == 0)
         {
            _loc6_.text = "Bot / pet";
            _loc6_.underline = false;
         }
         else
         {
            _loc6_.text = "-";
            _loc6_.underline = false;
         }
         var _loc7_:ITextWindow = ITextWindow(_loc4_.findChildByName("msg_txt"));
         _loc7_.text = param2.msg;
         _loc7_.height = _loc7_.textHeight + 5;
         _loc4_.height = _loc7_.height;
         this.addChatLineToList(_loc4_,param1);
      }
      
      private function onChatLogUserClick(param1:WindowMouseEvent) : void
      {
         var _loc2_:String = param1.target.caption;
         var _loc3_:int = this.var_1299.getValue(_loc2_);
         this.var_34.windowTracker.show(new UserInfoFrameCtrl(this.var_34,_loc3_),this._frame,false,false,true);
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.dispose();
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_49 || param2 != this._frame)
         {
            return;
         }
         this.var_456.reset();
         this.var_456.start();
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         this.refreshListDims();
         var _loc2_:Boolean = this.refreshScrollBarVisibility();
      }
      
      private function refreshListDims() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         this.var_60.autoArrangeItems = false;
         var _loc3_:int = this.var_60.numListItems;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = IWindowContainer(this.var_60.getListItemAt(_loc4_));
            if(_loc1_.name == "chatline")
            {
               _loc2_ = ITextWindow(_loc1_.findChildByName("msg_txt"));
               _loc2_.width = _loc1_.width - _loc2_.x;
               _loc2_.height = _loc2_.textHeight + 5;
               _loc1_.height = _loc2_.height;
            }
            _loc4_++;
         }
         this.var_60.autoArrangeItems = true;
      }
      
      private function refreshScrollBarVisibility() : Boolean
      {
         var _loc1_:IWindowContainer = IWindowContainer(this.var_60.parent);
         var _loc2_:IWindow = _loc1_.getChildByName("scroller") as IWindow;
         var _loc3_:* = this.var_60.scrollableRegion.height > this.var_60.height;
         if(_loc2_.visible)
         {
            if(_loc3_)
            {
               return false;
            }
            _loc2_.visible = false;
            this.var_60.width += 22;
            return true;
         }
         if(_loc3_)
         {
            _loc2_.visible = true;
            this.var_60.width -= 22;
            return true;
         }
         return false;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_34 = null;
         this.var_1602 = null;
         if(this.var_60 != null)
         {
            this.var_60.removeListItems();
            this.var_60.dispose();
            this.var_60 = null;
         }
         if(this._frame != null)
         {
            this._frame.destroy();
            this._frame = null;
         }
         this.var_113 = null;
         this.var_1604 = null;
         if(this.var_456 != null)
         {
            this.var_456.stop();
            this.var_456.removeEventListener(TimerEvent.TIMER,this.onResizeTimer);
            this.var_456 = null;
         }
         for each(_loc1_ in this.var_1298)
         {
            this.storeChatLineWindow(_loc1_);
         }
         for each(_loc1_ in this.var_1300)
         {
            this.storeChatHeaderWindow(_loc1_);
         }
         this.var_1298 = [];
         this.var_1300 = [];
         if(this.var_695 != null)
         {
            this.var_695.dispose();
            this.var_695 = null;
         }
         if(this.var_694 != null)
         {
            this.var_694.dispose();
            this.var_694 = null;
         }
      }
   }
}
