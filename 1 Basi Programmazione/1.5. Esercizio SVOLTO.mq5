//+------------------------------------------------------------------+
//|                                               1.5. Esercizio.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// Array devono contenere dati dello stesso tipo
int mio_array[50];

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

// 1.
   mio_array[0] = 10;
   mio_array[1] = 20;
   mio_array[2] = 30;
   mio_array[3] = 40;
   mio_array[4] = 50;

// 2.
   Print("Elemento 1: ", mio_array[0]);
   Print("Elemento 3: ", mio_array[2]);
   Print("Elemento 5: ", mio_array[4]);

// 3.
   for(int i = 0; i<5; i++)
     {
      Print("Elemento indice: ", i, " - ", mio_array[i]);
     }

   Print("Cosa c'è al primo posto del mio array: ", mio_array[0]);

// 4.
   Print("Dimensione array: ", ArraySize(mio_array));


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
