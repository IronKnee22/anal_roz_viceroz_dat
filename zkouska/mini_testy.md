✔️❌

## Popište rozdíl mezi informovanými (učení s učitelem) a neinformovanými (učení bez učitele) metodami data miningu?✔️
**Informované metody (učení s učitelem):**  
Metody, které pracují s daty, kde každý záznam má přiřazenou cílovou proměnnou (label). Cílem je naučit model predikovat tuto proměnnou. Příklady: klasifikace, regrese.

**Neinformované metody (učení bez učitele):**
Metody, které pracují s daty bez cílové proměnné. Cílem je nalézt strukturu nebo vzory v datech. Příklady: shlukování, detekce odlehlých hodnot, asociační pravidla.

## Popište rozdíl mezi numerickou, kategorickou a ordinální proměnnou, případně uveďte příklad.✔️
**Numerická proměnná:**  
Měřitelná veličina, má číselné hodnoty, mezi nimiž lze počítat rozdíly.  
Příklad: věk, výška, teplota.

**Kategorická proměnná:**  
Popisuje kategorie bez přirozeného pořadí.  
Příklad: barva očí (modrá, hnědá, zelená).

**Ordinální proměnná:**  
Kategorická proměnná s přirozeným pořadím, ale bez známých odstupů mezi kategoriemi.  
Příklad: známka ve škole (výborný, chvalitebný, dobrý, dostatečný, nedostatečný).

## Shlukování (clustering). Stručně popište dva základní přístupy ke tvorbě shluků✔️
1. **Hierarchické shlukování:**
Vytváří hierarchii shluků (stromovou strukturu). Může být:

- Agregativní: začíná s jednotlivými body a postupně je slučuje.
- Dělivé: začíná s jedním shlukem a postupně ho rozděluje.
Výstupem je dendrogram.

2. **Shlukování rozkladem (např. K-means):**
Rozdělí data do předem zadaného počtu K shluků tak, aby body uvnitř shluku byly co nejpodobnější. Opakovaně aktualizuje středy a přiřazení bodů ke shlukům.

## Uvažujte dva body x= (1;2) a y = (4;6). Spočítejte jejich Eukleidovskou i Manhttanskou vzdálenost❌

$\mathbf{x} = (1,\ 2)$
$\mathbf{y} = (4,\ 6)$

---

**Eukleidovská vzdálenost:**

$$
\sqrt{(4 - 1)^2 + (6 - 2)^2} = \sqrt{3^2 + 4^2} = \sqrt{9 + 16} = \sqrt{25} = 5
$$

**Manhattanská vzdálenost:**

$$
|4 - 1| + |6 - 2| = 3 + 4 = 7
$$

---

**Výsledek:**

* Eukleidovská vzdálenost = **5**
* Manhattanská vzdálenost = **7**

## Výpočet entropie ❌
Máme:

* $|S| = 100$
* $y = 0$: 30 záznamů → $p_0 = 30/100 = 0{,}3$
* $y = 1$: 70 záznamů → $p_1 = 70/100 = 0{,}7$

---

### **Výpočet entropie:**

$$
H(S) = -p_0 \cdot \log_2(p_0) - p_1 \cdot \log_2(p_1)
$$

$$
H(S) = -0{,}3 \cdot (-1{,}7) - 0{,}7 \cdot (-0{,}5) = 0{,}51 + 0{,}35 = \boxed{0{,}86}
$$

---

**Odpověď:** Entropie množiny $S$ je **0,86**.


## Stručně popište klasifikátor k nejbližších sousedů (k-nn). Jak probíhá učící a klasifikační fáze?✔️ Proč je tento klasifikátor nevhodný pro velké trénovací množiny?❌
**Klasifikátor k nejbližších sousedů (k-NN):**
Přiřazuje neznámému vzorku třídu podle většiny z jeho **k nejbližších sousedů** v trénovacích datech (podle zvolené metriky, např. Eukleidovské vzdálenosti).

---

### **Učící fáze:**

**Neprobíhá žádné učení.** Trénovací data se pouze uloží (paměťový přístup).

### **Klasifikační fáze:**

