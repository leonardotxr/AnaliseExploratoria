# Análise Exploratória de Dados em R
## Autor - Leonardo Teixeira
## Disciplina - Prática Estatística 2
---

## Estrutura do Repositório
- `Base_trabalho.xlsx` → Base de dados principal  
- `dicionario_Base_trabalho.xlsx` → Dicionário de variáveis  
- `01_graficos.R` → scrpit dos gráficos   
- `02_exploratoria.R` → scrpit da análise exploratória, incluindo as medidas de tendência central, dispersão e correlação  
- `figuras/` → Pasta com os gráficos gerados 

---

## Texto com a descrição dos resultados gráficos obtidos

- **Histograma da Idade:** Mostra a distribuição das idades dos indivíduos. Com esse gráfico podemos observar que a maioria das pessoas do estudo tem idade concentrada entre 30 e 55 anos 
- **Boxplot do Tempo Preso:** Mostra a mediana, quartis e os outliers da variável tempo preso. Com esse gráfico podemos observar que o tempo preso das pessoas do estudo se concentram entre 45 e 55 meses, como podemos ver nos limites do "retângulo" do boxplot, que representam o primeiro e terceiro quartil, com a mediana centralizada em 60 meses.  
- **Boxplot do Score de periculosidade por Escolaridade:** Indica variação da periculosidade conforme o nível educacional (Fundamental, Médio, Superior). Analisando os gráficos gerados, podemos observar que é quase inexistente uma diferença no tempo de prisao em relação ao nível de escolaridade fundamental e médio, e uma pequena diferença do nível superior em relação aos outros, indicando que nível de escolaridade não é uma variável que interfira tanto no tempo preso, ou seja, não tem tanta relação.
- **Gráfico de Barras Reincidente:** Indica a frequência de reincidentes (Sim/Não). Com o gráfico de barras gerado, podemos analisar uma grande diferença entre o número de pessoas no nosso estudo que são reincidentes e as que não são, onde no caso existem muito mais pessoas que não são reincidentes na base, do que pessoas que são.  
- **Dispersão Tempo Preso vs Periculosidade:** Relação linear entre tempo preso e score de periculosidade, com linha de tendência. Analisando o gráfico de dispersão gerado, fica evidente a percepção de que há uma relação linear forte entre o tempo preso e o nível de periculosidade (quanto maior mais perigoso, de acordo com dicionário), ou seja, não é errado afirmar que quanto mais tempo de prisão a pessoa tem, maior seu nível de periculosidade, ou seja, mais perigosa ela é.

---

## Medidas de tendência central e dispersão e suas definições

As medidas calculadas foram:

| Medida | Definição |
|--------|------------|
| **Média** | Soma dos valores dividida pelo número de observações:  \(\bar{x} = \frac{\sum x_i}{n}\) |
| **Mediana** | Valor central que divide os dados em duas metades iguais. |
| **Primeiro Quartil (Q1)** | Valor que separa os 25% menores dados. |
| **Terceiro Quartil (Q3)** | Valor que separa os 25% maiores dados. |
| **Variância** | Mede a dispersão dos dados em relação à média:  \(s^2 = \frac{\sum (x_i - \bar{x})^2}{n-1}\) |
| **Desvio Padrão** | Raiz quadrada da variância, mede a dispersão na mesma unidade da variável. |
| **Amplitude** | Diferença entre o maior e o menor valor da amostra:  \(A = \max(x) - \min(x)\) |
| **Correlação de Pearson** | Mede a intensidade e direção da relação linear entre duas variáveis. |

---

