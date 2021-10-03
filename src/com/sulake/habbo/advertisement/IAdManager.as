package com.sulake.habbo.advertisement
{
   import com.sulake.core.runtime.IUnknown;
   import flash.events.IEventDispatcher;
   
   public interface IAdManager extends IUnknown
   {
       
      
      function get events() : IEventDispatcher;
      
      function showInterstitial() : Boolean;
      
      function showRoomAd() : void;
   }
}
