# Minimum Wage & Employment in V4

**Stav: pracovná verzia, aktualizovaná 17. 11. 2026.** Výskumná otázka, východisková hypotéza a obdobie 2010–2025 sú potvrdené autorom. Autor schválil jednoduchú opisnú regresiu, Pearsonovu koreláciu a kontrolu citlivosti pre zamestnanosť v rozsahu uvedenom nižšie. Prijaté metodické rozhodnutia a ich obmedzenia sú uvedené nižšie; stav vykonaných krokov je v `CURRENT_STATE.md`. Pravidlá partnerskej analytickej spolupráce s AI upravuje `AGENTS.md`.

## Kontext a cieľ

Ide o druhý portfóliový analytický projekt autora. Prvý sa venoval regionálnej nezamestnanosti na Slovensku a vznikol v R s asistenciou AI. Autor má ukončené vzdelanie v politológii, základnú skúsenosť s analytickou metodikou a interpretáciou dát a začiatočnícke znalosti R.

Profesijným cieľom je príprava na juniorskú analytickú pozíciu, prednostne v Inštitúte sociálnej politiky (ISP). Projekt spája kvalitný analytický výstup s rozvojom znalostí a samostatnosti prostredníctvom partnerskej spolupráce. Rýchlosť nesmie obmedziť kvalitu, premýšľanie ani diskusiu. Rozsah má zostať primerane náročný a realizovateľný.

### Vznik výskumného návrhu a úloha AI

Projekt vzniká v spolupráci autora s AI ako analytickým partnerom. Výskumnú otázku, metodické možnosti a interpretácie rozvíjajú prostredníctvom diskusie, návrhov a vzájomného kritického posudzovania argumentov. Autor prináša vlastné otázky, vysvetlenia a riešenia; AI prispieva návrhmi, odbornými podkladmi a technickým spracovaním. Žiadny návrh sa nepovažuje za správny iba preto, že ho predložila AI alebo autor — rozhodujú jeho dôvody a overenie.

Rovnocennosť spolupráce znamená otvorenosť voči argumentom a možnosť spochybniť ktorýkoľvek návrh. Autor určuje smer projektu a prijíma konečné rozhodnutia. Podiel autora a AI na konkrétnych úlohách zostáva transparentne zaznamenaný. Rozvoj znalostí a samostatnosti je priebežným prínosom spolupráce; tutorský režim sa používa podľa potreby alebo dohody.

Doterajšia spolupráca vychádzala z autorovej témy, záujmu o pracovné uplatnenie zraniteľných skupín a očakávania negatívneho vzťahu. Otázka a operacionalizácia sa spresňujú podľa zámeru, teórie a dostupnosti porovnateľných dát; očakávanie nie je kritériom výberu výsledkov. Diskusia zahŕňala alternatívne mzdové metriky, rozdiel medzi zamestnanosťou a nezamestnanosťou, vymedzenie podľa vzdelania a veku a prácu s časovými zlomami. Konkrétne návrhy a formulácie vznikali aj s pomocou AI, prijaté rozhodnutia a dôvody sú v `DECISION_LOG.md`.

Pri technickej práci AI pripravila a upravovala R skripty a kontroly a preverovala primárne zdroje a obsah exportov. Autor získal exporty, spúšťal skripty a vizuálne porovnával vybrané hodnoty s XLSX. Kontroly autora a AI vrátane ich rozsahu a obmedzení sa zapisujú oddelene v `CURRENT_STATE.md`; úspešný beh kódu sám nepotvrdzuje metodickú správnosť.

### Spresnenie zámeru autorom – 23. 10. 2026

Autor chce pochopiť, či zvyšovanie zákonnej minimálnej mzdy pomáha zraniteľným ľuďom na trhu práce, alebo obmedzuje ich možnosti zamestnať sa. Zamýšľaným publikom sú zákonodarcovia a ľudia pripravujúci podklady pre ich rozhodovanie. Autor očakáva zvýšenie nezamestnanosti ľudí ochotných pracovať aj pod zákonným minimom; ide o východiskovú hypotézu, nie výsledok.

Ochota pracovať za nižšiu mzdu, nízke vzdelanie a nízka pozorovaná mzda označujú odlišné skupiny. Autor chce výber skúmanej skupiny oprieť aj o dostupnosť dát. Schválil blok overenia dátovej uskutočniteľnosti pre tri možnosti: nízke vzdelanie, nízko platení zamestnanci a nezamestnaní prechádzajúci do práce. Výber skupiny ani obdobia zatiaľ neprijal. Zistenia a hranice overenia sú v `CURRENT_STATE.md`.

## Výskumná otázka a východisková hypotéza

**Finálne znenie schválené autorom 25. 10. 2026.**

**Výskumná otázka:** Ako v jednotlivých krajinách V4 v období 2010–2025 súvisia medziročné zmeny relatívnej minimálnej mzdy s medziročnými zmenami miery zamestnanosti osôb s nízkym vzdelaním vo veku 20–64 rokov?

**Definície:** relatívna minimálna mzda je pomer hrubej minimálnej mzdy k priemernej hrubej mzde, vyjadrený v percentách (vybraný rad B–S); nízke vzdelanie je ISCED 0–2. Číselné medziročné zmeny v percentuálnych bodoch zachovávajú smer aj veľkosť.

**Východisková hypotéza:** Medzi medziročnými zmenami relatívnej minimálnej mzdy a medziročnými zmenami miery zamestnanosti skúmanej skupiny očakávame negatívnu súvislosť.

