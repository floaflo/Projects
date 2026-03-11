# 📦 **Sistema di Gestione Magazzini e Vendite**

Questo progetto fa parte della Build Weed 2 del Corso in Data Analyst di Epicode. 

Obiettivo: Creare un database relazionale progettato per gestire la catena di distribuzione tra magazzini, negozi e vendite, con monitoraggio automatico delle giacenze e delle soglie di riordino.

## **Tipo di Relazioni**
Magazzino --> Negozio 1:N - Un magazzino rifornisce molti negozi
Negozio --> Vendite 1: N - Un negozio può avere molte vendite
Vendite --> Dettaglio Vendita 1:N - Una vendita contiene molti prodotti
Prodotto <--> Magazzino M:N - Un prodotto può essere in molti magazzine (tramite GIACENZA)
Vendite <--> Prodotto M:N - Una vendita può contenere molti prodotti (Traimite Dettaglio Vendita) 

## ⚙️ **Funzionalità del database**
1. Quando viene effettuato una vendita, il sistema aggiorna automaticamente la giacenza nel magazzino che rifornisce il negozio.
2. Sistema di alert quando un prodotto va sotto la soglia di restock.
3. Possibilità di verificare la giacenza di un prodotto specifico.

## **👥 Ragionamento e Discussione del lavoro di gruppo**
Tutto il processo è stato tracciato nel documento word "Gestione_Ordini Diario". 
