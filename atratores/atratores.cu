#include <iostream>
#include <cmath>
#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>
#include <curand_kernel.h>
#include <assert.h>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

#define TABLE_SIZE 2048
#define BUCKET_SIZE 200
#define TAM_REDE CONSTANTE_REDE
#define TAM_PESOS CONSTANTE_PESOS
#define TAM_ESTADO (TAM_REDE/32 + (TAM_REDE%32 != 0))
#define CLOCK_PER_SEC_CPU 1007.780*1000000
#define CLOCK_PER_SEC_GPU 1506*1000000

//#define TAM_ESTADO TAM_REDE/32 + (TAM_REDE%32 != 0) //tamanho máximo de cada estado na rede (em bits)


typedef struct
{
    int *peso, *pesoIni, *eqSize, *T, nEq; //Grafo em forma de tabela
} Grafo;

//imprime o grafo lido
ostream & operator << (ostream & out, const Grafo & g)
{
    out << g.nEq <<"\n";
    for(int i = 0; i < g.nEq; i++)
        out << g.eqSize[i] << " ";
    out << "\n";

    int posPeso;
    for(int i = 0; i < g.nEq; i++)
    {
        posPeso = g.pesoIni[i];
        for(int j = 0; j < g.eqSize[i]; j++,posPeso+=2)
        {
            out << g.peso[posPeso] << " " << g.peso[posPeso+1]<<" ";
        }
        out << g.T[i] <<"\n";
    }
    return out;
}

typedef struct
{
    unsigned int *atr; //estados que o atrator contém. no caso de um atrator grande, a cada TAM_ESTADO bits teremos um novo atrator 
    unsigned long long cont; //conta quantos estados caem neste atrator
    int periodo; //período do atrator

} Atrator;

