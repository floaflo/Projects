# 🌄 Adventure Works Analisi Vendite

Questo progetto utilizza il database AdventureWorks per analizzare le vendite, i ricavi, i costi e la performance degli agenti di vendita. 
L’obiettivo del report:
- Comparare ricavi e costi nel tempo.
- Identificare i fattori che influenzano maggiormente i ricavi.
- Analizzare la performance degli agenti rispetto alla mediana degli ordini.
- Esplorare la distribuzione dei ricavi e la crescita delle categorie di prodotto.

## 🪜 **Task 0-1 – Collegamento e importazione dati**
Connessione al database AdventureWorks e importazione delle tabelle rilevanti.

Esplorazione preliminare: controllo dei tipi di dati, correzione dei formati e rimozione di colonne vuote.

Selezione delle colonne necessarie tramite Choose Columns, eliminando informazioni ridondanti o inutili.

Gestione valori nulli per evitare problemi nelle misure successive.

Preparazione per l’unione delle tabelle (append): Rinominazione di ResellerKey e CustomerKey in DestinationKey per uniformare le chiavi. Creazione di colonne aggiuntive per distinguere i canali di vendita (Reseller vs Internet).

## 🔠 ** Task 2 – Risoluzione conflitti di formato**
Poichè ProductKey ha formati diversi (numero vs testo), è stata duplicata la colonna e convertita in testo solo per questa operazione, mantenendo l’originale per altre analisi.

## ✂️ **Task 3-4-5 – Pulizia e trasformazioni**
Aggiunta di colonne concatenate per Nome + Cognome dei SalesPerson.

Analisi della distribuzione delle lunghezze delle stringhe in ProductAlternateKey: Operazione eseguita in Power Query per non impattare le dimensioni del modello.

Creata tabella temporanea con colonna calcolata per la lunghezza, analisi tramite Group By; la tabella non è stata caricata nel modello.
Definizione delle relazioni:
- Sales & Product: relazione molti-a-uno (un prodotto può comparire in più vendite).
- Sales & SalesPerson: relazione molti-a-uno.

## 🪛 **Task 6 – Aggregazioni**
Rimozione delle aggregazioni implicite dalle colonne della tabella Sales per evitare conflitti con misure DAX esplicite.

## 📅 **Task 7 – Creazione misura che calcoli ricavi nell’anno precedente**
Creazione della tabella calendario:

Calendar =
ADDCOLUMNS(
    CALENDAR(MIN(Sales[OrderDate]), MAX(Sales[OrderDate])),
    "Year", YEAR([Date]),
    "MonthNo", MONTH([Date]),
    "Month", FORMAT([Date], "MMM", "en-GB"),
    "Quarter", QUARTER([Date]),
    "QuarterDesc", "Q" & QUARTER([Date])
)

Relazione tra Calendar[Date] e Sales[OrderDate]. Ordinamento dei mesi e dei quarter tramite colonne MonthNo e QuarterDesc per una corretta visualizzazione.

Creazione della DAX con sameperiodlastyear: 
TSales = 
TSales LY = CALCULATE ([SalesAmount],SAMEPERIODLASTYEAR ( 'Calendar'[Date] )) 

## 🧱 **Task 8 – Creazione misure esplicite**
- per visualizzare il numero di prodotti diversi venduti in un certo periodo selezionato.
- per visualizzare il numero di ordini in un certo periodo selezionato.
- per visualizzare il numero di transazioni (singoli movimenti) in un certo periodo selezionato.
- per visualizzare il numero di unità vendute in un certo periodo selezionato.
- per calcolare il prezzo di listino medio (utilizza il campo ListPrice) della sola sottocategoria Road Frames.
- per calcolare i ricavi totali in base al prezzo di listino.
  
## 🎨 **Task 9 – Realizzazione del report**
Creazione di un report interrativo e dinamico con narrazione. 
