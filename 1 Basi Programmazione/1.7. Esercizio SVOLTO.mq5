//+------------------------------------------------------------------+
//|                                               1.7. Esercizio.mq5 |
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

// 4.
   double somma = SommaFunzione(4,3);
   double moltiplicazione = MoltiplicaNumeri(7,7);

   Print("Somma: ",somma);
   Print("Moltiplicazione: ",moltiplicazione);

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
//|                                                                  |
//+------------------------------------------------------------------+

// 1.
double SommaFunzione(double a, double b)
  {
// 2.
   Print("Sto sommando: a + b");
   return a + b;
  }
//+------------------------------------------------------------------+

// 3.
double MoltiplicaNumeri(double a, double b)
  {
   Print("Sto moltiplando: a * b");
   return a * b;
  }
//+------------------------------------------------------------------+
