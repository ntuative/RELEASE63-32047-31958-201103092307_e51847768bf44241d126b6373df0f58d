package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2807:uint;
      
      private var var_141:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_242:IWindowContext;
      
      private var var_1127:IMouseDraggingService;
      
      private var var_1125:IMouseScalingService;
      
      private var var_1126:IMouseListenerService;
      
      private var var_1128:IFocusManagerService;
      
      private var var_1124:IToolTipAgentService;
      
      private var var_1123:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2807 = 0;
         this.var_141 = param2;
         this.var_242 = param1;
         this.var_1127 = new WindowMouseDragger(param2);
         this.var_1125 = new WindowMouseScaler(param2);
         this.var_1126 = new WindowMouseListener(param2);
         this.var_1128 = new FocusManager(param2);
         this.var_1124 = new WindowToolTipAgent(param2);
         this.var_1123 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1127 != null)
         {
            this.var_1127.dispose();
            this.var_1127 = null;
         }
         if(this.var_1125 != null)
         {
            this.var_1125.dispose();
            this.var_1125 = null;
         }
         if(this.var_1126 != null)
         {
            this.var_1126.dispose();
            this.var_1126 = null;
         }
         if(this.var_1128 != null)
         {
            this.var_1128.dispose();
            this.var_1128 = null;
         }
         if(this.var_1124 != null)
         {
            this.var_1124.dispose();
            this.var_1124 = null;
         }
         if(this.var_1123 != null)
         {
            this.var_1123.dispose();
            this.var_1123 = null;
         }
         this.var_141 = null;
         this.var_242 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1127;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1125;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1126;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1128;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1124;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1123;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
