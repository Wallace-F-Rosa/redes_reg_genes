# Redes Reguladoras de Genes
Reges Reguladoras de Genes e lógica Limiar.
Este repositório contém 21 grafos booleanos de redes reguladoras de redes e aborda : cálculo de atratores, transformação de equações booleanas em equações que utilizam lógica limiar e avaliação de desempenho computacional das redes em diferentes arquiteturas.

Todas as 21 redes se encontram no diretório redes_bio/ organizadas em função de número de vértices de cada rede.
Das 21 redes disponívels, as seguintes 16 foram utilizadas nos programas contidos neste repositório:

 | Nome da rede | Identificador | Quantidade de vértices | 
 | --- | --- | --- | 
 | Cholesterol Regulatory Pathway | 1 | 34 | 
 | Apoptosis network | 2 | 41 | 
 | Guard Cell Abscisic Acid Signaling | 3 | 44 | 
 | Differentiation of T lymphocytes | 4 | 50 | 
 | B bronchiseptica and T retortaeformis coinfectio | 5 | 53 | 
 | MAPK Cancer Cell Fate Network | 6 | 55 | 
 | T-LGL Survival Network 2011 | 7 | 60 | 
 | PC12 Cell Differentiation | 8 | 62 | 
 | Bortezomib Responses in U266 Human Myelo | 9 | 67 | 
 | HGF Signaling in Keratinocytes | 10 | 68 | 
 | Glucose Repression Signaling 2009 | 11 | 73 | 
 | Yeast Apoptosis | 12 | 73 | 
 | Lymphopoiesis Regulatory Network | 13 | 81 | 
 | IL-6 Signalling | 14 | 87 | 
 | EGFR & ErbB Signaling | 15 | 104 | 
 | signal transduction in fibroblasts | 16 | 139 | 

atratores/ : calculo de atratores e programas utilizados para medir desempenho
    atratores.cu : cáculo de atratores utilizando a extensão de C\C++ CUDA e memória compartilhada.
    atratores_globalmem.cu : cálculo de atratores utilizando memória global.
    medir_tempo.cu : programa utilizado par medir desempenho das redes em GPU's utilizando o nvprof, ferramenta do CUDA toolkit da NVIDIA.
    