1. Spočítají se vzdálenosti mezi novým vzorkem a všemi trénovacími vzorky.
2. Vybere se k nejbližších sousedů.
3. Přiřadí se třída podle většiny z těchto sousedů.

---

### **Nevýhoda pro velké množiny:**

Vyžaduje **výpočet vzdáleností ke všem trénovacím vzorkům**, což je **časově náročné** (pomalá klasifikace).  
Také **paměťově náročné**, protože se ukládají všechna trénovací data.

### Jaká součást přípravy dat před shlukováním je obykle nezbytná a proč?
**Nezbytnou součástí přípravy dat před shlukováním je normalizace (škálování) proměnných.**

---

### **Důvod:**

Většina shlukovacích algoritmů (např. K-means) používá **vzdálenosti** mezi body.
**Proměnné s větším rozsahem** by ovlivnily výpočet vzdáleností **více** než proměnné s menším rozsahem.
Normalizací (např. na rozsah ⟨0,1⟩ nebo pomocí z-skóre) se **všem proměnným přidělí stejná váha**.

---

### **Shrnutí:**

**Normalizace zajišťuje, že žádná proměnná nedominuje výpočtu vzdáleností → správné shluky.**


## **Regresní koeficienty:**✔️
Test 4

* **Intercept (β₀)** = −47.3060
* **Koeficient pro výšku (β₁)** = 0.3385

---

### **Formální zápis (rovnice) modelu:**

$$
\text{tuk}_{\text{fat}} = -47.3060 + 0.3385 \cdot \text{tuk}_{\text{height}}
$$

---

Tedy: **Pro každé zvýšení výšky o 1 jednotku vzroste procento tělesného tuku v průměru o 0.3385 %.**

## **Statistická významnost (p-hodnota) pro proměnnou height:** ✔️
test 4

Z výstupu je:

$$
p = 0{,}0126
$$

---

### **Hodnocení významnosti pro α = 0,01:**

Protože

$$
p = 0{,}0126 > 0{,}01,
$$

**nezamítáme nulovou hypotézu**, tedy **koeficient není statisticky významný** na hladině významnosti 0,01.

---

## **Odpověď do testu:**
test 4

* **Dosažená hladina významnosti je 0,0126.**
* **Koeficient není statisticky významný na hladině 0,01, protože p > 0,01.**


Z tabulky máme: ✔️

* **TP (true positive)** = 5
* **TN (true negative)** = 2
* **FP (false positive)** = 1
* **FN (false negative)** = 2
* **Celkem vzorků** = 10

---

### **1. Klasifikační přesnost (accuracy):**

$$
\frac{TP + TN}{TP + TN + FP + FN} = \frac{5 + 2}{10} = \frac{7}{10}
$$

---

### **2. Relativní chyba (error rate):**

$$
\frac{FP + FN}{TP + TN + FP + FN} = \frac{1 + 2}{10} = \frac{3}{10}
$$

---

### **3. Sensitivita (recall, true positive rate):**

$$
\frac{TP}{TP + FN} = \frac{5}{5 + 2} = \frac{5}{7}
$$

---

### **4. Specificita (true negative rate):**

$$
\frac{TN}{TN + FP} = \frac{2}{2 + 1} = \frac{2}{3}
$$

---

**Shrnutí odpovědí:**

* **Přesnost:** $\frac{7}{10}$
* **Relativní chyba:** $\frac{3}{10}$
* **Sensitivita:** $\frac{5}{7}$
* **Specificita:** $\frac{2}{3}$


## **Otázka:** ✔️
test 5

Jaká je pravděpodobnost slunečného počasí (**outlook = sunny**) za předpokladu, že hráči **nešli hrát tenis (play = no)**?

---

### **Postup (podmíněná pravděpodobnost):**

Počet případů, kdy **play = no**:
→ z tabulky vidíme: **5 případů**

Z nich kolikrát byl **outlook = sunny**?
→ **3 případy** (řádky: 1, 2, 7)

---

### **Výpočet:**

$$
P(\text{sunny} \mid \text{play=no}) = \frac{\text{počet případů (sunny ∧ no)}}{\text{počet všech případů (no)}} = \frac{3}{5}
$$

---

### **Odpověď:**

$$
\boxed{\frac{3}{5} \text{ nebo } 60\%}
$$

