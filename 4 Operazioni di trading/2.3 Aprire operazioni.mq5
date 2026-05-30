//+------------------------------------------------------------------+
//|                          2.3 Come funziona il trading in MT5.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// Ordine - Deal - Posizione

// 1. Importare una libreria
#include <Trade\Trade.mqh>

// 2. Variabile oggetto che mi permette di utilizzare funzioni della libreria
CTrade trade;

input int MagicNumber = 321;

int BarsCount = 0;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
// 3. Setto il magic number
   trade.SetExpertMagicNumber(MagicNumber);


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

   if(Bars(_Symbol,PERIOD_CURRENT) > BarsCount)
     {
      double bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
      double ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);

      trade.Buy(0.1,_Symbol,ask,bid - 500 * _Point, bid + 300 * _Point,"IL mio ea apre un buy");

      BarsCount = Bars(_Symbol,PERIOD_CURRENT);
     }
  }
//+------------------------------------------------------------------+
