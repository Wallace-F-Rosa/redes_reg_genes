#include <iostream>
#include <chrono>
#include <ctime>
#include <string>
#include <limits>
#include <stdio.h>
#include <stdlib.h>

#define CLOCKS_PER_SEC_CPU 1100000000
using namespace std;
//REDE 2

__global__ void passo_bool_2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( (v>>25)%2 )<< 0 ;
        aux |=(unsigned long long) ( (v>>29)%2 )<< 1 ;
        aux |=(unsigned long long) ( ( (v>>13)%2 & ( ( ( (v>>3)%2 & (v>>24)%2 ) ) ) ) & ! ( (v>>17)%2 ) )<< 2 ;
        aux |=(unsigned long long) ( (v>>38)%2 )<< 3 ;
        aux |=(unsigned long long) ( ( (v>>38)%2 ) & ! ( (v>>1)%2 ) )<< 4 ;
        aux |=(unsigned long long) ( ( (v>>20)%2 & ( ( ( (v>>38)%2 ) ) ) ) & ! ( (v>>6)%2 ) ) | ( ( (v>>12)%2 & ( ( ( (v>>38)%2 ) ) ) ) & ! ( (v>>6)%2 ) )<< 5 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) & ! ( (v>>4)%2 ) ) & ! ( (v>>38)%2 ) )<< 6 ;
        aux |=(unsigned long long) ( (v>>11)%2 )<< 7 ;
        aux |=(unsigned long long) ( ( (v>>2)%2 ) & ! ( (v>>17)%2 ) ) | ( ( (v>>12)%2 ) & ! ( (v>>17)%2 ) ) | ( (v>>10)%2 )<< 8 ;
        aux |=(unsigned long long) ( (v>>8)%2 )<< 9 ;
        aux |=(unsigned long long) ( ( (v>>8)%2 ) & ! ( (v>>17)%2 ) )<< 10 ;
        aux |=(unsigned long long) ( ( (v>>2)%2 ) & ! ( (v>>17)%2 ) ) | ( ( (v>>12)%2 ) & ! ( (v>>17)%2 ) )<< 11 ;
        aux |=(unsigned long long) ( ( (v>>10)%2 ) & ! ( (v>>37)%2 ) ) | ( ( (v>>15)%2 ) & ! ( (v>>37)%2 ) )<< 12 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>17)%2 ) ) | ( ( ( (v>>7)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>17)%2 ) )<< 13 ;
        aux |=(unsigned long long) ( (v>>9)%2 & ( ( ( (v>>8)%2 ) ) ) )<< 14 ;
        aux |=(unsigned long long) ( (v>>34)%2 )<< 15 ;
        aux |=(unsigned long long) ( (v>>39)%2 )<< 16 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) & ! ( (v>>24)%2 ) ) & ! ( (v>>8)%2 & ( ( ( (v>>10)%2 ) ) ) ) )<< 17 ;
        aux |=(unsigned long long) ( ( (v>>1)%2 ) & ! ( (v>>0)%2 ) ) | ( ( (v>>26)%2 ) & ! ( (v>>0)%2 ) )<< 18 ;
        aux |=(unsigned long long) ( ( (v>>25)%2 ) & ! ( (v>>18)%2 ) )<< 19 ;
        aux |=(unsigned long long) ( (v>>21)%2 )<< 20 ;
        aux |=(unsigned long long) ( ( (v>>22)%2 ) & ! ( (v>>1)%2 ) )<< 21 ;
        aux |=(unsigned long long) ( (v>>35)%2 )<< 22 ;
        aux |=(unsigned long long) ( (v>>1)%2 ) | ( (v>>38)%2 )<< 23 ;
        aux |=(unsigned long long) ( ( (v>>5)%2 ) & ! ( (v>>6)%2 ) )<< 24 ;
        aux |=(unsigned long long) ! ( ( (v>>19)%2 ) )<< 25 ;
        aux |=(unsigned long long) ( (v>>36)%2 )<< 26 ;
        aux |=(unsigned long long) ( (v>>16)%2 )<< 27 ;
        aux |=(unsigned long long) ( (v>>16)%2 )<< 28 ;
        aux |=(unsigned long long) ( ( (v>>27)%2 & ( ( ( (v>>28)%2 ) ) ) ) & ! ( (v>>30)%2 ) )<< 29 ;
        aux |=(unsigned long long) ( (v>>38)%2 )<< 30 ;
        aux |=(unsigned long long) ( (v>>34)%2 )<< 31 ;
        aux |=(unsigned long long) ( (v>>40)%2 )<< 32 ;
        aux |=(unsigned long long) ( (v>>40)%2 )<< 33 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 34 ;
        aux |=(unsigned long long) ( (v>>34)%2 )<< 35 ;
        aux |=(unsigned long long) ( (v>>31)%2 )<< 36 ;
        aux |=(unsigned long long) ( (v>>35)%2 )<< 37 ;
        aux |=(unsigned long long) ( ( (v>>20)%2 ) & ! ( (v>>23)%2 ) ) | ( ( (v>>14)%2 ) & ! ( (v>>23)%2 ) )<< 38 ;
        aux |=(unsigned long long)(v>>39%2) << 39;
        aux |=(unsigned long long)(v>>40%2) << 40;
        aux |=(unsigned long long)(v>>41%2) << 41;
        
        printf("%ull\n",aux);
        estado[tid] = aux;
    }
}

