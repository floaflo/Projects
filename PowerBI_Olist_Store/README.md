# 🛒 **Olist Store Report**

Questo progetto nasce come parte dell’esercitazione finale del Modulo Power BI.
L’obiettivo era quello di simulare il mio ruolo come **Junior Data Analyst** presso Olist Store, una piattaforma brasiliana di e-commerce per venditori.

📊 Per l’analisi ho utilizzato un **database pubblico e anonimizzato** (disponibile online in formato CSV) che raccoglie gli ordini effettuati tra il 2016 e il 2018, permettendo di esplorare e analizzare le vendite rispetto ai clienti, prodotti, stato dell'ordine e area geografica. 

---

## 🎯 **Obiettivi dell’analisi**

Lo scopo era sviluppare un report interattivo in Power BI capace di rispondere a 3 principali domande analitiche:

📦 Come variano gli **ordini nel tempo** per stato dell’ordine e area geografica 

💰 Come si evolvono i **ricavi nel tempo** per stato dell’ordine e area geografica

⭐ Come si distribuiscono i **rating dei clienti** (valutazioni di soddisfazione)

---

## 🧩 **Preparazione e pulizia dei dati**

Per iniziare, ho esplorato i 9 file CSV disponibili per comprenderne la struttura e identificarne la rilevanza.
Successivamente ho importato in Power BI solo i dataset realmente utili e ho iniziato la fase di data cleaning e trasformazione in Power Query.

In particolare, ho:

🗓️ Corretto i formati dei dati (in particolare le date e i costi)

🧼 Applicato Trim e capitalizzazione per uniformare i testi

✂️ Selezionato solo le colonne utili all’analisi

🔍 Controllato e gestito i valori nulli e duplicati; sostituito i valori nulli nella categoria prodotti con "Unknown" per non perdere informazioni

📍 Aggiornato il file di geolocalizzazione direttamente nel file CSV, in Excel, usando XLOOKUP per avere i nomi completi delle Regioni brasiliane che ho scaricato da internet e non erano presenti nei file CSV poi caricato il file aggiornato in Power Query e fatto merge con le tabelle di riferimento (sia per regione che per prodotti)

---

## 📈 **Analisi e costruzione della dashboard**

Una volta sistemati i dati, ho creato le **relazioni in Model View** e creato una tabella **Calendar**. 
Dopodichè ho creato le principali misure DAX per analizzare le performance aziendali:

- Ho calcolato i ricavi totali per visualizzare il conteggio degli ordini mese per mese, confrontando anche i ricavi con quelli dell’anno precedente utilizzando la funzione SAMEPERIODLASTYEAR, e calcolando la variazione percentuale mese per mese. Lo stesso procedimento è stato applicato anche agli ordini.
- I ricavi sono stati calcolati con una somma personalizzata (SUMX) che include sia il prezzo di vendita sia il costo di spedizione/consegna.
- Per il rating, ho creato una misura DAX che calcola la media dei voti per categoria, il numero totale di recensioni e divide le recensioni in positive (4-5 stelle) e negative (1-3 stelle).

Ho poi costruito la dashboard finale, organizzando il report in pagine tematiche:

- Overview generale
- Vendite
- Ricavi
- Soddisfazione clienti
- Conclusioni e Wrap-up

---

## 🎨 **Design e funzionalità**

Per rendere il report chiaro e coinvolgente, ho curato sia la parte visiva che la user experience:

📊 Grafici interattivi e dinamici, dove necessario filtrati per top or bottom, accompagnati da descrizioni narrative che chiariscono cosa viene visualizzato e forniscono un’analisi 

🔍 Slicer per filtrare facilmente i dati (in particolare per area geografica, stato ordine e anno)

🧭 Bookmarks per una navigazione intuitiva

🎨 Stile coerente, pulito e professionale

