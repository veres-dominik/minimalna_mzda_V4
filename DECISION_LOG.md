# Denník rozhodnutí

Metodické návrhy nie sú konečné rozhodnutia. Každý ďalší významný záznam má uviesť dátum, stav rozhodnutia, alternatívy, zdôvodnenie a podiel autora a AI.

## 17. 11. 2026 – Publikovanie ručným nahratím cez web

- **Zvolil autor:** z dostupných možností vyskúšať web GitHubu. Táto cesta nahrádza čakanie na plugin alebo zavádzanie GitHub Desktop; nemení analytickú časť projektu.
- **Cieľ určil autor:** poskytol odkaz https://github.com/veres-dominik/minimalna_mzda_V4. Názov repozitára môže byť odlišný od lokálneho priečinka; vnútorné relatívne odkazy zostávajú platné. Prístupnosť a nahratie obsahu ešte čakajú na overenie.
- **Vykonala AI:** skontrolovala aktuálnosť uložených R skriptov voči dohodnutému rozsahu a pripravila samostatnú kópiu `github-upload/` na nahratie so zachovanou štruktúrou. Kópia rešpektuje `.gitignore`; lokálny Git a stav RStudio nezahŕňa. Kontrola zahŕňa zhodu súborov cez SHA-256 a dostupnosť lokálnych odkazov, nie nový beh R.
- **Hranice:** autor vykoná vytvorenie vzdialeného repozitára a nahratie cez svoj účet. Publikovanie a funkčnosť odkazov na GitHube treba následne potvrdiť; lokálna príprava sama nie je publikovaním. Pracovné originály zostávajú v koreni projektu, exportná kópia nie je druhou pracovnou verziou.

## 17. 11. 2026 – Obnovenie prípravy na publikovanie

- **Povolil autor:** po uzavretí reportu pokračovať najbližším blokom, prípravou a publikovaním projektu na GitHub pre prezentáciu v životopise.
- **Vykonala AI:** pripravila stručnú vstupnú stránku `README.md`, postup spustenia podľa existujúcich skriptov a `.gitignore`; založila lokálny Git repozitár na vetve `main`. Report a analytické výstupy zachovala. Zdroje dát a podmienky ich opätovného použitia uviedla odkazom na Eurostat. Nový beh R nevykonala.
- **Dohľadateľnosť a stav:** predchádzajúca práca zostáva doložená projektovými záznamami, nevytvára sa spätná história commitov. Licencia ku kódu a textom sa automaticky nevyberá. Pred prvým commitom a publikovaním treba doplniť GitHub účet, pripojenie a identitu pre Git; nič sa zatiaľ nezverejnilo.

## 17. 11. 2026 – Schválenie a uzavretie reportu

- **Rozhodol autor:** po priebežnom posúdení častí a záverečnej diskusii uzavrieť report v existujúcom rozsahu. Alternatívou bolo ďalšie pripomienkovanie alebo rozširovanie; nové analýzy sa nepridávajú.
- **Vykonala AI:** označila report ako finálnu verziu schválenú autorom a aktualizovala projektové dokumenty. Obsah, výpočty, grafy, skripty a dáta zostali nezmenené; nevykonávala nový beh R ani nové overovanie výsledkov.
- **Stav a hranice:** analytická a reportová etapa sú uzavreté. Schválenie nemení uvedené obmedzenia ani záznamy o autorstve kontrol. Príprava a publikovanie na GitHub zostávajú samostatnou prerušenou etapou; projekt zatiaľ nebol publikovaný.

## 17. 11. 2026 – Prijatie dvojpanelovej prílohy a uzavretie kontroly reportu

- **Prijal autor:** po diskusii čitateľnosti ponechať oneskorenú nezamestnanosť v dvoch dvojpanelových obrázkoch namiesto zmenšeného štvorpanelového prehľadu. Dôvodom je priestor pre ročné popisky pri šírke reportu; pozorovania a spoločné stupnice zostávajú zachované.
- **Dokončila AI:** kontrolu zhody výskumnej otázky s briefom, 9 výsledkových riadkov s CSV pri uvedenom zaokrúhlení, počtov 5 technických výstupov, 8 obrázkov a 23 lokálnych odkazov vrátane vnútorného odkazu na prílohu. Nadpisy a popisy zodpovedajú aktuálnemu rozsahu reportu. Finálne označenie zostáva „Verzia na záverečné posúdenie“.
- **Stav:** report je pripravený na posledné celkové prečítanie autorom; táto kontrola AI nie je novým metodickým rozhodnutím ani autorovým potvrdením každej bunky. Dáta, modely a interpretácie sa v tomto bloku nemenili. GitHub sa nepublikoval.

## 17. 11. 2026 – Schválenie úvodného zhrnutia a grafické doladenie

- **Schválil autor:** po vysvetlení meniaceho sa zloženia skupiny prijal zhrnutie hlavných zistení a povolil pokračovať najbližším blokom.
- **Vykonala AI:** pripravila rozmiestňovanie ročných popiskov základnými funkciami R, spoločné pre V4 a slovenský medián. Všetky roky a dátové body ostávajú zachované; odsunutý text spája s bodom jemná sivá spojnica. Ide o grafickú úpravu bez nového balíčka, nie zmenu metódy alebo vzorky. Alternatíva vynechať niektoré ročné popisky sa nepoužila.
- **Stav:** nový export ešte nebol vykonaný. Funkcia `uloz_grafy_reportu()` teraz obnoví päť bodových PNG vrátane nezamestnanostných príloh, ktoré zostávajú bez regresie. Finálny vzhľad a čitateľnosť čakajú na beh R a vizuálnu kontrolu.

## 17. 11. 2026 – Schválenie sprievodných častí a príloh reportu

- **Schválil autor:** po prečítaní prijal zdroje, opis spolupráce autora s AI a prílohy pripravené v predchádzajúcom bloku; povolil nadviazať úvodným zhrnutím a kontrolou reportu.
- **Vykonala AI:** doplnila stručné úvodné zhrnutie a pri redakcii zosúladila zdôvodnenie voľby pomeru oproti reálnej minimálnej mzde s autorom prijatým kontrastom v závere. Nejde o zmenu operacionalizácie alebo metodiky. Overila zhodu 9 riadkov výsledkových tabuliek s CSV a platnosť lokálnych a vnútorných odkazov.
- **Hranice schválenia:** nové úvodné zhrnutie ešte čaká na posúdenie autora. Prekrývajúce sa ročné popisky grafov zostávajú na doladenie; report týmto nie je označený za finálny ani publikovaný na GitHub.

## 17. 11. 2026 – Schválenie záveru po pripomienkach a pokračovanie doplnkami

- **Schválil autor:** po spresnení spoločných rokov, doplnení dôvodu výberu pomeru oproti reálnej minimálnej mzde a diskusii slov „súvislosti/asociácie“ ponechať znenie záveru a pokračovať. AI zachovala „opis súvislostí“ ako zrozumiteľné pomenovanie s výslovnou hranicou kauzálnej interpretácie.
- **Vykonala AI v najbližšom bloku:** doplnila do reportu dohodnuté nezamestnanostné prílohy, krátke súbežné zhrnutie, súhrn primárnych zdrojov, vecný opis podielu autora a AI a odkazy na technické CSV. Oneskorenú nezamestnanosť vecne neinterpretuje a nepridáva modely.
- **Stav:** nové doplnkové znenie čaká na posúdenie autora. Zhrnutie a finálna grafická/redakčná kontrola ešte nie sú hotové; schválenie záveru neznamená schválenie každej neskôr doplnenej časti alebo novej kontroly dát autorom.

## 16. 11. 2026 – Schválenie osnovy reportu a začatie realizácie

**Nadväzujúce schválenie autora (16. 11. 2026):** autor oznámil prečítanie úvodu a súhlas s jeho znením po diskusii alternatívnych teoretických mechanizmov. Povolil pokračovať ďalším blokom; AI doplnila kapitolu „Dáta a metodika“ podľa už prijatých rozhodnutí. Nové metodické znenie čaká na posúdenie autora, nejde o nové metódy alebo výpočty.

