package com.sulake.habbo.sound.music
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.incoming.sound.TraxSongInfoMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetSongInfoMessageComposer;
   import com.sulake.habbo.communication.messages.parser.sound.TraxSongInfoMessageParser;
   import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
   import com.sulake.habbo.sound.HabboSoundManagerFlash10;
   import com.sulake.habbo.sound.IHabboMusicController;
   import com.sulake.habbo.sound.IHabboSound;
   import com.sulake.habbo.sound.IPlayListController;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboMusicController implements IHabboMusicController, IDisposable
   {
      
      public static const const_1499:int = -1;
       
      
      private var var_507:HabboSoundManagerFlash10;
      
      private var _connection:IConnection;
      
      private var _events:IEventDispatcher;
      
      private var var_79:IEventDispatcher;
      
      private var var_176:Map;
      
      private var var_409:Array;
      
      private var var_888:Array;
      
      private var var_886:Map;
      
      private var var_887:Map;
      
      private var var_1711:RoomItemPlayListController = null;
      
      private var _disposed:Boolean = false;
      
      private var var_192:Map;
      
      private var var_889:int;
      
      private var var_1111:Timer;
      
      public function HabboMusicController(param1:HabboSoundManagerFlash10, param2:IEventDispatcher, param3:IEventDispatcher, param4:IConnection)
      {
         this.var_176 = new Map();
         this.var_409 = new Array();
         this.var_888 = new Array();
         this.var_886 = new Map();
         this.var_887 = new Map();
         this.var_192 = new Map();
         this.var_889 = HabboMusicPrioritiesEnum.PRIORITY_ROOM_PLAYLIST;
         super();
         this.var_507 = param1;
         this._events = param2;
         this.var_79 = param3;
         this._connection = param4;
         this.var_1711 = new RoomItemPlayListController(param1,this,param2,param3,param4);
         this._connection.addMessageEvent(new TraxSongInfoMessageEvent(this.onSongInfoMessage));
         this.var_1111 = new Timer(1000);
         this.var_1111.start();
         this.var_1111.addEventListener(TimerEvent.TIMER,this.sendNextSongRequestMessage);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_507 = null;
            this._connection = null;
            this.var_409 = null;
            this.var_888 = null;
            this.var_1711 = null;
            if(this.var_176)
            {
               this.var_176.dispose();
               this.var_176 = null;
            }
            this.var_1111.stop();
            this.var_1111 = null;
            this._disposed = true;
         }
      }
      
      public function getRoomItemPlaylist(param1:int = -1) : IPlayListController
      {
         return this.var_1711 as IPlayListController;
      }
      
      public function playSong(param1:int, param2:int, param3:Number = 0) : Boolean
      {
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         if(this.var_192.getKeys().indexOf(param2) != -1)
         {
            this.var_192.add(param2,param1);
         }
         else
         {
            this.var_192[param2] = param1;
         }
         var _loc4_:SongDataEntry = this.var_176.getValue(param1) as SongDataEntry;
         if(_loc4_ == null)
         {
            this.requestSongInfo(param1);
            _loc6_ = new Date();
            this.var_886.add(param1,_loc6_.getTime());
            this.var_887.add(param1,param3);
            return false;
         }
         this.var_887[param1] = param3;
         if(_loc4_.soundObject == null)
         {
            this.var_886[param1] = _loc6_.getTime();
            this.var_887[param1] = param3;
            _loc4_.soundObject = this.var_507.loadTraxSong(_loc4_.id,_loc4_.songData);
         }
         var _loc5_:IHabboSound = _loc4_.soundObject;
         if(!_loc5_.ready)
         {
            return false;
         }
         if(param2 >= this.var_889)
         {
            for each(_loc7_ in this.var_192.getValues())
            {
               if(_loc7_ != param1)
               {
                  _loc8_ = this.var_176.getValue(_loc7_) as SongDataEntry;
                  _loc8_.soundObject.stop();
               }
            }
            this.playSongObject(param1,param3);
            Logger.log("Started playing song: " + param1);
            this.var_889 = param2;
         }
         else
         {
            Logger.log("Song play was rejected because of low priority: " + param1);
         }
         return true;
      }
      
      public function stopSong(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:SongDataEntry = this.var_176.getValue(param1) as SongDataEntry;
         if(_loc2_ != null)
         {
            _loc2_.soundObject.stop();
         }
         var _loc3_:int = this.var_192.getValues().indexOf(_loc2_);
         if(_loc3_ != -1)
         {
            _loc4_ = this.var_192.getKeys()[_loc3_];
            this.var_192.remove(_loc4_);
            this.var_889 = this.getTopPriority();
         }
      }
      
      public function stop(param1:int = 10) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_192.length)
         {
            _loc3_ = this.var_192.getKeys()[_loc2_];
            if(_loc3_ <= param1)
            {
               _loc4_ = this.var_192.getValues()[_loc2_];
               _loc5_ = this.var_176.getValue(_loc4_) as SongDataEntry;
               if(_loc5_ != null)
               {
                  _loc6_ = _loc5_.soundObject;
                  _loc6_.stop();
               }
            }
            _loc2_++;
         }
      }
      
      public function previewSong(param1:int, param2:int) : void
      {
      }
      
      public function getSongObject(param1:int) : IHabboSound
      {
         var _loc2_:SongDataEntry = this.var_176.getValue(param1) as SongDataEntry;
         if(_loc2_ != null)
         {
            return _loc2_.soundObject;
         }
         return null;
      }
      
      public function updateVolume(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         for each(_loc2_ in this.var_192.getKeys())
         {
            _loc3_ = this.var_176.getValue(_loc2_) as SongDataEntry;
            if(_loc3_ != null)
            {
               _loc3_.soundObject.volume = param1;
            }
         }
      }
      
      public function onSongLoaded(param1:int) : void
      {
         var _loc2_:int = this.var_192[this.var_889];
         Logger.log("Song loaded : " + param1);
         if(param1 == _loc2_)
         {
            this.playSongObject(param1,this.var_887[param1]);
         }
      }
      
      public function requestSongInfo(param1:int) : void
      {
         this.var_409.push(param1);
      }
      
      public function requestSongInfoWithoutSamples(param1:int) : void
      {
         if(this.var_409.indexOf(param1) == -1)
         {
            this.var_409.push(param1);
            this.var_888.push(param1);
         }
      }
      
      public function getSongInfo(param1:int) : ISongInfo
      {
         return this.var_176.getValue(param1);
      }
      
      private function sendNextSongRequestMessage(param1:TimerEvent) : void
      {
         if(this.var_409.length < 1)
         {
            return;
         }
         var _loc2_:int = this.var_409[0];
         if(this.var_176.getValue(_loc2_) != null)
         {
            this.var_409.pop();
            return;
         }
         if(this._connection == null)
         {
            return;
         }
         this._connection.send(new GetSongInfoMessageComposer(_loc2_));
         Logger.log("Requested song info : " + _loc2_);
      }
      
      private function onSongInfoMessage(param1:IMessageEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc2_:TraxSongInfoMessageEvent = param1 as TraxSongInfoMessageEvent;
         var _loc3_:TraxSongInfoMessageParser = _loc2_.getParser() as TraxSongInfoMessageParser;
         var _loc4_:* = this.var_176.getValue(_loc3_.id) == null;
         var _loc5_:* = this.var_888.indexOf(_loc3_.id) == -1;
         this.var_409.splice(this.var_409.indexOf(_loc3_.id),1);
         if(!_loc5_)
         {
            this.var_888.splice(this.var_888.indexOf(_loc3_.id),1);
         }
         if(_loc4_)
         {
            if(_loc5_)
            {
               _loc6_ = this.var_507.loadTraxSong(_loc3_.id,_loc3_.data);
               if(_loc6_ == null)
               {
                  return;
               }
               _loc7_ = new SongDataEntry(_loc3_.id,_loc3_.length,_loc3_.name,_loc3_.author,_loc6_);
               this.var_176.add(_loc3_.id,_loc7_);
               _loc8_ = this.var_192[this.var_889];
               if(_loc6_.ready && _loc3_.id == _loc8_)
               {
                  this.playSongObject(_loc8_,this.var_887[_loc8_]);
               }
            }
            else
            {
               _loc9_ = new SongDataEntry(_loc3_.id,_loc3_.length,_loc3_.name,_loc3_.author,null);
               _loc9_.songData = _loc3_.data;
               this.var_176.add(_loc3_.id,_loc9_);
               this._events.dispatchEvent(new SongInfoReceivedEvent(SongInfoReceivedEvent.const_785,_loc3_.id));
            }
         }
         Logger.log("Received song info : " + _loc3_.id);
      }
      
      private function playSongObject(param1:int, param2:Number = -1) : Boolean
      {
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc3_:SongDataEntry = this.var_176.getValue(param1) as SongDataEntry;
         if(_loc3_ == null)
         {
            Logger.log("WARNING: Unable to find song entry id " + param1 + " that was supposed to be loaded.");
            return false;
         }
         var _loc4_:IHabboSound = _loc3_.soundObject;
         if(!_loc4_.ready)
         {
            return false;
         }
         _loc4_.volume = this.var_507.volume;
         if(param2 != const_1499)
         {
            _loc4_.position = param2;
            if(this.var_886.getKeys().indexOf(param1) != -1)
            {
               _loc6_ = new Date();
               _loc7_ = (_loc6_.getTime() - this.var_886[param1]) / 1000;
               _loc4_.position += _loc7_;
               this.var_886.remove(param1);
            }
         }
         _loc4_.play();
         if(_loc3_.length >= 8000)
         {
            this.var_507.notifyPlayedSong(_loc3_.name,_loc3_.creator);
         }
         Logger.log("Started playing song : " + param1 + " at position : " + _loc4_.position);
         return true;
      }
      
      private function getTopPriority() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = -1;
         for each(_loc2_ in this.var_192.getKeys())
         {
            if(_loc2_ > _loc1_)
            {
               _loc1_ = _loc2_;
            }
         }
         return _loc1_;
      }
   }
}
