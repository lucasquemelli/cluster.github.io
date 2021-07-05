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

