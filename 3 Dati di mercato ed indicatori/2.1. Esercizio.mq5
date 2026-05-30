//+------------------------------------------------------------------+
//|                                               2.1. Esercizio.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   double ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   double bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);

   Print("Ask è: ", ask);
   Print("Bid è: ", bid);

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
