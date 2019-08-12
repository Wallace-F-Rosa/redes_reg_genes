#arquivo recebe uma configuração de uma arquitetura e testa quantas atende em 1, 2 e 3 ciclos

import numpy as np 

#carrega a arquitetura
arq_path = "config/config7.txt"

PE_arq = []
qtd_arq = {}
arq = open(arq_path,'r')
for line in arq.readlines():
    values = line.replace("\n","").split(" ")
    pe = int(values[0])
    n = int(values[1])
    PE_arq.append(pe)
    qtd_arq[pe] = n
arq.close()

MAX_CICLOS = 3
#para cada numero de ciclos avalia a rede
for ciclos in range(0,MAX_CICLOS) :
    print("Redes cobertas com "+str(ciclos+1)+" ciclo(s) : \n")
    print(str(ciclos+1)+" ciclos\n")
    redes_cobertas = 0

    inputfile = "input.txt"
    infile = open(inputfile,'r')
    for line in infile.readlines() :
        #carrega rede
        PE_rede = []
        PE_rede_cobrido = []
        filepath = line.replace("\n","")
        rede = open(filepath,'r')
        for l in rede.readlines():
            values = l.replace("\n","").split(" ")
            pe = int(values[0])
            n = int(values[1])
            while n > 0 :
                PE_rede.append(pe)
                PE_rede_cobrido.append(False)
                n -= 1
        rede.close()

        map_rede_arq ={}
        #rede carregada, falta avaliar
        for ciclo in range(0,ciclos+1) :
            PE = PE_arq
            qtd_sobra = {}
            for pe in PE:
                qtd_sobra[pe] = int(qtd_arq[pe])

            #avalia
            for i in reversed(range(0,len(PE_rede))):
                if i not in map_rede_arq: #pe não mapeado
                    pe_arq = 0
                    achouPE = False
                    for j in range(len(PE)):
                        if PE[j] >= PE_rede[i] and qtd_sobra[PE[j]] > 0:
                            achouPE = True
                            map_rede_arq[i] = PE[j]
                            PE_rede_cobrido[i] = True
                            qtd_sobra[PE[j]] -= 1
                            break
                    if not achouPE :
                        for j in reversed(range(1,len(PE))):
                            if qtd_sobra[PE[j]] > 0:
                                map_rede_arq[i] = PE[j] 
                                qtd_sobra[PE[j]] -= 1
                                break
                else:
                    if PE_rede[i] > map_rede_arq[i] and PE_rede_cobrido[i] == False:
                        if PE_rede[i] <= (ciclo+1)*(map_rede_arq[i]):
                            PE_rede_cobrido[i] = True


            
        cobriu = True
        for i in range(len(PE_rede)):
            if PE_rede_cobrido[i] == False :
                cobriu = False
                break
        
        if cobriu :
            print(filepath)
        else:
            #print("Falha : "+filepath+" ")
            """ for pe in PE_rede :
                if qtd_rede[pe] != 0 :
                    print("PE : "+str(pe) +" qtd : "+str(qtd_rede[pe]) +"\n" ) """
    
    
            
        


    infile.close()