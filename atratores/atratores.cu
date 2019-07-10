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

#define TABLE_SIZE 1024
#define BUCKET_SIZE 200
#define TAM_REDE CONSTANTE_REDE
#define TAM_PESOS CONSTANTE_PESOS
#define TAM_ESTADO (TAM_REDE/32 + (TAM_REDE%32 != 0))

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
    if(g.nEq > 40){ aleatorio = true; srand(MAX_ESTADO);}  //rede grande, estados aleatórios   
    unsigned int * s0, *s1;
    s0 = (unsigned int *)malloc(TAM_ESTADO*sizeof(unsigned int));
    s1 = (unsigned int *)malloc(TAM_ESTADO*sizeof(unsigned int));
    for(unsigned long long estado = 0; estado < MAX_ESTADO; estado++)
    {
        //variáveis necessárias para realizar o passo
        
        for(int i = 0; i < TAM_ESTADO; i++)
            s0[i] = s1[i] = 0; 

        
        //inicializando estado inicial(o bit mais alto representa o vértice (nEq-1) e o bit mais baixo representa o vértice 0)
        if(aleatorio)
        {
            for(int i = 0; i < TAM_ESTADO; i++)
                s0[i] = (unsigned int)rand() % UINT_MAX; //preenche o estado com numeros aleatórios
        }
        else
        {
            for(int i = 0; i < g.nEq; i++)
            {
                int var = g.nEq -1 - i; //variável desejada
                int posAtr = TAM_ESTADO - var/32 - (var%32!=0); //posição de atr onde se encontra o bit da variável desejada
                s0[posAtr] |= ((estado >> i)%2) << (var%32);
            }
        }
        

        for(int i = 0; i < TAM_ESTADO; i++)
            s1[i] = s0[i];

         //variaveis auxiliares
         unsigned int * newEstado = (unsigned int *)malloc(sizeof(unsigned int)*TAM_ESTADO);
        
         bool diferente = false;
        
        //procurando o atrator onde os estados caem
        do
        {
            //s0 anda um passo

            //passo
            for(int i = 0; i < TAM_ESTADO; i++) newEstado[i]=0; //zera o newEstado

            //calcula novo estado
            for(int i = 0; i < g.nEq; i++)
            {
                int bitVar = 0; //bit no qual a variavel i é representada
                int posAtr = 0; //posição do bit no vetor do estado
                int sum_prod =0, pos = g.pesoIni[i] , eqsize = g.eqSize[i], Teq = g.T[i];
                //aplicando a tlf
                for(int j = 0; j < eqsize;  j++, pos += 2){
                    bitVar = (g.nEq-1)-g.peso[pos];
                    posAtr = TAM_ESTADO - bitVar/32 - (bitVar%32!=0) ;
                    sum_prod += ((s0[posAtr] >>(bitVar%32))% 2)*g.peso[pos+1];
                }
                bitVar = (g.nEq-1)-i; //variavel que será atualizada no novo estado
                newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar - 32*posAtr);
            }
            //atualiza s0
            for(int i = 0; i < TAM_ESTADO; i++) s0[i] = newEstado[i];

            //s1 anda dois passos
            //passo
            for(int i = 0; i < TAM_ESTADO; i++) newEstado[i]=0; //zera o newEstado

            //calcula novo estado
            for(int i = 0; i < g.nEq; i++)
            {
                int bitVar = 0; //bit no qual a variavel i é representada
                int posAtr = 0; //posição do bit no vetor do estado
                int sum_prod =0, pos = g.pesoIni[i] , eqsize = g.eqSize[i], Teq = g.T[i];
                //aplicando a tlf
                for(int j = 0; j < eqsize;  j++, pos += 2){
                    bitVar = (g.nEq-1)-g.peso[pos];
                    posAtr = TAM_ESTADO - bitVar/32 - (bitVar%32!=0) ;
                    sum_prod += ((s1[posAtr] >>(bitVar%32))% 2)*g.peso[pos+1];
                }
                bitVar = (g.nEq-1)-i;
                newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar - 32*posAtr);
            }
            //atualiza s1
            for(int i = 0; i < TAM_ESTADO; i++) s1[i] = newEstado[i];

            //passo
            for(int i = 0; i < TAM_ESTADO; i++) newEstado[i]=0; //zera o newEstado

            //calcula novo estado
            for(int i = 0; i < g.nEq; i++)
            {
                int bitVar = 0; //bit no qual a variavel i é representada
                int posAtr = 0; //posição do bit no vetor do estado
                int sum_prod =0, pos = g.pesoIni[i] , eqsize = g.eqSize[i], Teq = g.T[i];
                //aplicando a tlf
                for(int j = 0; j < eqsize;  j++, pos += 2){
                    bitVar = (g.nEq-1)-g.peso[pos];
                    posAtr = TAM_ESTADO - bitVar/32 - (bitVar%32!=0) ;
                    sum_prod += ((s1[posAtr] >>(bitVar%32))% 2)*g.peso[pos+1];
                }
                bitVar = (g.nEq-1)-i;
                newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar - 32*posAtr);
            }
            //atualiza s1
            for(int i = 0; i < TAM_ESTADO; i++) s1[i] = newEstado[i];

            //testando se s0 != s1
            diferente = false;
            for(int i = 0; i < TAM_ESTADO; i++) if(s0[i] != s1[i]){ diferente = true; break;}
        }while(diferente);

        int upperBit = -1, lowerBit = -1, hash = 0;
        #pragma unroll
        for(int i = 0; i < g.nEq; i++)
        {
            int bitVar = g.nEq -1 - i;
            int posAtr = TAM_ESTADO - bitVar/32 - (bitVar%32!=0) ;
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
            for(int i = 0; i < TAM_ESTADO; i++) printf("%d",s1[i]);
            printf(" , hash : %d\n",hash);
            return;
        }

        //salvar o atrator na tabela
        bool igual = true;
        for(int i = 0; i < TAM_ESTADO; i++) if(Tabela[hash].atr[i] != s1[i]) {igual = false; break;}
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
                for(int i = 0; i < TAM_ESTADO; i++) if(Tabela[hash].atr[i] != s1[i]) {igual = false; break;} 
                
            } 
            if(!igual)
                for(int i = 0; i < TAM_ESTADO; i++) Tabela[hash].atr[i]=s1[i];
            Tabela[hash].cont+=1;//se dois estados caem no mesmo balde, soma mais um no estado
            Tabela[hash].periodo=1;
        }
        
    }

    free(s0);
    free(s1);
    return;
}

