//+------------------------------------------------------------------+
//|                                    2.2 Richiamare indicatori.mq5 |
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

  }
//+------------------------------------------------------------------+