unsigned long long confere_bool_2(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( (v>>25)%2 )<< 0 ;
        aux |=(unsigned long long) ( (v>>29)%2 )<< 1 ;
        aux |=(unsigned long long) ( ( (v>>13)%2 & ( ( ( (v>>3)%2 & (v>>24)%2 ) ) ) ) & ! ( (v>>17)%2 ) )<< 2 ;
        aux |=(unsigned long long) ( (v>>38)%2 )<< 3 ;
        aux |=(unsigned long long) ( ( (v>>38)%2 ) & ! ( (v>>1)%2 ) )<< 4 ;
        aux |=(unsigned long long) ( ( (v>>20)%2 & ( ( ( (v>>38)%2 ) ) ) ) & ! ( (v>>6)%2 ) ) | ( ( (v>>12)%2 & ( ( ( (v>>38)%2 ) ) ) ) & ! ( (v>>6)%2 ) )<< 5 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) & ! ( (v>>4)%2 ) ) & ! ( (v>>38)%2 ) )<< 6 ;
        aux |=(unsigned long long) ( (v>>11)%2 )<< 7 ;
        aux |=(unsigned long long) ( ( (v>>2)%2 ) & ! ( (v>>17)%2 ) ) | ( ( (v>>12)%2 ) & ! ( (v>>17)%2 ) ) | ( (v>>10)%2 )<< 8 ;
        aux |=(unsigned long long) ( (v>>8)%2 )<< 9 ;
        aux |=(unsigned long long) ( ( (v>>8)%2 ) & ! ( (v>>17)%2 ) )<< 10 ;
        aux |=(unsigned long long) ( ( (v>>2)%2 ) & ! ( (v>>17)%2 ) ) | ( ( (v>>12)%2 ) & ! ( (v>>17)%2 ) )<< 11 ;
        aux |=(unsigned long long) ( ( (v>>10)%2 ) & ! ( (v>>37)%2 ) ) | ( ( (v>>15)%2 ) & ! ( (v>>37)%2 ) )<< 12 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>17)%2 ) ) | ( ( ( (v>>7)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>17)%2 ) )<< 13 ;
        aux |=(unsigned long long) ( (v>>9)%2 & ( ( ( (v>>8)%2 ) ) ) )<< 14 ;
        aux |=(unsigned long long) ( (v>>34)%2 )<< 15 ;
        aux |=(unsigned long long) ( (v>>39)%2 )<< 16 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) & ! ( (v>>24)%2 ) ) & ! ( (v>>8)%2 & ( ( ( (v>>10)%2 ) ) ) ) )<< 17 ;
        aux |=(unsigned long long) ( ( (v>>1)%2 ) & ! ( (v>>0)%2 ) ) | ( ( (v>>26)%2 ) & ! ( (v>>0)%2 ) )<< 18 ;
        aux |=(unsigned long long) ( ( (v>>25)%2 ) & ! ( (v>>18)%2 ) )<< 19 ;
        aux |=(unsigned long long) ( (v>>21)%2 )<< 20 ;
        aux |=(unsigned long long) ( ( (v>>22)%2 ) & ! ( (v>>1)%2 ) )<< 21 ;
        aux |=(unsigned long long) ( (v>>35)%2 )<< 22 ;
        aux |=(unsigned long long) ( (v>>1)%2 ) | ( (v>>38)%2 )<< 23 ;
        aux |=(unsigned long long) ( ( (v>>5)%2 ) & ! ( (v>>6)%2 ) )<< 24 ;
        aux |=(unsigned long long) ! ( ( (v>>19)%2 ) )<< 25 ;
        aux |=(unsigned long long) ( (v>>36)%2 )<< 26 ;
        aux |=(unsigned long long) ( (v>>16)%2 )<< 27 ;
        aux |=(unsigned long long) ( (v>>16)%2 )<< 28 ;
        aux |=(unsigned long long) ( ( (v>>27)%2 & ( ( ( (v>>28)%2 ) ) ) ) & ! ( (v>>30)%2 ) )<< 29 ;
        aux |=(unsigned long long) ( (v>>38)%2 )<< 30 ;
        aux |=(unsigned long long) ( (v>>34)%2 )<< 31 ;
        aux |=(unsigned long long) ( (v>>40)%2 )<< 32 ;
        aux |=(unsigned long long) ( (v>>40)%2 )<< 33 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 34 ;
        aux |=(unsigned long long) ( (v>>34)%2 )<< 35 ;
        aux |=(unsigned long long) ( (v>>31)%2 )<< 36 ;
        aux |=(unsigned long long) ( (v>>35)%2 )<< 37 ;
        aux |=(unsigned long long) ( ( (v>>20)%2 ) & ! ( (v>>23)%2 ) ) | ( ( (v>>14)%2 ) & ! ( (v>>23)%2 ) )<< 38 ;
        aux |=(unsigned long long)(v>>39%2) << 39;
        aux |=(unsigned long long)(v>>40%2) << 40;
        aux |=(unsigned long long)(v>>41%2) << 41;
    
        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2) >= 2 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2 + ( (v>>3)%2 ) * 2 + ( (v>>24)%2 ) * 2 + ( (v>>17)%2 ) * -2) >= 6 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>38)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>38)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * 2 + ( (v>>38)%2 ) * 6 + ( (v>>6)%2 ) * -6 + ( (v>>12)%2 ) * 2) >= 8 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2 + ( (v>>4)%2 ) * -2 + ( (v>>38)%2 ) * -2) >= 2 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>11)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( ( (v>>2)%2 ) * 2 + ( (v>>17)%2 ) * -6 + ( (v>>12)%2 ) * 2 + ( (v>>10)%2 ) * 10) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2 + ( (v>>17)%2 ) * -2) >= 2 ) << 10 ;
        aux |=(unsigned long long) ( ( ( (v>>2)%2 ) * 2 + ( (v>>17)%2 ) * -6 + ( (v>>12)%2 ) * 2) >= 2 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 2 + ( (v>>37)%2 ) * -6 + ( (v>>15)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>17)%2 ) * -6 + ( (v>>7)%2 ) * 2) >= 2 ) << 13 ;
        aux |=(unsigned long long) ( ( ( (v>>9)%2 ) * 2 + ( (v>>8)%2 ) * 2) >= 4 ) << 14 ;
        aux |=(unsigned long long) ( ( ( (v>>34)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 6 + ( (v>>24)%2 ) * -6 + ( (v>>8)%2 ) * -2 + ( (v>>10)%2 ) * -2) >= 4 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2 + ( (v>>0)%2 ) * -6 + ( (v>>26)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2 + ( (v>>18)%2 ) * -2) >= 2 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>21)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>35)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2 + ( (v>>38)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * 2 + ( (v>>6)%2 ) * -2) >= 2 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 ) * -2) >= 0 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(unsigned long long) ( ( ( (v>>16)%2 ) * 2) >= 2 ) << 27 ;
        aux |=(unsigned long long) ( ( ( (v>>16)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(unsigned long long) ( ( ( (v>>27)%2 ) * 2 + ( (v>>28)%2 ) * 2 + ( (v>>30)%2 ) * -2) >= 4 ) << 29 ;
        aux |=(unsigned long long) ( ( ( (v>>38)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(unsigned long long) ( ( ( (v>>34)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>40)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>40)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(unsigned long long) ( ( ( (v>>34)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(unsigned long long) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(unsigned long long) ( ( ( (v>>35)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * 2 + ( (v>>23)%2 ) * -6 + ( (v>>14)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(unsigned long long)(v>>39%2) << 39;
        aux |=(unsigned long long)(v>>40%2) << 40;
        aux |=(unsigned long long)(v>>41%2) << 41;
        
        estado[tid] = aux;
    }
}

unsigned long long confere_tlf_2(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2) >= 2 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2 + ( (v>>3)%2 ) * 2 + ( (v>>24)%2 ) * 2 + ( (v>>17)%2 ) * -2) >= 6 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>38)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>38)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * 2 + ( (v>>38)%2 ) * 6 + ( (v>>6)%2 ) * -6 + ( (v>>12)%2 ) * 2) >= 8 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2 + ( (v>>4)%2 ) * -2 + ( (v>>38)%2 ) * -2) >= 2 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>11)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( ( (v>>2)%2 ) * 2 + ( (v>>17)%2 ) * -6 + ( (v>>12)%2 ) * 2 + ( (v>>10)%2 ) * 10) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2 + ( (v>>17)%2 ) * -2) >= 2 ) << 10 ;
        aux |=(unsigned long long) ( ( ( (v>>2)%2 ) * 2 + ( (v>>17)%2 ) * -6 + ( (v>>12)%2 ) * 2) >= 2 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 2 + ( (v>>37)%2 ) * -6 + ( (v>>15)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>17)%2 ) * -6 + ( (v>>7)%2 ) * 2) >= 2 ) << 13 ;
        aux |=(unsigned long long) ( ( ( (v>>9)%2 ) * 2 + ( (v>>8)%2 ) * 2) >= 4 ) << 14 ;
        aux |=(unsigned long long) ( ( ( (v>>34)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 6 + ( (v>>24)%2 ) * -6 + ( (v>>8)%2 ) * -2 + ( (v>>10)%2 ) * -2) >= 4 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2 + ( (v>>0)%2 ) * -6 + ( (v>>26)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2 + ( (v>>18)%2 ) * -2) >= 2 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>21)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>35)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2 + ( (v>>38)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * 2 + ( (v>>6)%2 ) * -2) >= 2 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 ) * -2) >= 0 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(unsigned long long) ( ( ( (v>>16)%2 ) * 2) >= 2 ) << 27 ;
        aux |=(unsigned long long) ( ( ( (v>>16)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(unsigned long long) ( ( ( (v>>27)%2 ) * 2 + ( (v>>28)%2 ) * 2 + ( (v>>30)%2 ) * -2) >= 4 ) << 29 ;
        aux |=(unsigned long long) ( ( ( (v>>38)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(unsigned long long) ( ( ( (v>>34)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>40)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>40)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(unsigned long long) ( ( ( (v>>34)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(unsigned long long) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(unsigned long long) ( ( ( (v>>35)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * 2 + ( (v>>23)%2 ) * -6 + ( (v>>14)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(unsigned long long)(v>>39%2) << 39;
        aux |=(unsigned long long)(v>>40%2) << 40;
        aux |=(unsigned long long)(v>>41%2) << 41;
        
        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}

void preenche_init_rand(unsigned long long * init_rand, unsigned long long nSim, unsigned int nEq)
{
    
    for(unsigned long long i = 0; i < nSim; i++)
    {
        
        init_rand[i] = 0;
        unsigned long rand1 = rand()%((unsigned long)(1<<31)-1);
        unsigned long rand2 = rand()%((unsigned long)(1<<31)-1);
        init_rand[i] = rand1;
        for(int j = 0; j < nEq; j++)
            init_rand[i] |= ((rand2>>j)%2)<<j;
    }
}

int main(int argc, char **argv)
{
    unsigned long long MAX_ESTADO = 0;
    string argv2 = argv[1];
    for(int i = 0; i < argv2.size() ; i++)
        MAX_ESTADO += ((unsigned long int)(argv2[i] - '0'))*pow(10,argv2.size()-i-1);
    //definindo tamanho da grid e dos blocos
    int threads = 1024;
    dim3 block(threads);
    dim3 grid((MAX_ESTADO + block.x -1)/block.x);
    unsigned long long *h_init_rand, *h_estado;
    h_init_rand = new unsigned long long[MAX_ESTADO];
    h_estado = new unsigned long long[MAX_ESTADO];

    unsigned long long *d_init_rand, *d_estado;
    cudaMalloc(&d_init_rand,sizeof(unsigned long long)*MAX_ESTADO);
    cudaMalloc(&d_estado,sizeof(unsigned long long)*MAX_ESTADO);
    
    unsigned int nEq = 41;
    srand(MAX_ESTADO);
    preenche_init_rand(h_init_rand,MAX_ESTADO,nEq);

    /* for(unsigned long long i = 0; i < MAX_ESTADO; i++)
    {
        cout << h_init_rand[i] << " ";
    }
    cout << "\n"; */
    cudaMemcpy(d_init_rand, h_init_rand, sizeof(unsigned long long)*MAX_ESTADO, cudaMemcpyHostToDevice);

    passo_bool_2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
    cudaDeviceSynchronize();
    cudaMemcpy(h_estado, d_estado, sizeof(unsigned long long)*MAX_ESTADO, cudaMemcpyDeviceToHost);

    unsigned long long i = confere_bool_2(h_init_rand,h_estado,MAX_ESTADO);
    if(i == MAX_ESTADO)
        cerr << "Resultados da GPU batem com os da CPU\n";
    else
        cerr << "Resultados não batem!\n";
    
    cudaFree(d_init_rand);
    cudaFree(d_estado);
    return 0;
}