/* __device__ void passo(unsigned int * estado, unsigned int TAM_ESTADO, const Grafo &g)
{
    unsigned int * newEstado;
    newEstado = (unsigned int *)malloc(sizeof(unsigned int)*TAM_ESTADO);

    //passo
    for(int i = 0; i < TAM_ESTADO; i++) newEstado[i]=0; //zera o newEstado

    //calcula novo estado
    for(int i = 0; i < g.nEq; i++)
    {
        int bitVar = 0; //bit no qual a variavel i é representada
        int posAtr = 0; //posição do bit no vetor do estado
        int sum_prod =0, pos = g.pesoIni[i] , eqsize = g.eqSize[i], Teq = g.T[i];
        //aplicando a tlf
        for(int j = 0; j < eqsize;  j++, pos += 2){
            bitVar = (g.nEq-1)-g.peso[pos];
            posAtr = TAM_ESTADO - bitVar/32 - (bitVar%32!=0) ;
            sum_prod += ((estado[posAtr] >>(bitVar%32))% 2)*g.peso[pos+1];
        }
        bitVar = (g.nEq-1)-i; //variavel que será atualizada no novo estado
        newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar%32);
    }
    //atualiza s0
    for(int i = 0; i < TAM_ESTADO; i++) estado[i] = newEstado[i];

    free(newEstado);

} */


