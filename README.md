## Projeto de Sinais e Sistemas

## Universidade Federal de Pernambuco - 2020.3

### Alunos:

* Pedro Henrique de A. Gomes
* [Vitor Mendes Carvalho](https://github.com/VitorMCarvalho)

### Professor:

* Gilson Jeronimo da Silva Junior

  

### Proposta do projeto: 

#### 		Detecção/remoção de ecos

* Um eco simples pode ser implementados digitalmente a partir de um sistema LIT em tempo discreto com resposta ao impulso 

  *h*[*n*] = *δ*[*n*] *− αδ*[*n − D*]*,*

   com *|α| <* 1 e *D* um número inteiro, sendo *T_s* o período de amostragem, o atraso é dado por *DT**s*. 

1. Grave um som de aproximadamente 2 segundos (voz falando alguma coisa), com uma taxa de amostragem de 22050 Hz. Aplique um sistema de eco com *α* = 0*.*9, e *D* variável. A partir de que valor de *D* é possível identificar o eco? (faça o experimento com diferentes indivíduos). Em seguida, diminua o valor de *α* até que o eco não seja mais perceptível. Faça um gráfico do limiar *α* e *D* para detecção do eco. 

2. Seja um sinal com *α* e *D* desconhecidos, a partir do processamento do sinal com eco, *y*[*n*], é possível determinar se existe eco ou não? Como? Considere *α* e *D* na região detectável pelo cérebro humano. (Sugestão: calcule *φ**yy*[*m*] em função de *φ**xx*[*m*]) 

3. Compute e plote *φ**yy*[*m*] para alguns ecos detectáveis e não detectáveis. Como é possível interpretar esses resultados? 

4. O sistema eco é inversível? Como poderia ser implemen tado? O sistema inverso é estável? Em que condições? Projete um algoritmo para obter *α* e *D* a partir de um sinal qualquer (se não existe eco, o algoritmo retorna eco indetectável), aplique isso nos exemplos de ecos de tectáveis e indetectáveis. Se possível, obtenha os sinais originais *x*[*n*] a partir de y[n]. 

5. Comente sobre como poderia ser abordado o problema de sinais com múltiplos ecos.

