# 01_graficos.R
# Autor: Leonardo Teixeira
# Objetivo: gerar gráficos solicitados e salvar em pasta "figuras"

# Definindo diretório onde se encontram as bases:
setwd("C:/Users/Revia/Documents/AnaliseExploratoria")

library(readxl)
library(dplyr)
library(ggplot2)
library(janitor)

# 1: Importando a base 
df <- read_excel("Base_trabalho.xlsx") %>% 
  janitor::clean_names()

# 2: Transformando as variáveis de texto em fatores 
df <- df %>% mutate(across(where(is.character), as.factor))

# 3: Checando dados faltantes 
faltantes <- df %>% summarise(across(everything(), ~sum(is.na(.))))
print(faltantes)

# 4: Criando pasta para salvar as figuras 
if(!dir.exists("figuras")) dir.create("figuras")

# 5: Gráficos

## Histograma da idade
ggplot(df, aes(x = idade)) +
  geom_histogram(bins = 30, fill = "steelblue") +
  labs(title = "Histograma da Idade", x = "Idade", y = "Frequência")
ggsave("figuras/hist_idade.png", width = 7, height = 5)

## Boxplot do tempo preso
ggplot(df, aes(x = "", y = tempo_preso)) +
  geom_boxplot(fill = "orange", width = 0.3, outlier.color = "red") +
  labs(title = "Distribuição do Tempo Preso",
       x = NULL,
       y = "Tempo Preso (meses)") +
  theme_minimal()
ggsave("figuras/box_tempo_preso.png", width = 6, height = 5)

## Boxplot periculosidade por escolaridade
df <- df %>%
  mutate(escolaridade = factor(escolaridade,
                               levels = c(1, 2, 3),
                               labels = c("Fundamental", "Médio", "Superior")))

ggplot(df, aes(x = escolaridade, y = score_periculosidade)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Score por Escolaridade", 
       x = "Escolaridade", 
       y = "Score de Periculosidade") +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))
ggsave("figuras/box_periculosidade_por_escolaridade.png", width = 8, height = 5)

## Gráfico de barras para reincidente
df <- df %>%
  mutate(reincidente = factor(reincidente,
                              levels = c(0, 1),
                              labels = c("Não", "Sim")))

ggplot(df, aes(x = reincidente)) +
  geom_bar(fill = "tomato") +
  labs(title = "Frequência de Reincidentes", 
       x = "Reincidente", 
       y = "Contagem") +
  theme_minimal()
ggsave("figuras/bar_reincidente.png", width = 6, height = 5)
