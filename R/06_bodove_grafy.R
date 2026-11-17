# Spúšťaj z koreňa projektu po overení analytickej tabuľky.
# Jeden bod = krajina a rok t, v ktorom končí zmena pomeru t-1 -> t.
# Súbežný výsledok: zamestnanosť t-1 -> t; oneskorený: t -> t+1.
# Nezamestnanosť má oba varianty ako doplnkové pohľady na žiadosť autora.

source("R/graficke_popisky.R", local = TRUE, encoding = "UTF-8")

body_vstup <- read.csv("data/processed/analyticka_tabulka_20_64.csv",
                       fileEncoding = "UTF-8", stringsAsFactors = FALSE)
stopifnot(
  nrow(body_vstup) == 64,
  anyDuplicated(body_vstup[c("krajina", "rok")]) == 0,
  is.logical(body_vstup$pouzitelne_zam_subezne),
  !anyNA(body_vstup$pouzitelne_zam_subezne),
  is.logical(body_vstup$pouzitelne_zam_oneskorene),
  !anyNA(body_vstup$pouzitelne_zam_oneskorene),
  is.logical(body_vstup$pouzitelne_nezam_subezne),
  !anyNA(body_vstup$pouzitelne_nezam_subezne),
  is.logical(body_vstup$pouzitelne_nezam_oneskorene),
  !anyNA(body_vstup$pouzitelne_nezam_oneskorene)
)

# Rozdiely už boli vypočítané v skripte 04. Tu ich nemeníme:
# vyberieme iba páry označené ako použiteľné pre súbežné porovnanie.
body_zam <- body_vstup[body_vstup$pouzitelne_zam_subezne, ]
body_krajiny <- c("Czechia", "Slovakia", "Poland", "Hungary")
body_popisy <- c("Česko", "Slovensko", "Poľsko", "Maďarsko")
stopifnot(
  nrow(body_zam) == 56,
  setequal(body_zam$krajina, body_krajiny),
  all(table(body_zam$krajina) == 14),
  all(is.finite(body_zam$zmena_pomeru_pb)),
  all(is.finite(body_zam$zmena_zamestnanosti_pb)),
  !any(body_zam$zlom_zamestnanost),
  all(body_zam$rok %in% 2011:2025),
  all(is.na(body_zam$znacka_pomer) | body_zam$znacka_pomer == "p")
)

# Posun je už vytvorený podľa kalendára v skripte 04, pred výlukami.
# Neposúvame zostávajúce riadky súbežného výberu: preskočili by sme roky.
body_zam_oneskorene <- body_vstup[body_vstup$pouzitelne_zam_oneskorene, ]
stopifnot(
  nrow(body_zam_oneskorene) == 54,
  setequal(body_zam_oneskorene$krajina, body_krajiny),
  all(as.integer(table(body_zam_oneskorene$krajina)[body_krajiny]) == c(14, 14, 13, 13)),
  all(is.finite(body_zam_oneskorene$zmena_pomeru_pb)),
  all(is.finite(body_zam_oneskorene$zam_zmena_pristi_rok_pb)),
  all(body_zam_oneskorene$rok %in% 2011:2024),
  all(body_zam_oneskorene$rok_vysledku_oneskorene == body_zam_oneskorene$rok + 1L)
)

# Pre nezamestnanosť použijeme jej vlastné zmeny a príznaky použiteľnosti.
# Jej menovateľom sú ekonomicky aktívni, nie celá skúmaná populácia.
body_nezam <- body_vstup[body_vstup$pouzitelne_nezam_subezne, ]
stopifnot(
  nrow(body_nezam) == 56,
  setequal(body_nezam$krajina, body_krajiny),
  all(table(body_nezam$krajina) == 14),
  all(is.finite(body_nezam$zmena_pomeru_pb)),
  all(is.finite(body_nezam$zmena_nezamestnanosti_pb)),
  !any(body_nezam$zlom_nezamestnanost),
  all(body_nezam$rok %in% 2011:2025),
  all(is.na(body_nezam$znacka_pomer) | body_nezam$znacka_pomer == "p")
)

body_nezam_oneskorene <- body_vstup[body_vstup$pouzitelne_nezam_oneskorene, ]
stopifnot(
  nrow(body_nezam_oneskorene) == 54,
  setequal(body_nezam_oneskorene$krajina, body_krajiny),
  all(as.integer(table(body_nezam_oneskorene$krajina)[body_krajiny]) == c(14, 14, 13, 13)),
  all(is.finite(body_nezam_oneskorene$zmena_pomeru_pb)),
  all(is.finite(body_nezam_oneskorene$nezam_zmena_pristi_rok_pb)),
  all(body_nezam_oneskorene$rok %in% 2011:2024),
  all(body_nezam_oneskorene$rok_vysledku_oneskorene == body_nezam_oneskorene$rok + 1L)
)

