# ♻️⚡🌍 **Renewable Energy Finance Flows**

Questo progetto è il Capstone del Corso in Data Analyst di Epicode.

L’idea alla base di questo progetto nasce dal desiderio di applicare gli strumenti appresi durante il corso, in particolare Phyton e Power BI, alle tematiche relative il mio ambito di lavoro, ossia Clima e International Development. Ho quindi deciso di analizzare come la finanza internazionale si orienta verso progetti in energia rinnovabile in paesi emergenti e in via di sviluppo. 


## 🔢 **Dati** 

Il primo passo è stato quello di ricercare i dati disponibili. Ho trovato 3 database interessanti: 

- Renewable Energy Finance Flows dell' International Renewable Energy Agency (IRENA) https://www.irena.org/Data/View-data-by-topic/Finance-and-Investment/Renewable-Energy-Finance-Flows
- Data on CO2 and Greenhouse Gas Emissions di Our World in Data (OWID) https://github.com/owid/co2-data/tree/master
- Global Data on Sustainable Energy (2000-2020) di Ansh Tanwar on Kaggle https://www.kaggle.com/datasets/anshtanwar/global-data-on-sustainable-energy?resource=download

## 🔍 **Obiettivo dell'Analisi** 
Elaborando e unendo questi dataset ho voluto analizzare:

•	dove si concentra la finanza internazionale per l'energia rinnovabile,

•	quali tecnologie vengono maggiormente finanziate,

•	e quanto gli investimenti riescono davvero a ridurre le emissioni o aumentare l’accesso all’energia rinnovabile.


## ✂️ **Preparazione e pulizia dei dati**

### ⚡Pulizia su Phyton ###

Dopo aver controllato le licenze (CC BY 4.0), ho utilizzato Phyton per esplorare i database. Essendo molto ampi, ho deciso di concentrarmi solo su 162 paesi che erano presenti in tutti e 3 i database. Essendo i nomi dei paesi diversi tra i 3 database, ho usato diverse volte XLOOKUP su Excel per capire quali paesi tenere e creare la lista dei nomi da usare. Ho poi usato Phyton per uniformare le colonne e pulire i nomi dei paesi affinchè tutti e 3 i database avessero esattamente gli stessi paesi con gli stessi nomi. 

Ho dunque scaricato 3 database ognuno con i 162 paesi selezionati per l'analisi. 

### 📊 Power BI ###

Dopo aver importato i file excel in Power BI, ho continuato a pulire i database. 
Ho poi impostato un arco temporale, decidendo di coprire il periodo compreso tra 2000 e 2020. Ho fatto una merge tra la tabella con gli indicatori e quella con i valori di Co2 per avere in tutte e 3 le tabelle gli iso_code. Ho deciso di tenere solo le colonne utili all'analisi. Ho trasformato alcuni valori da USD ad EUR e in valori monetari leggibili. Ho creato delle altre tabelle utili per le relazioni

Una volta caricati i dati ho impostato le relazioni nel modello dati. 

Ho creato delle Dax utili all'anslisi, come la somma, la media e la variazione percentuale di alcuni valori. 

Ho poi creato il report aggiungendo slicers, bookmarks, grafici e testi che spiegano i grafici più complessi. 

---

## 💡 Difficoltà Incontrate e Risoluzione ##

❓ **Ipotesi di partenza**

Ero partita da un’ipotesi chiara: i Paesi con maggiori investimenti in energia rinnovabile mostrano una diminuzione delle emissioni di CO₂.
Questo era il risultato che intendevo dimostrare. Tuttavia, già nelle prime fasi di esplorazione dei dati, l’ipotesi si è rivelata non corretta.
Questo imprevisto, però, si è rivelato utile: mi ha permesso di approfondire meglio il dataset e di concentrarmi su indicatori che inizialmente avevo sottovalutato, ampliando così le tematiche affrontate nel report. 

🧪**I Paesi campione**

L’obiettivo iniziale era utilizzare tutti i Paesi presenti nel dataset di IRENA.
Tuttavia, durante la fase di pulizia dei dati, mi sono accorta che non era possibile farlo per due motivi principali:

- **Mancanza di dati**: non tutti i Paesi erano presenti negli altri database utilizzati;

- **Incoerenza nei nomi dei Paesi**: le denominazioni differivano tra i dataset, causando errori nelle query e impedendo il corretto collegamento dei dati.

Ho tentato di utilizzare l’ISO code come chiave di unione, ma anche questo risultava mancante in uno dei database. Per risolvere il problema, ho usato la funzione XLOOKUP in Excel per individuare i Paesi presenti in tutti e tre i dataset e quelli con nomi non corrispondenti.
Dopo aver uniformato le denominazioni dei Paesi, sono riuscita a eseguire una merge basata sull’ISO code, ottenendo finalmente un dataset coerente.

🔗 **Relazioni nel modello dati**

Utilizzando ISO code e anni, ho creato una chiave per definire le relazioni tra le tabelle.Nel primo modello dati, le relazioni erano impostate da uno a molti (indicatori e CO₂ → progetti).
Non ho voluto unire le tabelle “indicatori” e “CO₂” perchè volevo tenerli separati. Tuttavia, questa scelta ha creato alcune difficoltà durante l’uso degli slicer in Power BI, poiché le relazioni erano impostate come “single” e non filtravano. Ho deciso quindi di creare tabelle dedicate agli slicer e di stabilire relazioni uno-a-molti da queste verso le 3 tabelle principali (indicatori, co2, progetti). 

🗺️ **Mappe**

Per la mappa dei Paesi finanziatori, inizialmente avevo utilizzato il nome del donor come riferimento geografico. Tuttavia, questo approccio non funzionava bene, poiché alcuni donor multilaterali (composti da più Paesi) non venivano visualizzati correttamente.

Per risolvere il problema, ho creato in Excel una nuova tabella con l’elenco dei Paesi finanziatori e delle relative agenzie, utilizzando l’AI per generare la lista.
Una volta caricata la tabella su Power BI, ho dovuto impostare una relazione molti-a-molti tra questa e la tabella dei progetti, poiché in entrambe più Paesi possono essere associati a più donor e viceversa. Questa soluzione ha risolto il problema di visualizzazione, anche se ha reso il report leggermente più lento nell’elaborazione.


---
