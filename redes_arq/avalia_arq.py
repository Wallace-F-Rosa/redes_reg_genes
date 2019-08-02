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
        qtd_rede = {}
        filepath = line.replace("\n","")
        rede = open(filepath,'r')
        for l in rede.readlines():
            values = l.replace("\n","").split(" ")
            pe = int(values[0])
            n = int(values[1])
            if n != 0 :
                PE_rede.append(pe)
                qtd_rede[pe] = n
        rede.close()

        #rede carregada, falta avaliar
        for ciclo in range(0,ciclos+1) :
            PE = PE_arq
            qtd_sobra = {}
            for pe in PE:
                qtd_sobra[pe] = int(qtd_arq[pe])

            #avalia
            for pe in PE_rede :
                pe_arq = 0
                achou_pe = False
                for i in range(0,len(PE)): #procura um pe para cobrior o pe da rede
                    if PE[i] >= pe:
                        pe_arq = PE[i]
                        achou_pe = True
                        break 
                if achou_pe : #achou um pe que cobre o pe da rede
                    if qtd_sobra[pe_arq] <= qtd_rede[pe] : #quantidade do pe não é suficiente
                        qtd_rede[pe] = qtd_rede[pe] - qtd_sobra[pe_arq]
                        qtd_sobra[pe_arq] = 0
                    else :
                        qtd_sobra[pe_arq] = qtd_sobra[pe_arq] - qtd_rede[pe]
                        qtd_rede[pe] = 0
                else : #não tem pe que cobre o pe da rede
                    pe_necessario = []
                    qtd_necessaria = []
                    in_necessaria = pe
                    for i in range(1,len(PE)):
                        pe_arq = PE[i]
                        qtd_atendido = qtd_sobra[pe_arq]//(pe//pe_arq + (pe%pe_arq)!=0)
                        if qtd_rede[pe] > 0:
                            if qtd_atendido != 0: #tem uma quantidade suficiente pra atender pelo menos 1
                                qtd_total = qtd_rede[pe]*(pe//pe_arq + (pe%pe_arq)!=0)
                                if(qtd_sobra[pe_arq] <= qtd_total) :
                                    qtd_rede[pe] = qtd_rede[pe] - qtd_atendido
                                    qtd_sobra[pe_arq] = 0
                                else :
                                    qtd_sobra[pe_arq] = qtd_sobra[pe_arq] - qtd_total
                                    qtd_rede[pe] = 0
                            else : #precisamos achar varios PE's para cobrir o pe da rede   
                                if(qtd_sobra[pe_arq] != 0) :
                                    qtd = pe_arq*qtd_sobra[pe_arq]
                                    if in_necessaria > 0:
                                        if in_necessaria >= qtd :
                                            in_necessaria = in_necessaria - qtd
                                            qtd_sobra[pe_arq] = 0
                                        else:
                                            qtd = (in_necessaria//pe_arq + (in_necessaria%pe_arq)!=0)
                                            qtd_sobra[pe_arq] = qtd_sobra[pe_arq] - qtd

                                            qtd_rede[pe] = qtd_rede[pe] - 1
                                            in_necessaria = pe
                                            i = i - 1
                        else : #PE foi cobrido
                            break
        
        cobriu = True
        for pe in PE_rede :
            if qtd_rede[pe] != 0 :
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