void atrator_tabela_sincrono_cpu(const Grafo &g, Atrator * Tabela, unsigned long long MAX_ESTADO)
{
    bool aleatorio = false;
       
    int tamEstado = g.nEq/32 + (g.nEq%32 != 0);
    unsigned int * s0, *s1;
    s0 = (unsigned int *)malloc(tamEstado*sizeof(unsigned int));
    s1 = (unsigned int *)malloc(tamEstado*sizeof(unsigned int));
    for(unsigned long long estado = 0; estado < MAX_ESTADO; estado++)
    {
        //variáveis necessárias para realizar o passo
        if(g.nEq > 25){ aleatorio = true; srand(estado);}  //rede grande, estados aleatórios
        for(int i = 0; i < tamEstado; i++)
            s0[i] = s1[i] = 0; 

        
        //inicializando estado inicial(o bit mais alto representa o vértice (nEq-1) e o bit mais baixo representa o vértice 0)
        if(aleatorio)
        {
            for(int i = 0; i < tamEstado; i++)
                s0[i] = (unsigned int)rand() % UINT_MAX; //preenche o estado com numeros aleatórios

            if(TAM_REDE < 32*TAM_ESTADO)
            {
                for(int bitVar = TAM_REDE; bitVar < 32*TAM_ESTADO; bitVar++)
                {
                    int posAtr = (bitVar)/32;
                    s0[posAtr] =(s0[posAtr] & ~(1 << (bitVar%32)));
                }
            }
        }
        else
        {
            for(int i = 0; i < g.nEq; i++)
            {
                int var = g.nEq -1 - i; //variável desejada
                int posAtr = tamEstado - var/32 - (var%32!=0); //posição de atr onde se encontra o bit da variável desejada
                s0[posAtr] |= ((estado >> i)%2) << (var%32);
            }
        }
        

        for(int i = 0; i < tamEstado; i++)
            s1[i] = s0[i];

         //variaveis auxiliares
         unsigned int * newEstado = (unsigned int *)malloc(sizeof(unsigned int)*tamEstado);
        
         bool diferente = false;
        
        //procurando o atrator onde os estados caem
        do
        {
            //s0 anda um passo

            //passo
            for(int i = 0; i < tamEstado; i++) newEstado[i]=0; //zera o newEstado

            //calcula novo estado
            for(int i = 0; i < g.nEq; i++)
            {
                int bitVar = 0; //bit no qual a variavel i é representada
                int posAtr = 0; //posição do bit no vetor do estado
                int sum_prod =0, pos = g.pesoIni[i] , eqsize = g.eqSize[i], Teq = g.T[i];
                //aplicando a tlf
                for(int j = 0; j < eqsize;  j++, pos += 2){
                    bitVar = (g.nEq-1)-g.peso[pos];
                    posAtr = tamEstado - bitVar/32 - (bitVar%32!=0) ;
                    sum_prod += ((s0[posAtr] >>(bitVar%32))% 2)*g.peso[pos+1];
                }
                bitVar = (g.nEq-1)-i; //variavel que será atualizada no novo estado
                newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar - 32*posAtr);
            }
            //atualiza s0
            for(int i = 0; i < tamEstado; i++) s0[i] = newEstado[i];

            //s1 anda dois passos
            //passo
            for(int i = 0; i < tamEstado; i++) newEstado[i]=0; //zera o newEstado

            //calcula novo estado
            for(int i = 0; i < g.nEq; i++)
            {
                int bitVar = 0; //bit no qual a variavel i é representada
                int posAtr = 0; //posição do bit no vetor do estado
                int sum_prod =0, pos = g.pesoIni[i] , eqsize = g.eqSize[i], Teq = g.T[i];
                //aplicando a tlf
                for(int j = 0; j < eqsize;  j++, pos += 2){
                    bitVar = (g.nEq-1)-g.peso[pos];
                    posAtr = tamEstado - bitVar/32 - (bitVar%32!=0) ;
                    sum_prod += ((s1[posAtr] >>(bitVar%32))% 2)*g.peso[pos+1];
                }
                bitVar = (g.nEq-1)-i;
                newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar - 32*posAtr);
            }
            //atualiza s1
            for(int i = 0; i < tamEstado; i++) s1[i] = newEstado[i];

            //passo
            for(int i = 0; i < tamEstado; i++) newEstado[i]=0; //zera o newEstado

            //calcula novo estado
            for(int i = 0; i < g.nEq; i++)
            {
                int bitVar = 0; //bit no qual a variavel i é representada
                int posAtr = 0; //posição do bit no vetor do estado
                int sum_prod =0, pos = g.pesoIni[i] , eqsize = g.eqSize[i], Teq = g.T[i];
                //aplicando a tlf
                for(int j = 0; j < eqsize;  j++, pos += 2){
                    bitVar = (g.nEq-1)-g.peso[pos];
                    posAtr = tamEstado - bitVar/32 - (bitVar%32!=0) ;
                    sum_prod += ((s1[posAtr] >>(bitVar%32))% 2)*g.peso[pos+1];
                }
                bitVar = (g.nEq-1)-i;
                newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar - 32*posAtr);
            }
            //atualiza s1
            for(int i = 0; i < tamEstado; i++) s1[i] = newEstado[i];

            //testando se s0 != s1
            diferente = false;
            for(int i = 0; i < tamEstado; i++) if(s0[i] != s1[i]){ diferente = true; break;}
        }while(diferente);

        int upperBit = -1, lowerBit = -1, hash = 0;
        #pragma unroll
        for(int i = 0; i < g.nEq; i++)
        {
            int bitVar = g.nEq -1 - i;
            int posAtr = tamEstado - bitVar/32 - (bitVar%32!=0) ;
            bool bit = (s1[posAtr] >>(bitVar%32))% 2;
            if(lowerBit == -1 && (bit == 1))
                lowerBit = i+1;
            
            if(bit == 1)
            {
                upperBit = i + 1;
                hash += upperBit;
            }
        }
        if(upperBit == -1) hash = 0;
        else hash = (hash)/1024 + upperBit;

        //insere o estado na tabela hash :
        //assert(hash >= TABLE_SIZE || hash < 0);
        if(hash >= TABLE_SIZE || hash < 0){
            printf("Estado : ");
            for(int i = 0; i < tamEstado; i++) printf("%d",s1[i]);
            printf(" , hash : %d\n",hash);
            return;
        }

        //salvar o atrator na tabela
        bool igual = true;
        for(int i = 0; i < tamEstado; i++) if(Tabela[hash].atr[i] != s1[i]) {igual = false; break;}
        if(igual)
        {
            Tabela[hash].cont+=1;//se dois estados caem no mesmo balde, soma mais um no estado
        }
        else
        {
            //procura um balde vazio desde que o estado encontrado nao seja igual ao dos baldes encontrados no caminho
            while(Tabela[hash].cont != 0 && (!igual))
            {   
                hash++;
                igual = true;
                for(int i = 0; i < tamEstado; i++) if(Tabela[hash].atr[i] != s1[i]) {igual = false; break;} 
                
            } 
            if(!igual)
                for(int i = 0; i < tamEstado; i++) Tabela[hash].atr[i]=s1[i];
            Tabela[hash].cont+=1;//se dois estados caem no mesmo balde, soma mais um no estado
            Tabela[hash].periodo=1;
        }
        
    }

    free(s0);
    free(s1);
    return;
}