- **Schválil autor:** osnovu so zhrnutím, motiváciou a otázkou, dátami a metodikou, časovým kontextom, výsledkami po krajinách a diskusiou s obmedzeniami a záverom; následne prejsť k realizácii po dohodnutých blokoch. Zhrnutie sa napíše nakoniec.
- **Rozdelenie výstupov:** súbežná aj oneskorená zamestnanosť a slovenský medián v hlavnom texte, malé tabuľky a schválené interpretácie podľa krajín, jeden spoločný odsek kontroly rovnakých rokov. Nezamestnanostné grafy v prílohách; úplné diagnostické výpočty dostupné v CSV. Na konci zdroje a vecný opis podielu autora a AI. Tento zápis potvrdzuje predchádzajúce obsahové rozhodnutia.
- **Dôvod a alternatíva:** súvislý report umožní čitateľovi sledovať otázku, postup a dôkazy; samotné pracovné výsledky a oddelené projektové poznámky tento celok ešte netvoria. Podrobnosti v prílohách a CSV udržia hlavný text primeraný rozsahu projektu.
- **Vykonala AI:** založila `reports/REPORT.md` s úvodom, prijatou otázkou a hypotézou a teoretickým zdôvodnením. Znova overila príslušné zdroje ILO. Nové úvodné znenie čaká na posúdenie autora; schválené pracovné výsledky, výpočty a skripty zostávajú zachované. Nejde o dokončenie celého reportu.

## 3. 11. 2026 – Slovenskú dokumentačnú nejasnosť uvedieme ako obmedzenie

- **Schválil autor:** zachovať publikované rady B–S a stručne uviesť nejednoznačnosť slovenskej národnej poznámky v metodike. Po kontrole oficiálnej metodiky, prílohy a pôvodného exportu ďalšie preverovanie v aktuálnej etape ukončiť. Alternatívou bolo podrobnejšie objasňovanie národného zdroja alebo kontaktovanie poskytovateľa. Primeranosť rozsahu overovania posudzujeme podľa exploračného účelu projektu a absencie potvrdeného dátového rozporu.
- **Hranice rozhodnutia:** nevydávame nejasnú poznámku za chybu dát, dôkaz neporovnateľnosti alebo uzavreté overenie presného pokrytia. Podrobné poznámky zachovávame; konkrétny nový rozpor či doložená zmena definície môže byť dôvodom na opätovné otvorenie. Samotný vývoj bonusov zahrnutých v referenčnej mzde je legitímnou súčasťou relatívnej minimálnej mzdy, nie automatickým problémom modelu.
- **Vykonala AI:** vložila schválené stručné znenie obmedzenia do briefu a uzavrela tento pracovný bod v aktuálnom stave. Výpočty, dáta a schválenú výsledkovú časť nemenila; externé správy neodosielala.

## 3. 11. 2026 – Schválenie pracovných výsledkov a názvu záverečnej kontroly

- **Schválil autor:** po prečítaní prijal znenie pracovných výsledkov vrátane tabuliek po krajinách a interpretácií. Pre záverečný odsek navrhol presný názov „Rovnaké zloženie vzorky pri súbežnom a oneskorenom porovnaní“. Tým uzatvoril otvorené posúdenie pracovného textu a krátkeho samostatného zhrnutia kontroly za krajinami; podrobnosti zostávajú v technických výstupoch.
- **Vykonala AI:** použila autorov názov, odstránila už neaktuálne poznámky o čakajúcom schválení a zosúladila stav a brief. Interpretácie a číselné výsledky vecne nezmenila. Ide o schválenie výsledkovej časti, nie hotového reportu alebo autorovej kontroly všetkých dátových buniek.

## 3. 11. 2026 – Kontrola časovaní na spoločnom výbere rokov pomeru

- **Prijaté autorom:** po diskusii o tretích premenných a inom zastúpení rokov autor schválil kontrolný prepočet oboch časovaní na rovnakých rokoch zmeny pomeru v každej krajine. Alternatívou bolo ponechať odlišné vzorky iba ako slovné obmedzenie. Zjednotenie vzorky umožní overiť, či samotný výber rokov vysvetľuje rozdiel medzi časovaniami; pôvodné odhady zostávajú hlavnými výsledkami.
- **Presné vymedzenie:** prienik príznakov `pouzitelne_zam_subezne` a `pouzitelne_zam_oneskorene`; bez nového posunu po výlukách. Pri rovnakom x z t−1→t sa naďalej porovnáva y t−1→t a y t→t+1. CZ/SK po 13 párov, PL/HU po 12; spolu 50 spoločných rokových párov a 8 kontrolných regresných odhadov. Medián ani nezamestnanosť sa v tejto kontrole nerozširujú.
- **Vykonala AI:** pripravila samostatný `R/09_spolocne_roky.R` s porovnaním pôvodných a zjednotených vzoriek a kontrolným zoznamom rokov a súradníc. V Pythone nezávisle preverila všetkých 16 odhadov (8 pôvodných a 8 spoločných) dvoma matematickými postupmi, zhodu pôvodných výsledkov s uloženým CSV a kalendárne párovanie i zlomy všetkých 50 párov. Nový R skript nebol vykonaný; čaká na autora.
- **Hranice:** ide o kontrolu zloženia vzorky, nie kontrolu hospodárskeho cyklu alebo kauzálnu identifikáciu. Menšia vzorka môže byť citlivejšia na jednotlivé body; pri rovnakom roku pomeru výsledné kalendárne roky naďalej nie sú totožné. Sila pôsobenia tretích premenných sa z tejto kontroly nedá určiť.

## 3. 11. 2026 – Oneskorená zamestnanosť do hlavného analytického textu

- **Rozhodol autor:** jednoročne oneskorené porovnanie zamestnanosti zaradiť do hlavného textu ako zdôvodnený doplnok k súbežnému porovnaniu; alternatívou bolo umiestnenie iba v prílohe. Uvedieme všetky krajiny, aj keď výsledok bude slabý alebo odlišný od súbežného.
- **Zdôvodnenie rozvinuté AI v nadväznosti na skoršiu dohodu:** prispôsobovanie počtu pracovných miest môže byť postupné. Posun ročných zmien preto umožňuje preskúmať následnú asociáciu, nie dokázať reakciu po presne jednom roku. Zachovávame rovnaké definície, kalendárne párovanie, výluky a opisné zhrnutie; rozdielne zloženie rokov zostáva obmedzením porovnania časovaní.
- **Dôsledok a vykonanie:** AI aktualizovala brief a aktuálny stav, bez nových výpočtov alebo tvorby reportu. Oneskorená nezamestnanosť zostáva prílohou bez interpretácie v hlavnom texte; rozsah deviatich existujúcich regresií sa nemení.

## 3. 11. 2026 – Opisná regresia, korelácia a citlivosť na jednotlivé roky