## Uvažujete klasifikační algoritmus k-NN. Popište jak se určuje optimální hodnota, máte-li k dispozici soubor dat s předem určenou klasifikací. Jak nejlépe určití konečnou klasifikační přesnost modelu pro vybrané k✔️
Optimální hodnota k se určuje pomocí křížové validace, kdy se porovná přesnost pro různá k a zvolí se nejlepší. Konečná přesnost se určí opět křížovou validací nebo pomocí testovací množiny.

## Popište k-násobnou křížovou validaci. Jak probíhá tvorba trénovací a testovací množiny při použití této metody? Jak se spočítá výsledný odhad chyby zvoleného modelu✔️
Při k-násobné křížové validaci se data rozdělí na k částí. Každá část je jednou testovací a zbytek trénovací. Výsledný odhad chyby je průměr chyb ze všech k iterací.

## Popište, co znázorňuje ROC křivka. Jaké metriky tvoří její osy? Co znamená bod [0,1] a proč je považován za ideální?❌
### **ROC křivka (Receiver Operating Characteristic):**

Znázorňuje **schopnost klasifikátoru rozlišovat mezi třídami** při různých prahových hodnotách.

---

### **Osy:**

* **Y-osa:** **True Positive Rate (TPR)** = TP / (TP + FN), tj. **senzitivita**
* **X-osa:** **False Positive Rate (FPR)** = FP / (FP + TN)

---

### **Bod \[0, 1]:**

* **FPR = 0** (žádné falešné poplachy)
* **TPR = 1** (všechny pozitivní správně zachyceny)

---

### **Proč je ideální:**

* Znamená **dokonalou klasifikaci** – model **nemá žádné chyby**.

---

**Shrnutí do testu:**
ROC křivka zobrazuje závislost mezi **TPR** a **FPR** při různých prahových hodnotách. Bod \[0,1] značí **ideální klasifikátor** – 100% senzitivita a 0% falešná pozitivita.


## Jakou třídu problému řeší jednoduchý perceptronový algoritmus? Jaká jsou jeho omezení? Jak je leze překonat?✔️
Jednoduchý perceptron řeší lineárně separovatelné problémy. Nedokáže klasifikovat nelineárně oddělené třídy. Řešením je použití vícevrstvé sítě s nelineárními funkcemi.

Jasně, vysvětlím ti to úplně jednoduše:

---

## Co vidíš na obrázku?✔️

* Dvě třídy bodů:

  * **Modré** ve středu.
  * **Červené** kolem do kruhu.
* Tyto třídy **nejde oddělit přímkou**, protože jsou „do kruhu“.

---

### 🔹 **1. Pokud máš SVM s *lineárním jádrem*** (= umí kreslit jen **přímku**):

SVM si neumí s tímto poradit.
Abychom mu **pomohli**, musíme **předělat data**.
Například spočítáme pro každý bod jeho **vzdálenost od středu** (x² + y²).

* Pak dostaneme hodnoty:

  * Modré mají malou vzdálenost.
  * Červené větší.
* Tohle už **lze oddělit přímkou** → teď SVM s lineárním jádrem funguje.

---

### 🔸 **2. Když použijeme *lepší jádro* (např. RBF):**

* **RBF jádro** automaticky „ohne prostor“, aby oddělilo i tyhle složité tvary.
* **Nemusíš nic počítat navíc**, SVM to zvládne samo.

---

### Shrnutí:

* **SVM s lineárním jádrem** → musíš **předělat data** (např. počítat vzdálenost).
* **SVM s RBF jádrem** → **nemusíš nic měnit**, rovnou funguje.


## **1. Kolik modelů lze vytvořit?**

Máme:

* 5 možností pro **C**: {0.001, 0.01, 0.1, 1, 10}
* 3 možnosti pro **d**: {5, 10, 15}

Počet kombinací =

$$
5 \cdot 3 = \boxed{15}
$$

---

### **2. Jak vybrat nejlepší kombinaci C a d (aby model nepřeučil)?**

#### **Postup krok za krokem:**

1. **Rozděl data na trénovací a validační množinu**
   – např. pomocí **křížové validace** (např. 5-fold cross-validation).

