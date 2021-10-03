package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1945:int = 0;
      
      public static const const_1430:int = 1;
      
      public static const const_1647:int = 2;
      
      public static const const_1898:int = 3;
      
      public static const const_1773:int = 4;
      
      public static const const_1882:int = 5;
      
      public static const const_1387:int = 10;
      
      public static const const_1825:int = 11;
      
      public static const const_1952:int = 12;
      
      public static const const_1874:int = 13;
      
      public static const const_1926:int = 16;
      
      public static const const_1868:int = 17;
      
      public static const const_1778:int = 18;
      
      public static const const_1934:int = 19;
      
      public static const const_1837:int = 20;
      
      public static const const_1908:int = 22;
      
      public static const const_1751:int = 23;
      
      public static const const_1840:int = 24;
      
      public static const const_1873:int = 25;
      
      public static const const_1851:int = 26;
      
      public static const const_1819:int = 27;
      
      public static const const_1877:int = 28;
      
      public static const const_1783:int = 29;
      
      public static const const_1844:int = 100;
      
      public static const const_1775:int = 101;
      
      public static const const_1916:int = 102;
      
      public static const const_1806:int = 103;
      
      public static const const_1938:int = 104;
      
      public static const const_1895:int = 105;
      
      public static const const_1803:int = 106;
      
      public static const const_1836:int = 107;
      
      public static const const_1847:int = 108;
      
      public static const const_1944:int = 109;
      
      public static const const_1920:int = 110;
      
      public static const const_1771:int = 111;
      
      public static const const_1828:int = 112;
      
      public static const const_1794:int = 113;
      
      public static const const_1766:int = 114;
      
      public static const const_1910:int = 115;
      
      public static const const_1946:int = 116;
      
      public static const const_1799:int = 117;
      
      public static const const_1904:int = 118;
      
      public static const const_1878:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1430:
            case const_1387:
               return "banned";
            case const_1647:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