- **Schválené autorom:** po vysvetlení a odporúčaní AI autor pokynom „poďme na to“ prijal OLS priamku s konštantou ako hlavné číselné zhrnutie a Pearsonovu koreláciu ako doplnkové číslo. Rozsah: zamestnanosť po krajinách V4, súbežne aj s jednoročným oneskorením, plus SR medián súbežne; spolu 9 plných odhadov. Alternatívou bol iba grafický opis alebo samotná korelácia. Smernica umožní vyjadriť aj veľkosť asociácie, čo zodpovedá výskumnej otázke.
- **Dohodnutá kontrola:** systematicky vynechať postupne každý jeden pár a odhad zopakovať; spolu 124 diagnostických odhadov. Uchovať rozsah smerníc, zmeny znamienka a rok najväčšieho posunu, pri oneskorení aj rok výsledku. Nevyberať iba podozrivé roky a žiadne automaticky neodstrániť. Rozsah citlivosti nie je interval spoľahlivosti a stabilita znamienka nepreukazuje kauzalitu ani štatistickú významnosť.
- **Hranice:** rovnaký postup aj pri krajinách bez očakávaného negatívneho obrazu, bez spoločného nerozlíšeného modelu V4, bez ďalšej regresie nezamestnanosti. Žiadne nové kontrolné premenné, p-hodnoty, inferenčné intervaly ani predikcie; časová závislosť a confoundery zostávajú obmedzeniami. Porovnanie menovateľov SR používa rovnakú vzorku.
- **Vykonala AI:** pripravila `R/08_opisna_regresia.R` a voliteľné prekreslenie existujúcich grafov 06/07 s priamkou. Samostatne preverila všetkých 9 plných a 124 vynechaných odhadov v Pythone uzavretými vzorcami oproti `statistics.linear_regression` a `statistics.correlation`; výsledky sú v zhode. Overila primárnu dokumentáciu R a NIST a zosúladila brief. Rscript na hoste nástrojov nie je dostupný; nový R kód nebol vykonaný. Beh v RStudiu a vizuálna kontrola zostávajú autorovi.

## 25. 10. 2026 – Slovenský mediánový doplnok zaradený do hlavného reportu

