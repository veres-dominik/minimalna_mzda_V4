# Základy R – stručný prehľad na opakovanie

**Dátum:** 23. 10. 2026. Sumár pripravila AI podľa autorovho skriptu `01_moj_pokus.R` a cvičení v chate. Uvádza už precvičený kód, nie riešenie nasledujúcej úlohy.

## Objekty, vektory a tabuľky

| Zápis | Význam |
|---|---|
| `hodiny <- c(1, 2, 3)` | Vytvorí vektor a uloží ho do objektu. |
| `class(hodiny)` | Zistí triedu: tu `numeric`. Text je `character`, logické hodnoty sú `logical`. |
| `length(hodiny)` | Počet prvkov vektora, vrátane prípadných `NA`. |
| `ucenie <- data.frame(dni, hodiny)` | Spojí vektory do tabuľky podľa pozície prvkov. |
| `str(ucenie)` | Ukáže počet pozorovaní, premenné a ich typy aj ukážku hodnôt. |
| `ucenie$hodiny` | Vyberie jeden stĺpec ako vektor. |

Bežný atómový vektor má jeden spoločný typ. V `c(1, "2", 3)` sa všetky hodnoty prevedú na text. Tabuľka môže mať v rôznych stĺpcoch rôzne typy. Riadok predstavuje jedno pozorovanie, stĺpec jednu premennú. Správne poradie údajov musí zabezpečiť autor.

## Podmienky, výber a súhrny

```r
ucenie$hodiny > 1
dlhsie_ucenie <- ucenie[ucenie$hodiny >= 2, ]
sum(dlhsie_ucenie$hodiny)
mean(dlhsie_ucenie$hodiny)
```

- Porovnanie vráti `TRUE` alebo `FALSE` pre každý prvok. Používali sme `>`, `>=` a `<`.
- Zápis je `tabulka[riadky, stlpce]`: pred čiarkou vyberáme riadky; prázdne miesto za čiarkou ponechá všetky stĺpce.
- Samotný výber pôvodnú tabuľku nemení. Pomocou `<-` výsledok uložíme do nového objektu.
- `sum()` počíta súčet, `mean()` priemer. Vyberáme vhodný číselný stĺpec, nie celú tabuľku obsahujúcu text.
- V príklade vyššie je súčet **5** a priemer **2,5**.

**Výber mení význam výsledku:** v čítaní bol priemer za všetky štyri dni **7,5 strany**, ale iba za dni s čítaním **10 strán**. Oba výsledky sú správne, odpovedajú však na odlišné otázky.

## Chýbajúce hodnoty

`0` je známa nulová hodnota. `NA` znamená chýbajúci údaj a píše sa bez úvodzoviek.

Pre `strany_neuplne <- c(10, NA, 15, 5)`:

| Príkaz | Výsledok a význam |
|---|---|
| `mean(strany_neuplne)` | `NA`: jedna hodnota chýba. |
| `mean(strany_neuplne, na.rm = TRUE)` | `10`: priemer iba troch známych hodnôt; vektor sa nemení. |
| `is.na(strany_neuplne)` | `FALSE TRUE FALSE FALSE`: označí chýbajúce hodnoty. |
| `sum(is.na(strany_neuplne))` | `1`: počet chýbajúcich hodnôt. |
| `sum(!is.na(strany_neuplne))` | `3`: počet známych hodnôt. |
| `sum(is.na(strany_neuplne)) / length(strany_neuplne)` | `0.25`: podiel chýbajúcich hodnôt. |
| `sum(!is.na(strany_neuplne)) / length(strany_neuplne) * 100` | `75`: percento známych hodnôt. |

`!` obráti logické hodnoty. Pri sčítaní je `TRUE` ako 1 a `FALSE` ako 0. Vnorené funkcie čítame zvnútra von.

Vhodná interpretácia: **„Za tri dni so známym počtom prečítaných strán bol priemer 10 strán denne; za jeden deň údaj chýbal.“** Vynechanie `NA` chýbajúcu informáciu nedoplní.

## Čo ukázala kontrola skriptu

- `sum(mix)` je očakávaná chyba na precvičenie: textový vektor sa takto nedá sčítať. Pri spustení celého skriptu cez Source môže táto chyba zastaviť ďalšie vykonávanie; pri opakovaní spúšťaj tento príklad samostatne.
- Riadok s `ucenie$hodiny >= 1` vyberá všetky tri dni. Neznamená to isté ako `>= 2`; neskorší výber do `dlhsie_ucenie` má podmienku správne.
- Názvy funkcií a argumentov musia byť presné: `is.na`, nie `s.na`; `na.rm`, nie `na.rn`.

**Samostatnosť:** autor zapisoval a spúšťal cvičný kód a interpretoval výsledky. AI zadávala malé úlohy, vysvetľovala syntax a poskytovala nápovedu; pri poradí údajov a uložení výberu bolo potrebné upozornenie. Sumár a kontrolu čítaním vykonala AI; skript nemenila ani nespúšťala.

**Ďalej:** vytvoriť tabuľku `citanie_neuplne` z existujúcich vektorov `dni_citania` a `strany_neuplne` a vypísať ju.
