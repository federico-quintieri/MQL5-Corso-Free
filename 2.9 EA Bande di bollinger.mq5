//+------------------------------------------------------------------+
//|                                    2.9 EA Bande di bollinger.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

// 1. Includo le librerie
#include <Trade\Trade.mqh>
#include <FQInfo\Info.mqh>
#include <FQRischio\Rischio.mqh>
#include <FQGestione\Gestione.mqh>

// 2. Variabili oggetto delle classi
CInfo info;
CTrade trade;
CRischio rischio;
CGestione gestione;

// 3. Variabili input
input group "Generali"
input int MagicNumber = 777; // Magic Number
input double Lotti = 0.1;    // Lotti

input group "Bande di Bollinger"
input int bb_period = 20;    // Periodo media
input double bb_deviation = 2.0; // Deviazione standard

// 4. Variabili globali
int handle_bb = 0;
double banda_su[], banda_giu[], mediana[];
bool posizioni_aperte = false;
double massimi[], minimi[], aperture[], chiusure[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
// 5. Setto magic number ea
   trade.SetExpertMagicNumber(MagicNumber);

// 6. handle indicatore e preparazione array per buffer
   handle_bb = iBands(_Symbol,PERIOD_CURRENT,bb_period,0,bb_deviation,PRICE_CLOSE);

   ArraySetAsSeries(banda_giu,true);
   ArraySetAsSeries(banda_su,true);
   ArraySetAsSeries(mediana,true);
   ArraySetAsSeries(massimi,true);
   ArraySetAsSeries(minimi,true);
   ArraySetAsSeries(aperture,true);
   ArraySetAsSeries(chiusure,true);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
// 7. Rilascio indicatore bande
   IndicatorRelease(handle_bb);

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
// 8. Istruzioni da eseguire una volta per candela
   if(info.NuovaCandela() == true)
     {

      // 9. Controllo se ci sono posizioni aperte
      posizioni_aperte = info.CiSonoPosizioni(MagicNumber,_Symbol);

      // 10. Se non ci sono posizioni aperte eseguo la funzione per aprirne
      if(posizioni_aperte == false)
        {
         Invio_Posizioni();
        }
      // 11. Altrimenti eseguo la funzione per gestire le chiusure
      else
        {
         Chiusura_Posizioni();
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// Funzione che aggiorna gli array delle bande e delle candele
void Aggiorno_Buffer()
  {

// Aggiorno gli array delle bande
   CopyBuffer(handle_bb,2,0,5,banda_giu);
   CopyBuffer(handle_bb,1,0,5,banda_su);
   CopyBuffer(handle_bb,0,0,5,mediana);

// Aggiorno gli array delle candele
   CopyClose(_Symbol,PERIOD_CURRENT,0,5,chiusure);
   CopyOpen(_Symbol,PERIOD_CURRENT,0,5,aperture);
   CopyHigh(_Symbol,PERIOD_CURRENT,0,5,massimi);
   CopyLow(_Symbol,PERIOD_CURRENT,0,5,minimi);
  }

// Funzione che apre posizioni BUY o SELL se ci sono le condizioni giuste
void Invio_Posizioni()
  {
// Richiama la funzione che mi aggiorna gli array globali
   Aggiorno_Buffer();

// Prendo ask e bid
   double ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   double bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);

// Condizione apertura BUY
   if(minimi[1] < banda_giu[1] && chiusure[1] > banda_giu[1] && aperture[1] > banda_giu[1])
     {
      Print("Minimi");
      ArrayPrint(minimi);

      Print("Banda giu");
      ArrayPrint(banda_giu);

      Print("Chiusure");
      ArrayPrint(chiusure);

      Print("Aperture");
      ArrayPrint(aperture);

      trade.Buy(Lotti,_Symbol,ask,NULL,NULL,"Apro BUY Tocco Banda");
     }

// Condizione apertura SELL
   if(massimi[1] > banda_su[1] && chiusure[1] < banda_su[1] && aperture[1] < banda_su[1])
     {

      Print("Massimi");
      ArrayPrint(massimi);

      Print("Banda giu");
      ArrayPrint(banda_su);

      Print("Chiusure");
      ArrayPrint(chiusure);

      Print("Aperture");
      ArrayPrint(aperture);

      trade.Sell(Lotti,_Symbol,bid,NULL,NULL,"Apro SELL Tocco Banda");
     }
  }
//+------------------------------------------------------------------+

// Funzione per chiudere le posizioni
void Chiusura_Posizioni()
  {
// Richiamo la funzione che mi aggiorna gli array globali
   Aggiorno_Buffer();

// Chiudo BUY
   if(chiusure[1] > banda_su[1])
     {
      gestione.ChiudiPosizioni(POSITION_TYPE_BUY,_Symbol,MagicNumber);
     }

// Chiudo SELL
   if(chiusure[1] < banda_giu[1])
     {
      gestione.ChiudiPosizioni(POSITION_TYPE_SELL,_Symbol,MagicNumber);
     }


  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
