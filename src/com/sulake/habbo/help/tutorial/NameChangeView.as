package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.help.INameChangeUI;
   
   public class NameChangeView
   {
      
      private static var var_1351:uint = 13232628;
      
      private static var var_1677:uint = 11129827;
       
      
      private var _controller:INameChangeUI;
      
      private var _window:IFrameWindow;
      
      private var var_482:String;
      
      private var var_1675:String;
      
      private var var_1676:IWindowContainer;
      
      private var var_720:IWindowContainer;
      
      private var var_721:IWindowContainer;
      
      private var var_44:IWindowContainer;
      
      private var var_1352:Boolean = false;
      
      private var var_1095:NameSuggestionListRenderer;
      
      public function NameChangeView(param1:INameChangeUI)
      {
         super();
         this._controller = param1;
      }
      
      public function get id() : String
      {
         return TutorialUI.const_294;
      }
      
      public function set checkedName(param1:String) : void
      {
         this.var_482 = param1;
         if(this.var_1675 == this.var_482)
         {
            this.showConfirmationView();
            return;
         }
         this.setNameAvailableView();
      }
      
      public function dispose() : void
      {
         this.disposeWindow();
         if(this.var_1095 != null)
         {
            this.var_1095.dispose();
            this.var_1095 = null;
         }
      }
      
      private function disposeWindow() : void
      {
         this.var_1676 = null;
         this.var_720 = null;
         this.var_721 = null;
         this.var_44 = null;
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      private function showView(param1:IWindowContainer) : void
      {
         this.var_1352 = false;
         if(this.var_44)
         {
            this.var_44.visible = false;
         }
         this.var_44 = param1;
         this.var_44.visible = true;
         if(this._window)
         {
            this._window.content.width = this.var_44.width;
            this._window.content.height = this.var_44.height;
         }
      }
      
      public function showMainView() : void
      {
         if(!this._window)
         {
            this._window = this._controller.buildXmlWindow("welcome_name_change") as IFrameWindow;
            this._window.center();
            this._window.procedure = this.windowEventHandler;
            this.var_1676 = this._window.content.getChildAt(0) as IWindowContainer;
         }
         this._controller.localization.registerParameter("tutorial.name_change.current","name",this._controller.myName);
         this._window.caption = this._controller.localization.getKey("tutorial.name_change.title.main");
         this.showView(this.var_1676);
      }
      
      private function showSelectionView() : void
      {
         if(!this.var_720)
         {
            this.var_720 = this._controller.buildXmlWindow("welcome_name_selection") as IWindowContainer;
            if(!this.var_720)
            {
               return;
            }
            this._window.content.addChild(this.var_720);
         }
         this._window.caption = this._controller.localization.getKey("tutorial.name_change.title.select");
         var _loc1_:IButtonWindow = this._window.findChildByName("select_name_button") as IButtonWindow;
         if(_loc1_)
         {
            _loc1_.disable();
         }
         this.setNormalView();
         this.showView(this.var_720);
      }
      
      private function showConfirmationView() : void
      {
         if(!this.var_721)
         {
            this.var_721 = this._controller.buildXmlWindow("welcome_name_confirmation") as IWindowContainer;
            if(!this.var_721)
            {
               return;
            }
            this._window.content.addChild(this.var_721);
         }
         this._window.caption = this._controller.localization.getKey("tutorial.name_change.title.confirm");
         var _loc1_:ITextWindow = this.var_721.findChildByName("final_name") as ITextWindow;
         if(_loc1_)
         {
            _loc1_.text = this.var_482;
         }
         this.showView(this.var_721);
      }
      
      public function get view() : IWindowContainer
      {
         return this._window;
      }
      
      public function setNormalView() : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc1_:ITextWindow = this._window.findChildByName("info_text") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.text = this._controller.localization.getKey("help.tutorial.name.info");
         var _loc2_:IWindowContainer = this._window.findChildByName("suggestions") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = false;
      }
      
      public function setNameAvailableView() : void
      {
         if(this._window == null)
         {
            return;
         }
         this.nameCheckWaitEnd(true);
         var _loc1_:ITextWindow = this._window.findChildByName("info_text") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         this._controller.localization.registerParameter("help.tutorial.name.available","name",this.var_482);
         _loc1_.text = this._controller.localization.getKey("help.tutorial.name.available");
         var _loc2_:ITextFieldWindow = this._window.findChildByName("input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = this.var_482;
         var _loc3_:IWindowContainer = this._window.findChildByName("suggestions") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.visible = false;
      }
      
      public function setNameNotAvailableView(param1:int, param2:String, param3:Array) : void
      {
         var _loc8_:* = null;
         this.nameCheckWaitEnd(false);
         if(this.var_44 != this.var_720)
         {
            this.showSelectionView();
         }
         this.var_1675 = null;
         this.var_482 = null;
         if(this._window == null)
         {
            return;
         }
         var _loc4_:ITextWindow = this._window.findChildByName("info_text") as ITextWindow;
         if(_loc4_ == null)
         {
            return;
         }
         switch(param1)
         {
            case ChangeUserNameResultMessageEvent.var_799:
               this._controller.localization.registerParameter("help.tutorial.name.taken","name",param2);
               _loc4_.text = this._controller.localization.getKey("help.tutorial.name.taken");
               break;
            case ChangeUserNameResultMessageEvent.var_801:
               this._controller.localization.registerParameter("help.tutorial.name.invalid","name",param2);
               _loc4_.text = this._controller.localization.getKey("help.tutorial.name.invalid");
               break;
            case ChangeUserNameResultMessageEvent.var_802:
               break;
            case ChangeUserNameResultMessageEvent.var_800:
               _loc4_.text = this._controller.localization.getKey("help.tutorial.name.long");
               break;
            case ChangeUserNameResultMessageEvent.var_798:
               _loc4_.text = this._controller.localization.getKey("help.tutorial.name.short");
               break;
            case ChangeUserNameResultMessageEvent.var_997:
               _loc4_.text = this._controller.localization.getKey("help.tutorial.name.change_not_allowed");
               break;
            case ChangeUserNameResultMessageEvent.var_996:
               _loc4_.text = this._controller.localization.getKey("help.tutorial.name.merge_hotel_down");
         }
         var _loc5_:IWindowContainer = this._window.findChildByName("suggestions") as IWindowContainer;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == ChangeUserNameResultMessageEvent.var_996 || param1 == ChangeUserNameResultMessageEvent.var_997)
         {
            _loc5_.visible = false;
            return;
         }
         _loc5_.visible = true;
         this.var_1095 = new NameSuggestionListRenderer(this._controller);
         var _loc6_:int = this.var_1095.render(param3,_loc5_);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.numChildren)
         {
            _loc8_ = _loc5_.getChildAt(_loc7_);
            _loc8_.color = var_1351;
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.nameSelected);
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.nameOver);
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OUT,this.nameOut);
            _loc7_++;
         }
      }
      
      private function nameSelected(param1:WindowMouseEvent) : void
      {
         this.nameCheckWaitEnd(true);
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = _loc2_.text;
         this.setNormalView();
         var _loc4_:ITextFieldWindow = this._window.findChildByName("input") as ITextFieldWindow;
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.text = _loc3_;
      }
      
      private function nameOver(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.color = var_1677;
         }
      }
      
      private function nameOut(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.color = var_1351;
         }
      }
      
      public function nameCheckWaitBegin() : void
      {
         var _loc1_:* = null;
         if(this._window && !this._window.disposed)
         {
            _loc1_ = this._window.findChildByName("select_name_button");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = this._window.findChildByName("check_name_button");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = this._window.findChildByName("input");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = this._window.findChildByName("info_text");
            if(_loc1_)
            {
               _loc1_.caption = this._controller.localization.getKey("help.tutorial.name.wait_while_checking");
            }
         }
         this.var_1352 = true;
      }
      
      public function nameCheckWaitEnd(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(this._window && !this._window.disposed)
         {
            if(param1)
            {
               _loc2_ = this._window.findChildByName("select_name_button");
               if(_loc2_)
               {
                  _loc2_.enable();
               }
            }
            _loc2_ = this._window.findChildByName("check_name_button");
            if(_loc2_)
            {
               _loc2_.enable();
            }
            _loc2_ = this._window.findChildByName("input");
            if(_loc2_)
            {
               _loc2_.enable();
            }
         }
         this.var_1352 = false;
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(!this.var_1352)
         {
            if(param1.type == WindowEvent.const_109)
            {
               if(param2.name == "input")
               {
                  _loc3_ = this._window.findChildByName("select_name_button");
                  _loc4_ = param2 as ITextFieldWindow;
                  if(_loc3_ && _loc4_)
                  {
                     if(_loc4_.text.length > 2)
                     {
                        _loc3_.enable();
                     }
                     else
                     {
                        _loc3_.disable();
                     }
                  }
               }
            }
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "change_name_button":
               this.showSelectionView();
               break;
            case "keep_name_button":
               this.var_482 = this._controller.myName;
               this.showConfirmationView();
               break;
            case "check_name_button":
               this._controller.checkName(this.getName());
               this.nameCheckWaitBegin();
               break;
            case "select_name_button":
               _loc5_ = this.getName();
               if(_loc5_.length < 1)
               {
                  return;
               }
               if(this.var_482 != _loc5_)
               {
                  this.var_1675 = _loc5_;
                  this._controller.checkName(_loc5_);
                  this.nameCheckWaitBegin();
               }
               else
               {
                  this.showConfirmationView();
               }
               break;
            case "cancel_selection_button":
               this.nameCheckWaitEnd(true);
               this.showMainView();
               break;
            case "confirm_name_button":
               this._controller.changeName(this.var_482);
               break;
            case "cancel_confirmation_button":
               this.nameCheckWaitEnd(true);
               this.showMainView();
               break;
            case "header_button_close":
               this._controller.showView(TutorialUI.const_90);
         }
      }
      
      private function getName() : String
      {
         var _loc1_:* = null;
         if(this._window)
         {
            _loc1_ = this._window.findChildByName("input") as ITextFieldWindow;
            if(_loc1_)
            {
               return _loc1_.text;
            }
         }
         return null;
      }
   }
}
