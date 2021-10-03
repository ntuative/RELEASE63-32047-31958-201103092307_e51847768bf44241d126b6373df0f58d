package com.sulake.habbo.sound
{
   public interface IHabboMusicController
   {
       
      
      function getRoomItemPlaylist(param1:int = -1) : IPlayListController;
      
      function playSong(param1:int, param2:int, param3:Number = 0) : Boolean;
      
      function stopSong(param1:int) : void;
      
      function previewSong(param1:int, param2:int) : void;
      
      function stop(param1:int = 10) : void;
      
      function getSongInfo(param1:int) : ISongInfo;
      
      function requestSongInfoWithoutSamples(param1:int) : void;
   }
}
