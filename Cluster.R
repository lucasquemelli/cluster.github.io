library(readxl)
dados <- read_excel("R/dados.xlsx")
View(dados)

dados <- dados[,-c(1)]



## distância estatístia

x <- dados
y <- as.data.frame(mahalanobis(x, colMeans(x), cov(x)))
names(y)[1] = "Distancias"
y$Index = c(1:nrow(y))


alpha = 0.05
df <- ncol(x[,])
limite <- qchisq(1-alpha,df = df)
is_mv_outlier <- ifelse(y$Distancias > limite, "SIM", "NÃO")
x$Outliers <- is_mv_outlier
x = x[x$Outliers == "NÃO",]

x
summary(x)

x[29] = NULL

dados <- x



## padronização dos dados

dados_padronizados <- scale(dados)


## cálculo da distancia euclidiana

distancia_euclidiana <- dist(dados_padronizados, method = "euclidean")
print(distancia_euclidiana,digits = 2)





## Cluestering hierárquico 

hc.D <- hclust(distancia_euclidiana,method = "ward.D") 
names(hc.D)
plot(hc.D,hang = -1, cex=.5,main = "Dendograma - Ligação Ward", 
     ylab = "Distância")
rect.hclust(hc.D,h=30.0,border = "red")
groups.D <- cutree(hc.D,h=30.0)
dadosC.D <- cbind(dados,groups.D)

aggregate(dados_padronizados,list(groups.D),mean)


hc.DD <- hclust(distancia_euclidiana,method = "Ward.D2") 
names(hc.DD)
plot(hc.DD,hang = -1, cex=.5,main = "Dendograma - Ligação Ward D2", 
     ylab = "Distância")
rect.hclust(hc.DD,h=1.0,border = "red")
groups.DD <- cutree(hc.DD,h=1.0)
dadosC.DD <- cbind(dados,groups.D2)

aggregate(dados_padronizados,list(groups.DD),mean)

# Não funcionou



hc.S <- hclust(distancia_euclidiana,method = "single") 
names(hc.S)
plot(hc.S,hang = -1, cex=.5,main = "Dendograma - Ligação singular", 
     ylab = "Distância")
rect.hclust(hc.S,h=4.8,border = "red")
groups.S <- cutree(hc.S,h=4.8)
dadosC.S <- cbind(dados,groups.S)

aggregate(dados_padronizados,list(groups.S),mean)




hc.c <- hclust(distancia_euclidiana,method = "complete") 
names(hc.c)
plot(hc.c,hang = -1, cex=.5,main = "Dendograma - Ligação completa", 
     ylab = "Distância")
rect.hclust(hc.c,h=9.0,border = "red")
groups.c <- cutree(hc.c,h=9.0)
dadosC.c <- cbind(dados,groups.c)

aggregate(dados_padronizados,list(groups.c),mean)




hc.med <- hclust(distancia_euclidiana,method = "average") 
names(hc.med)
plot(hc.med,hang = -1, cex=.5,main = "Dendograma - Ligação média", 
     ylab = "Distância")
rect.hclust(hc.med,h=7.0,border = "red")

# A construção de dendograma para cada observação (períodos)
# não é interessante nesse caso porque após a 
# limpeza de dados, são gerados períodos de tempo
# que não se relacionam, e a análise da combinação 
# desses períodos se torna inapropriada por não 
# conter sentido físico
# o que pode ser concluído dessa análise é que determinados períodos possuem valores próximos das variáveis medidas
# contudo, mesmo assim muito não pode ser concluído já que a combinação traz períodos sequenciais
# como 2 e 3, 5 e 6, 14 e 15.
# Observações sequenciais em processos contínuos geralmente estão relacionadas (alta similaridade) se não há erro sistemático ou correção do erro
# Teria um sentido físico se, por exemplo, as observações fossem companias diferentes (observação não contínua)
# A continuação dessa análise é feita até que haja o agrupamento de todos grupos menores em um só grupo maior

groups.med <- cutree(hc.med,h=7.0)
dadosC.med <- cbind(dados,groups.med)

aggregate(dados_padronizados,list(groups.med),mean)

