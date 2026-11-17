# Spúšťaj z koreňa projektu. Vyžaduje už nainštalovaný balíček readxl.
# Načíta hodnoty a pôvodné značky; súbory v data/raw nemení.
# Jeden riadok predstavuje krajinu, stĺpce obsahujú roky 2010–2025.
# Trh práce: opravené rady, vek 20–64, ISCED 0–2, obe pohlavia.

# Rozsah A13:Q16 vynecháva metodické informácie a riadok GEO (Labels).
zamestnanost_import <- readxl::read_excel(
  "data/raw/lfsi_educ_a_20_64_export.xlsx",
  sheet = "Sheet 1",
  range = "A13:Q16",
  col_names = c("krajina", as.character(2010:2025))
)

# Prázdne bunky značiek sa načítajú ako NA, teda bez označenia.
zamestnanost_znacky <- readxl::read_excel(
  "data/raw/lfsi_educ_a_20_64_export.xlsx",
  sheet = "Flags 1",
  range = "A13:Q16",
  col_names = c("krajina", as.character(2010:2025)),
  col_types = "text"
)

# Nezamestnanosť má v overenom exporte rovnaké rozloženie.
nezamestnanost_import <- readxl::read_excel(
  "data/raw/une_educ_a_20_64_export.xlsx",
  sheet = "Sheet 1",
  range = "A13:Q16",
  col_names = c("krajina", as.character(2010:2025))
)

nezamestnanost_znacky <- readxl::read_excel(
  "data/raw/une_educ_a_20_64_export.xlsx",
  sheet = "Flags 1",
  range = "A13:Q16",
  col_names = c("krajina", as.character(2010:2025)),
  col_types = "text"
)

# Pomer minima k priemeru v %, B–S, V4. Tento export má iné riadky než LFS.
minimalna_mzda_priemer_import <- readxl::read_excel(
  "data/raw/minimalna_mzda_priemer_export.xlsx",
  sheet = "Sheet 1",
  range = "A12:Q15",
  col_names = c("krajina", as.character(2010:2025))
)

# Zachová pôvodné p (predbežný údaj); prázdna bunka sa načíta ako NA.
minimalna_mzda_priemer_znacky <- readxl::read_excel(
  "data/raw/minimalna_mzda_priemer_export.xlsx",
  sheet = "Flags 1",
  range = "A12:Q15",
  col_names = c("krajina", as.character(2010:2025)),
  col_types = "text"
)

# Doplnkový pomer minima k mediánu v %, B–S: iba slovenský riadok.
minimalna_mzda_median_sk_import <- readxl::read_excel(
  "data/raw/minimalna_mzda_priemer_export.xlsx",
  sheet = "Sheet 2",
  range = "A15:Q15",
  col_names = c("krajina", as.character(2010:2025))
)

minimalna_mzda_median_sk_znacky <- readxl::read_excel(
  "data/raw/minimalna_mzda_priemer_export.xlsx",
  sheet = "Flags 2",
  range = "A15:Q15",
  col_names = c("krajina", as.character(2010:2025)),
  col_types = "text"
)

