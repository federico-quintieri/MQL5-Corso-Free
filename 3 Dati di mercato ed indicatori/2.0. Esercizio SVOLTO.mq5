//+------------------------------------------------------------------+
//|                                               2.0. Esercizio.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

double Close[];
double somma_close = 0;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   CopyClose(_Symbol,PERIOD_CURRENT,0,5,Close);
   ArraySetAsSeries(Close,true);

   ArrayPrint(Close);

// 1.
   Print("Close attuale: ", Close[0], " - Chiusura precedente: ",Close[1], " - Chiusura candela indice 2: ", Close[2]);

// 2.
   for(int i = 0; i < ArraySize(Close); i++)
     {
      Print("Indice : ",i," | Prezzo chiusura candela: ", Close[i]);

      if(i!=4)
        {
         // 3.
         if(Close[i] > Close[i+1])
            Print("Salita rilevata");
         else
            if(Close[i] < Close[i+1])
               Print("Discesa rilevata");
        }
      // 4.
      somma_close += Close[i];
     }

   Print("Media 5 chiusure precedenti: ", somma_close / 5);

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
