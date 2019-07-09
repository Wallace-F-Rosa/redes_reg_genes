file = "histogramas/entrada/arquivos.txt"
input = open(file,'r')

g = {}
for l in input.readlines():
    caminho = "histogramas/entrada/"+l.replace("\n","")
    histograma = open(caminho,'r')
    for l1 in histograma.readlines():
        values = l1.replace("\n","").split(' ')
        if int(values[0]) not in g :
            g[int(values[0])] = int(values[1])
        else:
            g[int(values[0])] = g[int(values[0])] + int(values[1])
    histograma.close()
input.close()

output = open("histogramas/entrada/geral.txt",'w+')
for i in g :
    output.write(str(i)+" "+str(g[i])+"\n")
output.close()

