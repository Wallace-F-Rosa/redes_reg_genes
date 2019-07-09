import numpy as np
import matplotlib.pyplot as plt


inputfile = ""
index = np.arange(1,21)

xaxis = []
for i in range(1,21) :
    xaxis.append(str(i))


plt.bar(index, xaxis)
plt.xlabel('grau de saida')
plt.ylabel('nº de vértices')
plt.xticks(index, xaxis, fontsize=12)
plt.title("Nome da rede")
plt.show()