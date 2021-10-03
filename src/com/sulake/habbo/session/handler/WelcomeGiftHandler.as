package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.messages.incoming.room.furniture.WelcomeGiftStatusEvent;
   import com.sulake.habbo.communication.messages.parser.room.furniture.WelcomeGiftStatusParser;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.events.RoomSessionWelcomeGiftEvent;
   
   public class WelcomeGiftHandler extends BaseHandler
   {
       
      
      public function WelcomeGiftHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(param1 == null)
         {
            return;
         }
         param1.addMessageEvent(new WelcomeGiftStatusEvent(this.onWelcomeGiftStatus));
      }
      
      private function onWelcomeGiftStatus(param1:WelcomeGiftStatusEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:IRoomSession = listener.getSession(_xxxRoomId,var_23);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:WelcomeGiftStatusParser = param1.getParser() as WelcomeGiftStatusParser;
         _loc4_ = new RoomSessionWelcomeGiftEvent(_loc2_,_loc3_.email,_loc3_.isVerified,_loc3_.allowChange,_loc3_.furniId);
         listener.events.dispatchEvent(_loc4_);
      }
   }
}
