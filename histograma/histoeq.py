import numpy as np
import matplotlib.pyplot as plt

nome = "IL-6 Signalling"
rede = "../redes_pesos/eq_pesos/40-100/"+nome+".txt"

inputfile = open(rede,"r")
V = {}
adj = []

i = 0
eq = inputfile.readlines()
nEq = int(eq[0].replace('\n',''))
eqSize =[]
pesos = []
aux = eq[1].replace('\n','').split(' ')
for i in aux :
    eqSize.append(int(i))


ipeso = 0
for i in range(2,len(eq)):
    pesos.append([])
    txt = ''
    for peso in eq[i].replace('\n','').split(' '):
        txt += peso + ' '
        pesos[ipeso].append(int(peso))
    ipeso +=1

gin = []
gout = []

for i in range(0,nEq):
    gin.append(0)
    gout.append(0)

for i in range(nEq):
    if len(pesos[i]) == 3 and pesos[i][len(pesos[i])-2] == 0:
        gin[i] = 0
    else:
        gin[i] = (len(pesos[i])-1)//2

for eq in pesos:
	if len(eq) != 3 or eq[len(eq)-2] != 0:
		for i in range(0,(len(eq)-1),2):
			v = eq[i]
			gout[v] +=1

#neste ponto temos o grau de entrada e saida de cada vertice, falta plotar
gin.sort()
gout.sort()

#plotando histograma de saida
datain = []
dataout = []
for i in range (0,gin[len(gin)-1]+1):
    datain.append(0)
for i in gin :
    datain[i] = datain[i] + 1

for i in range (0,gout[len(gout)-1]+1):
    dataout.append(0)
for i in gout :
    dataout[i] = dataout[i] + 1

index = np.arange(0,gin[len(gin)-1]+1)

maior = 0
for i in datain:
    if i > maior :
        maior = i
indexy = np.arange(1,maior+1)
labely = []
for i in range(1,len(V)+1):
    labely.append(str(i))

label =[]
for i in range(0,len(gin)):
    label.append(str(i))

#criando arquivo txt com os dados do histograma
out = "histogramas/entrada/txt/"+nome+".txt"
outfile = open(out,'w+')

j=0
for i in datain :
    outfile.write(str(j)+" "+str(i)+"\n")
    j = j + 1
outfile.close()


#criando arquivo txt com os dados do histograma
out = "histogramas/saida/txt/"+nome+".txt"
outfile = open(out,'w+')

j=0
for i in dataout :
    outfile.write(str(j)+" "+str(i)+"\n")
    j = j + 1
outfile.close()

""" plt.bar(index, datain)
plt.xlabel('grau de entrada')
plt.ylabel('nº de vértices')
plt.yticks(indexy, labely, fontsize=10)
plt.xticks(index, index, fontsize=10)
plt.title(nome)
plt.show() """