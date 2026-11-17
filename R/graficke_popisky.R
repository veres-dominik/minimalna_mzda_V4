# Spoločná grafická pomôcka pre skripty 06 a 07; nepoužíva ďalší balíček.
# Presúva iba text. Súradnice dátových bodov, vzorky a regresie nemení.
# Rozmery písma meria na aktuálnom zariadení po vytvorení panelu.
rozmiestni_rocne_popisky <- function(x, y, labels, cex = 0.95, col = "#245A81") {
  labels <- as.character(labels)
  n <- length(x)
  stopifnot(n > 0, length(y) == n, length(labels) == n,
            all(is.finite(x)), all(is.finite(y)), !anyNA(labels))
  rozsah <- par("usr")
  sirka_os <- diff(rozsah[1:2])
  vyska_os <- diff(rozsah[3:4])
  px <- (x - rozsah[1]) / sirka_os
  py <- (y - rozsah[3]) / vyska_os
  sirka <- 1.10 * strwidth(labels, cex = cex) / sirka_os
  vyska <- 1.25 * strheight(labels, cex = cex) / vyska_os
  smery <- rbind(c(1, 0), c(-1, 0), c(0, 1), c(0, -1),
                 c(1, 1), c(-1, 1), c(1, -1), c(-1, -1))
  polohy <- matrix(NA_real_, nrow = n, ncol = 2)
  obsadene <- matrix(numeric(0), nrow = 0, ncol = 4)

  # Pre každý rok skúsi blízke polohy a potom väčšie odstupy.
  # Prednosť má poloha bez prekryvu textov a bez zakrytia ďalších bodov.
  for (i in seq_len(n)) {
    kandidati <- do.call(rbind, lapply(1:6, function(odstup) {
      cbind(px[i] + smery[, 1] * (sirka[i] / 2 + 0.018) * odstup,
            py[i] + smery[, 2] * (vyska[i] / 2 + 0.018) * odstup)
    }))
    kandidati[, 1] <- pmax(0.015 + sirka[i] / 2,
                           pmin(0.985 - sirka[i] / 2, kandidati[, 1]))
    kandidati[, 2] <- pmax(0.015 + vyska[i] / 2,
                           pmin(0.985 - vyska[i] / 2, kandidati[, 2]))
    ramce <- cbind(kandidati[, 1] - sirka[i] / 2,
                   kandidati[, 1] + sirka[i] / 2,
                   kandidati[, 2] - vyska[i] / 2,
                   kandidati[, 2] + vyska[i] / 2)
    skore <- sqrt((kandidati[, 1] - px[i])^2 + (kandidati[, 2] - py[i])^2)
    for (j in seq_len(nrow(kandidati))) {
      r <- ramce[j, ]
      if (nrow(obsadene) > 0) {
        skore[j] <- skore[j] + 1000 * sum(
          r[1] < obsadene[, 2] + 0.014 & r[2] > obsadene[, 1] - 0.014 &
          r[3] < obsadene[, 4] + 0.014 & r[4] > obsadene[, 3] - 0.014)
      }
      skore[j] <- skore[j] + 100 * sum(
        px >= r[1] - 0.006 & px <= r[2] + 0.006 &
        py >= r[3] - 0.009 & py <= r[4] + 0.009)
    }
    vyber <- which.min(skore)
    polohy[i, ] <- kandidati[vyber, ]
    obsadene <- rbind(obsadene, ramce[vyber, ])
  }

  # Odsunutý text spojí s bodom, aby zostalo jasné, ktorému roku patrí.
  dx <- polohy[, 1] - px
  dy <- polohy[, 2] - py
  spojit <- abs(dx) > sirka / 2 + 0.02 | abs(dy) > vyska / 2 + 0.02
  for (i in which(spojit)) {
    mierka <- max(abs(dx[i]) / (sirka[i] / 2), abs(dy[i]) / (vyska[i] / 2))
    segments(x[i], y[i],
             rozsah[1] + (polohy[i, 1] - dx[i] / mierka) * sirka_os,
             rozsah[3] + (polohy[i, 2] - dy[i] / mierka) * vyska_os,
             col = "#7E8A95", lwd = 1)
  }
  text(rozsah[1] + polohy[, 1] * sirka_os,
       rozsah[3] + polohy[, 2] * vyska_os,
       labels = labels, adj = c(0.5, 0.5), cex = cex, col = col)
  invisible(polohy)
}
