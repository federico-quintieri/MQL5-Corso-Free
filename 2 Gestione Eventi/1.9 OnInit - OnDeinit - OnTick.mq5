//+------------------------------------------------------------------+
//|                               1.9 OnInit - OnDeinit - OnTick.mq5 |
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
   Print("Evento Init Eseguito");
   Print(AccountInfoString(ACCOUNT_NAME));
   Print(AccountInfoString(ACCOUNT_COMPANY));
   Print(AccountInfoString(ACCOUNT_CURRENCY));
   Print(AccountInfoString(ACCOUNT_SERVER));

   string nome_account = AccountInfoString(ACCOUNT_NAME);

   if(nome_account == "Federico Quintieri")
      return(INIT_SUCCEEDED);
   else
      return(INIT_FAILED);

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
