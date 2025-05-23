# 🍷 Análise de Qualidade de Vinhos Tintos

![Linguagem](https://img.shields.io/badge/Linguagem-R-blue.svg)
![Licença](https://img.shields.io/badge/Licen%C3%A7a-MIT-green.svg)

## 📜 Sobre o Projeto

Este projeto realiza uma análise estatística exploratória sobre um conjunto de dados de vinhos tintos portugueses. O principal objetivo é investigar a relação entre as características físico-químicas dos vinhos, com foco no **teor alcoólico (X)**, e a sua **nota de qualidade sensorial (Y)**, que é atribuída por especialistas.

A análise busca responder à pergunta: "Vinhos com maior teor alcoólico tendem a receber melhores avaliações de qualidade?".

## 🍷 Dataset

O conjunto de dados utilizado é o `winequality-red.csv`, que contém 1.599 observações e 12 variáveis sobre amostras de vinhos tintos da região do Vinho Verde, em Portugal. 

## 📊 Análises Realizadas

O projeto foi desenvolvido em R e seguiu as seguintes etapas:

* **Pré-processamento dos Dados:** Limpeza do dataset com a remoção de linhas duplicadas e valores ausentes (NA), resultando em um conjunto de dados final com 1.359 observações. 
* **Estatísticas Descritivas:** Cálculo de média, variância, desvio padrão e mediana para as variáveis de interesse (`alcohol` e `quality`). 
* **Visualização de Dados:**
    * Criação de **Histogramas** para visualizar a distribuição de frequência de cada variável.
    * Geração de **Boxplots** para identificar a mediana, os quartis e os outliers.
    * Desenvolvimento de gráficos de **Densidade** sobrepostos aos histogramas para uma melhor visualização da forma da distribuição.
* **Análise de Correlação:** Cálculo do coeficiente de **Correlação de Pearson** para medir a força e a direção da relação linear entre teor alcoólico e qualidade.
* **Teste de Hipóteses:** Aplicação do **Teste de Normalidade de Shapiro-Wilk** para verificar se as variáveis seguem uma distribuição normal.

## 🛠️ Tecnologias Utilizadas

* **Linguagem de Programação:** **R**
* **Bibliotecas Principais:**
    * **`dplyr`**: Para manipulação e limpeza de dados.
    * **`readr`**: Para importação do arquivo `.csv`.
    * **`ggplot2`**: Para a criação de todas as visualizações de dados.

## 📈 Principais Resultados

* Existe uma **correlação positiva moderada** entre o teor alcoólico e a qualidade do vinho, com um coeficiente de Pearson de aproximadamente **0.48**.  Isso sugere que, em geral, vinhos com mais álcool tendem a receber notas maiores.
* A distribuição de qualidade não é normal; ela é **bimodal**, com picos claros nas notas **5 e 6**. Isso indica uma forte concentração de vinhos considerados "medianos".
* O **Teste de Normalidade de Shapiro-Wilk** confirmou que nem a variável `alcohol` nem a `quality` seguem uma distribuição normal (p-valor = 0 para ambas).
* A maioria dos vinhos analisados possui um teor alcoólico entre **9% e 11%** e uma nota de qualidade entre **5 e 7**.

## ✒️ Autores

* [Isabella Vieira Silva Rosseto] 
* [Gustavo Bertoluzzi Cardoso] 

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.
