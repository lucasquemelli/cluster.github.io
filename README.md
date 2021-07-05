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




