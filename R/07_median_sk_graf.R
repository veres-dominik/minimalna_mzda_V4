# Doplnok do reportu: citlivosť slovenského výsledku na menovateľ pomeru.
# Jeden bod = Slovensko a rok t; obe zmeny patria intervalu t-1 -> t.
# X je zmena POMERU minima k mediánu, nie zmena samotnej mediánovej mzdy.

source("R/graficke_popisky.R", local = TRUE, encoding = "UTF-8")

median_sk_vstup <- read.csv("data/processed/minimalna_mzda_median_sk.csv",
                            fileEncoding = "UTF-8", stringsAsFactors = FALSE)
median_sk_vstup <- median_sk_vstup[order(median_sk_vstup$rok), ]
stopifnot(
  nrow(median_sk_vstup) == 16,
  all(median_sk_vstup$krajina == "Slovakia"),
  identical(as.integer(median_sk_vstup$rok), 2010:2025),
  all(is.finite(median_sk_vstup$pomer_pct)),
  all(is.na(median_sk_vstup$znacka))
)

# Zmeny počítame na úplnom rade pred výlukami a potom párujeme podľa kľúča.
median_sk_vstup$zmena_pomeru_median_pb <- c(NA_real_, round(diff(median_sk_vstup$pomer_pct), 2))
median_sk_vysledky <- read.csv("data/processed/analyticka_tabulka_20_64.csv",
                               fileEncoding = "UTF-8", stringsAsFactors = FALSE)
median_sk_vysledky <- median_sk_vysledky[median_sk_vysledky$krajina == "Slovakia",
  c("krajina", "rok", "zmena_zamestnanosti_pb", "zlom_zamestnanost")]
stopifnot(
  nrow(median_sk_vysledky) == 16,
  anyDuplicated(median_sk_vysledky[c("krajina", "rok")]) == 0,
  setequal(median_sk_vysledky$rok, 2010:2025),
  is.logical(median_sk_vysledky$zlom_zamestnanost),
  !anyNA(median_sk_vysledky$zlom_zamestnanost)
)
median_sk_body <- merge(median_sk_vstup, median_sk_vysledky,
                         by = c("krajina", "rok"), all = TRUE)
median_sk_body <- median_sk_body[
  median_sk_body$rok >= 2011 & !median_sk_body$zlom_zamestnanost, ]
median_sk_body <- median_sk_body[order(median_sk_body$rok), ]
stopifnot(
  nrow(median_sk_body) == 14,
  identical(as.integer(median_sk_body$rok), 2012:2025),
  all(is.finite(median_sk_body$zmena_pomeru_median_pb)),
  all(is.finite(median_sk_body$zmena_zamestnanosti_pb))
)

vykresli_median_sk <- function(subor = NULL, regresia = FALSE) {
  if (!is.null(subor)) png(subor, width = 2000, height = 1600, res = 200)
  stare_par <- par(no.readonly = TRUE)
  on.exit({
    par(stare_par)
    if (!is.null(subor)) dev.off()
  })
  par(mfrow = c(1, 1), mar = c(6.5, 5, 4.5, 1.5),
      mgp = c(2.6, 0.8, 0), family = "sans", las = 1)
  x <- median_sk_body$zmena_pomeru_median_pb
  y <- median_sk_body$zmena_zamestnanosti_pb
  x_znacky <- pretty(range(c(0, x)), n = 6)
  y_znacky <- pretty(range(c(0, y)), n = 6)
  x_lim <- range(x_znacky) + c(-1, 1) * diff(range(x_znacky)) * 0.10
  y_lim <- range(y_znacky) + c(-1, 1) * diff(range(y_znacky)) * 0.10
  plot(x, y, type = "n", xlim = x_lim, ylim = y_lim, xaxt = "n", yaxt = "n",
       xlab = "Medziročná zmena pomeru minima k mediánu (p. b.)",
       ylab = "Medziročná zmena miery zamestnanosti (p. b.)", bty = "l")
  abline(v = x_znacky, h = y_znacky, col = "#E5E9ED", lwd = 0.8)
  abline(v = 0, h = 0, col = "#707A84", lty = 2)
  axis(1, at = x_znacky)
  axis(2, at = y_znacky)
  if (regresia) {
    fit <- lm(y ~ x, data = data.frame(x = x, y = y), na.action = na.fail)
    x_konce <- range(x)
    lines(x_konce, predict(fit, newdata = data.frame(x = x_konce)),
          col = "#9C4B28", lwd = 2)
    mtext(sprintf("OLS: b = %.3f | r = %.3f", coef(fit)[[2]],
                  cor(x, y, use = "all.obs")),
          side = 3, line = 0.05, cex = 0.8, col = "#9C4B28")
  }
  points(x, y, pch = 16, col = "#245A81", cex = 1)
  rozmiestni_rocne_popisky(x, y, labels = median_sk_body$rok,
                          cex = 0.9, col = "#245A81")
  mtext("Slovensko: pomer minima k mediánu a zamestnanosť", side = 3,
        line = 2.4, cex = 1.15, font = 2)
  mtext("Súbežné zmeny | Vek 20–64, ISCED 0–2, obe pohlavia | n = 14",
        side = 3, line = 1, cex = 0.85)
  mtext("Rok pri bode: koniec intervalu t−1 → t. Zmena 2010→2011 vynechaná pre zlom zamestnanosti.",
        side = 1, line = 4.4, cex = 0.7)
  mtext("Zdroj: Eurostat earn_mw_avgr2 (B–S), lfsi_educ_a. Exporty 24.–25. 10. 2026. Vlastné výpočty.",
        side = 1, line = 5.5, cex = 0.7)
}

if (interactive() && !identical(getOption("v4.automaticke_grafy"), FALSE)) vykresli_median_sk()
message("Kontroly mediánového doplnku prešli: 14 súbežných párov za Slovensko. Funkcia vykresli_median_sk() je pripravená.")
