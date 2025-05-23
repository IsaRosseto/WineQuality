# ===============================
# 📦 CARREGANDO PACOTES
# ===============================
# Verifica e instala pacotes necessários
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("dplyr"))  install.packages("dplyr")
if (!require("readr"))  install.packages("readr")

# Carrega as bibliotecas
library(ggplot2)
library(dplyr)
library(readr)

# ===============================
# 📂 IMPORTAR DADOS
# ===============================
# Lê o dataset CSV
dados <- read.csv("winequality-red.csv")

# ===============================
# ✨ PRÉ-PROCESSAMENTO 
# ===============================
# Mostra o número de linhas antes da limpeza
cat("Número de linhas ANTES da limpeza:", nrow(dados), "\n")

# 1. Remove linhas duplicadas
dados <- distinct(dados)

# 2. Remove linhas com valores faltantes (NA)
dados <- na.omit(dados)

# Mostra o número de linhas após a limpeza para verificação
cat("Número de linhas DEPOIS da limpeza:", nrow(dados), "\n\n")

# ===============================
# 🎯 DEFINIR VARIÁVEIS A PARTIR DOS DADOS LIMPOS
# ===============================
# Define as variáveis de interesse
x <- dados$alcohol   # Teor alcoólico
y <- dados$quality    # Nota de qualidade

# ===============================
# 🧮 ESTATÍSTICAS DESCRITIVAS
# ===============================
cat("📊 Estatísticas descritivas:\n\n")

# Função para imprimir medidas básicas
estatisticas <- function(nome, v) {
  cat(paste0("▶ ", nome, "\n"))
  cat("  • Média:         ", round(mean(v), 3), "\n")
  cat("  • Variância:     ", round(var(v), 3), "\n")
  cat("  • Desvio Padrão: ", round(sd(v), 3), "\n")
  cat("  • Mediana:       ", round(median(v), 3), "\n\n")
}

# Executa para alcohol e quality
estatisticas("Teor Alcoólico (alcohol)", x)
estatisticas("Qualidade (quality)", y)

# ===============================
# 📈 HISTOGRAMAS
# ===============================
# Histograma de 'alcohol'
grafico_hist_x <- ggplot(dados, aes(x = alcohol)) +
  geom_histogram(bins = 30, fill = "#2563EB", alpha = 0.7, color = "white") +
  ggtitle("Histograma: Teor Alcoólico") +
  xlab("Alcohol") + ylab("Frequência") +
  theme_minimal()

# Histograma de 'quality'
grafico_hist_y <- ggplot(dados, aes(x = quality)) +
  geom_histogram(bins = 7, fill = "#DC2626", alpha = 0.7, color = "white") +
  ggtitle("Histograma: Qualidade") +
  xlab("Quality") + ylab("Frequência") +
  theme_minimal()

# Exibe histogramas
print(grafico_hist_x)
print(grafico_hist_y)

# ===============================
# 📦 BOXPLOTS
# ===============================
# Boxplot de 'alcohol'
grafico_box_x <- ggplot(dados, aes(x = "", y = alcohol)) +
  geom_boxplot(fill = "#60A5FA", alpha = 0.7) +
  ggtitle("Boxplot: Teor Alcoólico") +
  xlab("") +
  ylab("Alcohol") +
  theme_minimal()

# Boxplot de 'quality'
grafico_box_y <- ggplot(dados, aes(x = "", y = quality)) +
  geom_boxplot(fill = "#F87171", alpha = 0.7) +
  ggtitle("Boxplot: Qualidade") +
  xlab("") +
  ylab("Quality") +
  theme_minimal()

# Exibe boxplots
print(grafico_box_x)
print(grafico_box_y)

# ===============================
# 🔗 CORRELAÇÃO
# ===============================
# Calcula correlação de Pearson
correlacao <- cor(x, y, method = "pearson")
cat("🔗 Correlação de Pearson entre alcohol e quality:", round(correlacao, 4), "\n\n")

# ===============================
# 📊 GRÁFICO DE CORRELAÇÃO (SCATTER PLOT)
# ===============================
# Cria o gráfico de dispersão com uma linha de regressão linear

grafico_correlacao <- ggplot(dados, aes(x = alcohol, y = quality)) +
  geom_point(alpha = 0.3, color = "#4F46E5") +  # Pontos com transparência
  geom_smooth(method = "lm", se = TRUE, color = "black", fill = "#A5B4FC") + # Linha de tendência linear com intervalo de confiança
  ggtitle("Correlação entre Teor Alcoólico e Qualidade") +
  xlab("Teor Alcoólico (%)") +
  ylab("Nota de Qualidade (0 a 10)") +
  theme_minimal()

# Exibe o gráfico de correlação
print(grafico_correlacao)

# ===============================
# 🧪 TESTE DE NORMALIDADE
# ===============================
# Shapiro-Wilk para normalidade
shapiro_x <- shapiro.test(x)
shapiro_y <- shapiro.test(y)

cat("🧪 Teste de normalidade (Shapiro-Wilk):\n")
cat("  • Alcohol: p-valor =", round(shapiro_x$p.value, 4), "\n")
cat("  • Quality: p-valor =", round(shapiro_y$p.value, 4), "\n\n")

# ===============================
# 🎯 DENSIDADE + HISTOGRAMA
# ===============================
# Histograma + densidade de 'alcohol'
grafico_densidade_x <- ggplot(dados, aes(x = alcohol)) +
  geom_histogram(aes(y = after_stat(density)), bins = 30,
                 fill = "#60A5FA", alpha = 0.4, color = "white") +
  geom_density(color = "black", linewidth = 1.2) +
  ggtitle("Densidade + Histograma: Teor Alcoólico") +
  xlab("Alcohol") + ylab("Densidade") +
  theme_minimal()

# Histograma + densidade de 'quality'
grafico_densidade_y <- ggplot(dados, aes(x = quality)) +
  geom_histogram(aes(y = after_stat(density)), bins = 7,
                 fill = "#F87171", alpha = 0.4, color = "white") +
  geom_density(color = "black", linewidth = 1.2) +
  ggtitle("Densidade + Histograma: Qualidade") +
  xlab("Quality") + ylab("Densidade") +
  theme_minimal()

# Exibe gráficos de densidade
print(grafico_densidade_x)
print(grafico_densidade_y)
