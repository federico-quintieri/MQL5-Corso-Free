//+------------------------------------------------------------------+
//|                                               2.5. Esercizio.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade/Trade.mqh>
CTrade trade;

// Input
input int    MagicNumber = 3124;
input double Lotti       = 0.3;
input bool   Apri        = true;
input bool   Chiudi      = false;

// Variabili globali
double ask;
double bid;

int win = 0, loss = 0, break_even = 0;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
// Imposta il Magic Number dell'Expert Advisor
   trade.SetExpertMagicNumber(MagicNumber);


// Ottiene ASK e BID correnti
   ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);

// Apertura esempi operazioni
   if(Apri)
     {
      trade.Sell(Lotti,_Symbol,bid,0,0,"SELL EA");
     }
   else
      if(Chiudi)
        {
         trade.PositionClose(_Symbol);
        }


// Seleziona i deal nello storico
   SelezionoDeals();

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {

  }

//+------------------------------------------------------------------+
//| Selezione Deal                                                   |
//+------------------------------------------------------------------+
void SelezionoDeals()
  {
// Variabili deal
   ulong deal_ticket;
   ulong order_ticket;
   datetime transaction_time;
   long deal_type;
   long position_ID;
   long deal_magic;
   double volume;
   double deal_profit;
   string symbol;
   ENUM_DEAL_ENTRY deal_entry;
   double deal_price;

// Intervallo storico
   datetime from_date = 0;
   datetime to_date   = TimeCurrent();

// Carica lo storico dei deal
   if(!HistorySelect(from_date,to_date))
     {
      Print("Errore nella selezione dello storico");
      return;
     }

// Numero totale deal
   int deals = HistoryDealsTotal();

// Ciclo scansione deal
   for(int i = 0; i < deals; i++)
     {
      // Ottiene il ticket del deal
      deal_ticket = HistoryDealGetTicket(i);

      // Ottiene informazioni deal
      volume = HistoryDealGetDouble(deal_ticket,DEAL_VOLUME);
      transaction_time =(datetime)HistoryDealGetInteger(deal_ticket,DEAL_TIME);
      order_ticket =HistoryDealGetInteger(deal_ticket,DEAL_ORDER);
      deal_type =HistoryDealGetInteger(deal_ticket,DEAL_TYPE);
      symbol =HistoryDealGetString(deal_ticket,DEAL_SYMBOL);
      position_ID =HistoryDealGetInteger(deal_ticket,DEAL_POSITION_ID);
      deal_magic =HistoryDealGetInteger(deal_ticket,DEAL_MAGIC);
      deal_profit =HistoryDealGetDouble(deal_ticket,DEAL_PROFIT);
      deal_entry =(ENUM_DEAL_ENTRY)HistoryDealGetInteger(deal_ticket,DEAL_ENTRY);
      deal_price = HistoryDealGetDouble(deal_ticket,DEAL_PRICE);

      // 1.

      // Filtra solo i deal del nostro EA
      if(deal_magic == MagicNumber && symbol == _Symbol)
        {
         if(deal_entry == DEAL_ENTRY_OUT)
           {

            // 2. e 3.
            if(deal_profit > 0)
              {
               Print("Deal in profitto");
               win++;
              }
            else
               if(deal_profit < 0)
                 {
                  Print("Deal in perdita");
                  loss++;
                 }
               else
                 {
                  Print("Deal in paro");
                  break_even++;
                 }
            PrintFormat(
               "DEAL | Ticket: %d | Symbol: %s | Profit: %.2f | Volume: %.2f",
               deal_ticket,
               symbol,
               deal_profit,
               volume
            );

           }
         if(deal_entry == DEAL_ENTRY_IN)
           {
            PrintFormat(
               "ORDER: %d | POSITION ID: %d | TYPE: %d | ENTRY: %.5f",
               order_ticket,
               position_ID,
               deal_type,
               deal_price
            );
           }
        }
     }
     Print("Deal in profitto: ", win, " | Deal in perdita: ", loss, " Deal in paro: ", break_even);
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
