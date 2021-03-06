library(readxl)
dados <- read_excel("R/dados.xlsx")
View(dados)

dados <- dados[,-c(1)]



## dist�ncia estat�stia

x <- dados
y <- as.data.frame(mahalanobis(x, colMeans(x), cov(x)))
names(y)[1] = "Distancias"
y$Index = c(1:nrow(y))


alpha = 0.05
df <- ncol(x[,])
limite <- qchisq(1-alpha,df = df)
is_mv_outlier <- ifelse(y$Distancias > limite, "SIM", "N�O")
x$Outliers <- is_mv_outlier
x = x[x$Outliers == "N�O",]

x
summary(x)

x[29] = NULL

dados <- x



## padroniza��o dos dados

dados_padronizados <- scale(dados)


## c�lculo da distancia euclidiana

distancia_euclidiana <- dist(dados_padronizados, method = "euclidean")
print(distancia_euclidiana,digits = 2)





## Cluestering hier�rquico 

hc.D <- hclust(distancia_euclidiana,method = "ward.D") 
names(hc.D)
plot(hc.D,hang = -1, cex=.5,main = "Dendograma - Liga��o Ward", 
     ylab = "Dist�ncia")
rect.hclust(hc.D,h=30.0,border = "red")
groups.D <- cutree(hc.D,h=30.0)
dadosC.D <- cbind(dados,groups.D)

aggregate(dados_padronizados,list(groups.D),mean)


hc.DD <- hclust(distancia_euclidiana,method = "Ward.D2") 
names(hc.DD)
plot(hc.DD,hang = -1, cex=.5,main = "Dendograma - Liga��o Ward D2", 
     ylab = "Dist�ncia")
rect.hclust(hc.DD,h=1.0,border = "red")
groups.DD <- cutree(hc.DD,h=1.0)
dadosC.DD <- cbind(dados,groups.D2)

aggregate(dados_padronizados,list(groups.DD),mean)

# N�o funcionou



hc.S <- hclust(distancia_euclidiana,method = "single") 
names(hc.S)
plot(hc.S,hang = -1, cex=.5,main = "Dendograma - Liga��o singular", 
     ylab = "Dist�ncia")
rect.hclust(hc.S,h=4.8,border = "red")
groups.S <- cutree(hc.S,h=4.8)
dadosC.S <- cbind(dados,groups.S)

aggregate(dados_padronizados,list(groups.S),mean)




hc.c <- hclust(distancia_euclidiana,method = "complete") 
names(hc.c)
plot(hc.c,hang = -1, cex=.5,main = "Dendograma - Liga��o completa", 
     ylab = "Dist�ncia")
rect.hclust(hc.c,h=9.0,border = "red")
groups.c <- cutree(hc.c,h=9.0)
dadosC.c <- cbind(dados,groups.c)

aggregate(dados_padronizados,list(groups.c),mean)




hc.med <- hclust(distancia_euclidiana,method = "average") 
names(hc.med)
plot(hc.med,hang = -1, cex=.5,main = "Dendograma - Liga��o m�dia", 
     ylab = "Dist�ncia")
rect.hclust(hc.med,h=7.0,border = "red")

# A constru��o de dendograma para cada observa��o (per�odos)
# n�o � interessante nesse caso porque ap�s a 
# limpeza de dados, s�o gerados per�odos de tempo
# que n�o se relacionam, e a an�lise da combina��o 
# desses per�odos se torna inapropriada por n�o 
# conter sentido f�sico
# o que pode ser conclu�do dessa an�lise � que determinados per�odos possuem valores pr�ximos das vari�veis medidas
# contudo, mesmo assim muito n�o pode ser conclu�do j� que a combina��o traz per�odos sequenciais
# como 2 e 3, 5 e 6, 14 e 15.
# Observa��es sequenciais em processos cont�nuos geralmente est�o relacionadas (alta similaridade) se n�o h� erro sistem�tico ou corre��o do erro
# Teria um sentido f�sico se, por exemplo, as observa��es fossem companias diferentes (observa��o n�o cont�nua)
# A continua��o dessa an�lise � feita at� que haja o agrupamento de todos grupos menores em um s� grupo maior

