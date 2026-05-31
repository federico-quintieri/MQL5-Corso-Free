//+------------------------------------------------------------------+
//|                                               1.6. Esercizio.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


double prezzi[] = {3.4,5.3,6.3,6.2,6.2};
double somma = 0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   for(int i = 0; i < ArraySize(prezzi); i++)
     {
      // 1.
      Print("Indice ", i, " | ", "Prezzo: ",prezzi[i]);

      // 2.
      somma = somma + prezzi[i];

      // 3.
      if(prezzi[i] > 5)
         Print("Valore array maggiore a 5 - ", prezzi[i]);

     }
   Print("Somma totale: ", somma);


// 4.
   for(int i = ArraySize(prezzi) - 1; i >= 0; i--)
     {
      Print("Elementi ciclo al contrario: ", prezzi[i]);
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
