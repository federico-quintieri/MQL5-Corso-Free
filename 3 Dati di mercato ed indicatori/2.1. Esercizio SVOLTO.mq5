//+------------------------------------------------------------------+
//|                                               2.1. Esercizio.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

double ask, bid;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);

// 1.
   Print("=== INFO MERCATO ===");
   Print("Simbolo: ", _Symbol, " | Ask: ", ask, " | Bid: ", bid);

// 2.
   double spread = NormalizeDouble(ask - bid, _Digits);
   Print("Spread : ", spread);

// 3.
   if(spread > 20 * _Point)
      Print("Spread troppo alto, mercato non ideale");
   else
      Print("Spread accettabile");


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
   double lastBid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
   double lastAsk = SymbolInfoDouble(_Symbol,SYMBOL_ASK);

// 4.
   if(ask != lastAsk)
     {
      ask = lastAsk;
      Print("Ask aggiornato: ", ask);
     }

   if(bid != lastBid)
     {
      bid = lastBid;
      Print("Bid aggiornato: ", bid);
     }

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
