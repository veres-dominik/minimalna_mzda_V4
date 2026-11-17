# Spúšťaj po overení analytickej tabuľky, z koreňa projektu.
# Vytvorí iba opisné grafy úrovní; medziročné vzťahy ešte nevyhodnocuje.
# Používa základné grafické funkcie R, bez nových balíčkov.

graf_data <- read.csv("data/processed/analyticka_tabulka_20_64.csv",
                      fileEncoding = "UTF-8", stringsAsFactors = FALSE)
stopifnot(
  nrow(graf_data) == 64,
  anyDuplicated(graf_data[c("krajina", "rok")]) == 0,
  !anyNA(graf_data[c("krajina", "rok", "pomer_pct", "zamestnanost_pct",
                    "zlom_zamestnanost")]),
  is.logical(graf_data$zlom_zamestnanost),
  all(is.na(graf_data$znacka_pomer) | graf_data$znacka_pomer == "p")
)

# Názvy krajín v dátach nemeníme; slovenské názvy používame iba v grafe.
krajiny_graf <- c("Czechia", "Slovakia", "Poland", "Hungary")
popisy_krajin <- c("Česko", "Slovensko", "Poľsko", "Maďarsko")
stopifnot(setequal(graf_data$krajina, krajiny_graf))

# Rovnaká funkcia zabezpečí zhodnú úpravu exportu aj zobrazenia v RStudiu.
# subor = NULL kreslí do Plots; zadaná cesta uloží PNG.
vykresli_vyvoj <- function(ukazovatel, subor = NULL) {
  ukazovatel <- match.arg(ukazovatel, c("pomer", "zamestnanost", "spolu"))
  je_spolu <- ukazovatel == "spolu"
  je_pomer <- ukazovatel %in% c("pomer", "spolu")
  stlpec <- if (je_pomer) "pomer_pct" else "zamestnanost_pct"
  titulok <- if (je_pomer) "Relatívna minimálna mzda vo V4" else
    "Zamestnanosť osôb s nízkym vzdelaním vo V4"
  popis_y <- if (je_pomer) "Minimum / priemerná mzda (%)" else
    "Miera zamestnanosti (%)"
  podtitulok <- if (je_pomer) "2010–2025 | Hrubé mzdy, výber NACE B–S" else
    "2010–2025 | Vek 20–64, ISCED 0–2, obe pohlavia"
  zdroj <- if (je_pomer) "Zdroj: Eurostat earn_mw_avgr2. Export 24. 10. 2026." else
    "Zdroj: Eurostat lfsi_educ_a, opravené rady. Export 25. 10. 2026."
  legenda <- if (je_pomer) "Oranžový kosoštvorec: predbežný údaj p (Poľsko 2025)." else
    "Oranžový prázdny kruh: zlom b. Spojnica cez zlom je prerušená."
  if (je_spolu) {
    titulok <- "Relatívna minimálna mzda a zamestnanosť vo V4"
    popis_y <- "Hodnota ukazovateľa (%)"
    podtitulok <- "2010–2025 | Zamestnanosť: vek 20–64, ISCED 0–2, obe pohlavia"
    zdroj <- "Zdroj: Eurostat earn_mw_avgr2 (B–S), lfsi_educ_a. Exporty 24.–25. 10. 2026."
    legenda <- "Oranžový kruh: b pri zamestnanosti. Kosoštvorec: p pri pomere."
  }

  if (!is.null(subor)) {
    png(subor, width = 2400, height = 1800, res = 200)
  }
  stare_par <- par(no.readonly = TRUE)
  on.exit({
    par(stare_par)
    if (!is.null(subor)) dev.off()
  })
  par(mfrow = c(2, 2), mar = c(3.1, 4.8, 2.7, 1), oma = c(4.6, 0.5, 4.2, 0.5),
      mgp = c(3, 0.8, 0), tcl = -0.25, family = "sans", las = 1)

  # Jednotný rozsah v štyroch paneloch; os y nemusí začínať nulou.
  rozsah_y <- if (je_spolu) range(graf_data$pomer_pct, graf_data$zamestnanost_pct) else
    range(graf_data[[stlpec]])
  y_znacky <- pretty(rozsah_y, n = 5)
  modra <- "#245A81"
  zelena <- "#28735D"
  oranzova <- "#B35A00"

  for (j in seq_along(krajiny_graf)) {
    rad <- graf_data[graf_data$krajina == krajiny_graf[j], ]
    rad <- rad[order(rad$rok), ]
    stopifnot(identical(as.integer(rad$rok), 2010:2025))
    y <- rad[[stlpec]]
    zlom <- if (je_pomer) rep(FALSE, nrow(rad)) else rad$zlom_zamestnanost

    plot(rad$rok, y, type = "n", xlim = c(2010, 2025), ylim = range(y_znacky),
         xaxt = "n", yaxt = "n", xlab = "", ylab = popis_y,
         main = popisy_krajin[j], cex.main = 1.1, bty = "l")
    abline(h = y_znacky, col = "#E5E9ED", lwd = 0.8)
    axis(1, at = c(2010, 2015, 2020, 2025), cex.axis = 0.85)
    axis(2, at = y_znacky, cex.axis = 0.85)

    # Neodstránime hodnotu v roku zlomu. Vynecháme len spojnicu od t-1 k t.
    for (i in 2:nrow(rad)) {
      if (!zlom[i]) {
        segments(rad$rok[i - 1], y[i - 1], rad$rok[i], y[i], col = modra, lwd = 2)
      }
    }
    points(rad$rok, y, pch = 16, cex = 0.65, col = modra)
    if (any(zlom)) {
      points(rad$rok[zlom], y[zlom], pch = 21, bg = "white",
             col = oranzova, cex = 1.1, lwd = 1.8)
    }
    if (je_pomer) {
      predbezny <- !is.na(rad$znacka_pomer) & rad$znacka_pomer == "p"
      points(rad$rok[predbezny], y[predbezny], pch = 23, bg = "white",
             col = oranzova, cex = 1.2, lwd = 1.8)
    }
    if (je_spolu) {
      # Druhá línia používa tú istú os y, ale vlastné značky zlomov.
      for (i in 2:nrow(rad)) {
        if (!rad$zlom_zamestnanost[i]) {
          segments(rad$rok[i - 1], rad$zamestnanost_pct[i - 1],
                   rad$rok[i], rad$zamestnanost_pct[i],
                   col = zelena, lwd = 2, lty = 2)
        }
      }
      points(rad$rok, rad$zamestnanost_pct, pch = 17, cex = 0.65, col = zelena)
      b <- rad$zlom_zamestnanost
      points(rad$rok[b], rad$zamestnanost_pct[b], pch = 21, bg = "white",
             col = oranzova, cex = 1.1, lwd = 1.8)
    }
  }
  mtext(titulok, side = 3, outer = TRUE, line = 2, cex = 1.3, font = 2)
  mtext(podtitulok, side = 3, outer = TRUE, line = 0.5, cex = 0.85)
  mtext("Rok", side = 1, outer = TRUE, line = 0.1, cex = 0.9)
  if (je_spolu) {
    mtext("Modrá plná: minimum / priemer. Zelená prerušovaná: miera zamestnanosti.",
          side = 1, outer = TRUE, line = 1.2, cex = 0.8)
  }
  mtext(legenda, side = 1, outer = TRUE, line = if (je_spolu) 2.2 else 1.6, cex = 0.8)
  mtext(paste(zdroj, "Rovnaká stupnica osi y vo všetkých paneloch."),
        side = 1, outer = TRUE, line = if (je_spolu) 3.5 else 3, cex = 0.7)
}

# Opätovné spustenie prepíše iba tieto tri PNG.
dir.create("outputs", showWarnings = FALSE)
vykresli_vyvoj("pomer", "outputs/01_vyvoj_relativnej_minimalnej_mzdy.png")
vykresli_vyvoj("zamestnanost", "outputs/02_vyvoj_zamestnanosti_20_64.png")
vykresli_vyvoj("spolu", "outputs/03_spolocny_vyvoj_20_64.png")

# V interaktívnej relácii zobrazí všetky grafy v Plots (prechod šípkami).
if (interactive()) {
  vykresli_vyvoj("pomer")
  vykresli_vyvoj("zamestnanost")
  vykresli_vyvoj("spolu")
}
message("Všetky tri časové grafy boli uložené do outputs/.")
