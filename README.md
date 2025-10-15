Questo progetto rappresenta l’esercitazione finale del Modulo 4 - Looker Studio.

Obiettivo del progetto
La traccia forniva tre file Excel e chiedeva di scegliere una tematica per l’analisi. 
Ho deciso di concentrarmi sulla disparità di genere tra i partecipanti del festival, analizzandola a livello di presentatori, vincitori e partecipanti.

Pulizia e preparazione dei dati
Come primo passo, ho aperto i file in Excel per avere una panoramica generale. Poiché mancava il dato relativo al genere degli artisti e non sono riuscita a reperirlo da altri database, 
ho proceduto alla pulizia e normalizzazione dei dati utilizzando Power Query. In particolare, ho:
- Rimosso duplicati e spazi vuoti;
- Pulito e uniformato i nomi degli artisti;
- Estratto nome e cognome di ogni artista;
- Identificato e rimosso i gruppi quando più artisti erano elencati insieme;
- Assegnato il genere tramite formule automatiche, e nel caso del database più complesso (quello con tutti i nomi) ho chiesto supporto a ChatGPT per completare l’attribuzione corretta del genere.

Integrazione e analisi dei dati
Dopo la pulizia, ho utilizzato MySQL per unire tutti i file in un’unica tabella centralizzata, pronta per l’analisi. 
Infine, ho importato i dati su Looker Studio per effettuare le analisi e creare le visualizzazioni.

Considerazioni finali
Questo lavoro mi ha permesso di comprendere l’importanza della pulizia e normalizzazione dei dati prima dell’analisi, nonché di sperimentare la combinazione di strumenti diversi: 
Excel/Power Query per il preprocessing, MySQL per l’integrazione e Looker Studio per la visualizzazione e interpretazione dei risultati. 
L’analisi finale ha evidenziato chiaramente le differenze di genere tra i partecipanti al festival, mostrando come la minor rappresentanza femminile influisca anche sulla popolarità dei loro brani 
e sulla visibilità complessiva.
