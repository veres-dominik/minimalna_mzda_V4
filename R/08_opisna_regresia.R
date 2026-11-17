# Schválený blok: opisná OLS regresia s konštantou, Pearsonova korelácia
# a citlivosť po vynechaní každého jednotlivého roka. Iba zamestnanosť.
# Jeden riadok vstupného radu = použiteľný pár krajiny a roka t.
# Výsledky opisujú asociácie; nekontrolujú ostatné ekonomické vplyvy.

# Existujúcu prípravu a kreslenie načítame do oddeleného prostredia.
# Dočasne potlačíme iba automatické grafy; pôvodné nastavenie obnovíme.
reg_prostredie <- new.env(parent = globalenv())
(function() {
  stare_volby <- options(v4.automaticke_grafy = FALSE)
  on.exit(options(stare_volby))
  source("R/06_bodove_grafy.R", local = reg_prostredie, encoding = "UTF-8")
  source("R/07_median_sk_graf.R", local = reg_prostredie, encoding = "UTF-8")
})()

# Rovnaké vzorky ako v overených grafoch: 4 súbežné + 4 oneskorené + SR medián.
reg_sady <- list()
for (casovanie in c("subezne", "oneskorene")) {
  vstup <- if (casovanie == "subezne") reg_prostredie$body_zam else
    reg_prostredie$body_zam_oneskorene
  y_stlpec <- if (casovanie == "subezne") "zmena_zamestnanosti_pb" else
    "zam_zmena_pristi_rok_pb"
  for (stat in reg_prostredie$body_krajiny) {
    rad <- vstup[vstup$krajina == stat, ]
    rad <- rad[order(rad$rok), ]
    reg_sady[[paste(stat, "priemer", casovanie, sep = "_")]] <- data.frame(
      krajina = stat, menovatel = "priemer", porovnanie = casovanie,
      rok = rad$rok,
      rok_vysledku = if (casovanie == "subezne") rad$rok else rad$rok_vysledku_oneskorene,
      x = rad$zmena_pomeru_pb, y = rad[[y_stlpec]])
  }
}
rad <- reg_prostredie$median_sk_body
reg_sady$Slovakia_median_subezne <- data.frame(
  krajina = "Slovakia", menovatel = "median", porovnanie = "subezne",
  rok = rad$rok, rok_vysledku = rad$rok,
  x = rad$zmena_pomeru_median_pb, y = rad$zmena_zamestnanosti_pb)

# Slovenské menovatele porovnávame pri úplne rovnakých výsledkoch a rokoch.
stopifnot(
  length(reg_sady) == 9,
  identical(reg_sady$Slovakia_priemer_subezne$rok, reg_sady$Slovakia_median_subezne$rok),
  identical(reg_sady$Slovakia_priemer_subezne$y, reg_sady$Slovakia_median_subezne$y)
)

spocitaj_opisnu_regresiu <- function(rad) {
  stopifnot(nrow(rad) >= 4, anyDuplicated(rad$rok) == 0,
            all(is.finite(rad$x)), all(is.finite(rad$y)), sd(rad$x) > 0, sd(rad$y) > 0)
  fit <- lm(y ~ x, data = rad, na.action = na.fail)
  b <- unname(coef(fit)["x"])
  r <- cor(rad$x, rad$y, method = "pearson", use = "all.obs")

  # Každýkrát vynecháme práve jeden bod z tej istej vzorky a znova odhadneme.
  # Pôvodný odhad ani pôvodné dáta sa neprepisujú; nejde o výber „lepšej“ vzorky.
  citlivost <- do.call(rbind, lapply(seq_len(nrow(rad)), function(i) {
    mensi_rad <- rad[-i, ]
    stopifnot(sd(mensi_rad$x) > 0, sd(mensi_rad$y) > 0)
    mensi_fit <- lm(y ~ x, data = mensi_rad, na.action = na.fail)
    mensi_b <- unname(coef(mensi_fit)["x"])
    data.frame(krajina = rad$krajina[1], menovatel = rad$menovatel[1],
      porovnanie = rad$porovnanie[1], vynechany_rok_pomeru = rad$rok[i],
      vynechany_rok_vysledku = rad$rok_vysledku[i], n = nrow(mensi_rad),
      smernica = mensi_b,
      pearson_r = cor(mensi_rad$x, mensi_rad$y, use = "all.obs"),
      rozdiel_smernice = mensi_b - b, zmena_znamienka = sign(mensi_b) != sign(b))
  }))
  # Pri zhode najväčších posunov uvádzame prvý z vynechaných rokov.
  najvacsi <- which.max(abs(citlivost$rozdiel_smernice))
  zhrnutie <- data.frame(krajina = rad$krajina[1], menovatel = rad$menovatel[1],
    porovnanie = rad$porovnanie[1], n = nrow(rad),
    konstanta = unname(coef(fit)["(Intercept)"]), smernica = b, pearson_r = r,
    smernica_bez_1_roka_min = min(citlivost$smernica),
    smernica_bez_1_roka_max = max(citlivost$smernica),
    pocet_zmien_znamienka = sum(citlivost$zmena_znamienka),
    rok_najvacsieho_posunu = citlivost$vynechany_rok_pomeru[najvacsi],
    max_abs_posun_smernice = max(abs(citlivost$rozdiel_smernice)))

  # Nezávislá matematická identita pre jednoduchú OLS s konštantou.
  stopifnot(isTRUE(all.equal(b, r * sd(rad$y) / sd(rad$x), tolerance = 1e-10)),
            all(is.finite(citlivost$smernica)), all(is.finite(citlivost$pearson_r)))
  list(model = fit, zhrnutie = zhrnutie, citlivost = citlivost)
}