__global__ void atrator_tabela_sincrono(curandState * curstate, const Grafo g, Atrator *Tabela, unsigned long long MAX_THREAD_ID)
{
    //o id da tread é calculado para evitar que as threads excedentes sejam utilizadas
    unsigned long long idx = blockDim.x*blockIdx.x + threadIdx.x;
    //calculo do estado : estado = blockDim.x*blockIdx.x + threadIdx.x 
    if(idx < MAX_THREAD_ID)
    {
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
        if(TAM_PESOS <= 1024)
        {
            if(threadIdx.x<TAM_PESOS)
            {
                peso[threadIdx.x*2] = peso[threadIdx.x*2];
                peso[threadIdx.x*2+1] = peso[threadIdx.x*2+1]; 
            }
        }
        else
        {
            int total = TAM_PESOS;
            while(total >= blockDim.x)
            {
                peso[threadIdx.x*2] = peso[threadIdx.x*2];
                peso[threadIdx.x*2+1] = peso[threadIdx.x*2+1];
                total = total - blockDim.x;
            }
            if(threadIdx.x<total)
            {
                peso[threadIdx.x*2] = peso[threadIdx.x*2];
                peso[threadIdx.x*2+1] = peso[threadIdx.x*2+1]; 
            }
        }
        __syncthreads();

        //rede grande, estado aleatório
        if(TAM_REDE > 25)
            curand_init(idx, idx, 0, curstate + idx);//inicia a seed


        //variáveis necessárias para realizar o passo
        unsigned int s0[TAM_ESTADO], s1[TAM_ESTADO];
        
        //testa se a memoria foi alocada corretamente
        /* assert(s0 != NULL);
        assert(s1 != NULL); */

        for(int i = 0; i < TAM_ESTADO; i++)
            s0[i] = s1[i] = 0; 
        
        if(TAM_REDE > 25)
        {
            for(int i = 0; i < TAM_ESTADO; i++)
               s1[i] = s0[i] = curand(curstate + idx);
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
        unsigned int newEstado[TAM_ESTADO];
        //assert(newEstado != NULL); //testa se a nenoria foi alocada corretamente

        //testando se s0 != s1
        bool diferente = false;
        
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

            //passo(s0,TAM_ESTADO,sh_g);

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
            /* passo(s1,TAM_ESTADO,sh_g);
            passo(s1,TAM_ESTADO,sh_g); */

            //testando se s0 != s1
            diferente = false;
            for(int i = 0; i < TAM_ESTADO; i++) if(s0[i] != s1[i]){ diferente = true; break;}
        }while(diferente);
        __syncthreads();
        //Neste ponto s0 == s1



        //salva na memória global sequencialmente

	
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
            printf("Erro ao calcular hash\n");
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
            __syncthreads();
            
            for(int i = 0; i < TAM_ESTADO; i++){ Tabela[hash].atr[i]=s1[i];} 
            atomicAdd((unsigned long long *)&(Tabela[hash].cont), (unsigned long long)1);
            Tabela[hash].periodo=1;
        }    		
        __syncthreads();		
     
        
        /* if(threadIdx.x == 0)
        {
            for(int i = 0; i < TAM_ESTADO; i++) printf("%X",s1[i]);
            printf("\n");
        } */
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
        unsigned int * estado;
        estado = (unsigned int *)malloc(sizeof(unsigned int)*TAM_ESTADO);
        for(int i = 0; i < TAM_ESTADO; i++) estado[i] = 0;  
        
       
        
        for(int i = 0; i < TAM_ESTADO; i++)
            estado[i] = curand(curstate + idx);

        /* for(int i = 0; i < TAM_ESTADO; i++)
        {
            float randf = curand_uniform(curstate + idx);
            unsigned int max = (2<<31)-1;
            randf *= ( max + 0.999999);
            randf += 0;
            unsigned int num = (unsigned int)truncf(randf);
            estado[i] = num;
        } */
        
        /* for(int i = 0; i < g.nEq; i++)
        {
            int var = g.nEq -1 - i; //variável desejada
            int posAtr = var/32 + (var%32!=0) - 1; //posição de atr onde se encontra o bit da variável desejada

            float randf = curand_uniform(curstate + idx);
            randf *= (1 - 0 + 0.999999);
            randf += 0;
            unsigned int bit = (unsigned int)truncf(randf);
            estado[posAtr] |= bit << (var - 32*posAtr);
        } */
        
        
        for(unsigned long long id = 0; id < MAX_TREAD_ID; id++)
        {
            __syncthreads();
            if(id == idx)
            {
                for(int i = 0; i < TAM_ESTADO; i++) printf("%u",estado[i]);
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
    //ajeita tabela da GPU
    /* if(tec == "GPU")
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
                        for(int z = 0; z < TAM_ESTADO; z++) if(Tabela[i].atr[z] != Tabela[j].atr[z]){ igual = false; break;}
                    }
                    if(igual)
                    {
                        Tabela[i].cont += Tabela[j].cont;
                        Tabela[j].cont = 0;
                    }
                }
                
            }
        }
    } */


    

    Atrator * resultado = new Atrator[TABLE_SIZE];

    //inicializa tabela
    for(int i = 0; i < TABLE_SIZE; i++) 
    {
        resultado[i].cont = 0;
        resultado[i].periodo = 0;
    }

    //variaveis auxiliares
    unsigned int * newEstado = new unsigned int[TAM_ESTADO];
    unsigned int * aux = new unsigned int[TAM_ESTADO]; //auxiliar para saber os próximos estados do atratror

    
    //junta os atratores da Tabela no resultado
    for(int i = 0; i < TABLE_SIZE; i++)
    {
        if(Tabela[i].cont != 0)
        {
            resultado[i].periodo = Tabela[i].periodo;
            resultado[i].cont = Tabela[i].cont;
            vector<unsigned int> atr(TAM_ESTADO); // atrator completo que será armazenado em resultado[i].atr

            //zera a posição visitada na Tabela
            Tabela[i].cont = 0;

            for(int j = 0; j < TAM_ESTADO; j++) aux[j] = atr[j] = Tabela[i].atr[j];//inicialização de aux e atr

            //aplica um passo em atr para encontrar o próximo estado do atrator
           
            //passo
            for(int j = 0; j < TAM_ESTADO; j++) newEstado[j]=0; //zera o newEstado

            //calcula novo estado
            for(int j = 0; j < g.nEq; j++)
            {
                int bitVar = 0; //bit no qual a variavel i é representada
                int posAtr = 0; //posição do bit no vetor do estado
                int sum_prod =0, pos = g.pesoIni[j] , eqsize = g.eqSize[j], Teq = g.T[j];
                //aplicando a tlf
                for(int z = 0; z < eqsize;  z++, pos += 2){
                    bitVar = (g.nEq-1)-g.peso[pos];
                    posAtr = TAM_ESTADO - bitVar/32 - (bitVar%32!=0) ;
                    sum_prod += ((aux[posAtr] >>(bitVar%32))% 2)*g.peso[pos+1];
                }
                bitVar = (g.nEq-1)-j;
                newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar%32);
            }
            //atualiza aux
            for(int j = 0; j < TAM_ESTADO; j++) aux[j] = newEstado[j];
            
            //testar se aux != Tabela[i].atr[j]
            bool diferente = false;
            for(int j = 0; j < TAM_ESTADO; j++) if(aux[j] != Tabela[i].atr[j]){ diferente = true; break;}
            while(diferente)
            {

               /*  for(int j = 0; j < TAM_ESTADO; j++) printf("%X",aux[j]);
                cout << endl; */

                //calcula o hash do estado atual
                int upperBit = -1, lowerBit = -1, hash = 0;
                #pragma unroll
                for(int j = 0; j < g.nEq; j++)
                {
                    int bitVar = g.nEq -1 - j;
                    int posAtr = TAM_ESTADO - bitVar/32 - (bitVar%32!=0) ;
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
                for(int j = 0; j < TAM_ESTADO; j++) if(Tabela[hash].atr[j] != aux[j]) {igual = false; break;}
                //procurando se o estado encontrado no ciclo esta na tabela
                if(hash < TABLE_SIZE) //se o estado estiver na tabela extraimos seus dados
                {
                    while(hash < TABLE_SIZE && !igual)
                    {
                        hash++;
                        igual = true;
                        if(hash < TABLE_SIZE) for(int j = 0; j < TAM_ESTADO; j++) if(Tabela[hash].atr[j] != aux[j]) {igual = false; break;}
                    } 
                }
                

                for(int j = 0; j < TAM_ESTADO; j++) atr.push_back(aux[j]);
                resultado[i].periodo++;
                
                if(hash < TABLE_SIZE) //se o estado estiver na tabela extraimos seus dados
                {
                    resultado[i].cont += Tabela[hash].cont;
                    Tabela[hash].cont = 0; // já contamos esse estado em algum atrator 
                    assert(Tabela[hash].cont == 0);
                }

                //da um passo em aux
                for(int j = 0; j < TAM_ESTADO; j++) newEstado[j]=0; //zera o newEstado

                //calcula novo estado
                for(int j = 0; j < g.nEq; j++)
                {
                    int bitVar = 0; //bit no qual a variavel i é representada
                    int posAtr = 0; //posição do bit no vetor do estado
                    int sum_prod =0, pos = g.pesoIni[j] , eqsize = g.eqSize[j], Teq = g.T[j];
                    //aplicando a tlf
                    for(int z = 0; z < eqsize;  z++, pos += 2){
                        bitVar = (g.nEq-1)-g.peso[pos];
                        posAtr = TAM_ESTADO - bitVar/32 - (bitVar%32!=0) ;
                        sum_prod += ((aux[posAtr] >>(bitVar%32))% 2)*g.peso[pos+1];
                    }
                    bitVar = (g.nEq-1)-j;
                    newEstado[posAtr] |= (sum_prod >= Teq) << (bitVar%32);
                }
                //atualiza aux
                for(int j = 0; j < TAM_ESTADO; j++) aux[j] = newEstado[j];


                //aux != Tabela[i].atr ?
                diferente = false;
                for(int j = 0; j < TAM_ESTADO; j++) if(aux[j] != Tabela[i].atr[j]){ diferente = true; break;}
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


__global__ void testekernel()
{
    if(threadIdx.x == 0)
        printf("Bloco %d Thread %d\n",blockIdx.x,threadIdx.x);
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

    for(int i = 0; i < TAM_REDE; i++)
    {
        is >> g.eqSize[i];
        nPesos+= g.eqSize[i];
    }

    nPesos *= 2;
    g.peso = new int [nPesos];
    cudaMalloc((int **)&(d_g.peso),nPesos*sizeof(int));

    int posPeso = 0; //posição dos pesos
    for(int i = 0; i < TAM_REDE; i++)
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
    
    for(int i = 0; i < TABLE_SIZE; i++)
    {
        Tabela[i].atr = new unsigned int[TAM_ESTADO];
        Tabela[i].cont = 0;
        Tabela[i].periodo = 0;

        for(int j = 0; j < TAM_ESTADO; j++) Tabela[i].atr[j] = 0;
        
        cudaMalloc((void **)&(d_atr[i]), sizeof(unsigned int)*TAM_ESTADO);
        cudaMemcpy(d_atr[i], Tabela[i].atr, sizeof(unsigned int)*TAM_ESTADO, cudaMemcpyHostToDevice);

        cudaMemcpy(&(d_Tabela[i]), &(Tabela[i]), sizeof(Atrator), cudaMemcpyHostToDevice);
        cudaMemcpy(&(d_Tabela[i].atr), &(d_atr[i]), sizeof(unsigned int*), cudaMemcpyHostToDevice);
    }
    

    double MB_por_Estado = (9.0/40000.0) * MAX_ESTADO;
    size_t HeapSize = MB_por_Estado * 1024 * 1024;

    string tec = argv[3];
    if(tec == "GPU")
    {
        curandState * d_state;
        cudaMalloc((void **)&d_state, sizeof(curandState) * MAX_ESTADO);
        //cudaDeviceSetLimit(cudaLimitMallocHeapSize, HeapSize);
    
        atrator_tabela_sincrono<<<grid,block>>>(d_state,d_g,d_Tabela,MAX_ESTADO);
        cudaDeviceSynchronize();
        //traz o resultado da GPU
        for(int i = 0; i < TABLE_SIZE; i++)
        {
            cudaMemcpy(Tabela[i].atr, d_atr[i], TAM_ESTADO*sizeof(unsigned int), cudaMemcpyDeviceToHost);
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
        if(resultado[i].periodo != 0)
        {
            printf("%u ",resultado[i].periodo);
            for(int j = 0; j < resultado[i].periodo; j++)
            {
                for(int z = 0; z < TAM_ESTADO; z++) printf("%X",resultado[i].atr[j*TAM_ESTADO + z]);
                printf(" ");
            }
                
            //binario
              for(int j = 0; j < g.nEq; j++)
            {
                int var = g.nEq -1 - j; //variável desejada
                int posAtr = var/32 + (var%32!=0) - 1; //posição de atr onde se encontra o bit da variável desejada
                bool valor = (Tabela[i].atr[posAtr]>>(var-32*posAtr))%2;
                printf("%d",valor);
            } 
            printf("%llu\n", resultado[i].cont); 
        }   
    }
    
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
