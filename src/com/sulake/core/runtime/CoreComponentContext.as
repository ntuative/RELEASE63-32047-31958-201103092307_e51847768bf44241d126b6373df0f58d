package com.sulake.core.runtime
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.runtime.events.LibraryProgressEvent;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.LibraryLoaderQueue;
   import com.sulake.core.utils.profiler.ProfilerViewer;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public final class CoreComponentContext extends ComponentContext implements ICore
   {
      
      private static const const_102:uint = 3;
      
      private static const const_1350:String = "asset-libraries";
      
      private static const const_1352:String = "library";
      
      private static const const_1355:String = "service-libraries";
      
      private static const const_1354:String = "library";
      
      private static const const_1357:String = "component-libraries";
      
      private static const const_1358:String = "library";
      
      private static const const_1353:String = "error_data";
      
      private static const const_1356:String = "error_cat";
      
      private static const const_1351:String = "error_desc";
       
      
      private var var_375:LibraryLoaderQueue;
      
      private var var_778:IEventDispatcher;
      
      private var var_520:uint;
      
      private var var_376:Function;
      
      private var var_202:Profiler;
      
      private var var_268:Array;
      
      private var var_633:Array;
      
      private var _lastUpdateTimeMs:uint;
      
      private var var_1467:uint = 0;
      
      public function CoreComponentContext(param1:DisplayObjectContainer, param2:uint)
      {
         super(this,Component.COMPONENT_FLAG_CONTEXT,new AssetLibraryCollection("_core_assets"));
         this.var_1467 = param2;
         _debug = (param2 & 0) == Core.CORE_SETUP_DEBUG;
         this.var_268 = new Array();
         this.var_633 = new Array();
         var_445 = param1;
         var _loc3_:int = 0;
         while(_loc3_ < CoreComponentContext.const_102)
         {
            this.var_268.push(new Array());
            this.var_633.push(0);
            _loc3_++;
         }
         this._lastUpdateTimeMs = getTimer();
         attachComponent(this,[new IIDCore()]);
         var_445.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         switch(param2 & 0)
         {
            case Core.const_1151:
               debug("Core; using simple frame update handler");
               this.var_376 = this.simpleFrameUpdateHandler;
               break;
            case Core.const_755:
               debug("Core; using complex frame update handler");
               this.var_376 = this.complexFrameUpdateHandler;
               break;
            case Core.const_750:
               debug("Core; using profiler frame update handler");
               this.var_376 = this.profilerFrameUpdateHandler;
               this.var_202 = new Profiler(this);
               attachComponent(this.var_202,[new IIDProfiler()]);
               var_445.addChild(new ProfilerViewer(this.var_202));
               break;
            case Core.const_483:
               debug("Core; using experimental frame update handler");
               this.var_376 = this.experimentalFrameUpdateHandler;
               break;
            case Core.CORE_SETUP_DEBUG:
               debug("Core; using debug frame update handler");
               this.var_376 = this.debugFrameUpdateHandler;
         }
      }
      
      public function getNumberOfFilesPending() : uint
      {
         return this.var_375.length;
      }
      
      public function getNumberOfFilesLoaded() : uint
      {
         return this.var_520 - this.getNumberOfFilesPending();
      }
      
      public function initialize() : void
      {
         events.dispatchEvent(new Event(Component.COMPONENT_EVENT_RUNNING));
         Logger.log(toXMLString());
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(!disposed)
         {
            debug("Disposing core");
            var_445.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            var_445 = null;
            _loc3_ = 0;
            while(_loc3_ < CoreComponentContext.const_102)
            {
               _loc2_ = this.var_268[_loc3_] as Array;
               _loc1_ = uint(_loc2_.length);
               while(_loc1_-- > 0)
               {
                  _loc2_.pop();
               }
               _loc3_++;
            }
            if(this.var_375 != null)
            {
               this.var_375.dispose();
               this.var_375 = null;
            }
            super.dispose();
         }
      }
      
      override public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         if(param4)
         {
            ErrorReportStorage.setParameter(const_1353,String(param4.getStackTrace()));
         }
         ErrorReportStorage.setParameter(const_1356,String(param3));
         ErrorReportStorage.setParameter(const_1351,param1);
         super.error(param1,param2,param3,param4);
         if(param2)
         {
            this.dispose();
         }
      }
      
      public function readConfigDocument(param1:XML, param2:IEventDispatcher = null) : void
      {
         var node:XML = null;
         var list:XMLList = null;
         var item:XML = null;
         var url:String = null;
         var loader:LibraryLoader = null;
         var config:XML = param1;
         var loadingEventDelegate:IEventDispatcher = param2;
         var context:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain,null);
         debug("Parsing config document");
         this.var_778 = loadingEventDelegate;
         if(this.var_375 == null)
         {
            this.var_375 = new LibraryLoaderQueue(_debug);
         }
         try
         {
            node = config.child(const_1350)[0];
            if(node != null)
            {
               list = node.child(const_1352);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  loader = new LibraryLoader(context,true,_debug);
                  assets.loadFromFile(loader,true);
                  loader.load(new URLRequest(url));
                  this.var_375.push(loader);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.updateLoadingProcess);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this.errorInLoadingProcess);
                  ++this.var_520;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse asset libraries from config xml!",true,Core.const_322,e);
         }
         try
         {
            node = config.child(const_1355)[0];
            if(node != null)
            {
               list = node.child(const_1354);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  loader = new LibraryLoader(context,true,_debug);
                  loader.load(new URLRequest(url));
                  this.var_375.push(loader);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.updateLoadingProcess);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this.errorInLoadingProcess);
                  ++this.var_520;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse interfaces from config xml!",true,Core.const_322,e);
         }
         try
         {
            node = config.child(const_1357)[0];
            if(node != null)
            {
               list = node.child(const_1358);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  loader = new LibraryLoader(context,true,_debug);
                  loader.load(new URLRequest(url));
                  this.var_375.push(loader);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.updateLoadingProcess);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this.errorInLoadingProcess);
                  ++this.var_520;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse components from config xml!",true,Core.const_322,e);
         }
         if(!disposed)
         {
            this.updateLoadingProcess();
         }
      }
      
      private function errorInLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:LibraryLoader = LibraryLoader(param1.target);
         this.error("Failed to download library \"" + _loc2_.url + "\" HTTP status " + param1.status + ": " + _loc2_.getLastErrorMessage(),true,Core.const_1455);
         if(!disposed)
         {
            this.updateLoadingProcess(param1);
         }
      }
      
      private function finalizeLoadingEventDelegate() : void
      {
         if(this.var_778)
         {
            this.var_778.dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      private function updateLoadingProgress(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:* = null;
         if(this.var_778)
         {
            _loc2_ = param1.target as LibraryLoader;
            this.var_778.dispatchEvent(new LibraryProgressEvent(_loc2_.url,param1.bytesLoaded,param1.bytesTotal,_loc2_.elapsedTime));
         }
      }
      
      private function updateLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 != null)
         {
            if(param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE || param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR)
            {
               _loc2_ = param1.target as LibraryLoader;
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.updateLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this.errorInLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,this.updateLoadingProgress);
               _loc3_ = _loc2_.url;
               debug("Loading library \"" + _loc3_ + "\" " + (param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE ? "ready" : "failed\n" + _loc2_.getLastErrorMessage()));
               _loc2_.dispose();
               if(!disposed)
               {
                  if(this.var_778)
                  {
                     this.var_778.dispatchEvent(new LibraryProgressEvent(_loc2_.url,this.var_520 - this.var_375.length,this.var_520,_loc2_.elapsedTime));
                  }
               }
            }
         }
         if(!disposed)
         {
            if(this.var_375.length == 0)
            {
               this.finalizeLoadingEventDelegate();
               debug("All libraries loaded, Core is now running");
            }
         }
      }
      
      override public function registerUpdateReceiver(param1:IUpdateReceiver, param2:uint) : void
      {
         this.removeUpdateReceiver(param1);
         param2 = param2 >= CoreComponentContext.const_102 ? 4294967295 : uint(param2);
         var _loc3_:int = !!this.var_202 ? 0 : this.var_1467 & 0;
         if(_loc3_ == Core.const_483)
         {
            this.var_268[param2].push(new UpdateDelegate(param1,this,param2));
         }
         else
         {
            this.var_268[param2].push(param1);
         }
      }
      
      override public function removeUpdateReceiver(param1:IUpdateReceiver) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc6_:* = null;
         var _loc4_:int = !!this.var_202 ? 0 : this.var_1467 & 0;
         var _loc5_:int = 0;
         while(_loc5_ < CoreComponentContext.const_102)
         {
            _loc3_ = this.var_268[_loc5_] as Array;
            if(_loc4_ == Core.const_483)
            {
               for each(_loc6_ in _loc3_)
               {
                  if(_loc6_.receiver == param1)
                  {
                     _loc6_.dispose();
                     return;
                  }
               }
            }
            else
            {
               _loc2_ = _loc3_.indexOf(param1);
               if(_loc2_ > -1)
               {
                  _loc3_[_loc2_] = null;
                  return;
               }
            }
            _loc5_++;
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:uint = getTimer();
         this.var_376(_loc2_,_loc2_ - this._lastUpdateTimeMs);
         this._lastUpdateTimeMs = _loc2_;
      }
      
      private function simpleFrameUpdateHandler(param1:uint, param2:uint) : void
      {
         var priority:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var msCurrentTime:uint = param1;
         var msSinceLastUpdate:uint = param2;
         priority = 0;
         while(priority < CoreComponentContext.const_102)
         {
            this.var_633[priority] = 0;
            receivers = this.var_268[priority];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = IUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     receiver.update(msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            priority++;
         }
      }
      
      private function complexFrameUpdateHandler(param1:uint, param2:uint) : void
      {
         var priority:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var skip:Boolean = false;
         var t:uint = 0;
         var msCurrentTime:uint = param1;
         var msSinceLastUpdate:uint = param2;
         var maxTimePerFrame:uint = 1000 / var_445.stage.frameRate;
         priority = 0;
         while(priority < CoreComponentContext.const_102)
         {
            t = getTimer();
            skip = false;
            if(t - msCurrentTime > maxTimePerFrame)
            {
               if(this.var_633[priority] < priority)
               {
                  ++this.var_633[priority];
                  skip = true;
               }
            }
            if(!skip)
            {
               this.var_633[priority] = 0;
               receivers = this.var_268[priority];
               index = 0;
               length = receivers.length;
               while(index != length)
               {
                  receiver = IUpdateReceiver(receivers[index]);
                  if(receiver == null || receiver.disposed)
                  {
                     receivers.splice(index,1);
                     length--;
                  }
                  else
                  {
                     try
                     {
                        receiver.update(msSinceLastUpdate);
                     }
                     catch(e:Error)
                     {
                        error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                        return;
                     }
                     index++;
                  }
               }
            }
            priority++;
         }
      }
      
      private function profilerFrameUpdateHandler(param1:uint, param2:uint) : void
      {
         var priority:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var msCurrentTime:uint = param1;
         var msSinceLastUpdate:uint = param2;
         this.var_202.start();
         priority = 0;
         while(priority < CoreComponentContext.const_102)
         {
            this.var_633[priority] = 0;
            receivers = this.var_268[priority];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = IUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     this.var_202.update(receiver,msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            priority++;
         }
         this.var_202.stop();
      }
      
      private function experimentalFrameUpdateHandler(param1:uint, param2:uint) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < CoreComponentContext.const_102)
         {
            _loc4_ = this.var_268[_loc3_];
            _loc5_ = _loc4_.length - 1;
            while(_loc5_ > -1)
            {
               if(_loc4_[_loc5_].disposed)
               {
                  _loc4_.splice(_loc5_,1);
               }
               _loc5_--;
            }
            _loc3_++;
         }
      }
      
      private function debugFrameUpdateHandler(param1:uint, param2:uint) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < CoreComponentContext.const_102)
         {
            this.var_633[_loc3_] = 0;
            _loc4_ = this.var_268[_loc3_];
            _loc7_ = 0;
            _loc6_ = uint(_loc4_.length);
            while(_loc7_ != _loc6_)
            {
               _loc5_ = IUpdateReceiver(_loc4_[_loc7_]);
               if(_loc5_ == null || _loc5_.disposed)
               {
                  _loc4_.splice(_loc7_,1);
                  _loc6_--;
               }
               else
               {
                  _loc5_.update(param2);
                  _loc7_++;
               }
            }
            _loc3_++;
         }
      }
      
      public function setProfilerMode(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(param1)
         {
            this.var_376 = this.profilerFrameUpdateHandler;
            if(!this.var_202)
            {
               this.var_202 = new Profiler(this);
               attachComponent(this.var_202,[new IIDProfiler()]);
            }
            _loc2_ = 0;
            while(_loc2_ < CoreComponentContext.const_102)
            {
               _loc3_ = this.var_268[_loc2_];
               _loc5_ = _loc3_.length - 1;
               while(_loc5_ > -1)
               {
                  _loc4_ = _loc3_[_loc5_];
                  if(_loc4_ is UpdateDelegate)
                  {
                     _loc3_[_loc5_] = UpdateDelegate(_loc4_).receiver;
                     UpdateDelegate(_loc4_).dispose();
                  }
                  _loc5_--;
               }
               _loc2_++;
            }
         }
         else
         {
            if(this.var_202)
            {
               detachComponent(this.var_202);
               this.var_202.dispose();
               this.var_202 = null;
            }
            switch(this.var_1467 & 0)
            {
               case Core.const_1151:
                  this.var_376 = this.simpleFrameUpdateHandler;
                  break;
               case Core.const_755:
                  this.var_376 = this.complexFrameUpdateHandler;
                  break;
               case Core.const_483:
                  this.var_376 = this.experimentalFrameUpdateHandler;
                  _loc2_ = 0;
                  while(_loc2_ < CoreComponentContext.const_102)
                  {
                     _loc3_ = this.var_268[_loc2_];
                     _loc5_ = _loc3_.length - 1;
                     while(_loc5_ > -1)
                     {
                        _loc4_ = _loc3_[_loc5_];
                        if(_loc4_ is IUpdateReceiver)
                        {
                           _loc3_[_loc5_] = new UpdateDelegate(IUpdateReceiver(_loc4_),this,_loc2_);
                        }
                        _loc5_--;
                     }
                     _loc2_++;
                  }
                  break;
               default:
                  this.var_376 = this.debugFrameUpdateHandler;
            }
         }
      }
   }
}

