//+------------------------------------------------------------------+
//|                                               1.4. Esercizio.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade\Trade.mqh>
CTrade trade;

// Variabili input
input double Lotti = 0.1;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   double Ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
// 4.
   Print("Lotti: ", Lotti, " | Ask: ",Ask);

// 1. e 3.
   if(Lotti >= 0.1 && Ask > 1.00000 && Lotti <= 1)
     {
      trade.Buy(Lotti,_Symbol,Ask,NULL,NULL,"Apro BUY");
     }
// 2.
   else
     {
      Print("Condizioni non valide, nessun ordine aperto");
      Print("Lotti troppo alti NON aprire il trade");
     }

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

  }
//+------------------------------------------------------------------+
