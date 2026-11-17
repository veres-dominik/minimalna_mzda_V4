# Spúšťa sa na konci R/02_priprava_dat.R pre všetky pripravené objekty.
# Trh práce: opravené rady V4, 2010–2025, vek 20–64, ISCED 0–2, obe pohlavia.
# Mzdové pomery: B–S, priemer V4 a medián SR, 2010–2025.
# Kontroly nepotvrdzujú metodickú porovnateľnosť rokov.

# Rovnaké kontroly vykonáme pre každú z dvoch tabuliek.
for (tabulka in list(zamestnanost, nezamestnanost)) {
  # Rozsah, typy, úplnosť a jedinečnosť krajina–rok.
  stopifnot(
    nrow(tabulka) == 64,
    identical(names(tabulka), c("krajina", "rok", "miera_pct", "znacka")),
    is.numeric(tabulka$rok),
    is.numeric(tabulka$miera_pct),
    is.logical(tabulka$znacka),
    !anyNA(tabulka),
    anyDuplicated(tabulka[c("krajina", "rok")]) == 0
  )

  # Každá zo štyroch krajín musí mať presne roky 2010–2025.
  stopifnot(
    setequal(tabulka$krajina, c("Czechia", "Hungary", "Poland", "Slovakia")),
    all(vapply(split(tabulka$rok, tabulka$krajina),
               function(x) setequal(x, 2010:2025), logical(1)))
  )

  # Percentá a počet zlomov porovnáme s očakávaniami z raw exportov.
  stopifnot(
    all(tabulka$miera_pct >= 0 & tabulka$miera_pct <= 100),
    sum(tabulka$znacka) == 5
  )

  # Overíme aj umiestnenie zlomov, nielen ich celkový počet.
  stopifnot(setequal(
    paste(tabulka$krajina[tabulka$znacka], tabulka$rok[tabulka$znacka]),
    c("Czechia 2011", "Hungary 2018", "Poland 2010", "Poland 2019", "Slovakia 2011")
  ))
}

# Iná pôvodná značka sa nesmie pri prevode na TRUE/FALSE potichu stratiť.
stopifnot(
  all(is.na(znacky) | znacky == "b"),
  all(is.na(znacky_zamestnanost) | znacky_zamestnanost == "b")
)

# Referenčné hodnoty z nových XLSX, vek 20–64.
stopifnot(
  isTRUE(all.equal(zamestnanost$miera_pct[
    zamestnanost$krajina == "Slovakia" & zamestnanost$rok == 2024], 33.8)),
  isTRUE(all.equal(nezamestnanost$miera_pct[
    nezamestnanost$krajina == "Slovakia" & nezamestnanost$rok == 2024], 39.4))
)

message("Kontroly zamestnanosti aj nezamestnanosti (20–64) prešli.")

# V mzdových tabuľkách je NA povolené iba pri značke, znamená bez označenia.
for (tabulka in list(minimalna_mzda_priemer, minimalna_mzda_median_sk)) {
  stopifnot(
    identical(names(tabulka), c("krajina", "rok", "pomer_pct", "znacka")),
    is.numeric(tabulka$rok),
    is.numeric(tabulka$pomer_pct),
    is.character(tabulka$znacka),
    !anyNA(tabulka[c("krajina", "rok", "pomer_pct")]),
    all(tabulka$pomer_pct > 0),
    anyDuplicated(tabulka[c("krajina", "rok")]) == 0,
    all(vapply(split(tabulka$rok, tabulka$krajina),
               function(x) setequal(x, 2010:2025), logical(1)))
  )
}

stopifnot(
  nrow(minimalna_mzda_priemer) == 64,
  setequal(minimalna_mzda_priemer$krajina,
           c("Czechia", "Hungary", "Poland", "Slovakia")),
  nrow(minimalna_mzda_median_sk) == 16,
  all(minimalna_mzda_median_sk$krajina == "Slovakia")
)

# Kontrolné body z raw XLSX a jediná značka p pri PL 2025.
pl_2025 <- with(minimalna_mzda_priemer, krajina == "Poland" & rok == 2025)
sk_2025 <- with(minimalna_mzda_priemer, krajina == "Slovakia" & rok == 2025)
stopifnot(
  isTRUE(all.equal(minimalna_mzda_priemer$pomer_pct[pl_2025], 52.85)),
  isTRUE(all.equal(minimalna_mzda_priemer$pomer_pct[sk_2025], 43.7)),
  isTRUE(all.equal(minimalna_mzda_median_sk$pomer_pct[
    minimalna_mzda_median_sk$rok == 2025], 52.9)),
  identical(minimalna_mzda_priemer$znacka[pl_2025], "p"),
  sum(!is.na(minimalna_mzda_priemer$znacka)) == 1,
  all(is.na(minimalna_mzda_median_sk$znacka))
)

message("Kontroly mzdových pomerov prešli.")
