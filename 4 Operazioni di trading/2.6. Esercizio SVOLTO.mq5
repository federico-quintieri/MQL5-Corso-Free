//+------------------------------------------------------------------+
//|                                               2.6. Esercizio.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade\Trade.mqh>
CTrade trade;

input group "Generali"
input int MagicNumber = 421;
input double Lotti = 0.1;

double ask = 0,bid = 0;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   trade.SetExpertMagicNumber(MagicNumber);

   ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);

   trade.Buy(Lotti,_Symbol,ask,NULL,NULL,"Apro BUY");


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
   SelezionePosizioni();
  }
//+------------------------------------------------------------------+
void SelezionePosizioni()
  {

   string position_symbol;
   double position_profit;
   double position_price;
   datetime position_open_time;
   long position_magic;

//--- in un ciclo per tutte le posizioni del conto
   int total=PositionsTotal();
   for(int i=0; i<total; i++)
     {
      //--- ottenere il ticket della posizione successiva selezionando automaticamente una posizione per accedere alle sue proprietà
      ulong ticket=PositionGetTicket(i);
      if(ticket==0)
         continue;

      position_symbol = PositionGetString(POSITION_SYMBOL);
      position_price = PositionGetDouble(POSITION_PRICE_OPEN);
      position_profit = PositionGetDouble(POSITION_PROFIT);
      position_open_time = (datetime)PositionGetInteger(POSITION_TIME);
      position_magic = PositionGetInteger(POSITION_MAGIC);

      if(position_magic == MagicNumber)
        {
         PrintFormat("La posizione selezionata ha simbolo: %s - prezzo di apertura: %.5f - profitto: %.2f - ora apertura: %s",
                     position_symbol,
                     position_price,
                     position_profit,
                     TimeToString(position_open_time, TIME_DATE|TIME_MINUTES));


         // Chiudo Posizione
         //trade.PositionClose(ticket);

         double StopLoss = bid - 300 * _Point;
         double TakeProfit = bid + 600 * _Point;
         // Modifico Posizione
         trade.PositionModify(ticket,StopLoss,TakeProfit);
        }
     }
  }
//+------------------------------------------------------------------+