# a clusterização hierárquica não é muito eficiente ao se analisar
# observações de um processo contínuo por dendograma
# No entanto, quando utilizada graficamente para comparar a relação entre
# as variáveis, esse método se torna eficiente.



hc.mc <- hclust(distancia_euclidiana,method = "mcquitty") 
names(hc.mc)
plot(hc.mc,hang = -1, cex=.5,main = "Dendograma - Ligação MCQuitty", 
     ylab = "Distância")
rect.hclust(hc.mc,h=7.0,border = "red")
groups.mc <- cutree(hc.mc,h=7.0)
dadosC.mc <- cbind(dados,groups.mc)

aggregate(dados_padronizados,list(groups.mc),mean)



hc.median <- hclust(distancia_euclidiana,method = "median") 
names(hc.median)
plot(hc.median,hang = -1, cex=.5,main = "Dendograma - Ligação mediana", 
     ylab = "Distância")
rect.hclust(hc.median,h=4.86,border = "red")
groups.median <- cutree(hc.median,h=4.86)
dadosC.median <- cbind(dados,groups.median)

# Não tem como selecionar 4 grupos. De 5 passa diretamente para 2 grupos.

aggregate(dados_padronizados,list(groups.median),mean)



hc.cen <- hclust(distancia_euclidiana,method = "centroid") 
names(hc.cen)
plot(hc.cen,hang = -1, cex=.5,main = "Dendograma - Ligação centroide", 
     ylab = "Distância")
rect.hclust(hc.cen,h=4.0,border = "red")
groups.cen <- cutree(hc.cen,h=4.0)
dadosC.cen <- cbind(dados,groups.cen)

aggregate(dados_padronizados,list(groups.cen),mean)


# verificando a relação das variáveis utilizandoo método "average"

plot(dados$PI0102,dados$FC0104, xlab = "PI0102", ylab = "FC0104", main = "Ligação média",pch=1, col=groups.med)
plot(dados$PI0102,dados$FC0108, xlab = "PI0102", ylab = "FC0108", main = "Ligação média",pch=1, col=groups.med)
plot(dados$PI0102,dados$TI0201, xlab = "PI0102", ylab = "TI0201", main = "Ligação média",pch=1, col=groups.med)






## Clustering NÃO-hierárquico

# Determinação do número de clusters

set.seed(555)
wss <- 0
for(i in 1:20) wss[i]<-sum(kmeans(dados_padronizados,centers=i)$withinss)
plot(1:20,wss,type="b",pch=1, main = "Soma dos quadrados dentro dos grupos", ylab = "WSS", xlab = "Número de clusters")
abline(h=400,lty=2,lwd=1.5,col=2)

# a determinação do número de clusters leva em consideração
# a variabilidade dentro dos grupos
# A escolha é feita a partir de um número de cluster que após esse número
# o aumento no número de cluster não resulta em melhora signficativa 


set.seed(222)
kc <- kmeans(dados_padronizados,3)

# adicionar clusters nas observações
groups.k <- kc$cluster
dadosC.k <- cbind(dados,groups.k)

aggregate(dados_padronizados,list(groups.k),mean)
write.csv2(dadosC.k,file="cluster_agrupados.csv",row.names=F)

plot(dados$PI0102,dados$FC0104,col=kc$cluster,pch=kc$cluster)
legend("topleft",legend=paste("Grupo",unique(sort(kc$cluster))),
       pch=unique(sort(kc$cluster)),col=unique(sort(kc$cluster)))

plot(dados$PI0102,dados$FC0105,col=kc$cluster,pch=kc$cluster)
legend("topleft",legend=paste("Grupo",unique(sort(kc$cluster))),
       pch=unique(sort(kc$cluster)),col=unique(sort(kc$cluster)))

# Cluster de Variáveis usando o pacote ClustOfVar

install.packages("ClustOfVar")

library(ClustOfVar)
hc.var <- hclustvar(dados)
plot(hc.var,cex=.8,main="Dendograma Variáveis", ylab="Distância")
rect.hclust(hc.var,h=.5, border="red")
groups.var <- cutree(hc.var, h=.5)