reg_vysledky <- lapply(reg_sady, spocitaj_opisnu_regresiu)
reg_zhrnutie <- do.call(rbind, lapply(reg_vysledky, function(x) x$zhrnutie))
reg_citlivost <- do.call(rbind, lapply(reg_vysledky, function(x) x$citlivost))
row.names(reg_zhrnutie) <- NULL
row.names(reg_citlivost) <- NULL
stopifnot(nrow(reg_zhrnutie) == 9, nrow(reg_citlivost) == 124,
          identical(reg_zhrnutie$n, c(14L, 14L, 14L, 14L, 14L, 14L, 13L, 13L, 14L)))

# Kontrolné hodnoty získané nezávisle z CSV v Pythone pred behom R.
stopifnot(
  isTRUE(all.equal(reg_zhrnutie$smernica[c(2, 3, 9)],
                   c(-1.141483991, -0.367863908, -0.802861830), tolerance = 1e-8)),
  isTRUE(all.equal(reg_zhrnutie$pearson_r[c(2, 3, 9)],
                   c(-0.645218655, -0.396048470, -0.559031958), tolerance = 1e-8))
)

# Čísla v CSV ostávajú nezaokrúhlené; konzola zobrazuje prehľad na 3 desatinné miesta.
dir.create("outputs", showWarnings = FALSE)
write.csv(reg_zhrnutie, "outputs/08_regresne_zhrnutie.csv",
          row.names = FALSE, fileEncoding = "UTF-8")
write.csv(reg_citlivost, "outputs/09_regresna_citlivost.csv",
          row.names = FALSE, fileEncoding = "UTF-8")
print(reg_zhrnutie, row.names = FALSE, digits = 3)

# Grafy s plnou vzorkou a priamkou; PNG export je voliteľný cez subor.
vykresli_regresiu_v4 <- function(porovnanie = c("subezne", "oneskorene"), subor = NULL) {
  reg_prostredie$vykresli_body_zam(subor = subor, porovnanie = match.arg(porovnanie), regresia = TRUE)
}
vykresli_regresiu_median_sk <- function(subor = NULL) {
  reg_prostredie$vykresli_median_sk(subor = subor, regresia = TRUE)
}

# Voliteľný export do reportu: uloží šesť bodových PNG.
# Používa rovnaké body, výluky aj OLS ako vyššie; nemení analytické dáta.
# Nezamestnanostné prílohy zostávajú bez regresných priamok.
uloz_grafy_reportu <- function() {
  vykresli_regresiu_v4("subezne", subor = "outputs/03_medzirocne_zmeny.png")
  vykresli_regresiu_v4("oneskorene", subor = "outputs/04_medzirocne_zmeny_oneskorene.png")
  reg_prostredie$vykresli_body_zam(
    subor = "outputs/05_medzirocne_zmeny_nezamestnanost.png",
    ukazovatel = "nezamestnanost")
  reg_prostredie$uloz_oneskorenu_nezamestnanost()
  vykresli_regresiu_median_sk(subor = "outputs/07_median_slovensko_zamestnanost.png")
  message("Šesť bodových grafov reportu bolo uložených do outputs/.")
}

if (interactive()) {
  vykresli_regresiu_v4("subezne")
  vykresli_regresiu_v4("oneskorene")
  vykresli_regresiu_median_sk()
}
message("Kontroly prešli: 9 opisných regresií a 124 vynechaní. Obe tabuľky sú uložené v outputs/.")
