//+------------------------------------------------------------------+
//|                                               2.4. Esercizio.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade\Trade.mqh>
CTrade trade;

input int MagicNumber = 782;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
// Setto Magic Number dell'ea
   trade.SetExpertMagicNumber(MagicNumber);

   double ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);

// Invio Buystop
   trade.BuyStop(0.1,ask + 100 * _Point, _Symbol,NULL,NULL,ORDER_TIME_DAY,0,"Apro ordine buystop figo da ea");

   SelezionoOrdineAttivo();
   SelezionoOrdinePassato();
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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SelezionoOrdineAttivo()
  {
//---variabili per la restituzione di valori dalle proprietà dell'ordine
   ulong    ticket;
   double   open_price;
   double   initial_volume;
   datetime time_setup;
   string   symbol;
   string   type;
   long     order_magic;
   long     positionID;
//--- numero degli attuali ordini in corso
   uint     total=OrdersTotal();
//--- passare attraverso gli ordini in un ciclo
   for(uint i=0;i<total;i++)
     {
      //--- restituisce il ticket dell'ordine per la sua posizione nella lista
      if((ticket=OrderGetTicket(i))>0)
        {
         //--- restituisce le proprietà dell'ordine
         open_price    =OrderGetDouble(ORDER_PRICE_OPEN);
         time_setup    =(datetime)OrderGetInteger(ORDER_TIME_SETUP);
         symbol        =OrderGetString(ORDER_SYMBOL);
         order_magic   =OrderGetInteger(ORDER_MAGIC);
         positionID    =OrderGetInteger(ORDER_POSITION_ID);
         initial_volume=OrderGetDouble(ORDER_VOLUME_INITIAL);
         type          =EnumToString(ENUM_ORDER_TYPE(OrderGetInteger(ORDER_TYPE)));

         if(order_magic == MagicNumber)
           {
            //--- prepara e mostra le informazioni sull'ordine
            printf("il #ticket %d %s %G %s at %G è stato impostato a %s, magic number: %d",
                   ticket,                 // ticket ordine
                   type,                   // tipo
                   initial_volume,         // volume piazzato
                   symbol,                 // simbolo
                   open_price,             // prezzo di apertura specificato
                   TimeToString(time_setup), // tempo di piazzamento dell'ordine
                   order_magic
                  );

            // Cancello ordine
            // trade.OrderDelete(ticket);

            double max = iHigh(_Symbol,PERIOD_CURRENT,iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,10,0));
            // Modificho ordine
            trade.OrderModify(ticket,max,NULL,NULL,ORDER_TIME_DAY,0);
           }
        }
     }
  }
//+------------------------------------------------------------------+
void SelezionoOrdinePassato()
  {
   datetime from=0;
   datetime to=TimeCurrent();
//--- richiede l'intera cronistoria
   HistorySelect(from,to);
//---variabili per la restituzione di valori dalle proprietà dell'ordine
   ulong    ticket;
   double   open_price;
   double   initial_volume;
   datetime time_setup;
   datetime time_done;
   string   symbol;
   string   type;
   long     order_magic;
   long     positionID;
//--- numero degli ordini passati
   uint     total=HistoryOrdersTotal();
//--- passa attraverso gli ordini in un ciclo
   for(uint i=0;i<total;i++)
     {
      //--- restituisce il ticket dell'ordine per la sua posizione nella lista
      if((ticket=HistoryOrderGetTicket(i))>0)
        {
         //--- restituisce le proprietà dell'ordine
         open_price    =HistoryOrderGetDouble(ticket,ORDER_PRICE_OPEN);
         time_setup    =(datetime)HistoryOrderGetInteger(ticket,ORDER_TIME_SETUP);
         time_done     =(datetime)HistoryOrderGetInteger(ticket,ORDER_TIME_DONE);
         symbol        =HistoryOrderGetString(ticket,ORDER_SYMBOL);
         order_magic   =HistoryOrderGetInteger(ticket,ORDER_MAGIC);
         positionID    =HistoryOrderGetInteger(ticket,ORDER_POSITION_ID);
         initial_volume=HistoryOrderGetDouble(ticket,ORDER_VOLUME_INITIAL);

         // Mi entri nell'if solamente se l'ordine passato ha lo stesso magic number del mio ea
         if(order_magic == MagicNumber)
           {
            //--- prepara e mostra le informazioni sull'ordine
            printf("#ticket %d %s %G %s at %G era impostato a %s => fatto a %s, pos ID=%d",
                   ticket,                  // ticket dell'ordine
                   type,                    // tipo
                   initial_volume,          // volume piazzato
                   symbol,                  // simbolo
                   open_price,              // prezzo open specificato
                   TimeToString(time_setup),// orario di piazzamento dell'ordine
                   TimeToString(time_done), // orario di esecuzione o cancellazione dell'ordine
                   positionID               // ID di una posizione, per cui la quantità dell'ordine è inclusa
                  );
           }
        }
     }
//---
  }
//+------------------------------------------------------------------+