2. **Pro každou kombinaci C a d (celkem 15 modelů):**

   * Natrénuj model na trénovacích datech.
   * Vyhodnoť přesnost (nebo jinou metriku) na validačních datech.
   * Zaznamenej průměrný výsledek.

3. **Vyber kombinaci C a d s nejlepší průměrnou přesností**
   – tedy model, který má **nejlepší výkon na validačních datech** → nejlépe se **obecně naučil**.

4. **Znovu natrénuj finální model s touto kombinací** na celé trénovací množině (bez dělení).

---

### **Proč tento postup?**

* Křížová validace pomáhá **odhalit přeučení (overfitting)**.
* Hledáme **parametry, které generalizují** – tedy fungují dobře i na nových datech.

---
**Stručně do testu:**

Použijeme **křížovou validaci** pro každou z 15 kombinací (C × d). Vybereme tu kombinaci, která má **nejnižší validační chybu** (nebo nejvyšší přesnost). Tím minimalizujeme riziko **přeučení** a najdeme **nejvhodnější model**.



## Rozhodovací funkce:✔️
test 8

Model je jednoduchý **perceptron**, který rozhoduje podle lineární kombinace vstupů a biasu.

Z obrázku:

* Váha k $x$: **0.34268**
* Váha k $y$: **0.3417**
* Bias (váha ke konstantě 1): **2.12288**

---

Rozhodovací funkce:

$$
f(x, y) = 0.34268 \cdot x + 0.3417 \cdot y + 2.12288
$$

Rozhodnutí:

* Pokud $f(x, y) > 0$ → třída **1**
* Pokud $f(x, y) \leq 0$ → třída **-1**

---

###  **2. Geometrická interpretace rozhodovací hranice:**

Rozhodovací hranice je **přímka** v rovině $(x, y)$, která rozděluje prostor na dvě části:

* Na jedné straně funkce $f(x, y) > 0$ → třída 1
* Na druhé straně $f(x, y) < 0$ → třída -1

Jde tedy o **lineární hranici (přímku)**, která je definována rovnicí:

$$
-0.34268 \cdot x + -0.3417 \cdot y + 2.12288 = 0
$$

---

###  **3. Do které třídy model zařadí vzorek (x=1, y=2)?**

Dosadíme do rozhodovací funkce:

$$
f(1, 2) = -0.34268 \cdot 1 + -0.3417 \cdot 2 + 2.12288 = \\
= 0.34268 + 0.6834 + 2.12288 = 3.14896 > 0
$$

→ Výsledek je **kladný**, takže výstupní třída je:

$$
\boxed{1}
$$

---

 **Shrnutí odpovědí do testu:**

1. $f(x, y) = -0.34268 \cdot x + -0.3417 \cdot y + 2.12288$
2. Rozhodovací hranice je **přímka** rozdělující prostor na dvě třídy.
3. Vzorek $(1, 2)$ model zařadí do třídy **1**.


## Jakým způsobem se mění váhy v každé iteraci algoritmu AdaBoost?✔️
### 🔍 **Vysvětlení (stručně pro test):**

V každé iteraci algoritmu **AdaBoost**:

* **Váhy špatně klasifikovaných vzorků se zvyšují** → aby se na ně příští klasifikátor více soustředil.
* **Váhy správně klasifikovaných vzorků se snižují** → protože už jsou „snadné“.

---

### 🔁 Tímto způsobem:

* Další slabý klasifikátor se **více zaměří na obtížné příklady**.
* Postupně se kombinuje více slabých klasifikátorů do jednoho silného modelu.


Zde jsou **stručné a přesné odpovědi** na otázky o **PCA (Analýze hlavních komponent):**

---

## **1. V jakém vztahu jsou komponenty (PCA) k původním souřadnicím dat?**

→ **Jsou ortogonální (navzájem kolmé)** a tvoří novou bázi.
Každá komponenta je lineární kombinací původních proměnných.

---

### **2. Podle jakého kritéria se hledá nová báze dat v PCA?**

→ **Maximalizace rozptylu (variance)** – vybírá se takový směr, ve kterém mají data největší rozptyl.
Každá další komponenta maximalizuje rozptyl za podmínky ortogonality k předchozím.

---

