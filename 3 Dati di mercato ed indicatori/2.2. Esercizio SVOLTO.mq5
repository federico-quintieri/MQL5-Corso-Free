//+------------------------------------------------------------------+
//|                                               2.2. Esercizio.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

input group "MACD"
input int fast_ema = 12;
input int slow_ema = 26;
input int signal = 9;

int handle;
double istogramma[];

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   handle = iMACD(_Symbol,PERIOD_CURRENT,fast_ema,slow_ema,signal,PRICE_CLOSE);
   ArraySetAsSeries(istogramma,true);

   ChartIndicatorAdd(ChartID(),1,handle);

// 4.
   if(handle == INVALID_HANDLE)
     {
      Print("Errore inizializzazione macd");
      return INIT_FAILED;
     }
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   IndicatorRelease(handle);

   string macd_name = StringFormat("MACD(%d,%d,%d)",fast_ema,slow_ema,signal);
   ChartIndicatorDelete(ChartID(),1,macd_name);

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

   int copiati = CopyBuffer(handle,0,0,5,istogramma);
// 1.
   Print("Valori copiati ", copiati);
   if(copiati <= 0)
     {
      Print("Errori nel copiare i dati del macd");
      return;
     }

// 2.
   for(int i = 0; i < ArraySize(istogramma); i++)
     {
      Print("Ad indice: ", i, " | Istogramma MACD vale: ", istogramma[i]);
     }

// 3.
   if(istogramma[0] > 0)
      Print("Macd rialzista");
   else
      if(istogramma[0] < 0)
         Print("Macd ribassista");
  }
//+------------------------------------------------------------------+
