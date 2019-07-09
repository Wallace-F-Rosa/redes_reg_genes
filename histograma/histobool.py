import numpy as np
import matplotlib.pyplot as plt

nome = "Apoptosis network"
rede = "/home/wallace/Documentos/UFV/IC-Ricardo/redes_bio/40-100/"+nome+"/expr/expressions.ALL.txt"

inputfile = open(rede,"r")
V = {}
adj = []

i = 0
for line in inputfile.readlines() : #pega somente os vertices
    content = line.split(' ')
    var = content[0] #vertice
    V[var] = i
    i = i+1 
    adj.append([])

inputfile.close()
inputfile = open(rede,'r')

gin = []
gout = []

for i in range(0,len(V)):
    gin.append(0)
    gout.append(0)

for line in inputfile.readlines() : #abre novamente o arquivo
    content = line.split(' ') #separa a string
    v = content[0] #separa o vertice que está sendo descrevido
    content.remove(content[0]) #remove o vertice
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
        lvar.append(n)
    adj[V[v]] = lvar
    #print(adj[v])
inputfile.close()
#neste ponto temos o grau de entrada e saida de cada vertice, falta plotar
gout.sort()

#plotando histograma
data = []
for i in range (1,gout[len(gin)-1]+1):
    data.append(0)
for i in gout :
    data[i-1] = data[i-1] + 1 

index = np.arange(1,gout[len(gout)-1]+1)

label =[]
for i in range(0,len(gout)):
    label.append(str(i))


#criando arquivo txt com os dados do histograma
out = "histogramas/txt/"+nome+".txt"
outfile = open(out,'w+')

j=0
for i in data :
    outfile.write(str(j+1)+" "+str(i)+"\n")
    j = j + 1
outfile.close()

plt.bar(index, data)
plt.xlabel('grau de saida')
plt.ylabel('nº de vértices')
plt.xticks(index, index, fontsize=12)
plt.title(nome)
plt.show()