# Bez cesty zobrazí graf v Plots. Pôvodné volania pre zamestnanosť ostávajú platné.
vykresli_body_zam <- function(subor = NULL, porovnanie = c("subezne", "oneskorene"),
                              ukazovatel = c("zamestnanost", "nezamestnanost"),
                              regresia = FALSE, krajiny = body_krajiny,
                              pod_sebou = FALSE) {
  porovnanie <- match.arg(porovnanie)
  ukazovatel <- match.arg(ukazovatel)
  stopifnot(length(krajiny) > 0, all(krajiny %in% body_krajiny),
            anyDuplicated(krajiny) == 0)
  je_oneskorene <- porovnanie == "oneskorene"
  je_nezam <- ukazovatel == "nezamestnanost"
  if (regresia && je_nezam) stop("Regresia bola dohodnutá iba pre zamestnanosť.")
  body_graf <- if (je_oneskorene) body_zam_oneskorene else body_zam
  stlpec_y <- if (je_oneskorene) "zam_zmena_pristi_rok_pb" else "zmena_zamestnanosti_pb"
  if (je_nezam) {
    body_graf <- if (je_oneskorene) body_nezam_oneskorene else body_nezam
    stlpec_y <- if (je_oneskorene) "nezam_zmena_pristi_rok_pb" else "zmena_nezamestnanosti_pb"
  }
  if (!is.null(subor)) {
    png(subor, width = if (pod_sebou) 2000 else 2400,
        height = if (pod_sebou) 1200 * length(krajiny) else 2000, res = 200)
  }
  stare_par <- par(no.readonly = TRUE)
  on.exit({
    par(stare_par)
    if (!is.null(subor)) dev.off()
  })
  par(mfrow = if (pod_sebou) c(length(krajiny), 1) else c(2, 2),
      mar = c(3, 3.8, if (regresia) 3.4 else 2.7, 1.2),
      oma = c(6, 2, 6, 0.5), mgp = c(2.4, 0.7, 0),
      tcl = -0.25, family = "sans", las = 1)
  if (pod_sebou) par(cex = 1)

  # Spoločné stupnice pre krajiny aj oba grafy zamestnanosti.
  # Nezamestnanosť má vlastný rozsah y, zhodný pre krajiny aj obe časovania.
  # Zahrnieme nulu a pridáme priestor na ročné popisky.
  x_znacky <- pretty(range(c(0, body_zam$zmena_pomeru_pb,
                            body_zam_oneskorene$zmena_pomeru_pb)), n = 5)
  y_znacky <- pretty(range(c(0, body_zam$zmena_zamestnanosti_pb,
                            body_zam_oneskorene$zam_zmena_pristi_rok_pb)), n = 5)
  if (je_nezam) {
    x_znacky <- pretty(range(c(0, body_nezam$zmena_pomeru_pb,
                              body_nezam_oneskorene$zmena_pomeru_pb)), n = 5)
    y_znacky <- pretty(range(c(0, body_nezam$zmena_nezamestnanosti_pb,
                              body_nezam_oneskorene$nezam_zmena_pristi_rok_pb)), n = 5)
  }
  x_lim <- range(x_znacky) + c(-1, 1) * diff(range(x_znacky)) * 0.10
  y_lim <- range(y_znacky) + c(-1, 1) * diff(range(y_znacky)) * 0.10

  for (stat_graf in krajiny) {
    j <- match(stat_graf, body_krajiny)
    rad <- body_graf[body_graf$krajina == body_krajiny[j], ]
    rad <- rad[order(rad$rok), ]
    predbezny <- !is.na(rad$znacka_pomer) & rad$znacka_pomer == "p"
    farba <- ifelse(predbezny, "#B35A00", "#245A81")

    plot(rad$zmena_pomeru_pb, rad[[stlpec_y]],
         type = "n", xlim = x_lim, ylim = y_lim,
         xaxt = "n", yaxt = "n", xlab = "", ylab = "",
         main = paste0(body_popisy[j], " (n = ", nrow(rad), ")"),
         cex.main = 1.1, bty = "l")
    abline(v = x_znacky, h = y_znacky, col = "#E5E9ED", lwd = 0.8)
    abline(v = 0, h = 0, col = "#707A84", lty = 2)
    axis(1, at = x_znacky, cex.axis = 0.85)
    axis(2, at = y_znacky, cex.axis = 0.85)
    if (regresia) {
      # Opisná OLS priamka s konštantou; kreslíme iba medzi krajnými x.
      fit <- lm(y ~ x, data = data.frame(x = rad$zmena_pomeru_pb,
                                         y = rad[[stlpec_y]]), na.action = na.fail)
      x_konce <- range(rad$zmena_pomeru_pb)
      lines(x_konce, predict(fit, newdata = data.frame(x = x_konce)),
            col = "#9C4B28", lwd = 2)
      mtext(sprintf("OLS: b = %.3f | r = %.3f", coef(fit)[[2]],
                    cor(rad$zmena_pomeru_pb, rad[[stlpec_y]], use = "all.obs")),
            side = 3, line = 0.2, cex = 0.75, col = "#9C4B28")
    }
    points(rad$zmena_pomeru_pb, rad[[stlpec_y]],
           pch = 16, cex = 1, col = farba)
    points(rad$zmena_pomeru_pb[predbezny],
           rad[[stlpec_y]][predbezny],
           pch = 23, bg = "white", col = "#B35A00", cex = 1.3, lwd = 1.5)

    # Mení sa iba poloha textu; všetky body a ich roky ostávajú zachované.
    rozmiestni_rocne_popisky(rad$zmena_pomeru_pb, rad[[stlpec_y]],
                            labels = rad$rok, cex = 0.95, col = farba)
  }
  mtext(if (je_nezam) "Zmeny relatívnej minimálnej mzdy a nezamestnanosti vo V4" else
          "Zmeny relatívnej minimálnej mzdy a zamestnanosti vo V4",
        side = 3, outer = TRUE, line = 2, cex = 1.2, font = 2)
  mtext(paste(if (je_oneskorene) "Jednoročné oneskorenie" else "Súbežné porovnanie",
              "| Vek 20–64, ISCED 0–2, obe pohlavia"),
        side = 3, outer = TRUE, line = 0.5, cex = 0.85)
  mtext("Medziročná zmena pomeru minima k priemeru (p. b.)",
        side = 1, outer = TRUE, line = 1, cex = 0.9)
  mtext(if (je_nezam && je_oneskorene) "Zmena miery nezamestnanosti v nasledujúcom roku (p. b.)" else
          if (je_nezam) "Medziročná zmena miery nezamestnanosti (p. b.)" else
          if (je_oneskorene) "Zmena miery zamestnanosti v nasledujúcom roku (p. b.)" else
          "Medziročná zmena miery zamestnanosti (p. b.)",
        side = 2, outer = TRUE, line = 0.3, las = 0, cex = 0.9)
  mtext(if (je_oneskorene)
          paste0("Bod t: pomer t−1 → t, ", if (je_nezam) "nezamestnanosť" else "zamestnanosť",
                 " t → t+1. Rok označuje zmenu pomeru.") else
          "Rok pri bode označuje koniec intervalu t−1 → t. Spoločné stupnice vo všetkých paneloch.",
        side = 1, outer = TRUE, line = 2.5, cex = 0.75)
  mtext(if (je_oneskorene)
          "Vynechané výsledné zmeny cez b: HU 2018, PL 2019. Pomer 2025 nemá výsledok za 2026." else
          "Prechody cez zlom b vynechané (1 na krajinu). Oranžový kosoštvorec: PL 2025, pomer s p.",
        side = 1, outer = TRUE, line = 3.6, cex = 0.75)
  mtext(paste0("Zdroj: Eurostat earn_mw_avgr2 (B–S), ",
               if (je_nezam) "une_educ_a" else "lfsi_educ_a",
               ". Exporty 24.–25. 10. 2026. Vlastné výpočty."),
        side = 1, outer = TRUE, line = 4.7, cex = 0.7)
}

