//+------------------------------------------------------------------+
//|                                               1.8. Esercizio.mq5 |
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
// 1.
   macd = 3,
   stocastico = 4,
  };

input ENUM_SCELTA_MULTIPLA scelta = medie;

// 3.
bool attiva_strategia = true;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   if(attiva_strategia)
     {
      // 2.
      switch(scelta)
        {
         case medie:
            Print("Medie");
            Print("Strategia basata su incrocio medie");
            break;
         case rsi:
            Print("RSI");
            Print("Strategia basata su RSI");
            break;
         case bande:
            Print("Bande");
            Print("Strategia su Bollinger Bands");
            break;
         case macd:
            Print("Macd");
            Print("Strategia MACD trend");
            break;
         case stocastico:
            Print("Stocastico");
            Print("Strategia momentum stocastico");
            break;
         default:
            Print("Default");
            Print("Scelta non riconosciuta, uso strategia base");
            break;
        }
     }
   else
     {
      Print("Strategia disattivata");
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

//+------------------------------------------------------------------+
