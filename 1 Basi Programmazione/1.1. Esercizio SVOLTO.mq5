//+------------------------------------------------------------------+
//|                                             1.1 Struttura EA.mq5 |
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
// 1.
   Print("EA avviato correttamente");

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
// 2.
   Print("EA spento");

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

//3.

   double Ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   double Bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);

   Print("Nuovo prezzo ask arrivato: ",Ask);
   Print("Nuovo prezzo bid arrivato: ",Bid);
  }
//+------------------------------------------------------------------+