Vyššej zmene pomeru by podľa hypotézy zodpovedala nepriaznivejšia zmena zamestnanosti (menší rast alebo väčší pokles). Nejde o požiadavku, aby pri každom raste pomeru zamestnanosť absolútne klesla. Hypotézu posudzujeme po krajinách; výsledky sa môžu líšiť. Je teoretickým východiskom exploračnej analýzy, nie vopred daným záverom ani tvrdením o kauzálnom účinku. Nezamestnanosť, jednoročné oneskorenie a slovenský mediánový pomer zostávajú doplnkovými porovnaniami.

**Obdobie prijaté autorom (25. 10. 2026):** 2010–2025. Pri analýze medziročných zmien je rok 2010 východiskom a prvá zmena patrí roku 2011. Zostávajúce zlomy znižujú počet použiteľných porovnaní; doplnkové jednoročné oneskorenie posúva interval výslednej zmeny. Nasledujúce staršie čiastkové rozhodnutia platia v rozsahu, v akom ich nenahradili novšie prijaté voľby uvedené vyššie a v `DECISION_LOG.md`.

**Aktuálna voľba veku a zdroja (25. 10. 2026):** autor schválil prechod na oficiálne opravené rady Eurostatu `lfsi_educ_a` (zamestnanosť, PC_POP) a `une_educ_a` (nezamestnanosť, PC_ACT), vek 20–64, ISCED 0–2, obe pohlavia, V4. Táto voľba nahrádza staršie vymedzenie 25–64 uvedené nižšie; hierarchia ukazovateľov sa nemení. Prínosom je lepšia kontinuita a viac použiteľných medziročných porovnaní v kandidátnom období 2010–2025. Pridané osoby 20–24 môžu ešte pokračovať vo vzdelávaní: meriame aktuálne dosiahnuté vzdelanie, nie konečnú vzdelávaciu úroveň. Trendy tak môžu viac súvisieť aj so štúdiom a prechodom na trh práce. Úplné zdôvodnenie a zostávajúce zlomy sú v `DECISION_LOG.md`. Prechod v skriptoch a spracovaných dátach bol dokončený; autor doložil úspešný beh kontrol a vizuálnu zhodu vybraných hodnôt s XLSX. Aktuálne CSV sú označené `_20_64`; pôvodné `_25_64` zostávajú oddelené. Podrobnosti overenia sú v `CURRENT_STATE.md`.

**Hierarchia ukazovateľov prijatá autorom (24. 10. 2026, potvrdená 25. 10. 2026):** hlavným ukazovateľom je miera zamestnanosti osôb s nízkym vzdelaním, aktuálne vo veku 20–64 rokov podľa vyššie uvedenej zmeny; doplnkovým je miera nezamestnanosti tej istej skupiny. Zamestnanosť vyjadruje pracovné uplatnenie celej skupiny a zachytáva aj jeho pokles pri prechode do ekonomickej neaktivity. Nezamestnanosť dopĺňa pohľad na ekonomicky aktívnu časť, pričom jej pokles môže znamenať nájdenie práce aj odchod do neaktivity. Zamestnanosť však ovplyvňujú aj okolnosti účasti na trhu práce, preto ju nepovažujeme za čistú mieru dopytu zamestnávateľov. Skupinu vymedzujeme podľa vzdelania; údaje neobsahujú informáciu o mzde, ktorú by jednotlivci boli ochotní prijať. Analýza skúma súvislosti medzi zmenami mzdového pomeru a ukazovateľov trhu práce; samotná súvislosť nepreukazuje kauzálny účinok minimálnej mzdy. Historické otvorené voľby nižšie platia len tam, kde ich nenahradili novšie prijaté rozhodnutia.

**Rozsah nezamestnanostného doplnku potvrdený autorom (25. 10. 2026):** už vytvorený súbežný bodový graf stručne zhrnieme a ponecháme v prílohe; v aktuálnej etape nezamestnanosť ďalej nemodelujeme. Autor následne výslovne požiadal ešte o jej jednoročne oneskorený graf a súbežný mediánový pohľad na Slovensko iba na prezretie. Táto požiadavka nahrádza skoršie obmedzenie vytvorenia oneskoreného grafu, automaticky však nerozširuje obsah reportu. Priorita zamestnanosti vychádza z metodických dôvodov prijatých pred zobrazením grafov. Odlišná vizuálna zreteľnosť výsledkov nie je kritériom výberu hlavného ukazovateľa; doplnkový výsledok zachováme. Regresia pre zamestnanosť ani konečné zaradenie ďalších grafov týmto nie sú rozhodnuté.

**Aktuálne zaradenie doplnkov rozhodnuté autorom (25. 10. 2026):** jednoročne oneskorenú nezamestnanosť vo V4 ponecháme v doplnkovej prílohe bez interpretácie v hlavnom analytickom texte a bez ďalšieho modelovania. Autor následne zmenil rozhodnutie pri slovenskom mediáne: súbežné porovnanie pomeru minima k mediánu so zamestnanosťou zaradíme do hlavného reportu ako krátke posúdenie citlivosti slovenského výsledku na menovateľ. Porovnáme smer a prípadne veľkosť asociácie pri priemere a mediáne na rovnakých 14 rokoch 2012–2025, s rovnakou populáciou a pravidlami výluk; mzdové pokrytie a jeho odchýlky posudzujeme podľa národnej metodiky. Vizuálny náznak súvislosti zatiaľ neoznačujeme za vypočítanú koreláciu. Tento doplnok bol metodicky navrhnutý pred prezretím grafov; jeho zaradenie nepredurčuje výsledok ani nepotvrdzuje správnosť hlavnej miery. Hlavná analýza V4 zostáva pri zamestnanosti a pomere k priemeru. Nové rozhodnutie nahrádza skoršie zaradenie mediánu iba do prílohy, nemení súbežný nezamestnanostný doplnok a samo neschvaľuje regresný model.

