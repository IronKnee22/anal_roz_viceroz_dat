## Co je to kvartil?✔️
**Kvartil je hodnota, která dělí seřazená data na čtyři stejné části. Existují tři kvartily:**
1. kvartil (Q1): hodnota, pod kterou leží 25 % dat
2. kvartil (Q2): medián, dělí data na poloviny
3. kvartil (Q3): hodnota, pod kterou leží 75 % dat  

Kvartily se používají k popisu rozložení dat a k detekci odlehlých hodnot.

## Jaký je rozdíl mezi výběrovým průměrem a mediánem?✔️
**Výběrový průměr:**  
Součet všech hodnot ve výběru dělený jejich počtem. Ovlivněn extrémními hodnotami (odlehlými daty).

**Medián:**  
Střední hodnota seřazeného výběru. Není ovlivněn odlehlými hodnotami.

**Rozdíl:**  
Průměr odráží celkovou hodnotu dat, ale je citlivý na extrémy, zatímco medián lépe reprezentuje „typickou“ hodnotu v případě asymetrického rozdělení.

## Co je to histogram?✔️
**Histogram** je grafické znázornění rozdělení numerických dat. Osa X zobrazuje intervaly hodnot (tzv. třídy), osa Y počet (frekvenci) hodnot v každé třídě. Sloupce jsou spojité – bez mezer. Histogram slouží k posouzení tvaru rozdělení dat (např. symetrie, špičatost, přítomnost odlehlých hodnot).

## Jak se zobrazuje odlehlá hodnota v box grafu?✔️
Odlehlá hodnota v box grafu (boxplotu) se zobrazuje jako samostatný bod (tečka nebo křížek) mimo „vousy“ grafu.
Je definována jako hodnota ležící mimo interval:  
- Q1−1.5×IQR,Q3+1.5×IQR,
- kde IQR = Q3 - Q1 (interkvartilové rozpětí).

## Hierarchické shlukování ✔️
**Hierarchické shlukování** (hierarchical clustering) je metoda shlukové analýzy, která seskupuje data do stromové struktury (dendrogramu), podle jejich podobnosti. Cílem je uspořádat objekty do hierarchie – tedy do „stromu“, kde blíže příbuzné objekty tvoří menší skupiny a ty se postupně spojují do větších celků.

## Shlukování rozkladem✔️
**Shlukování rozkladem** (partitioning clustering) je metoda, která rozdělí množinu dat do pevně daného počtu K shluků (K je zadáno předem).

Nejznámější metoda:  
K-means (nejbližší střed):
- Zvolí se K počátečních středů (náhodně).
- Každý bod se přiřadí ke středu, ke kterému má nejmenší vzdálenost.
- Spočítají se nové středy jako průměr bodů ve shluku.
- Opakuje se, dokud se středy nezmění (konvergence).

## Co je shluková analýza?✔️
**Shluková analýza** je metoda neřízeného učení, která slouží k rozdělení dat do skupin (shluků) tak, aby si data uvnitř shluku byla co nejpodobnější a mezi shluky co nejodlišnější.

## Vysvětlete proč je nutná normalizace dat při shlukování.✔️
Normalizace dat při shlukování je nutná, protože:
- Různé proměnné mohou mít různý rozsah hodnot (např. věk 0–100, příjem 0–100 000).
- Bez normalizace by proměnné s větším rozsahem dominovaly při výpočtu vzdáleností, které jsou základem většiny shlukovacích metod.
- Normalizace (např. z-skóre nebo min-max) zajistí, že všechny proměnné mají stejnou váhu při výpočtu vzdáleností.

## Základní algoritmus ID3❌
ID3 vytváří rozhodovací stromy a používá entropii a informační zisk k výběru nejvhodnějších atributů.

## Entropie❌
Je to míra nejistoty nebo průměrné informace, kterou dostaneme při pozorování náhodné proměnné

## 1. Co je to perceptron✔️

Perceptron je **jednoduchý neuronový model** pro binární klasifikaci. Vstupy násobí váhami, sčítají se a výstup se určí pomocí aktivační funkce (např. signum).

---

#### **a. Jak se v něm vybavuje odpověď? Co je jeho odpovědí?**

