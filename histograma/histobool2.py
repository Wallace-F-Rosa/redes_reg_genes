import numpy as np
import matplotlib.pyplot as plt

nome = "MAPK Cancer Cell Fate Network"
rede = "../redes_bio/40-100/"+nome+"/expr/expressions.ALL.txt"


inputfile = open(rede,'r')
V = {}
adj = []
gin = []
gout = []

for line in inputfile.readlines() : #Poe os vertices num MAP
    content = line.split(' ') #separa a string
    v = content[0] #separa o vertice que está sendo descrevido
    if(v not in V):
        V[v] = len(V)
    content.remove(content[0]) #remove o vertice
    content.remove('=') #remove o igual
    for word in content :
        aux = []
        for i in range (0,len(word)) :
            if (word[i] != '(' and word[i] != ')' and word[i] !='\n' ): #retira parenteses
                aux.append(word[i])
        aux2 = ''.join(aux)
        if (aux2 != 'OR' and aux2 != 'AND' and aux2 != 'NOT' and aux2 != '') : #retira expressões lógicas
            if(aux2 not in V):
                V[aux2] = len(V)
inputfile.close()

for i in range (0,len(V)):
    adj.append([])
    gin.append(0)
    gout.append(0)

#construir lista de adjacencia e calcula grau de entrada e saida
inputfile = open(rede,'r')
for line in inputfile.readlines() : #Poe os vertices num MAP
    content = line.split(' ') #separa a string
    v = content[0] #separa o vertice que está sendo descrevido
    content.remove(content[0]) #remove o vertice do conteudo
    content.remove('=') #remove o igual
    var = {}
    for word in content :
        aux = []
        for i in range (0,len(word)) :
            if (word[i] != '(' and word[i] != ')' and word[i] !='\n' ): #retira parenteses
                aux.append(word[i])
        aux2 = ''.join(aux)
        if (aux2 != 'OR' and aux2 != 'AND' and aux2 != 'NOT' and aux2 != '') : #retira expressões lógicas
            var[aux2] = aux2 #poe o vértice no map pra não repetir variaveis
    lvar = []
    for n in var:
        gin[V[v]] = gin[V[v]] + 1
        gout[V[n]] = gout[V[n]] + 1
        lvar.append(V[n])
    adj[V[v]] = lvar
inputfile.close()

#neste ponto temos o grau de entrada e saida de cada vertice, falta plotar
gout.sort()
gin.sort()

#plotando histograma de saida
data = []
for i in range (0,gin[len(gin)-1]+1):
    data.append(0)
for i in gin :
    data[i] = data[i] + 1

index = np.arange(0,gin[len(gin)-1]+1)

maior = 0
for i in data:
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
for i in data :
    outfile.write(str(j)+" "+str(i)+"\n")
    j = j + 1
outfile.close()

plt.bar(index, data)
plt.xlabel('grau de entrada')
plt.ylabel('nº de vértices')
plt.yticks(indexy, labely, fontsize=10)
plt.xticks(index, index, fontsize=10)
plt.title(nome)
plt.show()
