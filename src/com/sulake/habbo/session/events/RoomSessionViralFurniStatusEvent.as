package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionViralFurniStatusEvent extends RoomSessionEvent
   {
      
      public static const const_512:String = "RSVFS_STATUS";
      
      public static const const_445:String = "RSVFS_RECEIVED";
       
      
      private var var_173:String;
      
      private var var_347:int;
      
      private var var_386:int = -1;
      
      private var _shareId:String;
      
      private var var_2112:String;
      
      private var var_2113:Boolean;
      
      private var var_1282:int = 0;
      
      public function RoomSessionViralFurniStatusEvent(param1:String, param2:IRoomSession, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
         this.var_386 = this.status;
         this._shareId = this.shareId;
      }
      
      public function get objectId() : int
      {
         return this.var_347;
      }
      
      public function get status() : int
      {
         return this.var_386;
      }
      
      public function get shareId() : String
      {
         return this._shareId;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2112;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2113;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1282;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_347 = param1;
      }
      
      public function set status(param1:int) : void
      {
         this.var_386 = param1;
      }
      
      public function set shareId(param1:String) : void
      {
         this._shareId = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2112 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2113 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1282 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_173;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_173 = param1;
      }
   }
}