**Prijaté rozhodnutia autora (24. 10. 2026):** hlavný ukazovateľ relatívnej minimálnej mzdy bude pomer k priemernej hrubej mesačnej mzde v odvetviach NACE Rev. 2 B–S, zdroj Eurostat earn_mw_avgr2. Doplnkové deskriptívne porovnanie pre Slovensko využije pomer k mediánovej mzde pri rovnakom pokrytí B–S. Cieľom doplnku je posúdiť citlivosť záverov na menovateľ, nie potvrdiť správnosť priemeru pre V4. B–S je širšie než B–N, ale nepokrýva poľnohospodárstvo a nie je totožné s populáciou LFS. Autor oznámil rovnakú dostupnosť po prechode na B–S. Presný obsah menovateľov, časové definície a národné odchýlky ešte preveríme pred exportom; rozhodnutie neznamená, že už bola potvrdená úplná porovnateľnosť.

**Prijaté rozhodnutie autora (23. 10. 2026):** pri sledovaní zamestnanosti aj nezamestnanosti ľudí s nízkym vzdelaním používať vek 25–64 rokov. Dôvodom je obmedzenie vplyvu mladých ľudí s ešte neukončenou vzdelávacou dráhou a rovnaké vekové vymedzenie oboch ukazovateľov. Závery nebudú pokrývať mladých do 25 rokov. Hierarchia ukazovateľov, obdobie, metrika minimálnej mzdy a finálna otázka zostávajú otvorené.

Pôvodná otázka o vzťahu úrovne relatívneho minima a zamestnanosti bola nahradená vyššie schválenou otázkou o medziročných zmenách.

## Podoba analytického reportu

**Stav k 17. 11. 2026:** autor schválil uzavretie [reportu](reports/REPORT.md), ktorý je označený ako finálna verzia schválená autorom. Obsahuje všetky plánované časti vrátane zhrnutia, záveru, zdrojov, opisu spolupráce a príloh. Prehľad oneskorenej nezamestnanosti je rozdelený na dve dvojpanelové časti so spoločnými stupnicami. AI pred uzavretím dokončila kontrolu konzistentnosti otázky, tabuliek, počtov výstupov a lokálnych odkazov. Analytická a reportová etapa sú uzavreté; schválenie nepridáva metódy ani modely a nemení uvedené obmedzenia. Autor následne obnovil prípravu na GitHub a zvolil ručné nahratie cez web. Vstupom je [README](README.md), lokálny repozitár je založený a `github-upload/` slúži ako pripravená kópia na nahratie. Dokončenie publikovania a overenie verejného odkazu ešte čakajú na autora; pripojenie pluginu nie je pre zvolenú cestu potrebné.

**Osnova schválená autorom 16. 11. 2026:** zhrnutie hlavných zistení (napísané nakoniec), motivácia s výskumnou otázkou a hypotézou, dáta a metodika, časový kontext, výsledky po krajinách, diskusia s obmedzeniami a záver. Súbežná aj oneskorená zamestnanosť a slovenský medián patria do hlavného textu v už dohodnutom rozsahu. Nezamestnanostné grafy a podrobnejšie metodické prehľady patria do príloh; úplné diagnostiky zostanú dostupné v CSV. Report uvedie zdroje a vecný opis spolupráce autora s AI. Vzniká postupne v [reports/REPORT.md](reports/REPORT.md); schválená výsledková časť zostáva podkladom, nové znenie ostatných častí sa posudzuje po blokoch.

## Pôvodné analytické smerovanie – možnosti, nie dohodnutý plán

**Prezentácia výsledkov schválená autorom (3. 11. 2026):** autor prečítal a schválil znenie `reports/PRACOVNE_VYSLEDKY.md`. Výsledky sú usporiadané do malých tabuliek podľa krajín s interpretáciou pod nimi; obsahujú aj stručné zhrnutie citlivosti. Kontrola spoločných rokov zostáva jedným samostatným odsekom za krajinami pod autorom navrhnutým názvom „Rovnaké zloženie vzorky pri súbežnom a oneskorenom porovnaní“. Podrobné výpočty zostávajú v technických CSV; neopakujú sa v každom krajinskom odseku. Schválenie sa týka výsledkovej časti, nie dokončenia celého reportu ani uzavretia zostávajúcich metodických nejasností.

**Kontrola spoločného výberu rokov schválená autorom (3. 11. 2026):** pri každej krajine V4 doplnkovo prepočítame súbežnú aj oneskorenú asociáciu na prieniku rokov t, v ktorých sú prípustné obe porovnania. Zhodujeme roky zmeny pomeru a hodnoty x vnútri krajiny; výsledná zmena zamestnanosti zostáva súbežne t−1→t a oneskorene t→t+1. Nevyžadujeme zhodné roky medzi krajinami. V aktuálnych dátach ide o CZ/SK po 13 rokov (2012–2024), PL po 12 rokov (2011–2024 bez 2018/2019), HU po 12 rokov (2011–2024 bez 2017/2018). Odhadneme rovnakú jednoduchú OLS s konštantou a Pearsonovo r; pôvodné hlavné odhady zachováme. Kontrola umožní posúdiť zmenu výsledku po zjednotení vzorky, neodstraňuje confoundery ani rozdielny kalendár výsledných zmien. Slabý oneskorený vzťah preto sám nedokladá silnejšie tretie premenné. Nepridávame nové grafy, kontrolné premenné alebo ďalšie vynechávanie rokov nad tento dohodnutý blok.

