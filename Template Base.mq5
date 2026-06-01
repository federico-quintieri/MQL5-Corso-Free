//+------------------------------------------------------------------+
//|                                                Template Base.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


// 1. Includo le librerie

// 2. Variabili oggetto delle classi

// 3. Variabili input

// 4. Variabili globali

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
// 5. Setto magic number ea

// 6. Creazione handle indicatori

// 7. Setta come serie gli array buffer e per le candele


   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
// 7. Rilascio indicatore bande

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
// 8. Dentro if richiamo metodo per controllare se c'è nuova candela della classe CInfo
   if(true)
     {
      // 9. Controllo se ci sono posizioni aperte e ordini aperti

      // 10. Se non ci sono posizioni aperte eseguo la funzione per aprirne

      // 11. Altrimenti eseguo la funzione per gestire le chiusure

     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// Funzione che aggiorna gli array delle bande e delle candele
void Aggiorno_Buffer()
  {
// Aggiorno valori con CopyBuffer

// Aggiorno gli array delle candele con CopyClose ecc...
  }

// Funzione che apre posizioni BUY o SELL se ci sono le condizioni giuste
void Invio_Posizioni()
  {
// Richiama la funzione che mi aggiorna gli array globali

// Prendo ask e bid

// Variabili locali per contenere livelli di stop - take ed entrata delle posizioni/ordini
   double livello_stop = 0;

// Condizione apertura BUY
   if(true)
     {
      // Dentro if assegni alle variabili dei livelli i valori giusti ed invi posizione/ordine

     }

// Condizione apertura SELL
   if(true)
     {
      // Dentro if assegni alle variabili dei livelli i valori giusti ed invi posizione/ordine

     }
  }
//+------------------------------------------------------------------+

// Funzione per chiudere le posizioni
void Chiusura_Posizioni()
  {
// Richiamo la funzione che mi aggiorna gli array globali

// Condizione per chiudere il BUY
   if(true)
     {
      // Richiamo il metodo della libreria CGestione per chiudere o cancellare
     }

// Condizione per chiudere il SELL
   if(true)
     {
      // Richiamo il metodo della libreria CGestione per chiudere o cancellare
     }
  }
//+------------------------------------------------------------------+