### **3. Jak se problém PCA řeší matematicky (základní myšlenka)?**

→ **Výpočtem vlastních vektorů a vlastních čísel kovarianční matice dat.**

* Vlastní vektory = směry hlavních komponent
* Vlastní čísla = velikosti rozptylu v těchto směrech


## **1 Jaké kritérium optimalizuje LDA a jaké dvě vlastnosti popisuje?**

**Kritérium LDA:**
Maximalizuje poměr **mezitřídní rozptyl / vnitrotřídní rozptyl**.

**Vlastnosti:**

* **Mezitřídní rozptyl** má být **co největší** → třídy jsou co nejdál od sebe.
* **Vnitrotřídní rozptyl** má být **co nejmenší** → vzorky uvnitř jedné třídy jsou si podobné.

---

### **2 K čemu se využívá LDA a kdy je lepší než PCA?**

**LDA se používá pro:**
→ **Klasifikaci a redukci dimenze s ohledem na třídy (labely)**.

**LDA je výhodnější než PCA, když:**
→ **Máme známé třídy** a chceme **najít prostor, který je co nejlepší pro jejich oddělení**.

**Příklady úloh:** Rozpoznávání obličejů, diagnostika podle označených dat (např. nemoc vs. zdravý).

---

Shrnutí do testu:

1. LDA maximalizuje poměr mezitřídního a vnitrotřídního rozptylu.
2. Využívá se pro klasifikaci, je výhodnější než PCA, pokud máme známé třídy.

## 🔍 Úloha:

Máme rozhodovací strom (Decision Stump), který dělí pouze podle jediné podmínky:

$$
x_1 < 4.7606 \Rightarrow \text{třída } 1  
$$

$$
x_1 \geq 4.7606 \Rightarrow \text{třída } 0
$$

---

### 📌 Nový vstupní vektor:

$$
x = (x_1, x_2) = (2,\ 8)
$$

→ $x_1 = 2 < 4.7606$

---

### ✅ Rozhodnutí:

Model půjde po větvi **YES → x₁ < 4.7606**
→ třída podle uzlu č. 3:

$$
y = \boxed{1}
$$

---

### ✏️ Odpověď do testu:

**Pro vektor $x = (2,\ 8)$ se model rozhodne pro třídu 1.**


Podíváme se na odpovědi podle obrázku a tabulky transakcí:

---

### 🔹 **1. Podpora množiny {mléko, chléb, pleny}**

Projdeme transakce a spočítáme, kolik z nich obsahuje **všechny tři položky: mléko, chléb a pleny**.

* Transakce 1: chléb, mléko → ❌
* Transakce 2: chléb, pleny, pivo, vejce → ❌
* Transakce 3: mléko, pleny, pivo, kola → ❌
* Transakce 4: chléb, mléko, pleny, pivo → ✅
* Transakce 5: chléb, mléko, pleny, kola → ✅

✅ → ve **2 transakcích z 5**

$$
\text{Support} = \frac{2}{5}
$$

---

### 🔸 **2. Asociační pravidlo: {mléko, pleny} ⇒ pivo**

#### **Support:**

Hledáme, ve **kolika transakcích jsou všechny tři položky: mléko, pleny, pivo**:

* Transakce 3: mléko, pleny, pivo → ✅
* Transakce 4: mléko, pleny, pivo → ✅
* Transakce 5: mléko, pleny, kola → ❌ (chybí pivo)

→ **2 transakce z 5**

$$
\text{Support} = \frac{2}{5}
$$

---

#### **Confidence (spolehlivost):**

Ze všech transakcí, které obsahují **mléko a pleny**, v kolika je i **pivo**?

* Transakce 3: mléko, pleny → ✅ (obsahuje pivo)
* Transakce 4: mléko, pleny → ✅ (obsahuje pivo)
* Transakce 5: mléko, pleny → ✅ (NEobsahuje pivo)

→ 3 transakce s {mléko, pleny}, z toho 2 obsahují pivo

$$
\text{Confidence} = \frac{2}{3} \approx \boxed{66{,}7\%}
$$

---

### ✅ **Shrnutí výsledků:**

* **Support:** $\frac{2}{5}$
* **Confidence:** $\frac{2}{3} = 66{,}7\%$












