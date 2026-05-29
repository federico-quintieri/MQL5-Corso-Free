//+------------------------------------------------------------------+
//|                                               1.2. Esercizio.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// Variabili di input
input group "Principali"
input int numero_utente = 3;

// Variabili Globale
int    numero = 1;
double numero_virgola = 1.3;
bool   booleano = true;
string parola = "Ciao";

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   Print("Input:", numero_utente);


// Stampo la variabile globale "numero"
   Print("La variabile  ", numero);

   int numero_locale = 2;

// Stampo la variabile locale "numero_locale"
   Print("La variabile numero locale: ", numero_locale);

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