__device__ void passo(unsigned int * estado, unsigned int tamEstado, const Grafo &g)
{
    unsigned int * newEstado;
    newEstado = (unsigned int *)malloc(sizeof(unsigned int)*tamEstado);

    //passo
    for(int i = 0; i < tamEstado; i++) newEstado[i]=0; //zera o newEstado

    //calcula novo estado
    for(int i = 0; i < g.nEq; i++)
    {
        int bitVar = 0; //bit no qual a variavel i é representada
        int posAtr = 0; //posição do bit no vetor do estado
        int sum_prod =0, pos = g.pesoIni[i] , eqsize = g.eqSize[i], Teq = g.T[i];
        //aplicando a tlf
        for(int j = 0; j < eqsize;  j++, pos += 2){
            bitVar = (g.nEq-1)-g.peso[pos];
            posAtr = tamEstado - bitVar/32 - (bitVar%32!=0) ;
            sum_prod += ((estado[posAtr] >>(bitVar%32))% 2)*g.peso[pos+1];
        }
        bitVar = (g.nEq-1)-i; //variavel que será atualizada no novo estado
        newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar%32);
    }
    //atualiza s0
    for(int i = 0; i < tamEstado; i++) estado[i] = newEstado[i];

    free(newEstado);

}


__global__ void atrator_tabela_sincrono(curandState * curstate, const Grafo g, Atrator *Tabela, unsigned long long MAX_TREAD_ID, unsigned int * C)
{
    //o id da tread é calculado para evitar que as threads excedentes sejam utilizadas
    unsigned long long idx = blockDim.x*blockIdx.x + threadIdx.x;

    //copia do grafo na memória shared
    __shared__ int eqSize[TAM_REDE];
    __shared__ int pesoIni[TAM_REDE];
    __shared__ int T[TAM_REDE];
    __shared__ int peso[TAM_PESOS*2];

    //inicializa a cópía do grafo na memória shared
    if(threadIdx.x<TAM_REDE)
    {   
        eqSize[threadIdx.x] = g.eqSize[threadIdx.x];
        pesoIni[threadIdx.x] = g.pesoIni[threadIdx.x];
        T[threadIdx.x] = g.T[threadIdx.x];
    }
    if(threadIdx.x < TAM_PESOS)
    {
        peso[threadIdx.x*2] = g.peso[threadIdx.x*2];
        peso[threadIdx.x*2+1] = g.peso[threadIdx.x*2+1];
    }
    __syncthreads();

    
    //calculo do estado : estado = blockDim.x*blockIdx.x + threadIdx.x 
    if(idx < MAX_TREAD_ID)
    {
        //rede grande, estado aleatório
        if(TAM_REDE > 25)
            curand_init(idx, idx, 0, curstate + idx);//inicia a seed

        //variáveis necessárias para realizar o passo
        unsigned int s0[TAM_REDE], s1[TAM_REDE];

        for(int i = 0; i < TAM_ESTADO; i++)
            s0[i] = s1[i] = 0; 
        
        if(TAM_REDE > 25)
        {
            for(int i = 0; i < TAM_ESTADO; i++)
               s1[i] = s0[i] = curand(curstate + idx);

            //desligando bits que sobram
            if(TAM_REDE < 32*TAM_ESTADO)
            {
                for(int bitVar = TAM_REDE; bitVar < 32*TAM_ESTADO; bitVar++)
                {
                    int posAtr = (bitVar)/32;
                    s1[posAtr] = s0[posAtr] =(s0[posAtr] & ~(1 << (bitVar%32)));
                }
            }
        }
        else
        {
            //inicializando estado inicial(o bit mais alto representa o vértice (nEq-1) e o bit mais baixo representa o vértice 0)
            for(int i = 0; i < TAM_REDE; i++)
            {
                int var = TAM_REDE -1 - i; //variável desejada
                int posAtr = TAM_ESTADO - var/32 - (var%32!=0) ; //posição de atr onde se encontra o bit da variável desejada
                s0[posAtr] |= ((idx >> i)%2) << (var%32);
                s1[posAtr] |= ((idx >> i)%2) << (var%32);
            }
        }
        
        
        //variaveis auxiliares
        unsigned int newEstado[TAM_REDE];
        
        
        //assert(newEstado != NULL); //testa se a nenoria foi alocada corretamente

        //testando se s0 != s1
        bool diferente = false;
        unsigned int c1=0,c2=0;
        //procurando o atrator onde os estados caem
        do
        {
            //s0 anda um passo
            
            
            //passo
            for(int i = 0; i < TAM_ESTADO; i++) newEstado[i]=0; //zera o newEstado

            //calcula novo estado
            for(int i = 0; i < TAM_REDE; i++)
            {
                int bitVar = 0; //bit no qual a variavel i é representada
                int posAtr = 0; //posição do bit no vetor do estado
                int sum_prod =0, pos = pesoIni[i] , eqsize = eqSize[i], Teq = T[i];
                //aplicando a tlf
                for(int j = 0; j < eqsize;  j++, pos += 2){
                    bitVar = (TAM_REDE-1)-peso[pos];
                    posAtr = TAM_ESTADO - bitVar/32 - (bitVar%32!=0) ;
                    sum_prod += ((s0[posAtr] >>(bitVar%32))% 2)*peso[pos+1];
                }
                bitVar = (TAM_REDE-1)-i; //variavel que será atualizada no novo estado
                newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar%32);
            }
            //atualiza s0
            for(int i = 0; i < TAM_ESTADO; i++) s0[i] = newEstado[i];
            
            //passo(s0,tamEstado,sh_g);

            //s1 anda dois passos
            //passo
            for(int i = 0; i < TAM_ESTADO; i++) newEstado[i]=0; //zera o newEstado

            //calcula novo estado
            for(int i = 0; i < TAM_REDE; i++)
            {
                int bitVar = 0; //bit no qual a variavel i é representada
                int posAtr = 0; //posição do bit no vetor do estado
                int sum_prod =0, pos = pesoIni[i] , eqsize = eqSize[i], Teq = T[i];
                //aplicando a tlf
                for(int j = 0; j < eqsize;  j++, pos += 2){
                    bitVar = (TAM_REDE-1)-peso[pos];
                    posAtr = TAM_ESTADO - bitVar/32 - (bitVar%32!=0) ;
                    sum_prod += ((s1[posAtr] >>(bitVar%32))% 2)*peso[pos+1];
                }
                bitVar = (TAM_REDE-1)-i;
                newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar%32);
            }
            //atualiza s1
            for(int i = 0; i < TAM_ESTADO; i++) s1[i] = newEstado[i];

            asm("mov.u32 %0,%%clock;":"=r"(c1));
            //passo
            for(int i = 0; i < TAM_ESTADO; i++) newEstado[i]=0; //zera o newEstado

            //calcula novo estado
            for(int i = 0; i < TAM_REDE; i++)
            {
                int bitVar = 0; //bit no qual a variavel i é representada
                int posAtr = 0; //posição do bit no vetor do estado
                int sum_prod =0, pos = pesoIni[i] , eqsize = eqSize[i], Teq = T[i];
                //aplicando a tlf
                for(int j = 0; j < eqsize;  j++, pos += 2){
                    bitVar = (TAM_REDE-1)-peso[pos];
                    posAtr = TAM_ESTADO - bitVar/32 - (bitVar%32!=0) ;
                    sum_prod += ((s1[posAtr] >>(bitVar%32))% 2)*peso[pos+1];
                }
                bitVar = (TAM_REDE-1)-i;
                newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar%32);
            }
            //atualiza s1
            for(int i = 0; i < TAM_REDE; i++) s1[i] = newEstado[i];
            asm("mov.u32 %0,%%clock;":"=r"(c2));
            /* passo(s1,tamEstado,sh_g);
            passo(s1,tamEstado,sh_g); */

            //testando se s0 != s1
            diferente = false;
            for(int i = 0; i < TAM_ESTADO; i++) if(s0[i] != s1[i]){ diferente = true; break;}
        }while(diferente);
        __syncthreads();
        //Neste ponto s0 == s1

    //tempo do ultimo passo
    C[idx] = c2 - c1;
        //salva na memória global sequencialmente

	for(unsigned int block = 0; block < gridDim.x; block++)
	{
	    if(blockIdx.x == block)
	    {
            for(unsigned int thread = 0; thread < blockDim.x; thread++)
            {
                if(threadIdx.x == thread)
                {
                    int upperBit = -1, lowerBit = -1, hash = 0;
                    #pragma unroll
                    for(int i = 0; i < TAM_REDE; i++)
                    {
                        int bitVar = TAM_REDE -1 - i;
                        int posAtr = TAM_ESTADO - bitVar/32 - (bitVar%32!=0) ;
                        bool bit = (s1[posAtr] >> (bitVar%32))% 2;
                        if(lowerBit == -1 && (bit == 1))
                            lowerBit = i+1;
                        
                        if(bit == 1)
                        {
                            upperBit = i + 1;
                            hash += upperBit;
                        }
                    }
                    if(upperBit == -1) hash = 0;
                    else hash = (hash)/1024 + upperBit;
                    
                    assert(hash < TABLE_SIZE);
                    //insere o estado na tabela hash :
                    if(hash >= TABLE_SIZE || hash < 0){
                        printf("Estado : ");
                        for(int i = 0; i < TAM_ESTADO; i++) printf("%X",s1[i]);
                        printf(" , hash : %d\n",hash);
                        return;
                    }

                    //confere se o balde já está cheio e acha um balde vazio
                    bool igual = true;
                    for(int i = 0; i < TAM_ESTADO; i++) if(Tabela[hash].atr[i] != s1[i]) {igual = false; break;}
                    if(igual)
                    {
                        atomicAdd((unsigned long long *)&(Tabela[hash].cont), (unsigned long long)1);//se dois estados caem no mesmo balde, soma mais um no estado
                    }
                    else
                    {
                        //procura um balde vazio desde que o estado encontrado nao seja igual ao dos baldes encontrados no caminho
                        while(Tabela[hash].cont != 0 && (!igual))
                        {   
                            hash++;
                            igual = true;
                            for(int i = 0; i < TAM_ESTADO; i++) if(Tabela[hash].atr[i] != s1[i]) {igual = false; break;}
                        }
                        
                        
                        for(int i = 0; i < TAM_ESTADO; i++){ Tabela[hash].atr[i]=s1[i];} 
                        atomicAdd((unsigned long long *)&(Tabela[hash].cont), (unsigned long long)1);
                        Tabela[hash].periodo=1;
                    }    		
                } 
                __syncthreads();		
            }
            __syncthreads();
	    }
	    __syncthreads();
	}
    __syncthreads();
        
       
    }
}

