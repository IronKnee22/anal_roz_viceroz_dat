## Pokud máš příliš mnoho atributů a nevíš, které jsou relevantní, co uděláš?
→ selekce atributů, redukce dimenze

## Model má 100% přesnost na trénovacích datech. Co to znamená?
→ pravděpodobně přeučení (overfitting), nutné testování

## Proč nestačí jen sbírat všechna data a nic s nimi nedělat?
→ množství je neuchopitelné, potřebujeme extrakci znalostí

## Co je rozdíl mezi shlukováním a klasifikací?
→ klasifikace potřebuje označená data (učení s učitelem), shlukování ne

## Co se stane, když máš špatně zvolený počet shluků v k-means?
→ některé shluky budou neplnohodnotné, můžeš „rozbít“ přirozené struktury

## Jaký je rozdíl mezi single link a complete link?
→ Single tvoří „řetězce“, Complete kompaktní shluky

## Proč není k-means vhodný pro nominální data?
→ Nelze spočítat průměr kategorií (např. města, barvy)

## Jak zvolíš vhodný počet shluků, když jej neznáš?
→ Použiješ metodu kolena (elbow method)

## Kdy použít GMM místo k-means?
→ Když chceš pravděpodobnostní přiřazení, když máš složité (např. eliptické) shluky

## Proč preferujeme jednodušší stromy?
→ Occamova břitva – jednodušší hypotéza je méně pravděpodobně náhodná

## Jak vybere ID3 nejlepší atribut?
→ Použije entropii a informační zisk

## Kdy může být atribut „nebezpečně“ dobrý?
→ Když má unikátní hodnoty (např. rodné číslo)

## Co je gain ratio a kdy se používá?
→ Penalizuje atributy s mnoha hodnotami → vhodné proti přeučení

## Co se stane, když mám spojité atributy?
→ Diskretizace (rozdělíš do intervalů)

## Jak ID3 zvládá zašuměná data?
→ Poměrně dobře, protože bere celou trénovací množinu

## Model má 95 % přesnost, ale selhává při detekci nemocných. Proč?
→ Třídy jsou nevyvážené, přesnost nestačí. Potřeba měřit recall.

## Jak zjistím, že model je přeučený?
→ Má malou chybu na trénovacích datech, ale velkou na testovacích.

## Proč je LOO nevhodné pro velké datasety?
→ Výpočetně náročné – trénuješ tolikrát, kolik máš vzorků

## Kdy použít F1-score místo přesnosti?
→ Když máme nevyvážené třídy (např. nemoc x zdravý)

## Co je bias-variance tradeoff?
→ Kompromis mezi jednoduchostí (bias) a přizpůsobivostí (variance)

## Co je hlavním omezením základního perceptronu?
→ Umí pouze lineárně separabilní úlohy (neumí XOR)

## Jak se liší jedno- a vícevrstvá síť?
→ Jednovrstvá = lineární problémy, vícevrstvá = i nelineární

## Jak funguje backpropagation?
→ Chyba se šíří zpět sítí, váhy se aktualizují podle gradientu

## Proč není vždy vhodná schodová aktivační funkce?
→ Není diferencovatelná → nelze použít pro učení přes gradienty

## K čemu slouží aktivační funkce?
→ Zavádí nelinearitu, umožňuje rozhodování

## Co říká Kolmogorovova věta v kontextu neuronových sítí?
→ Libovolná spojitá funkce lze aproximovat MLP se 3 vrstvami

## Když je Lift = 1, co to znamená?
→ A a B se vyskytují nezávisle

## Kdy je pravidlo zajímavé?
→ Vysoký lift (>>1), dostatečný support, vysoká confidence

## Proč je Apriori efektivní?
→ Nepočítá zbytečně kombinace, které nemají šanci uspět

## Jaký je rozdíl mezi confidence a support?
→ Support říká jak často celkově, confidence říká jak často při výskytu A

## Proč je potřeba řešit chybějící hodnoty?
→ Mohou zkreslit výsledky modelu a bránit použití některých algoritmů.

## Kdy je vhodné ignorovat chybějící hodnoty?
→ Když je jich velmi málo a odstraněním neztratíme důležité informace.

## Jaký je rozdíl mezi náhradou nejčastější hodnotou a náhradou podle třídy?
→ Nejčastější hodnota bere v úvahu celý dataset, náhrada podle třídy pracuje jen v rámci dané cílové třídy.

## Proč použít náhradu průměrem nebo mediánem?
→ Pro číselné atributy – průměr je citlivý na extrémy, medián je robustnější.

## Kdy zvolit náhradu pomocí nejbližšího souseda (např. KNN)?
→ Když chceme zachovat vzory mezi atributy a máme dostatek podobných záznamů.