groups.med <- cutree(hc.med,h=7.0)
dadosC.med <- cbind(dados,groups.med)

aggregate(dados_padronizados,list(groups.med),mean)

# a clusteriza��o hier�rquica n�o � muito eficiente ao se analisar
# observa��es de um processo cont�nuo por dendograma
# No entanto, quando utilizada graficamente para comparar a rela��o entre
# as vari�veis, esse m�todo se torna eficiente.



hc.mc <- hclust(distancia_euclidiana,method = "mcquitty") 
names(hc.mc)
plot(hc.mc,hang = -1, cex=.5,main = "Dendograma - Liga��o MCQuitty", 
     ylab = "Dist�ncia")
rect.hclust(hc.mc,h=7.0,border = "red")
groups.mc <- cutree(hc.mc,h=7.0)
dadosC.mc <- cbind(dados,groups.mc)

aggregate(dados_padronizados,list(groups.mc),mean)



hc.median <- hclust(distancia_euclidiana,method = "median") 
names(hc.median)
plot(hc.median,hang = -1, cex=.5,main = "Dendograma - Liga��o mediana", 
     ylab = "Dist�ncia")
rect.hclust(hc.median,h=4.86,border = "red")
groups.median <- cutree(hc.median,h=4.86)
dadosC.median <- cbind(dados,groups.median)

# N�o tem como selecionar 4 grupos. De 5 passa diretamente para 2 grupos.

aggregate(dados_padronizados,list(groups.median),mean)



hc.cen <- hclust(distancia_euclidiana,method = "centroid") 
names(hc.cen)
plot(hc.cen,hang = -1, cex=.5,main = "Dendograma - Liga��o centroide", 
     ylab = "Dist�ncia")
rect.hclust(hc.cen,h=4.0,border = "red")
groups.cen <- cutree(hc.cen,h=4.0)
dadosC.cen <- cbind(dados,groups.cen)

aggregate(dados_padronizados,list(groups.cen),mean)


# verificando a rela��o das vari�veis utilizandoo m�todo "average"

plot(dados$PI0102,dados$FC0104, xlab = "PI0102", ylab = "FC0104", main = "Liga��o m�dia",pch=1, col=groups.med)
plot(dados$PI0102,dados$FC0108, xlab = "PI0102", ylab = "FC0108", main = "Liga��o m�dia",pch=1, col=groups.med)
plot(dados$PI0102,dados$TI0201, xlab = "PI0102", ylab = "TI0201", main = "Liga��o m�dia",pch=1, col=groups.med)






## Clustering N�O-hier�rquico

# Determina��o do n�mero de clusters

set.seed(555)
wss <- 0
for(i in 1:20) wss[i]<-sum(kmeans(dados_padronizados,centers=i)$withinss)
plot(1:20,wss,type="b",pch=1, main = "Soma dos quadrados dentro dos grupos", ylab = "WSS", xlab = "N�mero de clusters")
abline(h=400,lty=2,lwd=1.5,col=2)

# a determina��o do n�mero de clusters leva em considera��o
# a variabilidade dentro dos grupos
# A escolha � feita a partir de um n�mero de cluster que ap�s esse n�mero
# o aumento no n�mero de cluster n�o resulta em melhora signficativa 


set.seed(222)
kc <- kmeans(dados_padronizados,3)

# adicionar clusters nas observa��es
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

# Cluster de Vari�veis usando o pacote ClustOfVar

install.packages("ClustOfVar")

library(ClustOfVar)
hc.var <- hclustvar(dados)
plot(hc.var,cex=.8,main="Dendograma Vari�veis", ylab="Dist�ncia")
rect.hclust(hc.var,h=.5, border="red")
groups.var <- cutree(hc.var, h=.5)