__global__ void gen_rand(curandState * curstate, const Grafo g, const unsigned long long MAX_TREAD_ID)
{
    unsigned long long idx = blockDim.x*blockIdx.x + threadIdx.x;

    
    if(idx < MAX_TREAD_ID)
    {
        //inicia a seed
        curand_init(idx, idx, 0, curstate + idx);
        
        unsigned int tamEstado = g.nEq/32 + (g.nEq%32!=0);
        unsigned int * estado;
        estado = (unsigned int *)malloc(sizeof(unsigned int)*tamEstado);
        for(int i = 0; i < tamEstado; i++) estado[i] = 0;  
        
       
        
        for(int i = 0; i < tamEstado; i++)
            estado[i] = curand(curstate + idx);
        
        
        for(unsigned long long id = 0; id < MAX_TREAD_ID; id++)
        {
            __syncthreads();
            if(id == idx)
            {
                for(int i = 0; i < tamEstado; i++) printf("%u",estado[i]);
                printf("\n");
                __syncthreads();
            }
            __syncthreads();
        }
        __syncthreads();
        
        /*
        free(estado); */

    }

    return;

}


Atrator * junta_atrator(Atrator * Tabela, const Grafo &g, const string tec)
{
    int tamEstado = g.nEq/32 + (g.nEq%32 != 0);
    //ajeita tabela da GPU
    if(tec == "bananas")
    {
        for(int i = 0; i < TABLE_SIZE; i++)
        {
            if(Tabela[i].cont != 0)
            {
                bool igual;
                int j;
                for(j = i+1; j < TABLE_SIZE; j++)
                {
                    igual = false;
                    if(Tabela[j].cont != 0)
                    {
                        igual = true;
                        for(int z = 0; z < tamEstado; z++) if(Tabela[i].atr[z] != Tabela[j].atr[z]){ igual = false; break;}
                    }
                    if(igual)
                    {
                        Tabela[i].cont += Tabela[j].cont;
                        Tabela[j].cont = 0;
                    }
                }
                
            }
        }
    }


    Atrator * resultado = new Atrator[TABLE_SIZE];

    //inicializa tabela
    for(int i = 0; i < TABLE_SIZE; i++) 
    {
        resultado[i].cont = 0;
        resultado[i].periodo = 0;
    }

    //variaveis auxiliares
    unsigned int * newEstado = new unsigned int[tamEstado];
    unsigned int * aux = new unsigned int[tamEstado]; //auxiliar para saber os próximos estados do atratror

    
    //junta os atratores da Tabela no resultado
    for(int i = 0; i < TABLE_SIZE; i++)
    {
        if(Tabela[i].cont != 0)
        {
            resultado[i].periodo = Tabela[i].periodo;
            resultado[i].cont = Tabela[i].cont;
            vector<unsigned int> atr(tamEstado); // atrator completo que será armazenado em resultado[i].atr

            //zera a posição visitada na Tabela
            Tabela[i].cont = 0;

            for(int j = 0; j < tamEstado; j++) aux[j] = atr[j] = Tabela[i].atr[j];//inicialização de aux e atr

            //aplica um passo em atr para encontrar o próximo estado do atrator
           
            //passo
            for(int j = 0; j < tamEstado; j++) newEstado[j]=0; //zera o newEstado

            //calcula novo estado
            for(int j = 0; j < g.nEq; j++)
            {
                int bitVar = 0; //bit no qual a variavel i é representada
                int posAtr = 0; //posição do bit no vetor do estado
                int sum_prod =0, pos = g.pesoIni[j] , eqsize = g.eqSize[j], Teq = g.T[j];
                //aplicando a tlf
                for(int z = 0; z < eqsize;  z++, pos += 2){
                    bitVar = (g.nEq-1)-g.peso[pos];
                    posAtr = tamEstado - bitVar/32 - (bitVar%32!=0) ;
                    sum_prod += ((aux[posAtr] >>(bitVar%32))% 2)*g.peso[pos+1];
                }
                bitVar = (g.nEq-1)-j;
                newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar%32);
            }
            //atualiza aux
            for(int j = 0; j < tamEstado; j++) aux[j] = newEstado[j];
            
            //testar se aux != Tabela[i].atr[j]
            bool diferente = false;
            for(int j = 0; j < tamEstado; j++) if(aux[j] != Tabela[i].atr[j]){ diferente = true; break;}
            while(diferente)
            {

               /*  for(int j = 0; j < tamEstado; j++) printf("%X",aux[j]);
                cout << endl; */

                //calcula o hash do estado atual
                int upperBit = -1, lowerBit = -1, hash = 0;
                #pragma unroll
                for(int j = 0; j < g.nEq; j++)
                {
                    int bitVar = g.nEq -1 - j;
                    int posAtr = tamEstado - bitVar/32 - (bitVar%32!=0) ;
                    bool bit = (aux[posAtr] >>(bitVar%32))% 2;
                    if(lowerBit == -1 && (bit == 1))
                        lowerBit = j+1;
                    
                    if(bit == 1)
                    {
                        upperBit = j + 1;
                        hash += upperBit;
                    }
                }
                if(upperBit == -1) hash = 0;
                else hash = (hash)/1024 + upperBit;
                    

                bool igual = true;
                assert(hash < TABLE_SIZE);

                //procurando se o estado encontrado no ciclo esta na tabela
                for(int j = 0; j < tamEstado; j++) if(Tabela[hash].atr[j] != aux[j]) {igual = false; break;}
                //procurando se o estado encontrado no ciclo esta na tabela
                if(hash < TABLE_SIZE) //se o estado estiver na tabela extraimos seus dados
                {
                    while(hash < TABLE_SIZE && !igual)
                    {
                        hash++;
                        igual = true;
                        if(hash < TABLE_SIZE) for(int j = 0; j < tamEstado; j++) if(Tabela[hash].atr[j] != aux[j]) {igual = false; break;}
                    } 
                }
                

                for(int j = 0; j < tamEstado; j++) atr.push_back(aux[j]);
                resultado[i].periodo++;
                
                if(hash < TABLE_SIZE) //se o estado estiver na tabela extraimos seus dados
                {
                    resultado[i].cont += Tabela[hash].cont;
                    Tabela[hash].cont = 0; // já contamos esse estado em algum atrator 
                    assert(Tabela[hash].cont == 0);
                }

                //da um passo em aux
                for(int j = 0; j < tamEstado; j++) newEstado[j]=0; //zera o newEstado

                //calcula novo estado
                for(int j = 0; j < g.nEq; j++)
                {
                    int bitVar = 0; //bit no qual a variavel i é representada
                    int posAtr = 0; //posição do bit no vetor do estado
                    int sum_prod =0, pos = g.pesoIni[j] , eqsize = g.eqSize[j], Teq = g.T[j];
                    //aplicando a tlf
                    for(int z = 0; z < eqsize;  z++, pos += 2){
                        bitVar = (g.nEq-1)-g.peso[pos];
                        posAtr = tamEstado - bitVar/32 - (bitVar%32!=0) ;
                        sum_prod += ((aux[posAtr] >>(bitVar%32))% 2)*g.peso[pos+1];
                    }
                    bitVar = (g.nEq-1)-j;
                    newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar%32);
                }
                //atualiza aux
                for(int j = 0; j < tamEstado; j++) aux[j] = newEstado[j];


                //aux != Tabela[i].atr ?
                diferente = false;
                for(int j = 0; j < tamEstado; j++) if(aux[j] != Tabela[i].atr[j]){ diferente = true; break;}
            }


            //copia o atrator completo para a tabela de resultado
            resultado[i].atr = new unsigned int[atr.size()];
            for(int j = 0; j < atr.size(); j++) resultado[i].atr[j] = atr[j];


        }

    }
    
    delete [] aux;
    delete [] newEstado;

    return resultado;
}



