package com.sulake.habbo.widget.poll
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class PollSession implements IDisposable
   {
       
      
      private var _id:int = -1;
      
      private var _disposed:Boolean = false;
      
      private var var_1454:int = 0;
      
      private var var_1455:Array;
      
      private var var_1109:PollWidget;
      
      private var var_248:IPollDialog;
      
      private var var_1892:String = "";
      
      public function PollSession(param1:int, param2:PollWidget)
      {
         super();
         this._id = param1;
         this.var_1109 = param2;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get numQuestions() : int
      {
         return this.var_1454;
      }
      
      public function set numQuestions(param1:int) : void
      {
         this.var_1454 = param1;
      }
      
      public function get questionArray() : Array
      {
         return this.var_1455;
      }
      
      public function set questionArray(param1:Array) : void
      {
         this.var_1455 = param1;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_248)
            {
               this.var_248.dispose();
               this.var_248 = null;
            }
            this.var_1109 = null;
            this._disposed = true;
         }
      }
      
      public function showOffer(param1:String) : void
      {
         this.hideOffer();
         this.var_248 = new PollOfferDialog(this._id,param1,this.var_1109);
      }
      
      public function hideOffer() : void
      {
         if(this.var_248 is PollOfferDialog)
         {
            if(!this.var_248.disposed)
            {
               this.var_248.dispose();
            }
            this.var_248 = null;
         }
      }
      
      public function showContent(param1:String, param2:String, param3:Array) : void
      {
         this.hideOffer();
         this.hideContent();
         this.var_1892 = param2;
         this.var_248 = new PollContentDialog(this._id,param1,param3,this.var_1109);
      }
      
      public function hideContent() : void
      {
         if(this.var_248 is PollContentDialog)
         {
            if(!this.var_248.disposed)
            {
               this.var_248.dispose();
            }
            this.var_248 = null;
         }
      }
      
      public function showThanks() : void
      {
         this.var_1109.windowManager.alert("${poll_thanks_title}",this.var_1892,0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
   }
}
