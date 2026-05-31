//+------------------------------------------------------------------+
//|                                               1.9. Esercizio.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// 3.

// Variabili globali per una organizzazione migliore
string account_name,account_company,account_currency,account_server;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
// Assegno i valori dell'account richiamando la funzione
   account_name = AccountInfoString(ACCOUNT_NAME);
   account_currency = AccountInfoString(ACCOUNT_CURRENCY);
   account_server = AccountInfoString(ACCOUNT_SERVER);
   account_company = AccountInfoString(ACCOUNT_COMPANY);

// 1.
   Print("=== EA AVVIATO ===");
   Print("Nome account: ",account_name);
   Print("Società: ",account_company);
   Print("Valuta: ",account_currency);
   Print("Server: ",account_server);

// 2.
   if(account_name == "Federico Quintieri" || account_currency == "EUR" || account_currency == "USD")
      return(INIT_SUCCEEDED);
   else
     {
      Print("Account non autorizzato");
      return(INIT_FAILED);
     }
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Print("Evento Deinit Eseguito");
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//Print("Evento Tick Eseguito");
  }
//+------------------------------------------------------------------+
