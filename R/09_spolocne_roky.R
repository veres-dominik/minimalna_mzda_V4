# Kontrola zloženia vzorky: súbežné a oneskorené porovnanie zamestnanosti
# na rovnakých rokoch zmeny pomeru t, osobitne v každej krajine.
# Pri oneskorení zostáva výsledok z t+1. Ekonomické vplyvy nekontrolujeme.
# Pôvodné odhady ani ich výstupy neprepisujeme.

sp_vstup <- read.csv("data/processed/analyticka_tabulka_20_64.csv",
                     fileEncoding = "UTF-8", stringsAsFactors = FALSE)
sp_povodne <- read.csv("outputs/08_regresne_zhrnutie.csv",
                       fileEncoding = "UTF-8", stringsAsFactors = FALSE)
sp_krajiny <- c("Czechia", "Slovakia", "Poland", "Hungary")
stopifnot(
  nrow(sp_vstup) == 64,
  anyDuplicated(sp_vstup[c("krajina", "rok")]) == 0,
  setequal(sp_vstup$krajina, sp_krajiny),
  is.logical(sp_vstup$pouzitelne_zam_subezne),
  is.logical(sp_vstup$pouzitelne_zam_oneskorene),
  !anyNA(sp_vstup[c("pouzitelne_zam_subezne", "pouzitelne_zam_oneskorene")])
)

# Prienik vyžaduje použiteľnosť oboch výsledných zmien pre ten istý rok t.
# Žiadne nové posúvanie riadkov: kalendárne páry už vytvoril skript 04.
sp_spolocne <- sp_vstup[
  sp_vstup$pouzitelne_zam_subezne & sp_vstup$pouzitelne_zam_oneskorene, ]
sp_spolocne <- sp_spolocne[order(sp_spolocne$krajina, sp_spolocne$rok), ]
stopifnot(
  nrow(sp_spolocne) == 50,
  all(as.integer(table(sp_spolocne$krajina)[sp_krajiny]) == c(13, 13, 12, 12)),
  all(sp_spolocne$rok_vysledku_oneskorene == sp_spolocne$rok + 1L),
  all(sp_spolocne$rok %in% 2011:2024)
)

sp_odhad <- function(rad, y_stlpec) {
  xy <- data.frame(x = rad$zmena_pomeru_pb, y = rad[[y_stlpec]])
  stopifnot(nrow(xy) >= 4, all(is.finite(xy$x)), all(is.finite(xy$y)),
            sd(xy$x) > 0, sd(xy$y) > 0)
  fit <- lm(y ~ x, data = xy, na.action = na.fail)
  c(b = unname(coef(fit)["x"]), r = cor(xy$x, xy$y, use = "all.obs"))
}

sp_riadky <- list()
for (stat in sp_krajiny) {
  povodny_rad <- sp_vstup[sp_vstup$krajina == stat, ]
  spolocny_rad <- sp_spolocne[sp_spolocne$krajina == stat, ]
  for (casovanie in c("subezne", "oneskorene")) {
    flag <- if (casovanie == "subezne") "pouzitelne_zam_subezne" else "pouzitelne_zam_oneskorene"
    y_stlpec <- if (casovanie == "subezne") "zmena_zamestnanosti_pb" else "zam_zmena_pristi_rok_pb"
    povodny_vyber <- povodny_rad[povodny_rad[[flag]], ]
    pov <- sp_odhad(povodny_vyber, y_stlpec)
    spol <- sp_odhad(spolocny_rad, y_stlpec)

    # Prepočet pôvodnej vzorky sa musí zhodovať s uloženým výsledkom skriptu 08.
    kontrola <- sp_povodne[sp_povodne$krajina == stat &
      sp_povodne$menovatel == "priemer" & sp_povodne$porovnanie == casovanie, ]
    stopifnot(nrow(kontrola) == 1, nrow(povodny_vyber) == kontrola$n,
      isTRUE(all.equal(unname(pov["b"]), kontrola$smernica, tolerance = 1e-10)),
      isTRUE(all.equal(unname(pov["r"]), kontrola$pearson_r, tolerance = 1e-10)))

    sp_riadky[[paste(stat, casovanie, sep = "_")]] <- data.frame(
      krajina = stat, porovnanie = casovanie,
      n_povodne = nrow(povodny_vyber), n_spolocne = nrow(spolocny_rad),
      b_povodne = unname(pov["b"]), b_spolocne = unname(spol["b"]),
      r_povodne = unname(pov["r"]), r_spolocne = unname(spol["r"]),
      spolocne_roky_pomeru = paste(sort(spolocny_rad$rok), collapse = ", "),
      vyradene_roky_pomeru = paste(sort(setdiff(povodny_vyber$rok, spolocny_rad$rok)), collapse = ", "))
  }
}
sp_porovnanie <- do.call(rbind, sp_riadky)
row.names(sp_porovnanie) <- NULL

# Kontrolná tabuľka umožní skontrolovať skutočný rok výsledku a súradnice.
sp_kontrola <- data.frame(
  krajina = sp_spolocne$krajina, rok_pomeru = sp_spolocne$rok,
  rok_vysledku_subezne = sp_spolocne$rok,
  rok_vysledku_oneskorene = sp_spolocne$rok_vysledku_oneskorene,
  zmena_pomeru_pb = sp_spolocne$zmena_pomeru_pb,
  zmena_zam_subezne_pb = sp_spolocne$zmena_zamestnanosti_pb,
  zmena_zam_oneskorene_pb = sp_spolocne$zam_zmena_pristi_rok_pb)
stopifnot(nrow(sp_porovnanie) == 8, nrow(sp_kontrola) == 50,
          identical(sp_porovnanie$n_spolocne, rep(c(13L, 13L, 12L, 12L), each = 2)))

# Kontrolné čísla nezávislého výpočtu z CSV v Pythone, poradie CZ/SK/PL/HU.
stopifnot(isTRUE(all.equal(sp_porovnanie$b_spolocne,
  c(0.952973074, 0.393418100, -1.093248562, 0.106569785,
    -0.402590674, 0.086183074, -0.110921158, 0.179404666), tolerance = 1e-8)))

write.csv(sp_porovnanie, "outputs/10_porovnanie_spolocnych_rokov.csv",
          row.names = FALSE, fileEncoding = "UTF-8")
write.csv(sp_kontrola, "outputs/11_spolocne_roky_kontrola.csv",
          row.names = FALSE, fileEncoding = "UTF-8")
print(sp_porovnanie[1:8], row.names = FALSE, digits = 3)
message("Kontroly prešli: CZ/SK po 13 spoločných rokoch, PL/HU po 12. Výstupy 10 a 11 uložené.")
