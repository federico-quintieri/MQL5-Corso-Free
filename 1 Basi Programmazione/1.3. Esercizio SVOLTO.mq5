//+------------------------------------------------------------------+
//|                                               1.3. Esercizio.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// + - * / %
// > < >= <= ==
// && || !

input bool variabile_test = false;

int numero1 = 10;
int numero2 = 5;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
// Somma
   Print("Somma: ", numero1+numero2);

// Sottrazione
   Print("Sottrazione: ", numero1-numero2);

// Moltiplicazione
   Print("Moltiplicazione: ", numero1*numero2);

// Divisione
   Print("Divisione: ", numero1/numero2);

// Resto della divisione
   Print("Resto: ", numero1%numero2);

   if(numero1 > numero2)
     {
      Print("Numero1 è maggiore a numero2");
     }


   if(numero1 > numero2 && variabile_test == true)
     {
      Print("Condizione verificata");
     }
   else
     {
      Print("Condizione falsa");
     }

   if(variabile_test == false || variabile_test == true)
      Print("La variabile di input è falsa");

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
