//+------------------------------------------------------------------+
//|                                               2.3. Esercizio.mq5 |
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
// 1.
   Print("Nuovo tick ricevuto");

   if(Bars(_Symbol,PERIOD_CURRENT) > BarsCount)
     {
     
      Print("Nuova candela ricevuta");

      // 2.
      Print("Barre aggiornate: ", Bars(_Symbol,PERIOD_CURRENT), " | Barre precedenti: ", BarsCount);

      double bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
      double ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
      double spread = NormalizeDouble(ask - bid, _Digits);

      // 3.
      if(ask > 0 && bid > 0 && spread < 30 * _Point)
        {
         // 4. e 5.
         double livello_stop = NormalizeDouble(bid-500 * _Point,_Digits);
         double livello_take = NormalizeDouble(bid+300 * _Point,_Digits);
         Comment("Livello entrata: " , ask, "\n Livello stop: ",livello_stop, "\n Livello take: ", livello_take);
         trade.Buy(0.1,_Symbol,ask,livello_stop, livello_take,"IL mio ea apre un buy");
        }
      else
         Print("Condizioni non valide per aprire buy");

      BarsCount = Bars(_Symbol,PERIOD_CURRENT);
     }
  }
//+------------------------------------------------------------------+
