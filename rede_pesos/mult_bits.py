import sys
import math

inputfile = sys.argv[1]
#infile = open(inputfile,'r')
rede = open(inputfile, 'r')

#carraga rede
tam = int(rede.readline().replace("\n",""))
eq_tam = []
pesos = []
T = []
for value in rede.readline().replace("\n","").split(" "):
    eq_tam.append(int(value))
eq = 0
for line in rede.readlines():
    pesos.append([])
    content = line.replace("\n","").split(" ")
    for i in range(0, len(content)-1):
        pesos[eq].append(int(content[i]))
    T.append(int(content[len(content)-1]))
    eq = eq +1

#vendo pior caso da multiplicação

#pior numero positivo e pior numero negativo
max = 0
min = 0
eq = 0
sum_max = 0
sum_min = 0
for i in range(0, 2*eq_tam[eq],2):
    peso = pesos[eq][i+1]
    if peso >= 0 :
        sum_max = sum_max + peso
    else :
        sum_min = sum_min + peso
    i = i + 2
max = sum_max
min = sum_min
for eq in range(1,tam):
    sum_max = 0
    sum_min = 0
    for i in range(0, 2*eq_tam[eq],2):
        peso = pesos[eq][i+1]
        if peso >= 0 :
            sum_max = sum_max + peso
        else :
            sum_min = sum_min + peso
    if sum_max > max:
        max = sum_max
    if sum_min < min :
        min = sum_min

numeros = max - min + 1

bits = math.ceil(math.log2(numeros))

path = sys.argv[1].split("/")
redenome = path[len(path)-1].replace(".txt","")


saidafile = open("mul_bits/"+str(redenome)+".txt",'w+')
saidafile.write(str(max)+"\n")
saidafile.write(str(min)+"\n")
saidafile.write(str(bits)+"\n")
saidafile.close()

rede.close()