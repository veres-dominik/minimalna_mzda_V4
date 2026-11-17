# Lekcia 1 – Objekty, dátové typy a vektory

**Dátum:** 21. 10. 2026.  
**Stav:** prvá úloha dokončená; výstupy overené zo snímky RStudia. V doplňujúcej úlohe bol overený prevod na text; nasleduje precvičenie súčtu.

## Krátke vysvetlenie

Objekt je pomenovaná hodnota alebo štruktúra uložená v R. Operátor `<-` priraďuje hodnotu na pravej strane názvu na ľavej strane. Názov objektu bez úvodzoviek odkazuje na jeho obsah.

Základné typy hodnôt sú číselné (napríklad 12.5), textové (napríklad "kurz") a logické (`TRUE` alebo `FALSE`). R používa pri desatinných číslach bodku.

Vektor je usporiadaná postupnosť hodnôt. V bežnom atómovom vektore majú všetky prvky rovnaký dátový typ. Funkcia `c()` spája hodnoty do vektora; jednotlivé hodnoty v zátvorkách oddeľujeme čiarkami. Funkcia `length()` zistí počet prvkov a `class()` ich triedu. Funkcii odovzdávame vstup v zátvorkách.

## Samostatná úloha (približne 5 minút)

Použi vymyslené počty hodín učenia za tri dni: 1, 2 a 3.

1. Vytvor číselný vektor s týmito hodnotami a ulož ho do objektu `hodiny`.
2. Vypíš obsah objektu.
3. Zisti počet jeho prvkov a jeho triedu.
4. Vlastnými slovami vysvetli rozdiel medzi číslom `2` a textom `"2"`.

Pred spustením odhadni výsledok kontroly počtu a triedy. Svoj kód môžeš uložiť do `learning/01_moj_pokus.R`. Súbor má vytvoriť autor; riešenie zatiaľ nie je priložené.

Do chatu pošli svoj kód, výstup a krátke vysvetlenie. Ak sa objaví chyba, pošli aj presné hlásenie. Pripoj informáciu, či používaš RStudio, konzolu R alebo iné prostredie.

## Reflexia samostatnosti

- **Autor:** uložil vlastný pokus do `learning/01_moj_pokus.R`. Správne vytvoril číselný vektor a použil `length()` aj `class()`. V chate správne vysvetlil rozdiel medzi číslom a textom. Po upozornení AI doplnil výpis objektu a predložil snímku RStudia so správnymi výstupmi: obsah 1, 2, 3; počet 3; trieda `numeric`. Hviezdička v karte skriptu na snímke signalizuje neuložené zmeny.
- **AI:** pripravila vysvetlenie a zadanie bez hotového riešenia.
- **Spätná väzba AI:** kontrola kódu čítaním a následné overenie výstupov na snímke, bez vlastného spustenia. Medzera medzi názvom funkcie a zátvorkou je v R prípustná.

## Doplňujúca úloha – Spoločný typ vektora

Bežný atómový vektor má jeden spoločný typ. Pri kombinovaní rôznych typov môže R hodnoty automaticky previesť na spoločný typ.

1. Pred spustením odhadni, čo sa stane, keď do nového vektora spojíš číslo `1`, text `"2"` a číslo `3`.
2. Vytvor takýto vektor s názvom `mix`, vypíš ho a zisti jeho triedu.
3. Vysvetli, čo sa stalo s pôvodnými číslami. Pokus pridaj do svojho cvičného skriptu a ulož ho.

**Výsledok, 23. 10. 2026:** autor na snímke predložil správne vytvorenie vektora `mix` a výsledok `class(mix)` ako `"character"`. Správne vysvetlil, že došlo k prevodu na textové hodnoty. Výpis obsahu ani predbežný odhad neboli predložené. AI overila snímku; autorov skript nemenila.

## Krátke precvičenie – Prečo záleží na type

Funkcia `sum()` počíta súčet hodnôt. Názov vektora zadávame do jej zátvoriek.

1. Odhadni, či bude súčet fungovať pri číselnom vektore `hodiny` aj pri textovom vektore `mix`.
2. Skús pomocou `sum()` sčítať každý z nich. Ak po novom spustení R objekt `hodiny` neexistuje, najprv spusti svoj riadok, ktorý ho vytvára.
3. Pošli oba výstupy vrátane prípadného chybového hlásenia a vlastnými slovami vysvetli rozdiel.

Zadanie pripravila AI; čaká sa na pokus autora.
