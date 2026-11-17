# Spúšťaj z koreňa projektu po úspešnej príprave dát (skripty 01 a 02).
# Číta uložené CSV, nepotrebuje objekty zo starej R relácie ani nové balíčky.
# Jeden riadok výsledku predstavuje krajinu a rok t; zmena patrí intervalu t-1 -> t.

zam_vstup <- read.csv("data/processed/zamestnanost_20_64.csv",
                     colClasses = c("character", "integer", "numeric", "logical"))
nezam_vstup <- read.csv("data/processed/nezamestnanost_20_64.csv",
                       colClasses = c("character", "integer", "numeric", "logical"))
pomer_vstup <- read.csv("data/processed/minimalna_mzda_priemer.csv",
                       colClasses = c("character", "integer", "numeric", "character"))

# Pred spojením musia byť kľúče jedinečné a zhodné vo všetkých troch tabuľkách.
kluc_pomer <- paste(pomer_vstup$krajina, pomer_vstup$rok)
for (vstup in list(zam_vstup, nezam_vstup, pomer_vstup)) {
  stopifnot(nrow(vstup) == 64,
            !anyNA(vstup[c("krajina", "rok")]),
            anyDuplicated(vstup[c("krajina", "rok")]) == 0,
            setequal(paste(vstup$krajina, vstup$rok), kluc_pomer))
}

# Rozlíšime význam hodnôt a značiek pred spojením podľa krajiny a roku.
names(zam_vstup)[3:4] <- c("zamestnanost_pct", "zlom_zamestnanost")
names(nezam_vstup)[3:4] <- c("nezamestnanost_pct", "zlom_nezamestnanost")
names(pomer_vstup)[4] <- "znacka_pomer"
analyticka_tabulka <- merge(pomer_vstup, zam_vstup,
                            by = c("krajina", "rok"), all = TRUE)
analyticka_tabulka <- merge(analyticka_tabulka, nezam_vstup,
                            by = c("krajina", "rok"), all = TRUE)
analyticka_tabulka <- analyticka_tabulka[
  order(analyticka_tabulka$krajina, analyticka_tabulka$rok), ]
row.names(analyticka_tabulka) <- NULL

# U mzdového pomeru je v tomto exporte iba p alebo prázdna značka.
# p ponechávame. Neočakávaná značka musí zastaviť postup a byť preskúmaná.
stopifnot(
  nrow(analyticka_tabulka) == 64,
  !anyNA(analyticka_tabulka[setdiff(names(analyticka_tabulka), "znacka_pomer")]),
  all(is.na(analyticka_tabulka$znacka_pomer) | analyticka_tabulka$znacka_pomer == "p"),
  setequal(analyticka_tabulka$krajina, c("Czechia", "Hungary", "Poland", "Slovakia"))
)

# Zmeny počítame pred výlukami, výlučne medzi susednými rokmi tej istej krajiny.
# Dve desatinné miesta zachovávajú presnosť zdrojových mier a pomerov.
for (nazov in c("zmena_pomeru_pb", "zmena_zamestnanosti_pb",
                "zmena_nezamestnanosti_pb", "zam_zmena_pristi_rok_pb",
                "nezam_zmena_pristi_rok_pb")) {
  analyticka_tabulka[[nazov]] <- NA_real_
}
analyticka_tabulka$pouzitelne_zam_oneskorene <- FALSE
analyticka_tabulka$pouzitelne_nezam_oneskorene <- FALSE

for (stat in unique(analyticka_tabulka$krajina)) {
  i <- which(analyticka_tabulka$krajina == stat)
  rad <- analyticka_tabulka[i, ]
  stopifnot(identical(rad$rok, 2010:2025))
  dx <- c(NA_real_, round(diff(rad$pomer_pct), 2))
  dy_zam <- c(NA_real_, round(diff(rad$zamestnanost_pct), 2))
  dy_nezam <- c(NA_real_, round(diff(rad$nezamestnanost_pct), 2))
  analyticka_tabulka$zmena_pomeru_pb[i] <- dx
  analyticka_tabulka$zmena_zamestnanosti_pb[i] <- dy_zam
  analyticka_tabulka$zmena_nezamestnanosti_pb[i] <- dy_nezam

  # K zmene pomeru v roku t priradíme zmenu výsledku v roku t+1.
  # Posun sa robí ešte na úplnom rade. Rok 2025 nemá výsledok z roku 2026.
  analyticka_tabulka$zam_zmena_pristi_rok_pb[i] <- c(dy_zam[-1], NA_real_)
  analyticka_tabulka$nezam_zmena_pristi_rok_pb[i] <- c(dy_nezam[-1], NA_real_)
  analyticka_tabulka$pouzitelne_zam_oneskorene[i] <-
    !is.na(dx) & !is.na(c(dy_zam[-1], NA_real_)) & c(!rad$zlom_zamestnanost[-1], FALSE)
  analyticka_tabulka$pouzitelne_nezam_oneskorene[i] <-
    !is.na(dx) & !is.na(c(dy_nezam[-1], NA_real_)) & c(!rad$zlom_nezamestnanost[-1], FALSE)
}

