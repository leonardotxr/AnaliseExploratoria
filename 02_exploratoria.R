# 02_exploratoria.R
# Autor: Leonardo Teixeira
# Objetivo: Calcular medidas de tendência central e dispersão

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

# Variáveis numéricas
vars <- c("idade", "tempo_preso", "score_periculosidade")

# 3: Medidas de tendência central e dispersão 
resumo <- df %>%
  summarise(across(all_of(vars),
                   list(media = ~mean(., na.rm=TRUE),
                        q1 = ~quantile(., 0.25, na.rm=TRUE),
                        mediana = ~median(., na.rm=TRUE),
                        q3 = ~quantile(., 0.75, na.rm=TRUE),
                        variancia = ~var(., na.rm=TRUE),
                        dp = ~sd(., na.rm=TRUE),
                        amplitude = ~(max(., na.rm=TRUE) - min(., na.rm=TRUE)))))

print(resumo)

# 4: Gráfico de dispersão e correlação 
ggplot(df, aes(x = tempo_preso, y = score_periculosidade)) +
  geom_point(alpha = 0.6) +
  labs(title = "Dispersão: Tempo Preso vs Score de Periculosidade",
       x = "Tempo Preso", y = "Score de Periculosidade")
if(!dir.exists("figs")) dir.create("figs")
ggsave("figs/disp_tempo_vs_score.png", width = 7, height = 5)

# Correlação
cor_val <- cor(df$tempo_preso, df$score_periculosidade, use = "complete.obs")
cat("Correlação (Pearson) entre tempo_preso e score_periculosidade:", cor_val, "\n")
