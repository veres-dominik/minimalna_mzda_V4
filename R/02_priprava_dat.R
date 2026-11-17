# Spúšťaj po R/01_import_eurostat.R, z koreňa projektu.
# Pripraví tabuľky trhu práce a mzdových pomerov a po kontrolách uloží CSV.
# Jeden riadok výsledku predstavuje krajinu v jednom roku.
# Objekty zamestnanost a nezamestnanost patria aktuálnemu výberu 20–64.
# Pôvodné výsledky 25–64 ostávajú v samostatne označených CSV.

# Pozičné skladanie vyžaduje rovnaké poradie krajín v hodnotách a značkách.
stopifnot(identical(
  nezamestnanost_import$krajina,
  nezamestnanost_znacky$krajina
))

roky <- 2010:2025

# Obe tabuľky vyberieme v rovnakom poradí rokov a rozbalíme po krajinách.
# Transpozícia t() zabezpečí, že nasledujú všetky roky jednej krajiny.
miery <- as.vector(t(as.matrix(
  nezamestnanost_import[, as.character(roky)]
)))

znacky <- as.vector(t(as.matrix(
  nezamestnanost_znacky[, as.character(roky)]
)))

# Každej hodnote priradíme krajinu, rok a príznak zlomu.
# miera_pct obsahuje percentá priamo: 39.4 znamená 39,4 %.
# FALSE znamená neprítomnosť značky b, nie záruku porovnateľnosti.
# Pôvodné označenia zostávajú v objekte nezamestnanost_znacky a raw XLSX.
nezamestnanost <- data.frame(
  krajina = rep(nezamestnanost_import$krajina, each = length(roky)),
  rok = rep(roky, times = nrow(nezamestnanost_import)),
  miera_pct = miery,
  znacka = !is.na(znacky) & znacky == "b"
)

# Rovnaký prevod pre zamestnanosť; značky berieme z jej vlastného importu.
stopifnot(identical(
  zamestnanost_import$krajina,
  zamestnanost_znacky$krajina
))

miery_zamestnanost <- as.vector(t(as.matrix(
  zamestnanost_import[, as.character(roky)]
)))

znacky_zamestnanost <- as.vector(t(as.matrix(
  zamestnanost_znacky[, as.character(roky)]
)))

zamestnanost <- data.frame(
  krajina = rep(zamestnanost_import$krajina, each = length(roky)),
  rok = rep(roky, times = nrow(zamestnanost_import)),
  miera_pct = miery_zamestnanost,
  znacka = !is.na(znacky_zamestnanost) & znacky_zamestnanost == "b"
)

# Mzdové pomery: rovnaký prevod, ale značky zostávajú textové (p alebo NA).
stopifnot(
  identical(minimalna_mzda_priemer_import$krajina,
            minimalna_mzda_priemer_znacky$krajina),
  identical(minimalna_mzda_median_sk_import$krajina,
            minimalna_mzda_median_sk_znacky$krajina)
)

# Rozbalenie po riadkoch zodpovedá poradiu krajín a rokov v rep().
pomery_priemer <- as.vector(t(as.matrix(
  minimalna_mzda_priemer_import[, as.character(roky)]
)))
znacky_priemer <- as.vector(t(as.matrix(
  minimalna_mzda_priemer_znacky[, as.character(roky)]
)))

minimalna_mzda_priemer <- data.frame(
  krajina = rep(minimalna_mzda_priemer_import$krajina, each = length(roky)),
  rok = rep(roky, times = nrow(minimalna_mzda_priemer_import)),
  pomer_pct = pomery_priemer,
  znacka = znacky_priemer
)

pomery_median_sk <- as.vector(t(as.matrix(
  minimalna_mzda_median_sk_import[, as.character(roky)]
)))
znacky_median_sk <- as.vector(t(as.matrix(
  minimalna_mzda_median_sk_znacky[, as.character(roky)]
)))

minimalna_mzda_median_sk <- data.frame(
  krajina = rep(minimalna_mzda_median_sk_import$krajina, each = length(roky)),
  rok = rep(roky, times = nrow(minimalna_mzda_median_sk_import)),
  pomer_pct = pomery_median_sk,
  znacka = znacky_median_sk
)

# Všetky tabuľky musia prejsť kontrolami ešte pred uložením.
source("R/03_kontroly_dat.R", encoding = "UTF-8")

# CSV používa desatinnú bodku, UTF-8 a nemá pomocný stĺpec čísel riadkov.
# Opätovné spustenie prepíše iba tieto spracované CSV, raw XLSX nemení.
dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)
write.csv(zamestnanost, "data/processed/zamestnanost_20_64.csv",
          row.names = FALSE, fileEncoding = "UTF-8")
write.csv(nezamestnanost, "data/processed/nezamestnanost_20_64.csv",
          row.names = FALSE, fileEncoding = "UTF-8")
write.csv(minimalna_mzda_priemer, "data/processed/minimalna_mzda_priemer.csv",
          row.names = FALSE, fileEncoding = "UTF-8")
write.csv(minimalna_mzda_median_sk, "data/processed/minimalna_mzda_median_sk.csv",
          row.names = FALSE, fileEncoding = "UTF-8")

message("Všetky štyri tabuľky boli uložené do data/processed/.")