- **Nové rozhodnutie autora:** oproti predchádzajúcej voľbe iba prílohy ukázať v reporte, či slovenský súbežný obraz pri pomere k priemeru pretrváva aj pri pomere k mediánu. Ide o krátke posúdenie citlivosti na menovateľ, metodicky navrhnuté už pred grafmi. Oneskorená nezamestnanosť zostáva prílohou bez interpretácie v hlavnom texte.
- **Zdôvodnenie a spresnenie AI:** medián je menej ovplyvnený vysokými zárobkami a lepším referenčným bodom pre typického zamestnanca, najmä pri vysokej mzdovej nerovnosti; overené v primárnom zdroji [ILO](https://www.ilo.org/resource/55-ratio-minimum-average-wages). Táto vlastnosť nepreukazuje univerzálnu nadradenosť pre analýzu zamestnanosti. Pomer k priemeru zostáva hlavným ukazovateľom V4 aj pre úplnejšiu dostupnosť dát.
- **Postup a hranice:** oba slovenské pohľady porovnať na rovnakých 14 rokoch 2012–2025 s rovnakou zamestnanosťou, populáciou a výlukami; mzdové definície posúdiť podľa zdokumentovaných obmedzení. Výsledok môže byť podobný aj odlišný. Vizuálny náznak zatiaľ nie je vypočítaná korelácia, zhoda nie je nezávislou validáciou ani kauzálnym dôkazom. Regresia sa týmto neprijíma.
- **Podiel práce:** autor navrhol zmenu zaradenia; AI overila zdroj, otvorila už dostupný mediánový PNG a zosúladila dokumentáciu. Kód, dáta a analytický report v tomto kroku nemenila.

## 25. 10. 2026 – Posledné dva grafy iba do doplnkových príloh

- **Prijaté autorom po prezretí:** oneskorenú nezamestnanosť vo V4 a súbežný mediánový pohľad na zamestnanosť SR uviesť iba ako doplnok, bez interpretácie v hlavnom analytickom texte a bez ďalšieho modelovania. Alternatívou bola podrobnejšia interpretácia oboch pohľadov; autor zvolil stručnejší rozsah. Grafy zostanú dostupné s metodickými popismi a zdrojmi.
- **Dôvod a obmedzenie:** autor posúdil oba grafy ako vizuálne málo výpovedné. Z tohto dojmu nevyvodzujeme neexistenciu vzťahu. Zachovávame transparentný záznam aj dostupnosť doplnkov; priorita zamestnanosti bola metodicky prijatá ešte pred grafmi. Rozhodnutie sa týka týchto dvoch pohľadov, nie nového výberu hlavného ukazovateľa podľa výsledku.
- **Podiel práce:** autor grafy prezrel a rozhodol o zaradení; AI aktualizovala dokumentáciu, grafy v tomto kroku nanovo neposudzovala a nemenila dáta ani kód.

## 25. 10. 2026 – Dva ďalšie grafy iba na prezretie

- **Výslovný pokyn autora:** pripraviť jednoročne oneskorené porovnanie nezamestnanosti vo V4 a súbežný mediánový pohľad na Slovensko „zo zaujímavosti“. AI pri mediáne zachovala hlavný výsledný ukazovateľ zamestnanosti a tento výklad vopred uviedla.
- **Rozsah a dôsledky:** nové povolenie vykresliť oneskorenú nezamestnanosť nahrádza predchádzajúcu hranicu pre jej vytvorenie; priorita zamestnanosti a ohraničenie ďalšieho modelovania zostávajú. Grafy samy nerozhodujú o zaradení do reportu ani o zmene hypotézy. Medián skúma citlivosť na menovateľ v SR, nie správnosť metriky pre celé V4.
- **Vykonala AI:** rozšírila skript 06 a vytvorila `R/07_median_sk_graf.R`; doplnok nemení hlavné analytické CSV. Nezávisle preverila párovanie 54 oneskorených nezamestnanostných a 14 mediánových párov z CSV. Beh R a vizuálna kontrola nových grafov zostávajú autorovi.

## 25. 10. 2026 – Potvrdenie priority zamestnanosti a ohraničenie nezamestnanostného doplnku

- **Prijaté autorom:** pokračovať s mierou zamestnanosti ako hlavným ukazovateľom, v súlade s jej skorším metodickým uprednostnením. Nezamestnanosť ponechať ako stručný doplnkový výsledok s už vytvoreným súbežným grafom v prílohe; v tejto etape ju ďalej nemodelovať ani nepridávať oneskorené porovnanie.
- **Dôvody a alternatíva:** zamestnanosť zachytáva pracovné uplatnenie celej skúmanej skupiny vrátane možného odchodu do neaktivity; menovateľ nezamestnanosti tvoria ekonomicky aktívni. Rozvíjanie oboch ukazovateľov rovnako podrobne by rozširovalo projekt. Priorita bola prijatá pred grafmi, nie podľa toho, ktorý výsledok viac zodpovedá hypotéze. Doplnkový výsledok sa nezamlčí a jeho nejednoznačný vizuálny obraz neznamená preukázanú absenciu vzťahu.
- **Podiel práce a hranice:** autor posúdil graf nezamestnanosti a výslovne potvrdil pôvodnú prioritu; AI navrhla ohraničenie a aktualizovala dokumentáciu. Regresia pre zamestnanosť a rozsah mediánového doplnku týmto ešte nie sú rozhodnuté. Existujúce dáta, grafy a kód ostávajú zachované.

## 25. 10. 2026 – Prvé exploračné výstupy a príprava analytickej tabuľky

- **Schválené autorom:** časové grafy úrovní ako kontext, samostatné bodové grafy medziročných zmien po krajinách a prehľad použiteľných/vylúčených porovnaní. Následne dohodnuté oneskorenie a doplnkové ukazovatele; regresia nie je týmto prijatá.
- **Vykonala AI:** napísala `R/04_analyticka_tabulka.R`. Skript číta existujúce CSV (20–64), spája ich podľa krajiny a roku, zachováva úrovne a značky, počíta číselné rozdiely pred výlukami a osobitne označuje použiteľnosť súbežných a jednoročne oneskorených porovnaní pre obe miery. Surový rozdiel cez zlom zostáva uložený na kontrolu, nie určený na hlavné porovnanie. Grafy sa musia riadiť príslušným príznakom použiteľnosti.
- **Dôsledok a kontrola:** očakávaných 64 riadkov analytickej tabuľky a 16 riadkov prehľadu (4 krajiny × 2 ukazovatele × 2 časovania). Na každý ukazovateľ vychádza 56 súbežných a 54 oneskorených porovnaní; pred výlukami 60/56 kandidátov. Rok 2010 slúži ako základ; PL b 2010 nevylučuje zmenu 2010→2011. Pri oneskorení CZ/SK b 2011 nezasahuje najskorší výsledný interval 2011→2012. Značka p pri PL 2025 ostáva zachovaná a nie je dôvodom výluky.
- **Presnosť a rozsah:** rozdiely zaokrúhľujeme na dve desatinné miesta v percentuálnych bodoch podľa najjemnejšej presnosti zdrojov; napr. PL 2025 je −0,05 p. b. Nevytvárame iba kategórie rast/pokles. Mzdové pomery k mediánu zatiaľ nevstupujú do tejto hlavnej analytickej tabuľky.
- **Stav overenia:** AI skontrolovala kód čítaním a nezávisle z CSV vypočítala počty a kontrolné rozdiely pomocou Pythonu (bez vytvárania nových analytických CSV). Beh nového R skriptu a kontrola autora ešte neprebehli. Skript má po úspechu kontrol uložiť `data/processed/analyticka_tabulka_20_64.csv` a `outputs/prehlad_porovnani.csv`; existujúce vstupy nemení. Počkať na výsledok kontroly pred grafmi.

## 25. 10. 2026 – Schválenie finálnej výskumnej otázky a východiskovej hypotézy

- **Výskumná otázka prijatá autorom:** Ako v jednotlivých krajinách V4 v období 2010–2025 súvisia medziročné zmeny relatívnej minimálnej mzdy s medziročnými zmenami miery zamestnanosti osôb s nízkym vzdelaním vo veku 20–64 rokov?
- **Východisková hypotéza prijatá autorom:** Medzi medziročnými zmenami relatívnej minimálnej mzdy a medziročnými zmenami miery zamestnanosti skúmanej skupiny očakávame negatívnu súvislosť.
- **Dôvod a interpretácia:** neutrálna formulácia otázky zodpovedá dostupným dátam a vnútrokrajinskému porovnaniu smeru aj veľkosti zmien. Vyššiu zmenu pomeru hypotéza spája s menším rastom alebo väčším poklesom zamestnanosti; nepredpovedá absolútny pokles v každom roku. Výsledky môžu byť odlišné podľa krajiny a nemusia hypotézu podporiť. Relatívne minimum je pomer hrubého minima k hrubému priemeru, nízke vzdelanie ISCED 0–2.
- **Rozsah:** ide o teoretické východisko exploračnej analýzy asociácií, nie schválenie kauzálnej identifikácie alebo konkrétneho regresného modelu. Nezamestnanosť, jednoročné oneskorenie a mediánový pomer SR zostávajú doplnkami. Doterajšie pravidlá zlomov a zahrnutia predbežného PL 2025 ostávajú.
- **Podiel práce a stav:** autor priniesol zámer, očakávanie a priebežne spresňoval metodiku; AI navrhla výslednú formuláciu a autor ju výslovne schválil. AI zosúladila brief a aktuálny stav. Staršie otvorené návrhy otázky/hypotézy sú týmto uzavreté; žiadne nové výpočty nevznikli.

## 25. 10. 2026 – Zazdrojovanie metodických pojmov a rozhodnutí

- **Pokyn autora:** doložiť hlavné metodické rozhodnutia vrátane pojmu relatívna minimálna mzda.
- **Vykonala AI:** overila primárne zdroje ILO, Eurostatu a Európskej komisie a doplnila prehľad v `PROJECT_BRIEF.md` s názvami, relevantnými časťami a hranicami podpory. Pomer minima k priemeru je variant zavedeného relatívneho ukazovateľa (Kaitzov index); nejde o nový pojem vytvorený projektom.
- **Rozlíšenie:** definície ukazovateľov, národné odchýlky a korekcie radov sú prevzaté z metodík; výber veku, hierarchie ukazovateľov, medziročných zmien, samostatných krajín, výluk a jednoročného oneskorenia sú naše odôvodnené voľby. Zdrojom nepripisujeme odporúčania ani záruky, ktoré neobsahujú. Nezavádza sa nový model ani zmena dát.

## 25. 10. 2026 – Zahrnutie predbežného mzdového pomeru Poľska 2025

- **Prijaté autorom:** pomer minimálnej mzdy k priemernej mzde za Poľsko 2025 (52,85 %, značka p v uloženom exporte) bežne zahrnúť do analýzy, zachovať označenie predbežnosti a dátum získania.
- **Význam a dôvod:** p znamená provisional, teda predbežný údaj; hodnota môže byť neskôr revidovaná. Samotná značka nie je časový zlom b ani označenie nízkej spoľahlivosti u či prognózy f. Predbežnosť sama osebe nie je dôvodom na automatické vynechanie. [Eurostat – význam značiek](https://ec.europa.eu/eurostat/data/database)
- **Obmedzenie:** značka neuvádza dôvod predbežnosti, neistotu ani očakávanú veľkosť či smer revízie. Konkrétna príčina pri PL 2025 nebola doložená. Pri interpretácii priznať možnosť neskoršej zmeny výsledku; zachovať pôvodný export pre reprodukovateľnosť. Samostatné vyhodnotenie bez roku 2025 nebolo týmto rozhodnutím uložené ako povinné.
- **Dôsledok pre párovanie:** údaj vstúpi do súbežného porovnania zmien 2024→2025. Jeho použitie v jednoročne oneskorenom porovnaní by vyžadovalo výslednú zmenu do 2026, ktorá je mimo zvoleného obdobia. Kód aj dáta ho už zachovávajú; AI aktualizovala iba dokumentáciu na základe autorovej voľby.

## 25. 10. 2026 – Individuálny prístup ku krajinám V4 v metodike

- **Spresnené autorom:** výslovne zapracovať individuálny prístup ku krajinám do metodickej časti; nadväzuje na rozhodnutie z 24. 10. o vývoji vnútri každej krajiny.
- **Dôsledok:** hlavný vzťah medzi zmenami mzdového pomeru a zamestnanosti posudzovať osobitne v CZ, SK, PL a HU, pri zhodných filtroch a pravidlách. Následne porovnať podobnosti a rozdiely výsledkov. V4 je porovnávací rámec; spoločný smer a veľkosť vzťahu sa nepredpokladajú a nerozlíšené spojenie všetkých bodov do jedného vzťahu nie je hlavným postupom.
- **Dôvod a obmedzenie:** národné podmienky, definície a vývoj sa líšia. Oddelené vyhodnotenie neodstraňuje confoundery a pri krátkych radoch obmedzuje istotu zistení. Spoločný model nie je prijatý; jeho prípadné použitie potrebuje ďalšiu dohodu.
- **Vykonala AI:** aktualizovala existujúcu sekciu analytického smerovania v `PROJECT_BRIEF.md` bez vytvárania paralelnej metodiky. Dáta ani kód nemenila.

## 25. 10. 2026 – Partnerská analytická spolupráca a transparentný podiel práce

- **Prijaté autorom:** AI je prednostne analytický spolupracovník a kritický partner. Autor aj AI prispievajú návrhmi a posudzujú argumenty podľa dôvodov a overenia; autor určuje smer a prijíma konečné rozhodnutia. Tutorský režim sa používa podľa potreby alebo dohody.
- **Dôvod a zmena:** autor odmietol opis svojej roly iba ako osoby, ktorá má porozumieť postupu AI. Rozvoj znalostí zostáva prínosom, ale nenahrádza aktívnu tvorbu otázky, metodiky a interpretácie v partnerskej diskusii. Toto spresnenie nahrádza starší všeobecný dôraz na vedenie a tutorskú rolu; nemení dohody o zvládnuteľných blokoch, kontrolách a nepripisovaní práce AI autorovi.
- **Vykonala AI:** zosúladila `AGENTS.md` a vložila schválený opis spolupráce aj vecný prehľad doterajších príspevkov do `PROJECT_BRIEF.md`. V pravidlách zároveň odstránila neaktuálne všeobecné tvrdenie, že všetky metodické voľby sú otvorené; stav sa čerpá z aktuálnych rozhodnutí. Kód a dáta zostali bez zmeny.

## 25. 10. 2026 – Relatívna úroveň minimálnej mzdy a zdôvodnenie voči nominálnej sadzbe

- **Schválené autorom:** pomer minima k priemeru označujeme ako relatívnu úroveň minimálnej mzdy. Rast pomeru vyjadruje vyššiu zákonnú mzdovú hranicu voči priemernej mzde a môže signalizovať väčší tlak na odmeňovanie nízko platených pracovníkov; nejde o priamu mieru nákladu každej firmy.
- **Dôvod a alternatíva:** nominálna sadzba priamejšie opisuje zákonné nastavenie, no nezohľadňuje súbežný vývoj bežných zárobkov. Pomer rozlíši rast minima zhodný s percentuálnym rastom priemeru od rastu rýchlejšieho než priemer. Projekt preto skúma súvislosť relatívnej úrovne so zamestnanosťou, nie izolovaný legislatívny účinok.
- **Spresnenie:** priemerná mzda nie je priamou mierou produktivity a pomer nie je jej kontrolou ani mierou jednotkových nákladov práce. Súbežný rast produktivity môže kompenzovať vyššie náklady práce na jednotku produkcie, nie automaticky zrušiť nárast nominálneho nákladu na pracovníka. Rast pomeru môže vzniknúť aj poklesom menovateľa; samotný pomer neidentifikuje zvýšenie zákonnej sadzby.
- **Podiel práce a stav:** autor navrhol význam relatívnej sily minima a schválil presnejšie pomenovanie; AI doplnila zdôvodnenie a zdroje do `PROJECT_BRIEF.md`. Uzatvára sa diskusia o nominálnej alternatíve uvedená ako otvorená v staršom zázname. Dáta a kód bez zmeny, finálne znenie výskumnej otázky/hypotézy ešte nebolo výslovne prijaté.

## 25. 10. 2026 – Teoretické zdôvodnenie a smer aj veľkosť zmien

- **Spresnenie autora:** skúmať číselné medziročné zmeny vrátane smeru aj veľkosti; neprechádzať iba na dichotómiu rast/pokles. Autor opravil preklep v očakávanom smere: pri raste pomeru očakáva nepriaznivejšiu zmenu zamestnanosti, nie pokles nezamestnanosti.
- **Schválené autorom:** teoretické zdôvodnenie založené na možnom obmedzení dopytu po práci pri zvýšení záväznej mzdovej hranice, s uvedením predpokladov konkurenčného modelu a alternatívnych mechanizmov. AI zapísala text a zdroj do `PROJECT_BRIEF.md`; nejde o tvrdenie všeobecnej platnosti negatívneho účinku ani o dôkaz kauzality v našich dátach.
- **Otvorená diskusia:** autor navrhol zdôvodniť nevýber nominálnej mzdy aj možným súbežným rastom produktivity. Pri vysvetlení rozlišovať vyšší nominálny mzdový náklad od nákladu na jednotku produkcie; pomer k priemeru produktivitu priamo nemeria ani nekontroluje. Nové finálne znenie tohto zdôvodnenia ešte nebolo schválené.
- **Stav práce:** AI upravila iba dokumentáciu; finálne znenie otázky/hypotézy, konkrétne štatistické vyhodnotenie a výpočty zostávajú otvorené.

## 25. 10. 2026 – Potvrdenie obdobia 2010–2025

- **Prijaté autorom:** sledované obdobie je 2010–2025, nadväzuje na overenú dostupnosť všetkých troch hlavných ročných radov za V4 (zamestnanosť, nezamestnanosť, pomer minima k priemeru).
- **Dôsledok:** rok 2010 tvorí základ pre prvú medziročnú zmenu 2011. Súbežné zmeny pokrývajú 2011–2025 pred výlukami; pri doplnkovom oneskorení párujeme zmeny pomeru 2011–2024 so zmenami trhu práce 2012–2025. Obdobie nemení pravidlá vylúčenia porovnaní cez zostávajúce zlomy a zachovania predbežnej značky p pri PL 2025.
- **Otvorené:** autor navrhol otázku o raste zamestnanosti pri poklese mzdového pomeru a požiadal AI o formuláciu vzhľadom na dáta. Finálne znenie otázky a samostatnej hypotézy ešte nebolo prijaté; obdobie je už potvrdené.
- **Podiel práce:** autor určil obdobie; AI ho zdokumentovala. Bez nových výpočtov či úprav dát.

## 25. 10. 2026 – Prechod na opravené rady a vek 20–64 rokov

- **Prijaté autorom:** pre zamestnanosť aj nezamestnanosť prejsť na oficiálne opravené ročné rady `lfsi_educ_a` (miera PC_POP) a `une_educ_a` (miera PC_ACT), vek Y20-64, ISCED ED0-2, obe pohlavia, V4. Nahrádza sa pôvodný vek 25–64 a výber `lfsa_ergaed` / `lfsa_urgaed`. Zamestnanosť zostáva hlavná, nezamestnanosť doplnková; metrika minimálnej mzdy sa nemení.
- **Prínosy:** oficiálne spätné korekcie zlepšujú časovú kontinuitu pri prechode na metodiku od 2021. V novom výbere nie sú b pri 2014 a 2021, preto zachováme viac medziročných porovnaní aj párov pre jednoročné oneskorenie. Ide o menej výluk v rovnakom kandidátnom období, nie o pridanie nových rokov. Pre obe miery máme zhodné vekové vymedzenie a úplných 64 hodnôt za V4 v rokoch 2010–2025. Využijeme zdokumentované korekcie štatistického úradu namiesto vlastného odhadovania metodických skokov. Viac pozorovaní však samo nezaručuje presnejší ani kauzálny výsledok.
- **Čo strácame:** pridávame osoby vo veku **20–24 rokov**, nie 20–25; 25-roční už boli v pôvodnom výbere. U časti pridaných osôb aktuálne najvyššie dosiahnuté vzdelanie ešte nepredstavuje konečnú úroveň. Osoba môže byť správne zaradená do ISCED 0–2, pokračovať v štúdiu a po dokončení vyššieho stupňa zo skupiny odísť. Nejde o chybu klasifikácie, ale o menej ustálené zloženie populácie. Miera zamestnanosti môže viac odrážať účasť na vzdelávaní a prechod zo školy do práce; meniaci sa podiel študujúcich, vekové zloženie či dokončovanie vzdelania môžu meniť trend bez zodpovedajúcej zmeny dopytu po práci. Študent nie je automaticky neaktívny; rozhoduje jeho pracovný status. Pri nezamestnanosti neaktívni študenti nie sú v menovateli, no vstupy mladých na trh práce a odchody z neho môžu meniť zloženie aktívnej skupiny. Závery sa vzťahujú na aktuálne nízkovzdelané osoby 20–64, nie výlučne na ľudí s ukončenou vzdelávacou dráhou.
- **Ďalšie obmedzenia a dôsledky:** korekcie môžu zahŕňať modelové odhady a podliehajú revíziám. Neodstraňujú všetky historické zlomy; zostávajú CZ/SK 2011, HU 2018, PL 2010/2019. Výluky odvodíme z nových radov, nie automatickým prenosom starých značiek. Súčasne meníme vek aj typ radu, takže rozdiely oproti starým hodnotám nemožno pripísať iba korekcii. Vizuálne rozlíšenie troch období samo neznamená, že nové rady sú na ich hraniciach nesúvislé; presné použitie členenia posúdime pri grafoch.
- **Alternatíva a dôvod voľby:** ponechať vek 25–64 v pôvodných radoch by lepšie obmedzilo vplyv prebiehajúceho vzdelávania, vyžadovalo by však viac výluk. Autor uprednostnil kontinuitu opravených radov a väčší počet použiteľných porovnaní s priznaním zmeny skúmanej populácie.
- **Podklady:** overenie AI z 25. 10. 2026 v `CURRENT_STATE.md`; [metodika hlavných ukazovateľov](https://ec.europa.eu/eurostat/cache/metadata/en/lfsi_esms.htm) a [postup korekcie zlomov](https://ec.europa.eu/eurostat/statistics-explained/index.php?title=EU_labour_force_survey_-_correction_for_breaks_in_time_series). Konečné obdobie a výskumná otázka ešte nie sú potvrdené.
- **Podiel práce a stav:** autor výslovne vybral prechod a požiadal o zaznamenanie prínosov a nákladov; AI spresnila dôvody a aktualizovala dokumentáciu. Nové exporty nie sú uložené ani importované. Existujúce súbory a skripty stále spracúvajú pôvodné 25–64; prechod v dátach zatiaľ nebol vykonaný.

## 25. 10. 2026 – Overenie oficiálne opravených radov a otvorená voľba veku

- **Vykonala AI:** preverila metodiku a verejné API opravených ročných tabuliek `lfsi_educ_a` (miera zamestnanosti PC_POP) a `une_educ_a` (miera nezamestnanosti PC_ACT), Total, ISCED 0–2, V4, 2010–2025. Výsledok a zdroje sú v najnovšom overení v `CURRENT_STATE.md`; odpovede sa neuložili ako nové dátové súbory.
- **Zistenie:** tabuľky neponúkajú Y25-64. Spoločný vek Y20-64 má všetkých 64 hodnôt v každej tabuľke; b pri 2014 a 2021 nie je, zostávajú CZ/SK 2011, HU 2018 a PL 2010/2019. Nejde o univerzálne odstránenie všetkých metodických problémov.
- **Otvorená alternatíva:** zachovať prijatých 25–64 v pôvodných radoch s výlukami, alebo prijať 20–64 a nové opravené rady. Druhá možnosť zahrnie mladých s ešte prebiehajúcim vzdelávaním a mení skúmanú populáciu, ale zlepší kontinuitu oficiálnych radov a zachová viac medziročných porovnaní. Dostupnosť sama osebe nie je dôkazom teoretickej nadradenosti metriky.
- **Návrh AI, nie rozhodnutie autora:** zvážiť 20–64 s opravenými radmi, ak rozšírená populácia zodpovedá zámeru. Doterajšie rozhodnutie 25–64 ostáva platné, kým autor výslovne nezvolí inak. Žiadna výmena dát, prepis skriptov ani nový analytický výpočet neboli vykonané.

## 24. 10. 2026 – Zamestnanosť ako hlavný ukazovateľ, nezamestnanosť ako doplnok

- **Prijaté autorom:** hlavný ukazovateľ trhu práce je miera zamestnanosti osôb s nízkym vzdelaním vo veku 25–64 rokov; miera nezamestnanosti rovnakej skupiny je doplnková. V dohodnutom porovnaní využijeme ich medziročné zmeny.
- **Zdôvodnenie:** zamestnanosť vyjadruje pracovné uplatnenie celej skupiny vrátane zachytenia úbytku zamestnanosti pri prechode do neaktivity. Nezamestnanosť opisuje ekonomicky aktívnu časť; môže klesnúť nájdením práce aj odchodom z aktivity. Alternatívou bola nezamestnanosť ako hlavný ukazovateľ, bližšia otázke situácie ľudí hľadajúcich prácu, ale nezachytávajúca odchod do neaktivity.
- **Obmedzenia výberu:** zamestnanosť ovplyvňuje aj zdravie, starostlivosť a ďalšie okolnosti účasti na trhu práce; nie je čistou mierou dopytu po práci. Skupinu definujeme podľa vzdelania, nie podľa mzdy, ktorú sú jej členovia ochotní prijať. Oddelene platí, že pozorované asociácie nepreukazujú kauzálny účinok minimálnej mzdy.
- **Podiel práce a stav:** AI predstavila alternatívy a odporúčanie; autor voľbu výslovne prijal a odsúhlasil spresnenie obmedzení. AI aktualizovala dokumentáciu, kód a dáta nemenila. Táto voľba uzatvára hierarchiu ukazovateľov uvedenú ako otvorenú v starších záznamoch.

## 24. 10. 2026 – Súbežné a doplnkové oneskorené porovnanie

- **Prijaté autorom:** základom bude porovnanie medziročnej zmeny mzdového pomeru medzi t−1 a t so zmenou ukazovateľa trhu práce medzi t−1 a t. Doplnkovo porovnať tú istú zmenu mzdového pomeru so zmenou ukazovateľa trhu práce medzi t a t+1 (jednoročné oneskorenie výsledku).
- **Príklad:** zmenu pomeru 2018→2019 porovnať primárne so zmenou zamestnanosti/nezamestnanosti 2018→2019, doplnkovo so zmenou 2019→2020. Oba typy porovnania vyhodnotiť oddelene; nevyberať hlavný výsledok podľa silnejšej asociácie alebo zhody s očakávaním.
- **Dôvod a alternatíva:** rovnaký rok je základné časové zosúladenie ročných ukazovateľov; doplnok umožní preskúmať asociáciu s neskoršou zmenou trhu práce. Samotná ročná frekvencia nedokazuje rovnaký časový základ národných mzdových zložiek ani presnú dĺžku reakcie zamestnávateľov. Viacročné oneskorenia teraz nezavádzame.
- **Zlomy a dostupnosť:** každá zo spárovaných zmien musí byť použiteľná. Pri doplnku overiť zlom výsledného ukazovateľa v roku t+1; zachovať aj posúdenie mzdovej zmeny v roku t. Posun párovať podľa krajiny a kalendárneho roku, nie podľa zostávajúcich riadkov po výlukách. Pri datech 2010–2025 sú pred výlukami možné súbežné zmeny 2011–2025 a oneskorené páry so zmenou pomeru 2011–2024 a výslednou zmenou 2012–2025. Presné počty platných párov ešte vypočítať a uviesť zvlášť pre oba postupy.
- **Obmedzenia:** doplnok má menej pozorovaní a môže odrážať iné súbežné ekonomické vplyvy. Časové predchádzanie ani silnejšia oneskorená asociácia nedokazujú kauzálny účinok či skutočnú dĺžku reakcie. Výsledky s odlišným zložením rokov nemožno pripísať iba oneskoreniu.
- **Podiel práce a stav:** autor schválil rovnaký rok a následne výslovne aj doplnkové porovnanie; AI upresnila párovanie a zaznamenala voľbu. Kód ani nové analytické výstupy nevznikli. Hlavná úloha zamestnanosti oproti nezamestnanosti a prípadné štatistické modely zostávajú otvorené. Tento záznam uzatvára časovú voľbu uvedenú ako otvorenú v predchádzajúcom zázname.

## 24. 10. 2026 – Medziročné zmeny, časové zlomy a vizuálne rozlíšenie období

- **Prijaté autorom:** hlavné porovnanie založiť na medziročných zmenách pomeru minimálnej mzdy k priemeru a ukazovateľov trhu práce, posudzovaných po krajinách. Zachovať jeden súvislý dataset; netvoriť tri povinné samostatné analýzy. Zmeny percentuálnych ukazovateľov vyjadrovať v percentuálnych bodoch.
- **Zaobchádzanie so zlomami:** z hlavného porovnania vylúčiť zmenu ukazovateľa medzi t−1 a t, ak má tento ukazovateľ v roku t evidovaný časový zlom. Zohľadniť všetky krajinské zlomy, nielen roky 2014 a 2021. Pôvodné ročné hodnoty a značky zachovať; rok so zlomom možno použiť ako základ zmeny do nasledujúceho roku bez ďalšieho zlomu. Zmeny najprv počítať zo susedných kalendárnych rokov, až potom označiť nepoužiteľné porovnania, aby nevznikli dvojročné rozdiely vydávané za medziročné. Značka p pri mzdovom pomere označuje predbežnosť, nie metodický zlom.
- **Doplnok ku grafom:** vizuálne rozlíšiť obdobia 2010–2013, 2014–2020 a 2021–2025 a posúdiť, či podobu celkového vzťahu neurčuje iba jedno obdobie alebo či sa smer súvislosti medzi obdobiami líši. Toto členenie neopravuje dáta a nepotvrdzuje vnútornú homogénnosť období; ďalšie zlomy zostávajú relevantné.
- **Zdôvodnenie a alternatívy:** vylúčenie prechodov cez zlomy obmedzuje zámeny metodického skoku za ekonomickú zmenu a zachováva viac pozorovaní než použitie iba obdobia 2021–2025. Samostatné regresie v troch krátkych úsekoch by boli založené na malom počte bodov; nie sú prijaté. Vlastnú štatistickú korekciu zlomov teraz nezavádzať, keďže nemáme podklad na oddelenie metodického a ekonomického vplyvu.
- **Obmedzenia:** odstránenie prechodov cez známe zlomy nerieši možné zmeny citlivosti merania po zmene metodiky ani neoznačené problémy porovnateľnosti. Rozdiely medzi obdobiami môžu odrážať metodiku, ekonomické podmienky aj náhodné kolísanie. Závery opisujú použiteľné medziročné porovnania, nie bezvýhradne celé obdobie; nejde o dôkaz kauzálneho účinku zvýšenia zákonnej minimálnej mzdy. Rast pomeru môže vzniknúť aj poklesom priemernej mzdy.
- **Otvorené:** dostupnosť oficiálnych radov opravených o zlomy pre presný výber; hlavná úloha zamestnanosti oproti nezamestnanosti; súbežné či oneskorené porovnanie a prípadná regresia. Pri prípadnom oneskorení kontrolovať zlom v období výslednej zmeny, nie iba v roku zmeny mzdového pomeru. Konečná výskumná otázka a obdobie zostávajú otvorené.
- **Podiel práce a stav:** autor navrhol ponechať jeden rad a vynechať zmeny cez zlomy, diskutoval prínos troch období a schválil zápis do denníka. AI vysvetlila alternatívy a obmedzenia a zapísala rozhodnutie. Výpočty medziročných zmien, výluky ani grafy zatiaľ neboli implementované či overené.

## 24. 10. 2026 – Prednostne vývoj pomeru v každej krajine osobitne

- **Prijaté autorom:** sledovať vývoj pomeru minimálnej mzdy k priemernej mzde v jednotlivých krajinách.
- **Dôvod a alternatíva:** hlavný záujem je trend vnútri krajiny, nie poradie krajín podľa úrovne pomeru. Stabilné rozdiely národných definícií sú preto odlišným problémom než zmeny merania v čase.
- **Dôsledok:** sústrediť metodické overenie na časovú konzistentnosť a zlomy, odchýlky medzi krajinami opísať ako obmedzenie. Nezamieňať trend pomeru s rastom zákonnej sadzby; meniace sa zložky zárobkov môžu ovplyvniť aj vnútrokrajinský vývoj.
- **Otvorené:** presný spôsob porovnania s trhom práce, obdobie a prípadná regresia. Rozhodnutie nie je odklonom od pôvodnej témy ani schválením kauzálnych záverov.
- **Podiel práce:** autor spresnil prioritu a prijal smerovanie; AI ho zdokumentovala. Nové dáta ani kód nevznikli.

## 24. 10. 2026 – Výslovné zdôvodnenie nevýberu PPS a reálnej mzdy

- **Pokyn autora:** v metodike vysvetliť, prečo ako hlavnú operacionalizáciu nepoužívame PPS ani reálnu minimálnu mzdu.
- **Vykonala AI:** doplnila jednu metodickú sekciu v `PROJECT_BRIEF.md` s primárnymi zdrojmi a porovnaním alternatív. PPS je vhodné pre cenovo porovnateľnú úroveň medzi krajinami; spotrebiteľská reálna mzda pre vývoj kúpnej sily. Uprednostnený pomer k priemeru zachytáva relatívnu mzdovú hranicu, nie priamu motiváciu firmy.
- **Obmedzenia:** reálna mzda je legitímna aj pre výskum zamestnanosti; výber pomeru nie je dôkazom jeho nadradenosti ani kauzality. Zachované otvorené overenie národných definícií a odvetvového pokrytia. Bez nového modelu, dát či kódu.

## 24. 10. 2026 – Odvetvové pokrytie B–S

- **Prijaté autorom:** NACE Rev. 2 B–S pre hlavný pomer minimálnej mzdy k priemeru aj doplnkový mediánový pomer Slovenska.
- **Alternatíva:** užšie pokrytie B–N (Business economy).
- **Zdôvodnenie:** širší odvetvový záber je bližší zámeru sledovať celú vzdelanostnú skupinu; podľa kontroly autora počet dostupných údajov neklesol.
- **Obmedzenia:** B–S nie je totožné s populáciou LFS a nezahŕňa sekciu A. Rovnaký počet hodnôt nezaručuje zhodné definície medzi krajinami. Národné metodické poznámky a časový základ pomerov ešte nie sú overené.
- **Podiel práce:** AI vysvetlila a odporučila alternatívu; autor skontroloval dostupnosť a prijal rozhodnutie. AI aktualizovala dokumentáciu, nové údaje sa nestiahli.

## 24. 10. 2026 – Pomer minima k priemeru a návrh doplnku s mediánom

- **Voľba autora:** pokračovať s pomerom hrubej minimálnej mzdy k priemernej hrubej mzde. Presné odvetvové pokrytie a národné odchýlky ešte overiť pred finalizáciou operacionalizácie.
- **Dôvod:** relatívne nastavenie minima voči mzdovej úrovni a podľa autorovej kontroly úplnejšie dáta oproti mediánu; nejde o priamu mieru nákladov zamestnávateľa.
- **Návrh autora:** dostupný mediánový pomer Slovenska využiť ako doplnkové porovnanie.
- **Overila AI:** v aktuálnom výbere Business economy má Slovensko hodnoty 2010–2025. Navrhnuté použitie: citlivosť deskriptívnych záverov pre SR na voľbu referenčnej mzdy, nie validácia priemeru pre všetky V4. Implementácia ani nový model zatiaľ neboli dohodnuté.

## 24. 10. 2026 – Dokončenie oboch tabuliek pred minimálnou mzdou

- **Prijaté autorom:** najprv dokončiť zamestnanosť a nezamestnanosť v rovnakom štvorstĺpcovom formáte a uložiť do data/processed, potom riešiť minimálnu mzdu. Postupovať vo väčších blokoch s primeranými kontrolami.
- **Dôvod:** uzavrieť rozpracovanú prípravu dát a nepreskakovať medzi nedokončenými etapami.
- **Vykonala AI:** doplnila transformáciu zamestnanosti, kontroly oboch tabuliek a zápis dvoch CSV až po úspešných kontrolách. Bez nového balíčka či modelu. CSV je jednoduchý čitateľný formát, logické príznaky sa zapíšu ako TRUE/FALSE; pôvodné značky a filtre ostávajú v raw XLSX.
- **Stav overenia:** kód skontrolovaný čítaním; nový beh a vytvorenie CSV čakajú na autora v RStudiu. Jeho predchádzajúce úspešné spustenie sa týkalo iba prípravy nezamestnanosti. Metodická porovnateľnosť zostáva otvorená.

## 24. 10. 2026 – Rozdelenie skriptov podľa účelu

- **Prijaté autorom:** rozdeliť existujúci postup na import, prípravu a kontroly, so stručnými komentármi. Autor upozornil, že podrobný kontrolný blok v uloženom skripte vymazal.
- **Alternatíva a dôvod:** jeden dlhý skript by miešal načítanie, transformácie a kontroly. Rozdelenie má uľahčiť čítanie aj prezentáciu projektu zamestnávateľovi.
- **Vykonala AI:** zachovala štyri existujúce importy v `R/01_import_eurostat.R`, presunula existujúcu prípravu nezamestnanosti do `R/02_priprava_dat.R`, doplnila dohodnuté kontroly v `R/03_kontroly_dat.R`. Kontrola poradia krajín ostáva pred pozičným skladaním; príprava na konci spúšťa skript kontrol. Výpisy dimenzií, krajín a View boli pomôcky pre už vykonané kontroly a boli z hlavného postupu odstránené.
- **Rozsah:** bez nových analytických etáp, transformácie zamestnanosti, balíčkov alebo zmeny raw súborov. Pôvodné značky zostávajú v importovaných objektoch a XLSX; výsledná nezamestnanosť zachováva dohodnuté štyri stĺpce.
- **Overenie:** AI skontrolovala rozdelenie čítaním. Pokus o spustenie v čistej R relácii neprebehol, pretože nájdená registrovaná cesta k Rscript.exe neexistuje. Beh musí ešte potvrdiť autor v RStudiu; nemožno tvrdiť, že kontroly prešli.

## 24. 10. 2026 – Zachovanie značiek pri hodnotách

- **Pokyn autora:** vytvoriť dataset so zachovanými označeniami časových zlomov a zohľadniť ich pri interpretácii. Pred prípravou overiť aj význam ostatných značiek.
- **Dôvod a alternatíva:** zachovať informáciu o porovnateľnosti namiesto importu samotných čísel či automatického vyhadzovania označených rokov.
- **Vykonala AI:** preverila značky zamestnanosti v otvorenej tabuľke a vysvetlenia Eurostatu; výsledky a hranice overenia zapísala do `CURRENT_STATE.md`.
- **Návrh technického riešenia:** jeden riadok krajina × rok × ukazovateľ, samostatná číselná hodnota a pôvodná značka, presné filtre a zdroj; príčinu zlomu viesť ako doloženú poznámku, nie odhadovať zo samotného písmena. Značky oboch ukazovateľov kontrolovať samostatne.
- **Obmedzenie:** uchovanie značky samo neopravuje časový rad ani nepostačuje na kauzálnu interpretáciu. Dataset a analytický kód v tomto bloku ešte nevznikli; konečný spôsob práce so zlomami zostáva otvorený.

## 23. 10. 2026 – Veková skupina 25–64 rokov

- **Stav:** prijaté autorom po vysvetlení alternatív od AI.
- **Rozhodnutie:** pri zamestnanosti aj nezamestnanosti ľudí s nízkym vzdelaním používať vek 25–64 rokov.
- **Alternatíva:** 15–64 rokov, ktorá zahŕňa mladých vstupujúcich na trh práce, ale aj ľudí s ešte neukončenou vzdelávacou dráhou.
- **Dôvod:** lepšie vymedzenie dospelých s ustálenejším dosiahnutým vzdelaním; rovnaký vek pri oboch ukazovateľoch. Pri miere zamestnanosti sa obmedzí vplyv nepracujúcich mladých študentov.
- **Obmedzenie:** výsledky nebudú pokrývať osoby do 25 rokov; voľba veku neidentifikuje ochotu pracovať pod minimálnou mzdou ani kauzálny účinok.
- **Podiel práce:** AI odporučila vek a vysvetlila dôsledky; autor rozhodol. Úplnosť údajov pre zvolený vek ešte nebola overená.

## 23. 10. 2026 – Výber skupiny podľa dátovej uskutočniteľnosti

- **Prijaté autorom:** pred výberom skupiny preveriť dostupnosť údajov pre nízke vzdelanie, nízko platených zamestnancov a nezamestnaných prechádzajúcich do práce.
- **Alternatíva:** najprv definitívne vybrať skupinu bez overenia dát. Dostupnosť je legitímne kritérium; výber podľa zhody výsledku s hypotézou by bol nevhodný.
- **Vykonala AI:** orientačne overila verejné tabuľky a primárnu metodiku; zistenia, zdroje, limity a navrhnutá kontrola autora sú v `CURRENT_STATE.md`.
- **Zostáva návrhom:** odporúčanie začať ukazovateľmi podľa vzdelania. Autor zatiaľ nevybral skupinu, metódu ani obdobie a nevykonal navrhnutú kontrolu. Úplnosť konkrétnych radov ešte nie je overená.

## 23. 10. 2026 – Vedená analýza s podporou AI

- **Stav:** prijaté pravidlá spolupráce na výslovný pokyn autora; nahrádzajú staršie obmedzenie poskytovania kódu až po vlastnom pokuse.
- **Rozhodnutie autora:** autor určuje zámer a prijíma rozhodnutia; AI môže písať kód v dohodnutých blokoch. Samostatné napísanie celého kódu nie je podmienkou autorstva. Podrobné pravidlá sú na jednom mieste v `AGENTS.md`.
- **Alternatíva a dôvod zmeny:** pôvodný dôraz na vlastné písanie kódu nahrádza dôraz na porozumenie rozhodujúcim operáciám, primerané kontroly a transparentné autorstvo.
- **Dôsledok:** otázka, obdobie a metrika zostávajú otvorené; regresia nie je povinná. Najbližším blokom je vyjasnenie zámeru a publika, bez kódu, sťahovania dát či hotového plánu.
- **Vykonala AI:** prečítala existujúcu dokumentáciu, zistila prítomnosť učebných súborov a zosúladila projektové dokumenty. Učebné súbory nemenila ani nespúšťala. Autor zatiaľ nevykonal kontrolu tejto aktualizácie.

## 21. 10. 2026 – Založenie projektu

- **Stav:** prijaté organizačné rozhodnutie podľa zadania autora.
- **Rozhodnutie:** vytvoriť lokálnu štruktúru projektu a štyri základné dokumenty v slovenčine. Kontext uchovávať v súboroch spoločných pre tematické vlákna.
- **Alternatíva:** ponechať kontext iba v konverzáciách; nebola zvolená pre potrebu kontinuity medzi vláknami.
- **Zdôvodnenie:** prehľadná organizácia a dohľadateľnosť stavu a rozhodnutí.
- **Podiel práce:** autor určil štruktúru a pravidlá; AI skontrolovala priečinok a vytvorila súbory a priečinky.

## 21. 10. 2026 – Vzdelávanie ako priorita

- **Stav:** prijaté pravidlo spolupráce podľa zadania autora.
- **Rozhodnutie:** autor najprv navrhuje riešenie a skúša malé úlohy; AI pôsobí ako mentor, metodický reviewer a tutor. Hotový kód poskytne po pokuse autora alebo na jeho výslovnú žiadosť.
- **Alternatíva:** automatické vytvorenie celého projektu a hotových skriptov; autor ju odmietol.
- **Zdôvodnenie:** rozvoj samostatnosti a príprava na juniorskú analytickú pozíciu.
- **Podiel práce:** pravidlo stanovil autor; AI ho zapísala.

## 21. 10. 2026 – Pracovné analytické smerovanie

- **Stav:** predbežný návrh autora, bez definitívneho metodického rozhodnutia.
- **Návrh:** panel krajina × rok za V4, zamýšľané obdobie 2010–2025, zamestnanosť ISCED 0–2 a relatívna minimálna mzda; zvážiť deskriptívnu analýzu a jednoduché regresné prístupy vrátane oneskorených asociácií.
- **Otvorené alternatívy:** presný ukazovateľ relatívnej minimálnej mzdy, vymedzenie populácie, dostupné obdobie, kontrolné premenné a špecifikácia regresie.
- **Zdôvodnenie odkladu:** najprv overiť dáta a umožniť autorovi vypracovať vlastný metodický návrh. Nevyslovovať neodôvodnené kauzálne závery.
- **Podiel práce:** pracovné smerovanie navrhol autor; AI ho iba zdokumentovala.