**Umiestnenie oneskorenej zamestnanosti schválené autorom (3. 11. 2026):** jednoročne oneskorené porovnanie zamestnanosti vo všetkých štyroch krajinách zaradíme do hlavného analytického textu ako interpretovaný doplnok k súbežnému porovnaniu. Ukážeme grafy, sklony, korelácie a primerané zhrnutie citlivosti aj pri slabom či odlišnom výsledku. Dôvodom je možnosť postupného prispôsobovania zamestnanosti prostredníctvom prijímania, prepúšťania či neobsadzovania miest. Jednoročný posun je jednoduchá projektová voľba pre ročné dáta; nepreukazuje, že reakcia skutočne nastáva práve po roku. Párujeme zmenu pomeru t−1→t so zmenou zamestnanosti t→t+1; ide o oneskorenú asociáciu. Rozdiel oproti súbežnému výsledku môže súvisieť aj s odlišným zložením použiteľných rokov. Rozhodnutie uzatvára skoršiu otvorenú otázku hlavný text/príloha pre zamestnanosť, nemení zaradenie oneskorenej nezamestnanosti iba do prílohy.

**Číselné zhrnutie schválené autorom (3. 11. 2026):** pre zamestnanosť odhadneme jednoduchú OLS regresiu s konštantou `zmena zamestnanosti = a + b × zmena mzdového pomeru` a Pearsonovu koreláciu. Osobitne pre každú krajinu V4 pri súbežnom aj jednoročnom oneskorenom párovaní a pre SR súbežne pri mediánovom pomere: spolu 9 odhadov. Použijeme všetky vopred označené použiteľné páry, rovnaké váhy a rovnaký postup bez ohľadu na smer výsledku; slovenský priemer a medián majú rovnakých 14 rokov a rovnakú výslednú premennú. Pri oneskorení je rok t rokom zmeny pomeru, výsledkom je zmena zamestnanosti t→t+1. Nezamestnanosť týmto ďalej nemodelujeme.

Smernica b je zmena opísanej medziročnej zmeny zamestnanosti v p. b. spojená s o 1 p. b. väčšou zmenou pomeru; Pearsonovo r vyjadruje smer a lineárnu tesnosť bez jednotky. Priamku kreslíme iba v pozorovanom rozsahu x. Citlivosť preveríme postupným vynechaním každého jedného bodu: uvedieme rozsah smerníc, počet zmien znamienka a rok najväčšieho posunu, pričom pôvodný plný odhad zostáva hlavným opisom. Pri oneskorení evidujeme aj rok vynechaného výsledku. Žiadny rok automaticky neodstraňujeme; rozsah týchto odhadov nie je interval spoľahlivosti ani test významnosti. Nepridávame p-hodnoty, inferenčné intervaly, prognózy ani kauzálnu interpretáciu. Krátke časové rady, závislosť pozorovaní v čase, mzdové definície a ostatné ekonomické vplyvy naďalej obmedzujú výpoveď.

