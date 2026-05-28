//+------------------------------------------------------------------+
//|                                                1.4 If - Else.mq5 |
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

// Se Lotti è maggiore a 0.1 apro un buy altrimenti non apro niente
   if(Lotti < 1 && Lotti > 0.01)
     {
      trade.Buy(Lotti,_Symbol,Ask,NULL,NULL,"Apro BUY");
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