* Vstupy $x_i$ se vynásobí váhami $w_i$, spočítá se součet $\sum w_i x_i + b$ (bias).
* Tento součet se vloží do **aktivační funkce**.
* Odpověď je typicky **0 nebo 1** (binární výstup).

---

#### **b. Jak se perceptron učí?**

* Prochází trénovací data a upravuje váhy podle **chyby mezi výstupem a cílovou hodnotou**.
* Učení probíhá pomocí **delta pravidla**:

  $$
  w_i \leftarrow w_i + \eta \cdot (t - y) \cdot x_i
  $$

  kde $\eta$ je **učící rychlost**, $t$ cíl a $y$ výstup.

---

#### **c. K čemu se dá použít?**

* K **binární klasifikaci** lineárně separovatelných dat.
* Např. rozpoznávání jednoduchých vzorů.

---

## 2. Co je to vícevrstvá perceptronová síť (MLP)?✔️

Síť složená z **více vrstev perceptronů** – vstupní, skrytých a výstupní vrstvy.
Umí **modelovat i nelineární vztahy** díky nelineárním aktivačním funkcím.

---

#### **a. Jak se volí počty neuronů v jednotlivých vrstvách?**

* **Vstupní vrstva:** podle počtu atributů.
* **Výstupní vrstva:** podle počtu tříd (např. 1 neuron pro binární klasifikaci).
* **Skryté vrstvy:** volí se experimentálně nebo podle heuristik (např. 1–2 skryté vrstvy, počet neuronů mezi vstupem a výstupem).

---

#### **b. Jak probíhá učení pomocí algoritmu Backpropagation?**

1. **Dopředný průchod:** spočítá se výstup sítě.
2. **Spočtení chyby:** porovná se s cílovou hodnotou.
3. **Zpětný průchod:** chyba se šíří zpět do sítě a podle ní se **aktualizují váhy** pomocí gradientního sestupu.
4. Proces se **opakovaně iteruje** přes trénovací data, dokud se chyba nezmenší.

---

**Shrnutí:**

* Perceptron = základní neuron pro binární klasifikaci.
* MLP = vícevrstvá síť pro složitější úlohy, učí se pomocí backpropagation.


## PCA❌
Analýza hlavních komponent (PCA – Principal Component Analysis) je statistická metoda používaná ke snížení rozměrnosti dat, aniž by došlo k výrazné ztrátě informace. Jejím hlavním cílem je najít nové proměnné – tzv. hlavní komponenty – které co nejlépe vystihují variabilitu původních dat. Tyto komponenty jsou lineární kombinace původních proměnných, jsou na sobě nezávislé (ortogonální) a jsou seřazeny podle toho, kolik variability v datech vysvětlují – první komponenta zachycuje největší možnou část rozptylu, druhá o něco menší, a tak dále.

Zde jsou stručné a jasné odpovědi vhodné pro test:

---

## 1. Co je to podpora (support) množiny položek?

**Podpora** je počet (nebo podíl) transakcí, které obsahují danou množinu položek.

$$
\text{Support}(X) = \frac{\text{počet transakcí obsahujících } X}{\text{celkový počet transakcí}}
$$

---

## 2. Co je množina častých položek a jak je definována?

**Častá množina položek** je taková, jejíž podpora je **větší nebo rovna zadané minimální podpoře**.

$$
\text{Support}(X) \geq \text{minsup}
$$

---

## 3. Jak byste definovali “apriori vlastnost podmnožin”?

**Apriori vlastnost:**
Pokud je množina položek častá, **všechny její podmnožiny musí být také časté**.

---

## 4. Jak funguje apriori algoritmus?

1. **Najde všechny časté 1-položky** (podle minsupu).
2. **Generuje kandidáty pro 2-položky** kombinací častých 1-položek.
3. **Odstraní kandidáty**, jejichž podmnožiny nejsou časté (apriori vlastnost).
4. **Spočítá podporu zbývajících kandidátů**.
5. **Opakuje** pro 3-položky, 4-položky atd., dokud nevzniknou žádní noví kandidáti.

---

📌 **Cílem je najít všechny časté množiny položek** bez zbytečného prohledávání nepravděpodobných kombinací.

