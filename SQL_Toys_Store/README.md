## **Esercitazione Finale del Modulo SQL**

**Case Study:**

**🪁ToysGroup 🧸** distribuisce giocattoli in diverse aree geografiche del mondo. I prodotti sono classificati in categorie e i mercati di riferimento sono organizzati in regioni di vendita.

**🔍Scenario:**

- Prodotti organizzati in categorie gerarchiche (es. "Bikes-100" → categoria "Bikes")
- Stati raggruppati in regioni di vendita (es. "France", "Germany" → regione "WestEurope")
- Transazioni di vendita che collegano prodotti e mercati geografici

**🎯 Obiettivi del Progetto**
Progettare e implementare un database relazionale che:

  - Modelli lo scenario aziendale con entità Product, Region, Sales e relative gerarchie
  - Garantisca integrità referenziale attraverso chiavi primarie e foreign keys
  - Minimizzi la ridondanza dei dati applicando principi di normalizzazione
  - Fornisca query analitiche per:
      -Verificare l'univocità delle chiavi
      -Generare report di vendita dettagliati
      -Analizzare performance prodotti e categorie
      -Calcolare fatturati per stato/anno
      -Identificare prodotti invenduti
      -Creare viste denormalizzate per reporting