import com.sulake.core.runtime.IContext;
import com.sulake.core.runtime.IDisposable;
import com.sulake.core.runtime.IUpdateReceiver;
import flash.events.Event;
import flash.utils.getQualifiedClassName;
import flash.utils.getTimer;

class UpdateDelegate implements IDisposable
{
    
   
   private var _receiver:IUpdateReceiver;
   
   private var _context:IContext;
   
   private var _priority:int;
   
   private var _lastUpdateTimeMs:uint;
   
   private var _framesSkipped:uint = 0;
   
   function UpdateDelegate(param1:IUpdateReceiver, param2:IContext, param3:int)
   {
      super();
      if(param2 && param1)
      {
         this._receiver = param1;
         this._context = param2;
         this._priority = param3;
         param2.displayObjectContainer.stage.addEventListener(this._priority == 0 ? "null" : Event.ENTER_FRAME,this.onFrameUpdate);
         this._lastUpdateTimeMs = getTimer();
      }
   }
   
   public function get priority() : int
   {
      return this._priority;
   }
   
   public function get receiver() : IUpdateReceiver
   {
      return this._receiver;
   }
   
   public function get disposed() : Boolean
   {
      return !!this._receiver ? Boolean(this._receiver.disposed) : true;
   }
   
   public function dispose() : void
   {
      if(this._receiver)
      {
         this._receiver = null;
         this._context.displayObjectContainer.stage.removeEventListener(this._priority == 0 ? "null" : Event.ENTER_FRAME,this.onFrameUpdate);
         this._context = null;
      }
   }
   
   private function onFrameUpdate(param1:Event) : void
   {
      var msCurrentTime:uint = 0;
      var msDeltaTime:uint = 0;
      var event:Event = param1;
      if(!this.disposed)
      {
         msCurrentTime = getTimer();
         msDeltaTime = msCurrentTime - this._lastUpdateTimeMs;
         this._lastUpdateTimeMs = msCurrentTime;
         if(this._priority > 0 && this._framesSkipped < this._priority)
         {
            if(msDeltaTime > 1000 / this._context.displayObjectContainer.stage.frameRate)
            {
               ++this._framesSkipped;
               return;
            }
         }
         this._framesSkipped = 0;
         try
         {
            this._receiver.update(msDeltaTime);
         }
         catch(e:Error)
         {
            _context.error("Error in update receiver \"" + getQualifiedClassName(_receiver) + "\": " + e.message,true,e.errorID,e);
         }
      }
   }
}
