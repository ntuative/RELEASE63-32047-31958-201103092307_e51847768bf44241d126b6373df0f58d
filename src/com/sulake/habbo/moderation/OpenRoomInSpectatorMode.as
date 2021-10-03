package com.sulake.habbo.moderation
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPublicSpaceCastLibsMessageComposer;
   
   public class OpenRoomInSpectatorMode
   {
       
      
      private var var_34:ModerationManager;
      
      private var var_1759:Boolean;
      
      private var _roomId:int;
      
      public function OpenRoomInSpectatorMode(param1:ModerationManager, param2:IWindow, param3:Boolean, param4:int)
      {
         super();
         this.var_34 = param1;
         this.var_1759 = param3;
         this._roomId = param4;
         param2.procedure = this.onClick;
      }
      
      private function onClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this.var_1759)
         {
            this.var_34.connection.send(new GetPublicSpaceCastLibsMessageComposer(this._roomId));
         }
         else
         {
            this.var_34.goToRoom(this._roomId);
         }
      }
   }
}
