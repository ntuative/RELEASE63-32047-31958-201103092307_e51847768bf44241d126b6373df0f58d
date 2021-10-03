package com.sulake.habbo.messenger
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SendMsgMessageComposer;
   import com.sulake.habbo.messenger.domain.Conversation;
   import com.sulake.habbo.messenger.domain.Message;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class MessengerView implements IDisposable
   {
       
      
      private var var_131:HabboMessenger;
      
      private var var_952:ConversationsTabView;
      
      private var var_953:ITextFieldWindow;
      
      private var var_16:IFrameWindow;
      
      private var var_1451:ConversationView;
      
      private var var_456:Timer;
      
      private var _disposed:Boolean = false;
      
      public function MessengerView(param1:HabboMessenger)
      {
         super();
         this.var_131 = param1;
         this.var_456 = new Timer(300,1);
         this.var_456.addEventListener(TimerEvent.TIMER,this.onResizeTimer);
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_456)
            {
               this.var_456.stop();
               this.var_456.removeEventListener(TimerEvent.TIMER,this.onResizeTimer);
               this.var_456 = null;
            }
            this.var_131 = null;
            this._disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function isMessengerOpen() : Boolean
      {
         return this.var_16 != null && this.var_16.visible;
      }
      
      public function close() : void
      {
         if(this.var_16 != null)
         {
            this.var_16.visible = false;
         }
      }
      
      public function openMessenger() : void
      {
         if(this.var_131.conversations.openConversations.length < 1)
         {
            return;
         }
         if(this.var_16 == null)
         {
            this.prepareContent();
            this.refresh();
            this.var_131.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_53,HabboToolbarIconEnum.MESSENGER,this.var_16));
         }
         else
         {
            this.refresh();
            this.var_16.visible = true;
            this.var_16.activate();
         }
      }
      
      public function refresh() : void
      {
         if(this.var_16 == null)
         {
            return;
         }
         var _loc1_:Conversation = this.var_131.conversations.findSelectedConversation();
         this.var_16.caption = _loc1_ == null ? "" : _loc1_.name;
         this.var_952.refresh();
         this.var_1451.refresh();
         if(this.var_131.conversations.openConversations.length < 1)
         {
            this.var_16.visible = false;
            this.var_131.setHabboToolbarIcon(false,false);
         }
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         if(this.var_16 == null)
         {
            return;
         }
         if(!param1.selected)
         {
            return;
         }
         this.var_1451.addMessage(param2);
      }
      
      private function prepareContent() : void
      {
         this.var_16 = IFrameWindow(this.var_131.getXmlWindow("main_window"));
         var _loc1_:IWindow = this.var_16.findChildByTag("close");
         _loc1_.procedure = this.onWindowClose;
         this.var_16.procedure = this.onWindow;
         this.var_16.title.color = 4294623744;
         this.var_16.title.textColor = 4287851525;
         this.var_952 = new ConversationsTabView(this.var_131,this.var_16);
         this.var_952.refresh();
         this.var_953 = ITextFieldWindow(this.var_16.findChildByName("message_input"));
         this.var_953.addEventListener(WindowKeyboardEvent.const_183,this.onMessageInput);
         this.var_1451 = new ConversationView(this.var_131,this.var_16);
         this.var_16.scaler.setParamFlag(HabboWindowParam.const_698,false);
         this.var_16.scaler.setParamFlag(HabboWindowParam.const_1081,true);
      }
      
      private function onMessageInput(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = param1 as WindowKeyboardEvent;
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            this.sendMsg();
         }
         else
         {
            _loc4_ = 120;
            _loc5_ = this.var_953.text;
            if(_loc5_.length > _loc4_)
            {
               this.var_953.text = _loc5_.substring(0,_loc4_);
            }
         }
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_49 || param2 != this.var_16)
         {
            return;
         }
         if(!this.var_456.running)
         {
            this.var_456.reset();
            this.var_456.start();
         }
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         Logger.log("XXX RESIZE XXX");
         this.var_1451.afterResize();
         this.var_952.refresh();
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.var_16.visible = false;
      }
      
      private function sendMsg() : void
      {
         var _loc1_:String = this.var_953.text;
         Logger.log("Send msg: " + _loc1_);
         if(_loc1_ == "")
         {
            Logger.log("No text...");
            return;
         }
         var _loc2_:Conversation = this.var_131.conversations.findSelectedConversation();
         if(_loc2_ == null)
         {
            Logger.log("No conversation...");
            return;
         }
         this.var_131.send(new SendMsgMessageComposer(_loc2_.id,_loc1_));
         if(_loc2_.messages.length == 1)
         {
            this.var_131.playSendSound();
         }
         this.var_953.text = "";
         this.var_131.conversations.addMessageAndUpdateView(new Message(Message.const_797,_loc2_.id,_loc1_,Util.getFormattedNow()));
      }
      
      public function getTabCount() : int
      {
         return this.var_952 == null ? 7 : int(this.var_952.getTabCount());
      }
   }
}
