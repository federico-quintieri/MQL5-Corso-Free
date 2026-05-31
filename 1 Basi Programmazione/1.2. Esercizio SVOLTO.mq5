//+------------------------------------------------------------------+
//|                                 1.2 Variabili e tipi di dato.mq5 |
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

// 1.
double saldo = 1000.50;

// 2.
string nome_utente = "Mario";


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

// 3.
   Print("Saldo: ", saldo);
   Print("Nome utente: ",nome_utente);
   Print("Input:", numero_utente);

// 4.
   bool mercato_aperto = true;

// 5.
   Print("Mercato aperto: ",mercato_aperto);

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