# Pri súbežnom porovnaní b v roku t vylučuje zmenu t-1 -> t, nie celú hodnotu.
analyticka_tabulka$pouzitelne_zam_subezne <- with(analyticka_tabulka,
  !is.na(zmena_pomeru_pb) & !is.na(zmena_zamestnanosti_pb) & !zlom_zamestnanost)
analyticka_tabulka$pouzitelne_nezam_subezne <- with(analyticka_tabulka,
  !is.na(zmena_pomeru_pb) & !is.na(zmena_nezamestnanosti_pb) & !zlom_nezamestnanost)
analyticka_tabulka$rok_vysledku_oneskorene <- ifelse(
  analyticka_tabulka$rok < 2025, analyticka_tabulka$rok + 1L, NA_integer_)

# Stručný prehľad: kandidáti sú roky s oboma potrebnými zmenami pred výlukami.
# V kompletných vstupoch sú dôvodom ďalších výluk zostávajúce časové zlomy.
spocitaj_porovnania <- function(ukazovatel, porovnanie, stlpec) {
  do.call(rbind, lapply(split(analyticka_tabulka, analyticka_tabulka$krajina), function(rad) {
    kandidat <- rad$rok >= 2011 &
      (porovnanie == "subezne" | rad$rok <= 2024)
    data.frame(krajina = rad$krajina[1], ukazovatel = ukazovatel,
               porovnanie = porovnanie, kandidati = sum(kandidat),
               vylucene_pre_zlom = sum(kandidat & !rad[[stlpec]]),
               pouzitelne = sum(kandidat & rad[[stlpec]]))
  }))
}
prehlad_porovnani <- rbind(
  spocitaj_porovnania("zamestnanost", "subezne", "pouzitelne_zam_subezne"),
  spocitaj_porovnania("zamestnanost", "oneskorene_1_rok", "pouzitelne_zam_oneskorene"),
  spocitaj_porovnania("nezamestnanost", "subezne", "pouzitelne_nezam_subezne"),
  spocitaj_porovnania("nezamestnanost", "oneskorene_1_rok", "pouzitelne_nezam_oneskorene")
)
row.names(prehlad_porovnani) <- NULL

# Kontrolné body: prvá zmena, zachovanie p a správne kalendárne párovanie.
sk_2011 <- with(analyticka_tabulka, krajina == "Slovakia" & rok == 2011)
sk_2012 <- with(analyticka_tabulka, krajina == "Slovakia" & rok == 2012)
pl_2025 <- with(analyticka_tabulka, krajina == "Poland" & rok == 2025)
stopifnot(
  all(is.na(analyticka_tabulka$zmena_pomeru_pb[analyticka_tabulka$rok == 2010])),
  !analyticka_tabulka$pouzitelne_zam_subezne[sk_2011],
  isTRUE(all.equal(analyticka_tabulka$zmena_zamestnanosti_pb[sk_2012], -0.1)),
  isTRUE(all.equal(analyticka_tabulka$zam_zmena_pristi_rok_pb[sk_2011], -0.1)),
  analyticka_tabulka$pouzitelne_zam_oneskorene[sk_2011],
  isTRUE(all.equal(analyticka_tabulka$zmena_pomeru_pb[pl_2025], -0.05)),
  identical(analyticka_tabulka$znacka_pomer[pl_2025], "p"),
  analyticka_tabulka$pouzitelne_zam_subezne[pl_2025],
  all(!analyticka_tabulka$pouzitelne_zam_oneskorene[analyticka_tabulka$rok == 2025]),
  all(prehlad_porovnani$kandidati ==
        prehlad_porovnani$vylucene_pre_zlom + prehlad_porovnani$pouzitelne)
)
# Očakávané počty vyplývajú z kalendára a zoznamu zlomov, nie z výslednej asociácie.
for (ukazovatel in c("zamestnanost", "nezamestnanost")) {
  prehlad <- prehlad_porovnani[prehlad_porovnani$ukazovatel == ukazovatel, ]
  stopifnot(sum(prehlad$pouzitelne[prehlad$porovnanie == "subezne"]) == 56,
            sum(prehlad$pouzitelne[prehlad$porovnanie == "oneskorene_1_rok"]) == 54)
}

# Uloženie až po úspechu kontrol; opätovné spustenie prepíše iba tieto dva výstupy.
dir.create("outputs", showWarnings = FALSE)
write.csv(analyticka_tabulka, "data/processed/analyticka_tabulka_20_64.csv",
          row.names = FALSE, fileEncoding = "UTF-8")
write.csv(prehlad_porovnani, "outputs/prehlad_porovnani.csv",
          row.names = FALSE, fileEncoding = "UTF-8")
print(prehlad_porovnani, row.names = FALSE)
message("Kontroly analytickej tabuľky prešli. Tabuľka a prehľad boli uložené.")
