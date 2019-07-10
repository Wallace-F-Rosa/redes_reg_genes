# Redes Reguladoras de Genes
Reges Reguladoras de Genes utilizando lógica Limiar. Cálculo de atratores. CGRA dinâmico para FPGA.


atratores : calculo de atratores
    atratores.cu -- versão que utiliza shared memory e const memory. Pouco dinâmica, requer recompilação ao trocar de rede. 
    atratores_stable.cu -- versão que utiliza memória global. Muito dinâmica, porém lenta e exige muita, MUITA , MMMMUUUIIITTTAAAAA memória na GPU. Também serve de backup
        .advertência : proceda com cautela ao executar esta versão. Risco de travar o pc e precisar reiniciar no dedo.