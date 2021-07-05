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


