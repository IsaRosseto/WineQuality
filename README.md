# 📊 Projeto de Probabilidade e Estatística — Análise Bivariada com `mtcars`

## 🎯 Objetivo do Projeto

Este trabalho tem como finalidade aplicar conceitos de **estatística descritiva e inferencial** a partir de um conjunto de dados real, utilizando a linguagem de programação R. A análise envolve o cálculo de medidas estatísticas básicas, construção de gráficos, verificação de normalidade e interpretação da correlação entre duas variáveis.

---

## 📁 Dataset Utilizado

Utilizamos o clássico dataset `mtcars`, que contém dados sobre 32 modelos de veículos, com variáveis como número de cilindros, peso, potência, tipo de transmissão, entre outros.

---

## 🔢 Variáveis Analisadas

- **x = `wt`** — Peso do carro (em milhares de libras)
- **y = `mpg`** — Milhas por galão (eficiência de combustível)

Essa escolha foi feita por representar uma **relação prática e lógica**: veículos mais pesados tendem a consumir mais combustível, e isso é ideal para análise estatística com interpretação clara.

---

## 🧪 Análises Realizadas

### a) Estatísticas descritivas:
- Média, variância, desvio padrão e mediana de `x` e `y`.

### b) Histogramas:
- Frequência de distribuição de `wt` e `mpg`.

### c) Boxplots:
- Representação da dispersão e presença de outliers.

### d) Correlação:
- Correlação de Pearson entre `x` e `y`.

### e) Teste de normalidade:
- Teste de Shapiro-Wilk para ambas as variáveis.

### f) Densidade + histograma:
- Sobreposição da curva de densidade ao histograma.

---

## 💻 Código Completo (`analise_mtcars.R`)

```r
# ===============================
# 📦 CARREGANDO PACOTES
# ===============================
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("dplyr")) install.packages("dplyr")
if (!require("MASS")) install.packages("MASS")

library(ggplot2)
library(dplyr)
library(MASS)

# ===============================
# 📂 IMPORTAR DADOS
# ===============================
dados <- read.csv("mtcars.csv")  # Atualize o caminho se necessário
x <- dados$wt
y <- dados$mpg

# ===============================
# 🧮 ESTATÍSTICAS DESCRITIVAS
# ===============================
cat("📊 Estatísticas descritivas:\n\n")

estatisticas <- function(nome, v) {
  cat(paste0("▶ ", nome, "\n"))
  cat("  Média: ", mean(v), "\n")
  cat("  Variância: ", var(v), "\n")
  cat("  Desvio Padrão: ", sd(v), "\n")
  cat("  Mediana: ", median(v), "\n\n")
}

estatisticas("Peso (wt)", x)
estatisticas("Consumo (mpg)", y)

# ===============================
# 📈 HISTOGRAMAS
# ===============================
grafico_hist_x <- ggplot(data.frame(x), aes(x = x)) +
  geom_histogram(bins = 15, fill = "#2563EB", alpha = 0.7, color = "white") +
  ggtitle("Histograma: Peso do carro (wt)") +
  xlab("Peso (wt)") + ylab("Frequência") +
  theme_minimal()

grafico_hist_y <- ggplot(data.frame(y), aes(x = y)) +
  geom_histogram(bins = 15, fill = "#DC2626", alpha = 0.7, color = "white") +
  ggtitle("Histograma: Consumo de combustível (mpg)") +
  xlab("Consumo (mpg)") + ylab("Frequência") +
  theme_minimal()

print(grafico_hist_x)
print(grafico_hist_y)

# ===============================
# 📦 BOXPLOTS
# ===============================
grafico_box_x <- ggplot(data.frame(x), aes(y = x)) +
  geom_boxplot(fill = "#60A5FA", alpha = 0.7) +
  ggtitle("Boxplot: Peso do carro (wt)") +
  ylab("Peso (wt)") +
  theme_minimal()

grafico_box_y <- ggplot(data.frame(y), aes(y = y)) +
  geom_boxplot(fill = "#F87171", alpha = 0.7) +
  ggtitle("Boxplot: Consumo de combustível (mpg)") +
  ylab("Consumo (mpg)") +
  theme_minimal()

print(grafico_box_x)
print(grafico_box_y)

# ===============================
# 🔗 CORRELAÇÃO
# ===============================
correlacao <- cor(x, y)
cat("🔗 Correlação de Pearson entre wt e mpg:", round(correlacao, 4), "\n\n")

# ===============================
# 🧪 TESTE DE NORMALIDADE
# ===============================
shapiro_x <- shapiro.test(x)
shapiro_y <- shapiro.test(y)

cat("🧪 Teste de normalidade (Shapiro-Wilk):\n")
cat("  Peso (wt): p-valor =", round(shapiro_x$p.value, 4), "\n")
cat("  Consumo (mpg): p-valor =", round(shapiro_y$p.value, 4), "\n\n")

# ===============================
# 🎯 DENSIDADE + HISTOGRAMA
# ===============================
grafico_densidade_x <- ggplot(data.frame(x), aes(x = x)) +
  geom_histogram(aes(y = after_stat(density)), bins = 15, fill = "#60A5FA", alpha = 0.4, color = "white") +
  geom_density(color = "black", linewidth = 1.2) +
  ggtitle("Densidade + Histograma: Peso do carro (wt)") +
  xlab("Peso (wt)") + ylab("Densidade") +
  theme_minimal()

grafico_densidade_y <- ggplot(data.frame(y), aes(x = y)) +
  geom_histogram(aes(y = after_stat(density)), bins = 15, fill = "#F87171", alpha = 0.4, color = "white") +
  geom_density(color = "black", linewidth = 1.2) +
  ggtitle("Densidade + Histograma: Consumo (mpg)") +
  xlab("Consumo (mpg)") + ylab("Densidade") +
  theme_minimal()

print(grafico_densidade_x)
print(grafico_densidade_y)
