# 📊 Projeto de Análise de Wine Quality

[![R ≥ 4.0](https://img.shields.io/badge/R-%3E%3D4.0-blue)](#) [![Pacotes](https://img.shields.io/badge/pacotes-tidyverse%20%7C%20ggplot2-lightgrey)](#)

---

## 🎯 Objetivo  
Analisar a relação entre teor alcoólico (`alcohol`) e nota de qualidade (`quality`) no dataset **winequality-red.csv**, aplicando:

- **Pré-processamento** de dados  
- **Estatística descritiva**  
- **Visualização** (histogramas, boxplots, densidade)  
- **Teste de correlação** de Pearson  
- **Teste de normalidade** (Shapiro-Wilk)  

---

## 🗂️ Estrutura do Repositório  
```text
├── winequality-red.csv       # Dataset original
├── analysis_script.R         # Script completo em R
├── analise_wine.Rmd          # R Markdown (geração de PPTX)
├── figures/                  # Gráficos gerados (.png)
│   ├── histogram_alcohol.png
│   ├── histogram_quality.png
│   ├── boxplot_alcohol.png
│   ├── boxplot_quality.png
│   ├── density_hist_alcohol.png
│   └── density_hist_quality.png
└── README.md                 # Este documento
```

---

## ⚙️ Pré-requisitos  
- **R** versão ≥ 4.0  
- Pacotes R:  
  - `tidyverse`  
  - `readr`  
  - `ggplot2`  
  - `rmarkdown` / `knitr`

Instale com:
```r
install.packages(c(
  "tidyverse",
  "readr",
  "ggplot2",
  "rmarkdown"
))
```

---

## 📥 1. Carregamento e Limpeza  
```r
# 1.1 Carregar dados
df <- readr::read_csv("winequality-red.csv")

# 1.2 Remover duplicatas
df <- dplyr::distinct(df)

# 1.3 Tratar valores ausentes
df <- tidyr::drop_na(df, alcohol, quality)

# 1.4 Verificar contagem antes/depois
cat("Linhas após limpeza:", nrow(df), "\n")
```

---

## 🧮 2. Estatística Descritiva  
Calcular média, variância, desvio-padrão e mediana:
```r
stats <- df %>%
  summarise(
    mean_x = mean(alcohol),
    var_x  = var(alcohol),
    sd_x   = sd(alcohol),
    med_x  = median(alcohol),
    mean_y = mean(quality),
    var_y  = var(quality),
    sd_y   = sd(quality),
    med_y  = median(quality)
  )
print(stats)
```

---

## 📈 3. Visualizações  

| Tipo                  | Comando ggplot2                                       | Arquivo gerado                       |
|-----------------------|-------------------------------------------------------|--------------------------------------|
| Histograma `alcohol`  | `geom_histogram(bins = 30)`                           | `figures/histogram_alcohol.png`      |
| Histograma `quality`  | `geom_histogram(bins = 7)`                            | `figures/histogram_quality.png`      |
| Boxplot `alcohol`     | `geom_boxplot()`                                      | `figures/boxplot_alcohol.png`        |
| Boxplot `quality`     | `geom_boxplot()`                                      | `figures/boxplot_quality.png`        |
| Hist.+Densidade       | `geom_histogram(aes(y=..density..)) + geom_density()` | `figures/density_hist_alcohol.png`   |
| Hist.+Densidade       | `geom_histogram(aes(y=..density..)) + geom_density()` | `figures/density_hist_quality.png`   |

---

## 📊 4. Correlação  
```r
corr <- cor(df$alcohol, df$quality, method = "pearson")
cat("Coeficiente de correlação (Pearson):", round(corr, 3), "\n")
```
- **Interpretação**:  
  - +1 → correlação positiva perfeita  
  - –1 → correlação negativa perfeita  
  - 0  → sem correlação linear

---

## 🧪 5. Teste de Normalidade  
```r
sh_x <- stats::shapiro.test(df$alcohol)
sh_y <- stats::shapiro.test(df$quality)
cat("Alcohol: W =", round(sh_x$statistic,3), "p =", round(sh_x$p.value,3), "\n")
cat("Quality: W =", round(sh_y$statistic,3), "p =", round(sh_y$p.value,3), "\n")
```
- **Hipótese nula**: dados seguem distribuição normal.  
- **p-valor < 0.05** ⇒ rejeita normalidade.


---

## 🔍 6. Conclusão  
- **Achados principais**:  
  - Estatísticas centrais das variáveis.  
  - Correlação entre teor alcoólico e qualidade.  
  - Resultados do teste de normalidade.

- **Limitações**:  
  - Análise restrita a 2 variáveis.  
  - Possível viés no conjunto de dados.


## 📚 Referências  
- **UCI ML Repository** – Wine Quality Dataset  
- **tidyverse**, **ggplot2**, **rmarkdown** documentation  
- Shapiro, S.S. & Wilk, M.B. (1965). An analysis of variance test for normality.
