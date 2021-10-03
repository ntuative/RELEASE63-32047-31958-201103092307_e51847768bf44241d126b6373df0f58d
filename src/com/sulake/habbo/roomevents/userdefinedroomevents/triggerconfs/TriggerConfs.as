package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.TriggerDefinition;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
   import com.sulake.habbo.roomevents.userdefinedroomevents.Element;
   import com.sulake.habbo.roomevents.userdefinedroomevents.ElementTypeHolder;
   
   public class TriggerConfs implements ElementTypeHolder
   {
       
      
      private var var_191:Array;
      
      public function TriggerConfs()
      {
         this.var_191 = new Array();
         super();
         this.var_191.push(new AvatarSaysSomething());
         this.var_191.push(new AvatarEntersStuff());
         this.var_191.push(new AvatarExitsStuff());
         this.var_191.push(new TriggerOnce());
         this.var_191.push(new StuffIsUsed());
         this.var_191.push(new TriggerPeriodically());
         this.var_191.push(new AvatarEntersRoom());
         this.var_191.push(new GameStarts());
         this.var_191.push(new GameEnds());
         this.var_191.push(new ScoreAchieved());
         this.var_191.push(new AvatarCaught());
         this.var_191.push(new StuffCaught());
      }
      
      public function get confs() : Array
      {
         return this.var_191;
      }
      
      public function getByCode(param1:int) : TriggerConf
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_191)
         {
            if(_loc2_.code == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getElementByCode(param1:int) : Element
      {
         return this.getByCode(param1);
      }
      
      public function acceptTriggerable(param1:Triggerable) : Boolean
      {
         return param1 as TriggerDefinition != null;
      }
      
      public function getKey() : String
      {
         return "trigger";
      }
   }
}