int main(int argc, char **argv)
{

    int nEq; // numero de equações

    //ler o grafo pelo arquivo de entrada
    filebuf fb;
    if(!fb.open(argv[1],ios::in)) 
    {
        cerr << "Erro ao abrir arquivo de entrada " << argv[1] <<endl;
        exit(0);
    }

    istream is(&fb);
    is >> nEq; //numero de equações, tamanho da rede
    
    Grafo g, d_g; //grafo da cpu e da gpu 
    g.eqSize = new int[nEq];
    g.pesoIni = new int[nEq];
    g.T = new int[nEq];
    g.nEq = nEq;

    cudaMalloc((int **)&(d_g.eqSize),sizeof(int)*nEq);
    cudaMalloc((int **)&(d_g.pesoIni),sizeof(int)*nEq);
    cudaMalloc((int **)&(d_g.T),sizeof(int)*nEq);

    //ler os tamanhos das equações a seguir
    int nPesos = 0; // numero de pesos

    for(int i = 0; i < nEq; i++)
    {
        is >> g.eqSize[i];
        nPesos+= g.eqSize[i];
    }

    nPesos *= 2;
    g.peso = new int [nPesos];
    cudaMalloc((int **)&(d_g.peso),nPesos*sizeof(int));

    int posPeso = 0; //posição dos pesos
    for(int i = 0; i < nEq; i++)
    {
        int var=0, peso=0, T=0; // variavel da equação, peso e threshold
        g.pesoIni[i] = posPeso;
        for(int j = 0; j < g.eqSize[i]; j++,posPeso+=2)
        {
            is >> var >> peso;
            g.peso[posPeso] = var;
            g.peso[posPeso + 1] = peso;
        }
        is >> T;
        g.T[i] = T;
    }
    fb.close(); // fim da leitura

    
    //inicializando objeto que vai para a gpu
    cudaMemcpy(d_g.eqSize, g.eqSize, sizeof(int)*nEq, cudaMemcpyHostToDevice);
    cudaMemcpy(d_g.pesoIni, g.pesoIni, sizeof(int)*nEq, cudaMemcpyHostToDevice);
    cudaMemcpy(d_g.T, g.T, sizeof(int)*nEq, cudaMemcpyHostToDevice);
    cudaMemcpy(d_g.peso, g.peso, sizeof(int)*nPesos, cudaMemcpyHostToDevice);
    d_g.nEq = g.nEq;
    //cudaMemcpy(&(d_g.nEq), &(g.nEq), sizeof(int), cudaMemcpyHostToDevice);


    //definindo tamanho da grid e dos blocos
    int threads = 1024;
    dim3 block(threads);

    unsigned long long MAX_ESTADO = 0;
    string argv2 = argv[2];
    for(int i = 0; i < argv2.size() ; i++)
        MAX_ESTADO += ((unsigned long int)(argv2[i] - '0'))*pow(10,argv2.size()-i-1);

    dim3 grid((MAX_ESTADO + block.x -1)/block.x);

    //Alocando tabela de atratores para cpu e para gpu
    Atrator *Tabela,*d_Tabela;
    Tabela = new Atrator[TABLE_SIZE];
    cudaMalloc((Atrator**)&d_Tabela, TABLE_SIZE*sizeof(Atrator));
    unsigned int * d_atr[TABLE_SIZE];

    int tamEstado = nEq/32 + (nEq%32 != 0);

    
    for(int i = 0; i < TABLE_SIZE; i++)
    {
        Tabela[i].atr = new unsigned int[tamEstado];
        Tabela[i].cont = 0;
        Tabela[i].periodo = 0;

        for(int j = 0; j < tamEstado; j++) Tabela[i].atr[j] = 0;
        
        cudaMalloc((void **)&(d_atr[i]), sizeof(unsigned int)*tamEstado);
        cudaMemcpy(d_atr[i], Tabela[i].atr, sizeof(unsigned int)*tamEstado, cudaMemcpyHostToDevice);

        cudaMemcpy(&(d_Tabela[i]), &(Tabela[i]), sizeof(Atrator), cudaMemcpyHostToDevice);
        cudaMemcpy(&(d_Tabela[i].atr), &(d_atr[i]), sizeof(unsigned int*), cudaMemcpyHostToDevice);
    }
    

    double MB_por_Estado = (9.0/40000.0) * MAX_ESTADO;
    size_t HeapSize = MB_por_Estado * 1024 * 1024;

    string tec = argv[3];
    
    unsigned int * h_C = new unsigned int[MAX_ESTADO];
    if(tec == "GPU")
    {
        //estado para gerar números aleatórios
        curandState * d_state;
        cudaMalloc((void **)&d_state, sizeof(curandState) * MAX_ESTADO);
        //cudaDeviceSetLimit(cudaLimitMallocHeapSize, HeapSize);
        
        unsigned int * d_C;
        cudaMalloc(&d_C,sizeof(unsigned int)*MAX_ESTADO);

        //gen_rand<<<1,1024>>>(d_state,d_g,MAX_ESTADO);
        atrator_tabela_sincrono<<<grid,block>>>(d_state,d_g,d_Tabela,MAX_ESTADO,d_C);
        cudaDeviceSynchronize();
        cudaMemcpy(h_C, d_C, sizeof(unsigned int)*MAX_ESTADO, cudaMemcpyDeviceToHost);
        //traz o resultado da GPU
        for(int i = 0; i < TABLE_SIZE; i++)
        {
            cudaMemcpy(Tabela[i].atr, d_atr[i], tamEstado*sizeof(unsigned int), cudaMemcpyDeviceToHost);
            cudaMemcpy(&(Tabela[i].cont), &(d_Tabela[i].cont), sizeof(unsigned long long), cudaMemcpyDeviceToHost);
            cudaMemcpy(&(Tabela[i].periodo), &(d_Tabela[i].periodo), sizeof(unsigned long long), cudaMemcpyDeviceToHost);
        }

    }
    else if(tec == "CPU") atrator_tabela_sincrono_cpu(g,Tabela,MAX_ESTADO);
    else
    {
        cerr << "Argumento "<<tec<<" inválido : escolha entre GPU ou CPU!"<<endl;
        //desalocando memória
        for(int i = 0; i < TABLE_SIZE; i++){ delete [] Tabela[i].atr; cudaFree(d_atr[i]);}  
        delete [] Tabela;
        cudaFree(d_Tabela);

        delete [] g.peso;
        delete [] g.pesoIni;
        delete [] g.eqSize;
        delete [] g.T;
        cudaFree(d_g.peso);
        cudaFree(d_g.pesoIni);
        cudaFree(d_g.eqSize);
        cudaFree(d_g.T);
        return 0;
    }
    //junta os atratores
    Atrator * resultado ;//= Tabela;
    resultado = junta_atrator(Tabela,g,tec);
    //return 0;
    //imprimindo resultado
    for(int i = 0; i < TABLE_SIZE; i++)
    {
        if(resultado[i].cont)
        {
            printf("%d ",resultado[i].periodo);
            for(int j = 0; j < resultado[i].periodo; j++)
            {
                for(int z = 0; z < tamEstado; z++) printf("%X",resultado[i].atr[j*tamEstado + z]);
                printf(" ");
            }
            printf("%llu\n", resultado[i].cont);
        }
    }

    double avgT = 0;
    for(int i = 0; i < MAX_ESTADO; i++)
        avgT += h_C[i];
    avgT /= MAX_ESTADO;
    if(tec == "CPU") avgT /= CLOCK_PER_SEC_CPU;
    else avgT /= CLOCK_PER_SEC_GPU;

    cerr << "Tempo de 1 passo : "<<h_C[1] << "s\n";

    //desalocando memória
    for(int i = 0; i < TABLE_SIZE; i++){ cudaFree(d_atr[i]); free(Tabela[i].atr);}  
    free(Tabela);
    free(resultado);
    cudaFree(d_Tabela);

    delete [] g.peso;
    delete [] g.pesoIni;
    delete [] g.eqSize;
    delete [] g.T;
    cudaFree(d_g.peso);
    cudaFree(d_g.pesoIni);
    cudaFree(d_g.eqSize);
    cudaFree(d_g.T);

    //reinicia o device
    cudaDeviceReset();
    return 0;
}
