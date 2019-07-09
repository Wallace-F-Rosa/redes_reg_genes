import numpy as np 

MAX_IN = 256 # numero máximo de entradas que a rede aceitará

PE = []
PE_qtd = 0 #quantidade de entradas cobertas
qtd = {}
for i in range(0,5):
    PE.append(i)
    qtd[i] = 0

inputfile = "input.txt"
infile = open(inputfile,'r')
for line in infile.readlines() :
    #armazena quanto de cada PE está sobrando
    qtd_sobra = {}

    for i in PE :
        qtd_sobra[i] = qtd[i]

    filepath = line.replace("\n","")
    rede = open(filepath,'r')
    PE_rede = []
    qtd_rede = {}
    for l in rede.readlines():
        values = l.replace("\n","").split(" ")
        pe = int(values[0])
        n = int(values[1])
        if n != 0 :
            PE_rede.append(pe)
            qtd_rede[pe] = n
    rede.close()
    for pe in PE_rede :
        if(pe > PE[len(PE)-1]):
            if(pe >= 1.5*PE[len(PE)-1]):
                if(PE_qtd + (pe*qtd_rede[pe]) <= MAX_IN) :
                    PE_qtd = PE_qtd + pe*qtd_rede[pe]
                    PE.append(pe)
                    qtd[PE[len(PE)-1]] = qtd_rede[pe]
                    qtd_sobra[PE[len(PE)-1]] = qtd_rede[pe]
            else:
                n_total = qtd_rede[pe]*(pe//PE[len(PE)-1] + (pe%PE[len(PE)-1])!=0)
                if qtd_sobra[PE[len(PE)-1]] == 0:
                    if( PE_qtd +(PE[len(PE)-1]*n_total) <= MAX_IN ):
                        PE_qtd = PE_qtd + (PE[len(PE)-1]*n_total)
                        qtd[PE[len(PE)-1]] = qtd[PE[len(PE)-1]]+(qtd_rede[pe]*(pe//PE[len(PE)-1] + (pe%PE[len(PE)-1])!=0))
                else:
                    
                    #adicionando PE
                    if qtd_sobra[PE[len(PE)-1]] <= n_total : #não tem PE suficiente pra cobrir o grau maior
                        if(PE_qtd + (PE[len(PE)-1]*n_total) <= MAX_IN):
                            PE_qtd = PE_qtd + (PE[len(PE)-1]*n_total)
                            qtd[PE[len(PE)-1]] = qtd[PE[len(PE)-1]]+ ( n_total-qtd_sobra[PE[len(PE)-1]])
                            qtd_sobra[PE[len(PE)-1]] = 0
                    else : #tem PE suficiente pra cobrir o grau maior
                        qtd_sobra[PE[len(PE)-1]] = qtd_sobra[PE[len(PE)-1]] - n_total 
        else:
            for i in PE:
                if i >= pe:
                    if qtd_sobra[i] <= qtd_rede[pe] :
                        j = i
                        if(i == 0) : j = 1
                        if( PE_qtd + (j*(qtd_rede[pe] - qtd_sobra[i])) <= MAX_IN) :
                            PE_qtd = PE_qtd + (j*(qtd_rede[pe] - qtd_sobra[i]))
                            qtd[i] = qtd[i] + (qtd_rede[pe] - qtd_sobra[i])
                            qtd_sobra[i] = 0
                    else :
                        qtd_sobra[i] = qtd_sobra[i] - qtd_rede[pe]
                    break
infile.close()

outfile = open("config/config8.txt",'w+')
for i in PE:
    outfile.write(str(i) + " "+str(qtd[i])+"\n")
outfile.close()