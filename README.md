# cluster.github.io
Este projeto é a aplicação da análise de cluster em correntes de uma planta química industrial. 

Inicialmente, foi feita a inserção da matriz de dados no R. Em seguida, foi retirada a coluna de horas.

![image](https://user-images.githubusercontent.com/81119854/124508980-5deca980-dda7-11eb-9799-795dad84ac25.png)

# Identificação e remoção de outliers Mahalanobis

![image](https://user-images.githubusercontent.com/81119854/124509062-9d1afa80-dda7-11eb-9ecb-d0b695175399.png)

# Padronização dos dados

Para a análise de cluster, a matriz de dados deve ser padronizada. O comando no R para padronizar a matriz de dados e para o cálculo da distância euclidiana está abaixo:

![image](https://user-images.githubusercontent.com/81119854/124509135-c8054e80-dda7-11eb-8eb4-ff8de93b8c4f.png)

# Clusterização hierárquica

Foi feita clusterização hierárquica para agrupar as observações em 4 grupos. O comando no R para a clusterização está presente abaixo. 

Foram testados 7 tipos de métodos, que podem ser vistos nas figuras abaixo (Dendrogramas das clusterizações hierárquicas). Apenas o método “ward.D2” não foi possível de ser utilizado.

![image](https://user-images.githubusercontent.com/81119854/124510031-634af380-dda9-11eb-9308-9800e731e3d1.png)
![image](https://user-images.githubusercontent.com/81119854/124510350-fd12a080-dda9-11eb-9406-dea1a740c596.png)

![image](https://user-images.githubusercontent.com/81119854/124510276-d6ed0080-dda9-11eb-8791-f47e1c9d87b1.png)


![image](https://user-images.githubusercontent.com/81119854/124510404-16b3e800-ddaa-11eb-99d0-266d583db877.png)
![image](https://user-images.githubusercontent.com/81119854/124510328-ef5d1b00-dda9-11eb-85fe-57a46847a86f.png)

![image](https://user-images.githubusercontent.com/81119854/124510833-0d774b00-ddab-11eb-989e-cc6020dacefe.png)
![image](https://user-images.githubusercontent.com/81119854/124510860-1ff18480-ddab-11eb-8e60-309182fa0082.png)

![image](https://user-images.githubusercontent.com/81119854/124510655-ace80e00-ddaa-11eb-9b93-4a81f96770fa.png)
![image](https://user-images.githubusercontent.com/81119854/124510697-c426fb80-ddaa-11eb-8bde-74e3e4a0fa0f.png)

![image](https://user-images.githubusercontent.com/81119854/124510933-41eb0700-ddab-11eb-9d66-65eb57392089.png)
![image](https://user-images.githubusercontent.com/81119854/124510950-4e6f5f80-ddab-11eb-824c-e665bf852445.png)

![image](https://user-images.githubusercontent.com/81119854/124510977-5fb86c00-ddab-11eb-9a8a-e799561ece97.png)
![image](https://user-images.githubusercontent.com/81119854/124511009-71017880-ddab-11eb-914a-85a7000043af.png)

![image](https://user-images.githubusercontent.com/81119854/124511029-7d85d100-ddab-11eb-877e-5f6585d2adc9.png)
![image](https://user-images.githubusercontent.com/81119854/124511074-97bfaf00-ddab-11eb-974a-5fb43e2d4a55.png)

A construção de dendrogramas para cada observação (para os períodos) não é interessante nesse caso porque, após a limpeza de dados, são gerados períodos de tempo
que não se relacionam, e a análise da combinação desses períodos se torna inapropriada por não conter sentido físico. 

O que pode ser concluído dessa análise é que determinados períodos possuem valores próximos das variáveis medidas. Contudo, ainda assim, muito não pode ser concluído já que a combinação traz períodos sequenciais como 2 e 3, 5 e 6, 14 e 15. 

Observações sequenciais em processos contínuos geralmente estão relacionadas (alta similaridade) se não há erro sistemático. Teria um sentido físico se, por exemplo, as observações fossem companhias diferentes (observação não contínua, diferentes conjuntos de dados).

Embora a análise hierárquica não seja a melhor opção para este caso, foram escolhidos 4 grupos finais, com o propósito de comparação entre os métodos de agrupamento hierárquico. Normalmente, a continuação dessa análise é feita até que haja o agrupamento de todos grupos menores em um só grupo maior. Assim, o número de grupos é definido, graficamente, por screeplot ou por critério pessoal do analista com base em seus conhecimentos do processo.

Ao comparar os dendrogramas da Figura 4, observa-se que os grupos selecionados por diferentes métodos, pelo critério de similaridade, são muito parecidos. Uma diferença que ocorreu foi no método de Ligação Singular (ou ligação única) que separou as observações de 32 ao 37 em dois grupos diferentes – essa sequência foi identificada como um único grupo nos demais métodos. Este resultado era esperado, porque esse método, às vezes, pode produzir clusters onde as observações em diferentes clusters estão mais próximas do que as observações em seus próprios clusters.

# Clusterização não-hierárquica

Para a clusterização não-hierárquica, é necessário estabelecer um número de grupos. O código para determinação do número de grupos está localizado na figura abaixo. O gráfico gerado pelo código está presente adiante.

![image](https://user-images.githubusercontent.com/81119854/124511708-27b22880-ddad-11eb-87cf-db5ef63ed139.png)
![image](https://user-images.githubusercontent.com/81119854/124511779-503a2280-ddad-11eb-90e2-d6becc4a0f20.png)

A determinação do número de grupos leva em consideração a variabilidade dentro dos grupos. A escolha é feita a partir de um número no gráfico que, após esse número, o aumento no número de cluster (grupos) não resulta em melhora significativa – representação pela reta tracejada, de cor vermelha, no valor de 400 para a soma dos quadrados dentro dos grupos. 

Pela figura, pode ser concluído que o número de grupos é 3. Assim, foi feita a seleção dos grupos utilizando a função kmeans no R. O código no programa R pode ser visto abaixo:

![image](https://user-images.githubusercontent.com/81119854/124511995-c3dc2f80-ddad-11eb-9fcc-be9eb03b43a0.png)

Para salvar os valores (do DataFrame) que foram exibidos no Console do RStudio em um arquivo csv, pode ser utilizado o seguinte comando no R:
write.csv2(dadosC.k,file="cluster_agrupados.csv",row.names=F)

Após a inserção do código de agrupamento, os grupos em cada variáveis foram organizados e exibidos na seção ‘adicionar clusters nas observações’. Os grupos com seus respectivos valores médios podem ser vistos abaixo:

![image](https://user-images.githubusercontent.com/81119854/124512217-39480000-ddae-11eb-8c60-7b77ea4fcb77.png)

Para visualizar todos os pontos dos grupos de todas as variáveis do processo foi utilizada a função plot para gerar os gráficos da relação de duas variáveis. No entanto, devido ao grande número de combinações, foram selecionados os gráficos com os melhores agrupamentos – alta distância entre os grupos e baixa distância entre os pontos do mesmo grupo. 

O Comando no R para geração dos gráficos pode ser visto abaixo:

![image](https://user-images.githubusercontent.com/81119854/124512416-ae1b3a00-ddae-11eb-9d84-116fb2640626.png)

Os gráficos formados podem ser vistos abaixo. O número de gráficos apresentados é 8, que corresponde aos melhores agrupamentos. Foram excluídos da exibição os grupos em que os pontos se sobrepunham, não sendo possível a identificação de uma região específica para definição do grupo. 

A ordem em que as relações são apresentada é da esquerda para a direita, começando no topo e indo até em baixo.

![image](https://user-images.githubusercontent.com/81119854/124512532-f9354d00-ddae-11eb-8f01-7fb41b286f1f.png)
![image](https://user-images.githubusercontent.com/81119854/124512547-05210f00-ddaf-11eb-942a-44c268c66c1f.png)
![image](https://user-images.githubusercontent.com/81119854/124512564-10743a80-ddaf-11eb-92b4-5edca7711bb4.png)
![image](https://user-images.githubusercontent.com/81119854/124512574-19650c00-ddaf-11eb-819f-5ad9702d8658.png)

# Análise das relações entre as variáveis

PI0102 (pressão no evaporador) – TI0201 (temperatura na entrada da câmara 1): esta relação tem sentido físico porque fazem partes de seções subsequentes e
pressão e temperatura são duas grandezas físicas diretamente proporcional, conforme Lei dos Gases (reais e ideais).

PI0102 (pressão no evaporador) – PI0216 (pressão na saída da serpentina 3): esta relação também tem sentido físico por se tratar de variáveis em seções subsequentes. É possível que a pressão de uma dada seção seja regulada a partir da pressão da seção anterior por causa do fluxo de gases entre essas seções.

FC0104 (vazão de ácido acético) – TI0201 (temperatura na entrada da câmara 1): esta relação também tem sentido físico porque a vazão de ácido acético é a variável que alimenta o processo e a temperatura na entrada da seção de clivagem é dependente da vazão de alimentação, isto é, quanto maior a vazão, maior a temperatura deve ser para iniciar o preparo do reagente para a temperatura de trabalho.

FC0104 (vazão de ácido acético) – TI0205 (temperatura na saída da câmara 1): esta relação tem sentido físico e está relacionada com o item anterior. A temperatura de saída da câmara 1 está diretamente relacionada com a temperatura de entrada na câmara 1 que, por sua vez, está relacionada com a vazão de ácido acético.

FC0104 (vazão de ácido acético) – PI0216 (pressão na saída da serpentina 3): esta relação tem sentido físico porque a vazão de ácido acético influencia a pressão de saída da seção de clivagem na tentativa de minimizar os produtos não condensáveis. Quanto maior a vazão de ácido acético, maior a possibilidade de produtos não condensáveis e maior deve ser a pressão para evitar que produtos gasosos sejam formados (Le Chatelier).

FC0108 (vazão de catalisador) – TI0201 (temperatura na entrada da câmara 1): embora o catalisador não seja consumido no processo, a sua presença é fundamental pra aumentar a taxa de reação química. Por isso, a vazão de catalisador deve influenciar a temperatura na entrada da seção de clivagem (reação) porque mesmo na ausência de catalisador, a temperatura é fundamental para promover uma reação por meio de energia de ativação. Isto é, deve ser fornecida uma quantidade limite de catalisador no processo para que a temperatura da reação seja minimizada.

TI0201 (temperatura na entrada da câmara 1) – PI0214 (pressão na saída da serpentina 1): a serpentina 1 está contida na câmara 1. Ambas estão contidas na seção
de clivagem. Pressão e temperatura estão diretamente relacionadas. Esta relação tem sentido físico.

TI0201 (temperatura na entrada da câmara 1) – PI0215 (pressão na saída da serpentina 2): ambas as variáveis estão contidas na etapa de reação, dentro dos reatores. A pressão na saída da serpentina 2 está relacionada com a pressão na saída da serpentina 1 que, por sua vez, tem influência da temperatura na entrada da câmara 1, como visto no item anterior.

# Agrupamento das variáveis

Ao final, as variáveis foram agrupadas em 4 grupos com distâncias similares. Os comandos para o agrupamento, para a geração do dendrograma e para o armazenamento da identificação dos grupos em uma variável (goups.var) podem ser vistos abaixo:

![image](https://user-images.githubusercontent.com/81119854/124513008-259d9900-ddb0-11eb-907d-74410e6e5785.png)
![image](https://user-images.githubusercontent.com/81119854/124513035-3948ff80-ddb0-11eb-9422-3a24a4c11196.png)

No primeiro grupo, foram agrupadas as variáveis da seção de clivagem (reação), a vazão de vapor no evaporador e variáveis de pressão e temperatura dos condensadores. Este agrupamento foi adequado porque relaciona variáveis em seções subsequentes e, por isso, relacionadas no processo. A seção de evaporação influencia a seção de reação que, por sua vez, influencia a seção dos condensadores.

No segundo grupo, foram agrupadas variáveis da seção de clivagem, a pressão que sai dos condensadores que está ligada à clivagem e uma temperatura no segundo trocador (seção de condensadores). As variáveis da clivagem e a pressão dos condensadores que está ligada à clivagem estão relacionadas e podem ser reunidas no mesmo grupo. Entretanto, temperatura no segundo trocador (TC0510) não aparenta ter sentido físico já que está no trocador intermediário, isto é, não é influenciada diretamente pelo grupo de clivagem e nem pela variável do condensador que está ligada à clivagem. Portanto, TC0510 parece não pertencer ao grupo em questão.

O terceiro grupo contém as seguintes variáveis: temperatura na entrada da câmara 3 (TI0204), temperatura na saída do trocador 1 (TC0508), temperatura na saída da serpentina 1 (TI0211) e vazão de gás natural (FI0446). Existem 3 variáveis que estão relacionadas por fazerem parte da seção de clivagem (TI0204, TI0211 e FI0446). A temperatura na saída do trocador 1 não tem relação direta, mas pode estar relacionada por fazer parte de uma seção subsequente.

Pode ser observado no quarto grupo que este é composto por dois grupos menores. O primeiro deles possui as vazões de ácido acético que sai dos condensadores e de anidrido acético. As duas vazões estão relacionadas porque fazem parte da mesma seção (absorção) e uma é diferença da outra, isto é, a quantidade de produto formado depende da quantidade de ácido acético que não foi convertido na seção de reação. O outro grupo menor é formado pelas vazões de ácido acético e de catalisador (na seção de evaporação), pela temperatura na saída do trocador 3 (relacionada com as vazões de ácido acético que sai dos condensadores e de anidrido acético), pelas pressões nas serpentinas 2 e 3 e pela pressão no evaporador. Este grupo é mais distinto e complexo do que os outros, mas quando visto com atenção, pode ser concluído que a pressão no evaporador influencia as pressões na seção de clivagem (serpentinas). Além disso, a vazão de ácido acético (entrada) no evaporador está relacionada tanto com a vazão de ácido acético (reagente não convertido) que sai dos condensadores quanto que a vazão de produto de anidrido formado (saída), porque a partir da primeira que se obtém as duas últimas.

