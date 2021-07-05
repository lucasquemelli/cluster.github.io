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

Após a inserção do código de agrupamento, os grupos em cada variáveis foram organizados e exibidos na seção ‘adicionar clusters nas observações’. Os grupos com seus respectivos valores médios podem ser vistos abaixo:

![image](https://user-images.githubusercontent.com/81119854/124512217-39480000-ddae-11eb-8c60-7b77ea4fcb77.png)



