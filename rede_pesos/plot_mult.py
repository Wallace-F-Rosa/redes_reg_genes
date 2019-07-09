import matplotlib.pyplot as plt
import numpy as np


redes_nome = []
nbits = []
inputfile = "input_mult.txt"

max_bits = 0

lista = open(inputfile,'r')
for line in lista.readlines():
    redepath = line.replace("\n","")
    pathcontent = redepath.replace(".txt","").split("/")
    redes_nome.append(pathcontent[len(pathcontent)-1])
    
    rede = open(redepath,'r')
    max = rede.readline()
    min = rede.readline()
    bits_value = int(rede.readline().replace("\n",""))
    nbits.append(bits_value)
    rede.close()

    if bits_value > max_bits :
        max_bits = bits_value

lista.close()

index = np.arange(0,max_bits+1)

indexy = np.arange(1,max_bits+1)

plt.bar(index, nbits)
plt.xlabel('redes')
plt.ylabel('nº de bits')
plt.yticks(indexy, indexy, fontsize=10)
plt.xticks(index, redes_nome, fontsize=10,rotation='vertical')
plt.title("Multiplicação - Pior caso")
plt.show()
