package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class SoundSettingsParser implements IMessageParser
   {
       
      
      private var _volume:int;
      
      public function SoundSettingsParser()
      {
         super();
      }
      
      public function get volume() : int
      {
         return this._volume;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._volume = param1.readInteger();
         return true;
      }
   }
}
