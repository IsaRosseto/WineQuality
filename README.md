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
# 📦 Carregando pacotes necessários
library(ggplot2)
library(dplyr)
library(MASS)

# 📂 Importando o dataset
dados <- read.csv("mtcars.csv")  # Certifique-se que o arquivo esteja no mesmo diretório do script

# 🎯 Definindo variáveis
x <- dados$wt
y <- dados$mpg

# 📊 Estatísticas descritivas
calcular_estatisticas <- function(v) {
  list(
    media = mean(v),
    variancia = var(v),
    desvio_padrao = sd(v),
    mediana = median(v)
  )
}

cat("🔹 Estatísticas para x (wt):\n")
print(calcular_estatisticas(x))

cat("\n🔸 Estatísticas para y (mpg):\n")
print(calcular_estatisticas(y))

# 📈 Histogramas
ggplot(data.frame(x), aes(x = x)) +
  geom_histogram(bins = 15, fill = "#2563EB", alpha = 0.6) +
  ggtitle("Histograma do Peso (wt)") +
  xlab("Peso (wt)") + ylab("Frequência") +
  theme_minimal()

ggplot(data.frame(y), aes(x = y)) +
  geom_histogram(bins = 15, fill = "#DC2626", alpha = 0.6) +
  ggtitle("Histograma do Consumo (mpg)") +
  xlab("Consumo (mpg)") + ylab("Frequência") +
  theme_minimal()

# 📦 Boxplots
ggplot(data.frame(x), aes(y = x)) +
  geom_boxplot(fill = "#2563EB", alpha = 0.5) +
  ggtitle("Boxplot do Peso (wt)") +
  ylab("Peso (wt)") +
  theme_minimal()

ggplot(data.frame(y), aes(y = y)) +
  geom_boxplot(fill = "#DC2626", alpha = 0.5) +
  ggtitle("Boxplot do Consumo (mpg)") +
  ylab("Consumo (mpg)") +
  theme_minimal()

# 🔁 Correlação
correlacao <- cor(x, y)
cat("\n🔗 Correlação entre Peso e Consumo:", correlacao, "\n")

# 🧪 Teste de normalidade (Shapiro-Wilk)
cat("\n📊 Teste de normalidade:\n")
cat("Peso (wt): p-value =", shapiro.test(x)$p.value, "\n")
cat("Consumo (mpg): p-value =", shapiro.test(y)$p.value, "\n")

# 🧩 Densidade + Histograma
ggplot(data.frame(x), aes(x = x)) +
  geom_histogram(aes(y = after_stat(density)), bins = 15, fill = "#60A5FA", alpha = 0.4) +
  geom_density(color = "black", linewidth = 1) +
  ggtitle("Densidade + Histograma de Peso (wt)") +
  xlab("Peso (wt)") + ylab("Densidade") +
  theme_minimal()

ggplot(data.frame(y), aes(x = y)) +
  geom_histogram(aes(y = after_stat(density)), bins = 15, fill = "#F87171", alpha = 0.4) +
  geom_density(color = "black", linewidth = 1) +
  ggtitle("Densidade + Histograma de Consumo (mpg)") +
  xlab("Consumo (mpg)") + ylab("Densidade") +
  theme_minimal()