Technická opora: [R – lm](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html), [R – cor](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html), [NIST – Linear Least Squares Regression](https://www.itl.nist.gov/div898/handbook/pmd/section1/pmd141.htm). Výber rozsahu a kontrola vynechávaním rokov sú naše projektové rozhodnutia. Toto schválenie nahrádza staršie otvorené formulácie o regresii; nejde o schválenie panelového modelu.

**Prvé výstupy schválené autorom (25. 10. 2026):** deskriptívne časové grafy úrovní ako kontext, bodové grafy medziročných zmien v rovnakom roku osobitne po krajinách a stručný prehľad počtu použiteľných a vylúčených porovnaní. Následne rovnaké zobrazenie pre dohodnuté jednoročné oneskorenie; nezamestnanosť a slovenský medián ako doplnky po hlavnom výsledku. Ide o exploračnú analýzu s východiskovou hypotézou, nie automatický výber regresie. Najprv pripravíme a overíme zmeny a kalendárne párovanie; až po kontrole vytvoríme grafy.

**Prístup ku krajinám prijatý autorom (24. 10. 2026, spresnený 25. 10. 2026):** k Česku, Slovensku, Poľsku a Maďarsku pristupujeme jednotlivo. Hlavná analýza sleduje v každej krajine súvislosť medzi medziročnými zmenami relatívnej minimálnej mzdy a miery zamestnanosti; nezamestnanosť a jednoročné oneskorenie sú doplnkové porovnania. V4 tvorí rámec výberu a následného porovnania zistení, nie jeden homogénny trh práce. Dôvodom sú rozdielne národné inštitucionálne podmienky, mzdové definície a ekonomický vývoj; veľkosť a smer asociácie preto vopred nepovažujeme za spoločné.

Použijeme rovnaké vekové a vzdelanostné vymedzenie, obdobie a pravidlá výpočtu aj výluk, aby sa výsledky dali porovnať. Zmeny a oneskorené páry vytvárame vždy vnútri krajiny. Prípadné grafické alebo číselné zhrnutia hlavného vzťahu vyhodnocujeme po krajinách; všetky pozorovania nespojíme do jednej nerozlíšenej korelácie či regresie. Po analýze krajín porovnáme podobnosti a rozdiely priebehov a zistených asociácií. Spoločné modelovanie nie je dohodnuté a vyžadovalo by samostatné zdôvodnenie a rozhodnutie.

Individuálny prístup neodstraňuje ostatné ekonomické vplyvy ani metodické zlomy. Pri časovom porovnaní zohľadníme národné zmeny merania a zostávajúce značky; stabilné rozdiely medzi krajinami opíšeme ako obmedzenie. Vývoj pomeru sa nesmie zamieňať s vývojom samotnej zákonnej sadzby a podobné priebehy nepreukazujú kauzálny účinok.

Nasledujúce body zachovávajú pôvodný návrh, nie aktuálny zoznam otvorených volieb; novšie rozhodnutia majú prednosť. Jednoduché opisné regresné vyhodnotenie bolo výslovne schválené 3. 11. 2026 vyššie. Kauzálna analýza ani panelový model týmto schválené neboli.

- Jednotka pozorovania: krajina × rok; panelové údaje za krajiny V4.
- Zamýšľané obdobie: 2010–2025; dostupnosť a úplnosť zatiaľ neboli overené.
- Pôvodne navrhnutá závislá premenná: miera zamestnanosti osôb s ISCED 0–2. Následne autor zvolil vek 25–64 pre zamestnanosť aj nezamestnanosť; pohlavie a presné konečné vymedzenie populácie zostávajú otvorené.
- Hlavná vysvetľujúca premenná: relatívna výška minimálnej mzdy, potenciálne Kaitzov index; presná definícia a referenčná mzda zostávajú otvorené.
- Metódy na zváženie: deskriptívna analýza, jednoduchá lineárna regresia a podľa možností základná panelová regresia.
- Preskúmanie súbežných a oneskorených asociácií; konkrétne oneskorenia zatiaľ neurčené.
- Diskusia o confounderoch, mediátoroch a časovom poradí premenných pred výberom kontrolných premenných.
- Žiadne neodôvodnené kauzálne závery. Regresné asociácie samy osebe nepreukazujú kauzálny účinok.

Zdroje dát, harmonizácia ukazovateľov, chýbajúce hodnoty, kontrolné premenné a konečná špecifikácia modelov zatiaľ nie sú stanovené.

## Metodické zdôvodnenie operacionalizácie minimálnej mzdy

### Opora v primárnych zdrojoch a hranice projektových volieb

**Zdroje overila AI 25. 10. 2026.** Externý zdroj dokladá definíciu alebo metodický argument; sám osebe nepreukazuje, že naša voľba je jediná správna. Nasledujúci prehľad prepája hlavné rozhodnutia s konkrétnymi podkladmi; nejde o nové metodické rozhodnutia.

| Pojem alebo rozhodnutie | Primárny zdroj a relevantná časť | Čo podklad podporuje a čo volíme my |
|---|---|---|
| Relatívna úroveň minimálnej mzdy | ILO (2015), [5.5 Ratio of minimum to average wages](https://www.ilo.org/resource/55-ratio-minimum-average-wages), úvod a upozornenia na obmedzenia. Európska komisia (2025), [Developments in wage adequacy](https://op.europa.eu/webpub/empl/lmwd-annual-review-report-2025/chapter2/developments-in-wage-adequacy.html), Box 2.1. | Pomer zákonného minima k priemernej alebo mediánovej mzde je zavedený relatívny ukazovateľ; Komisia používa označenie Kaitzov index. V projekte používame jeho variant s priemerom, nie vlastný nový koncept. Presný obsah menovateľa sa musí uviesť, pretože rôzne zdroje nemusia byť zameniteľné. |
| Konkrétna mzdová premenná a pokrytie B–S | Eurostat (2026), [Minimum wages – earn_minw](https://ec.europa.eu/eurostat/cache/metadata/en/earn_minw_esms.htm), časti 3.1–3.4 a 15; [národná príloha k pomerom, stav 1. 7. 2026](https://ec.europa.eu/eurostat/cache/metadata/Annexes/earn_minw_esms_an_Monthly_minimum_wage_as_a_prop.pdf). | Dokladá hrubé mzdové veličiny, ročnú frekvenciu pomeru, NACE a národné odchýlky. Výber priemeru a B–S je naše rozhodnutie podľa zámeru a dostupnosti; neznamená úplne harmonizované národné definície. |
| Nízke vzdelanie = aktuálne dosiahnuté ISCED 0–2 | Eurostat (2026), [Educational attainment level and transition from education to work](https://ec.europa.eu/eurostat/cache/metadata/en/edat1_esms.htm), časti 3.1, 3.2 a 15.2. | Definuje vzdelanostný agregát a prechod klasifikácie. Voľba tejto skupiny ako operacionalizácie skúmanej zraniteľnej populácie je naša; zdroj netvrdí, že všetci jej členovia majú nízku produktivitu alebo prijmú mzdu pod zákonným minimom. |
| Miera zamestnanosti a nezamestnanosti | Eurostat, [EU-LFS – new methodology from 2021 onwards](https://ec.europa.eu/eurostat/statistics-explained/index.php?title=EU_Labour_Force_Survey_-_new_methodology_from_2021_onwards), časti Labour force status a Main indicators being expressed as a rate. | Dokladá pracovné statusy a odlišné menovatele mier: celá príslušná populácia oproti ekonomicky aktívnym. Uprednostnenie zamestnanosti ako hlavného výsledku je naše rozhodnutie podľa otázky pracovného uplatnenia celej skupiny. |
| Opravené rady a vek 20–64 | Eurostat (2026), [LFS main indicators](https://ec.europa.eu/eurostat/cache/metadata/en/lfsi_esms.htm), časti 3.1 a 15.2; Eurostat (2024), [Correction for breaks in time series](https://ec.europa.eu/eurostat/statistics-explained/index.php?title=EU_labour_force_survey_-_correction_for_breaks_in_time_series), Background a Input for break correction. Konkrétny výber: [lfsi_educ_a](https://ec.europa.eu/eurostat/databrowser/view/lfsi_educ_a/default/table?lang=en) a [une_educ_a](https://ec.europa.eu/eurostat/databrowser/view/une_educ_a/default/table?lang=en). | Dokladá postup opráv vrátane možného modelového odvodzovania. Dostupnosť presného výberu sme overili v API a exportoch; vek 20–64 je náš kompromis medzi kontinuitou a ustálenosťou vzdelania, nie všeobecné odporúčanie zdroja. |
| Podmienené očakávanie negatívnej súvislosti | ILO (2016), [Employment effects in different economic theories](https://www.ilo.org/resource/employment-effects-different-economic-theories). | Uvádza konkurenčný nákladový a substitučný mechanizmus aj alternatívy založené na mzdovej moci zamestnávateľov a dopyte. Podporuje zdôvodnenie hypotézy, nie tvrdenie, že negatívny účinok nevyhnutne nastane vo V4. |

**Medziročné zmeny a individuálny prístup ku krajinám sú naše analytické voľby.** Zodpovedajú záujmu o zmeny vnútri krajiny; národná príloha vyššie dokladá rozdielne mzdové definície, napríklad zahrnutie bonusov. Nepreberáme z nej tvrdenie, že medziročné zmeny tieto rozdiely odstránia alebo sú vždy lepšie než úrovne. Rozdiely úrovní opisujeme ako kontext; zmeny neposkytujú automatickú kontrolu ostatných ekonomických vplyvov. Zmena definície v čase aj meniaci sa objem zahrnutých bonusov môžu ovplyvniť výsledok.

**Doplnkové jednoročné oneskorenie je naša exploračná voľba.** Uvedené zdroje neurčujú jednoročnú reakciu zamestnávateľov. Rovnako výluky medziročných porovnaní cez zostávajúce b sú transparentné pravidlo nášho spracovania, nie univerzálna štatistická oprava. Rozhodnutia, alternatívy a ich autorstvo sú v `DECISION_LOG.md`.

**Predbežný údaj (prijaté 25. 10. 2026):** poľský pomer minima k priemeru za rok 2025 (52,85 %, p v získanom exporte) zahŕňame do analýzy so zachovaným označením. p znamená predbežnosť a možnosť neskoršej revízie, nie automatické porušenie časovej porovnateľnosti. Konkrétnu príčinu ani veľkosť prípadnej revízie zo značky nepoznáme. Pôvodný export a dátum získania zachováme. [Eurostat – značky pozorovaní](https://ec.europa.eu/eurostat/data/database)

### Relatívna úroveň minimálnej mzdy a nominálna alternatíva

**Zdôvodnenie schválené autorom (25. 10. 2026):** pomer minimálnej mzdy k priemernej mzde používame na zachytenie relatívnej úrovne zákonnej mzdovej hranice. Jeho rast znamená, že minimum sa približuje priemernej mzde, a môže signalizovať väčší tlak na odmeňovanie nízko platených pracovníkov. Skúmame, ako zmeny tejto relatívnej úrovne súvisia so zamestnanosťou ľudí s nízkym vzdelaním. [ILO – pomer minima k priemernej alebo mediánovej mzde](https://www.ilo.org/resource/55-ratio-minimum-average-wages)

Nominálna sadzba priamo opisuje zákonné nastavenie minima, ale neukazuje jeho postavenie voči bežným zárobkom. Pomer rozlišuje zvýšenie minima sprevádzajúce rovnaký percentuálny rast priemeru (pomer zostáva rovnaký) od zvýšenia, pri ktorom minimum rastie rýchlejšie než priemer. Zvolená metrika preto zodpovedá otázke relatívnej úrovne, nie izolovaného zásahu zákonodarcov. Priemerná mzda nie je priamou mierou produktivity; pomer nekontroluje produktivitu ani náklady na jednotku produkcie. Rast produktivity môže kompenzovať rast nákladov práce na jednotku produkcie, hoci nominálny náklad na pracovníka vzrastie. [BLS – jednotkové náklady práce](https://www.bls.gov/k12/productivity-101/content/what-is-productivity/what-is-unit-labor-cost.htm)

### Teoretické východisko negatívnej asociácie

**Zdôvodnenie schválené autorom (25. 10. 2026):** v konkurenčnom modeli môže záväzná minimálna mzda nad úrovňou, ktorá by vznikla bez nej, zvýšiť náklady na dotknuté pracovné miesta a obmedziť dopyt po práci. Firmy môžu znížiť prijímanie či zamestnanosť alebo nahrádzať prácu technológiami. To motivuje východiskové očakávanie negatívnej súvislosti medzi zmenami relatívneho minima a miery zamestnanosti. Ide o podmienený mechanizmus: modely s mzdovou mocou zamestnávateľov pripúšťajú pri primeranom minime aj nezáporný účinok. Nízke vzdelanie nie je totožné s nízkou mzdou ani produktivitou a rast pomeru nemusí znamenať zvýšenie zákonného minima. [ILO – rozdielne teoretické mechanizmy](https://www.ilo.org/resource/employment-effects-different-economic-theories)

Autor potvrdil, že očakávanie sa týka nepriaznivejšej zmeny zamestnanosti pri vyššej zmene pomeru. Záujem zahŕňa smer aj veľkosť číselných zmien, nie iba dichotómiu rast/pokles. Schválené znenie otázky a hypotézy je v príslušnej sekcii vyššie.

**Stav:** autor vybral relatívny ukazovateľ a pokrytie B–S. Národné definície a referenčné obdobia vo vybranom rade ešte overíme. Nasledujúce zdôvodnenie nepredstavuje prijatie konečnej regresnej ani kauzálnej metodiky.

Relatívnu minimálnu mzdu operacionalizujeme ako pomer hrubej minimálnej mzdy k priemernej hrubej mesačnej mzde vo vybranom odvetvovom pokrytí NACE Rev. 2 B–S, vyjadrený v percentách. Cieľom je zachytiť zákonnú mzdovú hranicu vzhľadom na mzdovú úroveň ekonomiky. Ukazovateľ je približnou mierou relatívneho nastavenia minima; priamo nemeria motiváciu zamestnávateľa, produktivitu ľudí s nízkym vzdelaním ani celkový náklad ich zamestnania. [ILO – význam a obmedzenia pomeru minima k bežným zárobkom](https://www.ilo.org/resource/55-ratio-minimum-average-wages)

### Prečo nevolíme PPS ako hlavnú premennú

Minimálna mzda v PPS zohľadňuje rozdielne cenové hladiny medzi krajinami a je vhodná najmä na porovnávanie kúpnej sily v rovnakom období. Naším hlavným zámerom je vzťah nastavenia mzdového minima k pracovným príležitostiam, nie porovnanie spotrebných možností pracovníkov. PPS nevyjadruje minimum voči ostatným mzdám či produktivite a bežný prepočet do PPS sám neodstraňuje infláciu v čase. Rast PPS preto nemožno automaticky označiť za rast reálnej kúpnej sily medzi rokmi. PPS je vhodnou alternatívou pre inú otázku, nie všeobecne nevhodným ukazovateľom. [Eurostat – prepočet minimálnych miezd](https://ec.europa.eu/eurostat/cache/metadata/en/earn_minw_esms.htm), [Európska komisia – PPS a stále ceny, časť 2.5](https://publications.jrc.ec.europa.eu/repository/bitstream/JRC138212/JRC138212_01.pdf)

### Prečo nevolíme reálnu minimálnu mzdu ako hlavnú premennú

Minimálna mzda očistená spotrebiteľským cenovým indexom je relevantná na skúmanie zmien kúpnej sily v čase a môže byť použitá aj vo výskume zamestnanosti. Pre tento projekt uprednostňujeme pomer k bežným zárobkom, pretože chceme porovnávať relatívne nastavenie mzdovej hranice medzi ekonomikami s odlišnou mzdovou úrovňou. Spotrebiteľské ceny nemusia sledovať ceny produkcie zamestnávateľa: reálna spotrebiteľská mzda môže zostať rovnaká, hoci náklady firmy voči výnosom z práce vzrastú. Deflácia spotrebiteľskými cenami teda sama nevytvára priamu mieru nákladového tlaku. Ani relatívny pomer však tento problém úplne nerieši. [ECB – spotrebiteľská a producentská reálna mzda](https://www.ecb.europa.eu/press/economic-bulletin/articles/2023/html/ecb.ebart202208_02~2328747465.en.html)

### Výber priemeru a hranice interpretácie

Medián rozdeľuje mzdové rozdelenie na dve polovice a je menej ovplyvnený extrémne vysokými zárobkami než priemer. Pre porovnanie minima so zárobkom typického zamestnanca je preto vhodnejším referenčným bodom, najmä pri vysokej mzdovej nerovnosti; tento dôvod uvádza aj [ILO – Ratio of minimum to average wages](https://www.ilo.org/resource/55-ratio-minimum-average-wages). Neznamená to jeho univerzálnu nadradenosť pre vysvetlenie zamestnanosti ani priame meranie produktivity či nákladov zamestnávateľa. Priemer volíme aj vzhľadom na autorom overenú úplnejšiu dostupnosť V4 za obdobie 2010–2025 v Eurostate. Slovenské súbežné porovnanie oboch pomerov z výberu B–S zaradíme do reportu ako posúdenie citlivosti na menovateľ. Ide o súvisiace ukazovatele s rovnakým minimom v čitateli a rovnakou zamestnanosťou vo výsledku, nie nezávislú validáciu hlavnej miery. Zhodný vizuálny smer by len naznačoval, že slovenský obraz nie je špecifický výlučne pre priemer; rozsah mzdových definícií zostáva predmetom nižšie uvedených obmedzení.

Pomer môže vzrásť zvýšením minima aj poklesom priemernej mzdy. Vývoj priemeru môže navyše súvisieť so zmenami zloženia zamestnaných. Rast pomeru preto automaticky neoznačíme za zvýšenie zákonnej sadzby ani za vyšší náklad každého zamestnávateľa. Priemer B–S sa nevzťahuje výlučne na osoby s nízkym vzdelaním. Ukazovateľ nezahŕňa všetky odvody, úľavy či dotácie zamestnávateľa a jeho asociácia so zamestnanosťou sama nepreukazuje účinok minimálnej mzdy. [ILO – interpretačné obmedzenia](https://www.ilo.org/resource/55-ratio-minimum-average-wages)

## Overenie národných definícií mzdového pomeru

**Overila AI 24. 10. 2026, opätovne 3. 11. 2026:** [metodika Eurostatu](https://ec.europa.eu/eurostat/cache/metadata/en/earn_minw_esms.htm) a [národná príloha earn_mw_avgr2, stav k 1. 7. 2026](https://ec.europa.eu/eurostat/cache/metadata/Annexes/earn_minw_esms_an_Monthly_minimum_wage_as_a_prop.pdf), strany 1, 3–5. Existuje spoločná cieľová definícia aj výslovne vykazované národné odchýlky; nejde o úplnú harmonizáciu vstupných miezd. Príloha opisuje aktuálne definície; sama nepotvrdzuje nemennosť všetkých pravidiel za 2010–2025.

Všeobecný cieľový štandard: hrubé pravidelné peňažné zárobky, zamestnanci na plný úväzok, podniky všetkých veľkostí, priemer za rok (ak nie je dostupný, konkrétny mesiac). Pomer je publikovaný ako ročný ukazovateľ. Základná metodika vylučuje nepravidelné platby, národné odchýlky však menia obsah menovateľa:

| Krajina | Čo uvádza národná poznámka | Dôsledok |
|---|---|---|
| Česko | Zahrnuté aj 13./14. mzdy a dovolenkové bonusy; všetci zamestnanci prepočítaní na plné úväzky, všetky veľkosti podnikov. | Menovateľ sa líši od štandardu pravidelných platieb. |
| Maďarsko | Priemer vylučuje pravidelné aj nepravidelné prémie, bonusy a 13./14. mzdy; podniky s aspoň 4 zamestnancami. Zárobky 2019–2024 boli revidované v 2025. | Iné mzdové zložky aj pokrytie najmenších podnikov než pri Česku. |
| Poľsko | Referenčné zárobky vylučujú 13. plat a platby zo zisku; nemožno oddeliť jubilejné odmeny, odchodové platby a nadčasy, ktoré sa pri definovaní minima posudzujú inak. | Čitateľ a menovateľ nemajú úplne zhodný rozsah mzdových zložiek. |
| Slovensko | Zárobky zamestnancov na plný úväzok; poznámka uvádza všetky odvetvia NACE Rev. 2. Export však obsahuje odlišné hodnoty za B–N a B–S pri oboch menovateľoch. | Nejednoznačnosť dokumentácie, nie potvrdená chyba údajov. Zachovávame publikovaný výber B–S a neistotu stručne uvádzame v metodike podľa rozhodnutia autora z 3. 11. 2026. |

**Overenie pôvodného exportu AI (3. 11. 2026):** v nezmenenom `data/raw/minimalna_mzda_priemer_export.xlsx` je priemer B–S na `Sheet 1`, medián B–S na `Sheet 2`, priemer B–N na `Sheet 3` a medián B–N na `Sheet 4`. Slovenské riadky majú rozdielne hodnoty podľa odvetvového výberu; za 2024 ide o priemer 42,8 % (B–S) oproti 43,0 % (B–N) a medián 51,9 % oproti 53,1 %. Toto potvrdzuje odlíšenie publikovaných radov a správnosť nášho výberu označeného B–S. Samo to však nevysvetľuje národnú poznámku „All NACE Rev. 2 sectors are covered“ ani nedokladá totožné presné pokrytie priemeru a mediánu počas celého obdobia. Označenie publikovaného radu odlišujeme od plne doloženej definície zdrojového menovateľa. Vývoj zahrnutých bonusov je legitímnou súčasťou vývoja referenčných zárobkov a relatívnej minimálnej mzdy, nie automatickou chybou merania. Rozdielne národné definície zohľadňujeme pri porovnaní krajín; zmeny pomeru neinterpretujeme ako čistú zmenu zákonnej sadzby.

**Zaobchádzanie s nejasnosťou schválené autorom (3. 11. 2026):** po overení metodiky, národnej prílohy a exportu ďalšie preverovanie v tejto etape ukončujeme. Použijeme publikované rady B–S a stručne uvedieme nasledujúce obmedzenie: „Pre Slovensko používame publikovaný rad Eurostatu označený B–S. Národná poznámka zároveň všeobecne uvádza pokrytie všetkých odvetví NACE; jej vzťah ku konkrétnemu odvetvovému výberu sa z dostupnej dokumentácie nepodarilo jednoznačne objasniť.“ Podrobné zistenia zostávajú v projektových poznámkach. Nevyhlasujeme slovenské údaje za chybné alebo neporovnateľné a presné pokrytie nepovažujeme za definitívne overené. Nový konkrétny rozpor v hodnotách alebo dôkaz zmeny pokrytia v čase by bol dôvodom na opätovné otvorenie; bez takého podnetu táto dokumentačná neistota neblokuje prípravu reportu.

Väčší rozsah zahrnutých odmien môže pri inak rovnakých podmienkach znižovať pomer. Samotné rozdiely pomerov teda nemožno pripísať iba nastaveniu zákonného minima. Národné poznámky pre V4 neuvádzajú dostatočne podrobne časový základ čitateľa a menovateľa v každom roku. Nepovažujeme za preukázané, že ide vždy o presne rovnaké ročné priemery, ani že slovenský priemer a medián majú totožné pokrytie. Závery o medzinárodnej porovnateľnosti zostávajú podmienené; tieto odchýlky sa nedajú opraviť iba pridaním značky b.

## Vzdelávacie ciele

Rozvíjať analytické myslenie, tvorbu výskumnej metodiky, spracovanie dát v R, používanie lineárnej regresie, interpretáciu ekonomických a štatistických výsledkov a kritické využívanie AI. Priebežne rozlišovať samostatnú prácu autora, prácu s usmernením a prácu vykonanú AI.

## Organizácia projektu

- `00 – Project Control`: koordinácia, stav projektu a rozhodnutia.
- `01 – R Learning Lab`: malé vzdelávacie úlohy a reflexia učenia.
- `02 – Data & Methodology`: overenie dát a metodický návrh autora s následnou revíziou.
- `03 – Analysis & Regression`: postupná analýza a interpretácia po príprave dát a metodiky.
- `04 – Report & GitHub`: spracovanie výstupov, report a prezentácia projektu.

Všetky tematické vlákna používajú rovnaký projektový adresár. Hlavným zdrojom kontextu sú projektové súbory, nie história konverzácií.

## Štruktúra súborov

- `data/raw/`: pôvodné dáta po neskoršom získaní.
- `data/processed/`: spracované dáta.
- `R/`: postupne vytvárané skripty.
- `outputs/`: tabuľky, grafy a ďalšie analytické výstupy.
- `reports/`: report a textová interpretácia.
- `learning/`: cvičenia, poznámky a záznamy o učení.
- `PROJECT_BRIEF.md`: pracovné vymedzenie projektu.
- `DECISION_LOG.md`: významné rozhodnutia, alternatívy a zdôvodnenia.
- `CURRENT_STATE.md`: aktuálny stav a najbližší krok.
- `AGENTS.md`: trvalé pravidlá spolupráce s Codexom.