## Jaký je rozdíl mezi jednou hodnotou a více možnými hodnotami při náhradě?
→ Jedna hodnota zjednodušuje data, více hodnot (např. v rough sets) zachovává neurčitost a zvyšuje robustnost.

## Proč je fáze přípravy dat často nejdelší částí projektu?
→ Obsahuje čištění, transformace, výběr atributů – ovlivňuje kvalitu modelu.

## Co je rozdíl mezi transformací 1:1 a 1:N?
→ 1:1 vytváří jeden nový atribut, 1:N vytváří více nových atributů na základě skupiny.

## Co znamená diskretizace a proč se používá?
→ Převod číselných hodnot na kategorie – zjednodušuje modely a zvyšuje interpretovatelnost.

## Jaký je rozdíl mezi ekvidistantní a ekvifrekvenční diskretizací?
→ Ekvidistantní má stejně široké intervaly, ekvifrekvenční stejně početné.

## K čemu slouží normalizace?
→ Aby měly všechny atributy stejný rozsah, což je důležité pro metody citlivé na měřítko.

## Co je outlier a jak s ním zacházíš?
→ Výrazně odlišná hodnota – může být chyba nebo užitečná informace, záleží na kontextu.

## Co je anachronický atribut a proč je nebezpečný?
→ Atribut obsahující informaci z budoucnosti vůči predikci – může způsobit nerealistickou přesnost modelu.

## Kdy použiješ PCA?
→ Když chceš zredukovat počet atributů a zachovat co nejvíc informace.

## Jaký je rozdíl mezi PCA a LDA?
→ PCA pracuje bez tříd, hledá osy s největší variabilitou. LDA využívá informace o třídách, hledá osy co nejlépe oddělující třídy.

## Proč se používá SVD u PCA?
→ Protože umožňuje efektivně spočítat hlavní komponenty (vlastní vektory).

## Jaký je rozdíl mezi výběrem a extrakcí příznaků?
→ Výběr vybere z existujících, extrakce vytváří nové.

## Proč je nebezpečné mít anachronický atribut?
→ Zahrnuje informaci z budoucnosti → vede k nereálné přesnosti.

## K čemu slouží filtrační metody?
→ Hodnotí příznaky nezávisle na modelu, např. podle korelace s cílem.

## Proč nestačí běžná p-hodnota při více testech?
→ Zvyšuje se pravděpodobnost náhodně významného výsledku.

## Jak funguje Bonferroniho korekce?
→ p-hodnota se vynásobí počtem testů, nebo se alfa podělí.

## Jaký je rozdíl mezi FDR a FWER?
→ FWER zajišťuje, že nebude žádná chyba, FDR dovoluje pár chyb, ale kontrolovaně.

## Kdy použiješ Benjamini-Hochberg místo Bonferroniho?
→ Když chceš zvýšit šanci odhalit skutečné efekty a toleruješ pár FP.

## Kdy použiješ paralelní souřadnice?
→ Při zobrazení vícerozměrných dat – každá čára ukazuje jeden objekt přes všechny příznaky.

## K čemu slouží histogram?
→ Ke zjištění rozdělení hodnot jednoho atributu.

## Proč může být vizualizace zavádějící?
→ Kvůli špatnému měřítku, pořadí dat nebo ztrátě struktury při promítnutí do nižší dimenze.

## Co znázorňuje RadViz?
→ Zobrazuje vícerozměrná data pomocí sil "trpaslíků", každý atribut táhne bod do své pozice – vzniká 2D znázornění podobností.

## Jaký je rozdíl mezi boxplotem a histogramem?
→ Boxplot ukazuje rozptyl, kvartily a odlehlé hodnoty; histogram zobrazuje četnosti.

## Co je autokorelace a proč se používá?
→ Ukazuje, zda jsou v datech opakující se vzory v čase (závislost hodnoty na minulých hodnotách).

## Jaký je rozdíl mezi trendem a sezónností?
→ Trend je dlouhodobý směr, sezónnost je pravidelný krátkodobý cyklus.

## Kdy použiješ klouzavý průměr?
→ K vyhlazení šumu a lepší interpretaci trendu.

## Proč je důležité testovat stacionaritu?
→ Mnoho modelů (např. ARIMA) vyžaduje, aby časová řada měla konstantní průměr a rozptyl v čase.

## Jaký je rozdíl mezi aditivním a multiplikativním modelem?
→ Aditivní: složky se sčítají, vhodné při konstantní sezónnosti.
→ Multiplikativní: složky se násobí, vhodné při sezónnosti závislé na úrovni signálu.