# Dve čitateľnejšie časti tej istej oneskorenej nezamestnanosti.
# Stupnice sa vyššie počítajú zo všetkých krajín, nie iba z vybranej dvojice.
uloz_oneskorenu_nezamestnanost <- function() {
  dir.create("outputs", showWarnings = FALSE)
  vykresli_body_zam(
    subor = "outputs/06a_nezamestnanost_oneskorene_cz_sk.png",
    porovnanie = "oneskorene", ukazovatel = "nezamestnanost",
    krajiny = c("Czechia", "Slovakia"), pod_sebou = TRUE)
  vykresli_body_zam(
    subor = "outputs/06b_nezamestnanost_oneskorene_pl_hu.png",
    porovnanie = "oneskorene", ukazovatel = "nezamestnanost",
    krajiny = c("Poland", "Hungary"), pod_sebou = TRUE)
  message("Dve časti oneskorenej nezamestnanosti boli uložené do outputs/.")
}

# Source v interaktívnej relácii iba zobrazí prehľady; export je voliteľný.
if (interactive() && !identical(getOption("v4.automaticke_grafy"), FALSE)) {
  vykresli_body_zam()
  vykresli_body_zam(porovnanie = "oneskorene")
  vykresli_body_zam(ukazovatel = "nezamestnanost")
  vykresli_body_zam(porovnanie = "oneskorene", ukazovatel = "nezamestnanost")
}
message("Kontroly vstupu prešli. Zamestnanosť aj nezamestnanosť: po 56 súbežných a 54 oneskorených párov.")
