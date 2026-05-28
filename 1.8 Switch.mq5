//+------------------------------------------------------------------+
//|                                                   1.8 Switch.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// Enumerazione
enum ENUM_SCELTA_MULTIPLA
  {
   medie = 0,
   rsi = 1,
   bande = 2,
  };

input ENUM_SCELTA_MULTIPLA scelta = medie;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   switch(scelta)
     {
      case medie:
         Print("Medie");
         break;
      case rsi:
         Print("RSI");
         break;
      case bande:
         Print("Bande");
         break;
      default:
         Print("Default");
         break;
     }

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

  }
//+------------------------------------------------------------------+
