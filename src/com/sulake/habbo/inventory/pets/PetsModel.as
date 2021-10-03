package com.sulake.habbo.inventory.pets
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.inventory.pets.GetPetInventoryComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.engine.PlacePetMessageComposer;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.Event;
   
   public class PetsModel implements IInventoryModel
   {
       
      
      private var _controller:HabboInventory;
      
      private var var_17:PetsView;
      
      private var _assets:IAssetLibrary;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var _catalog:IHabboCatalog;
      
      private var var_403:Map;
      
      private var var_1947:Boolean = false;
      
      private var _disposed:Boolean = false;
      
      private var var_2610:Boolean;
      
      public function PetsModel(param1:HabboInventory, param2:IHabboWindowManager, param3:IHabboCommunicationManager, param4:IAssetLibrary, param5:IHabboLocalizationManager, param6:IRoomEngine, param7:IAvatarRenderManager, param8:IHabboCatalog)
      {
         super();
         this._controller = param1;
         this._assets = param4;
         this._communication = param3;
         this._roomEngine = param6;
         this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_222,this.onObjectPlaced);
         this._catalog = param8;
         this.var_403 = new Map();
         this.var_17 = new PetsView(this,param2,param4,param5,param6,param7);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._controller = null;
            if(this.var_17 != null)
            {
               this.var_17.dispose();
            }
            this._assets = null;
            this._communication = null;
            this._disposed = true;
         }
      }
      
      public function isListInited() : Boolean
      {
         return this.var_2610;
      }
      
      public function setListInitialized() : void
      {
         this.var_2610 = true;
         this.var_17.setViewToState();
      }
      
      public function requestPetInventory() : void
      {
         if(this._communication == null)
         {
            return;
         }
         var _loc1_:IConnection = this._communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new GetPetInventoryComposer());
      }
      
      public function requestCatalogOpen() : void
      {
         this._catalog.openCatalog();
      }
      
      public function get pets() : Map
      {
         return this.var_403;
      }
      
      public function addPet(param1:PetData) : void
      {
         if(this.var_403.add(param1.id,param1))
         {
            this.var_17.addPet(param1);
         }
         this.var_17.setViewToState();
      }
      
      public function removePet(param1:int) : void
      {
         this.var_403.remove(param1);
         this.var_17.removePet(param1);
         this.var_17.setViewToState();
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
         this.requestPetInventory();
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(param1 == InventoryCategory.const_150 && this._controller.isVisible)
         {
            this._controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_PETS));
         }
      }
      
      public function switchCategory(param1:String) : void
      {
         var _loc2_:FurniModel = this._controller.furniModel;
         if(_loc2_ != null)
         {
            _loc2_.switchCategory(param1);
            this._controller.toggleInventoryPage(InventoryCategory.const_76);
         }
      }
      
      public function refreshViews() : void
      {
         this.var_17.update();
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return this.var_17.getWindowContainer();
      }
      
      public function closingInventoryView() : void
      {
      }
      
      public function subCategorySwitch(param1:String) : void
      {
      }
      
      public function placePetToRoom(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:PetData = this.getPetById(param1);
         if(_loc3_ == null)
         {
            return;
         }
         if(this._controller.roomSession.isRoomOwner)
         {
            this.var_1947 = this._roomEngine.initializeRoomObjectInsert(_loc3_.id,RoomObjectCategoryEnum.const_33,RoomObjectTypeEnum.const_196,_loc3_.figureString);
            this._controller.closeView();
            return;
         }
         if(!this._controller.roomSession.arePetsAllowed)
         {
            return;
         }
         if(!param2)
         {
            this._communication.getHabboMainConnection(null).send(new PlacePetMessageComposer(_loc3_.id,0,0));
         }
      }
      
      public function updateView() : void
      {
         if(this.var_17 == null)
         {
            return;
         }
         this.var_17.update();
      }
      
      private function getPetById(param1:int) : PetData
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_403)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function onObjectPlaced(param1:Event) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_1947 && param1.type == RoomEngineObjectEvent.const_222)
         {
            this._controller.showView();
            this.var_1947 = false;
         }
      }
      
      public function get roomSession() : IRoomSession
      {
         return this._controller.roomSession;
      }
      
      public function updatePetsAllowed() : void
      {
         this.var_17.update();
      }
   }
}
