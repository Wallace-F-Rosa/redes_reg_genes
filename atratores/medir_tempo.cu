#include <iostream>
#include <chrono>
#include <ctime>
#include <string>
#include <limits>
#include <stdio.h>
#include <stdlib.h>

#define CLOCKS_PER_SEC_CPU 1100000000
using namespace std;

//REDE 1
__global__ void passo_bool_1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( (v>>1)%2 & ( ( ( (v>>2)%2 ) ) ) )<< 0 ;
        aux |=(unsigned long long) ( (v>>1)%2 )<< 1 ;
        aux |=(unsigned long long) ( (v>>3)%2 )<< 2 ;
        aux |=(unsigned long long) ( (v>>4)%2 )<< 3 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 4 ;
        aux |=(unsigned long long) ( (v>>9)%2 ) | ( (v>>29)%2 )<< 5 ;
        aux |=(unsigned long long) ( (v>>7)%2 )<< 6 ;
        aux |=(unsigned long long) ( (v>>8)%2 )<< 7 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 8 ;
        aux |=(unsigned long long) ( (v>>25)%2 )<< 9 ;
        aux |=(unsigned long long) ( (v>>24)%2 )<< 10 ;
        aux |=(unsigned long long) ( (v>>12)%2 )<< 11 ;
        aux |=(unsigned long long) ( (v>>13)%2 )<< 12 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 13 ;
        aux |=(unsigned long long) ( ( (v>>15)%2 ) & ! ( (v>>11)%2 ) )<< 14 ;
        aux |=(unsigned long long) ( (v>>10)%2 ) | ( (v>>24)%2 )<< 15 ;
        aux |=(unsigned long long) ( (v>>0)%2 & ( ( ( (v>>1)%2 & (v>>20)%2 ) ) ) )<< 16 ;
        aux |=(unsigned long long) ( ( (v>>18)%2 ) & ! ( (v>>31)%2 ) )<< 17 ;
        aux |=(unsigned long long) ( (v>>19)%2 )<< 18 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 19 ;
        aux |=(unsigned long long) ( (v>>21)%2 )<< 20 ;
        aux |=(unsigned long long) ( (v>>22)%2 )<< 21 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 22 ;
        aux |=(unsigned long long) ! ( ( (v>>5)%2 ) )<< 23 ;
        aux |=(unsigned long long) ( (v>>27)%2 )<< 24 ;
        aux |=(unsigned long long) ( (v>>30)%2 )<< 25 ;
        aux |=(unsigned long long) ( (v>>16)%2 & ( ( ( (v>>17)%2 ) ) ) )<< 26 ;
        aux |=(unsigned long long) ( (v>>26)%2 )<< 27 ;
        aux |=(unsigned long long) ( ( (v>>23)%2 ) & ! ( (v>>31)%2 ) )<< 28 ;
        aux |=(unsigned long long) ( (v>>25)%2 )<< 29 ;
        aux |=(unsigned long long) ( (v>>14)%2 )<< 30 ;
        aux |=(unsigned long long) ( (v>>31)%2 )<< 31 ;
        aux |=(unsigned long long) ( (v>>33)%2 )<< 32 ;
        aux |=(unsigned long long) ( (v>>28)%2 )<< 33 ;
    
        estado[tid] = aux;
    }
}

unsigned long long confere_bool_1(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( (v>>1)%2 & ( ( ( (v>>2)%2 ) ) ) )<< 0 ;
        aux |=(unsigned long long) ( (v>>1)%2 )<< 1 ;
        aux |=(unsigned long long) ( (v>>3)%2 )<< 2 ;
        aux |=(unsigned long long) ( (v>>4)%2 )<< 3 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 4 ;
        aux |=(unsigned long long) ( (v>>9)%2 ) | ( (v>>29)%2 )<< 5 ;
        aux |=(unsigned long long) ( (v>>7)%2 )<< 6 ;
        aux |=(unsigned long long) ( (v>>8)%2 )<< 7 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 8 ;
        aux |=(unsigned long long) ( (v>>25)%2 )<< 9 ;
        aux |=(unsigned long long) ( (v>>24)%2 )<< 10 ;
        aux |=(unsigned long long) ( (v>>12)%2 )<< 11 ;
        aux |=(unsigned long long) ( (v>>13)%2 )<< 12 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 13 ;
        aux |=(unsigned long long) ( ( (v>>15)%2 ) & ! ( (v>>11)%2 ) )<< 14 ;
        aux |=(unsigned long long) ( (v>>10)%2 ) | ( (v>>24)%2 )<< 15 ;
        aux |=(unsigned long long) ( (v>>0)%2 & ( ( ( (v>>1)%2 & (v>>20)%2 ) ) ) )<< 16 ;
        aux |=(unsigned long long) ( ( (v>>18)%2 ) & ! ( (v>>31)%2 ) )<< 17 ;
        aux |=(unsigned long long) ( (v>>19)%2 )<< 18 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 19 ;
        aux |=(unsigned long long) ( (v>>21)%2 )<< 20 ;
        aux |=(unsigned long long) ( (v>>22)%2 )<< 21 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 22 ;
        aux |=(unsigned long long) ! ( ( (v>>5)%2 ) )<< 23 ;
        aux |=(unsigned long long) ( (v>>27)%2 )<< 24 ;
        aux |=(unsigned long long) ( (v>>30)%2 )<< 25 ;
        aux |=(unsigned long long) ( (v>>16)%2 & ( ( ( (v>>17)%2 ) ) ) )<< 26 ;
        aux |=(unsigned long long) ( (v>>26)%2 )<< 27 ;
        aux |=(unsigned long long) ( ( (v>>23)%2 ) & ! ( (v>>31)%2 ) )<< 28 ;
        aux |=(unsigned long long) ( (v>>25)%2 )<< 29 ;
        aux |=(unsigned long long) ( (v>>14)%2 )<< 30 ;
        aux |=(unsigned long long) ( (v>>31)%2 )<< 31 ;
        aux |=(unsigned long long) ( (v>>33)%2 )<< 32 ;
        aux |=(unsigned long long) ( (v>>28)%2 )<< 33 ;

        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_1_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2 + ( (v>>2)%2 ) * 2) >= 4 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>3)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>4)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>9)%2 ) * 2 + ( (v>>29)%2 ) * 2) >= 2 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2) >= 2 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>24)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(unsigned long long) ( ( ( (v>>12)%2 ) * 2) >= 2 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 13 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 2 + ( (v>>11)%2 ) * -2) >= 2 ) << 14 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 2 + ( (v>>24)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>1)%2 ) * 2 + ( (v>>20)%2 ) * 2) >= 6 ) << 16 ;

    
        estado[tid] |= aux;
    }
}

__global__ void passo_tlf_1_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2 + ( (v>>31)%2 ) * -2) >= 2 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>21)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2) >= 2 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * -2) >= 0 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>27)%2 ) * 2) >= 2 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>30)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>16)%2 ) * 2 + ( (v>>17)%2 ) * 2) >= 4 ) << 26 ;
        aux |=(unsigned long long) ( ( ( (v>>26)%2 ) * 2) >= 2 ) << 27 ;
        aux |=(unsigned long long) ( ( ( (v>>23)%2 ) * 2 + ( (v>>31)%2 ) * -2) >= 2 ) << 28 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(unsigned long long) ( ( ( (v>>14)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(unsigned long long) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2) >= 2 ) << 33 ;

    
        estado[tid] |= aux;
    }
}

unsigned long long confere_tlf_1(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2 + ( (v>>2)%2 ) * 2) >= 4 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>3)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>4)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>9)%2 ) * 2 + ( (v>>29)%2 ) * 2) >= 2 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2) >= 2 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>24)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(unsigned long long) ( ( ( (v>>12)%2 ) * 2) >= 2 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 13 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 2 + ( (v>>11)%2 ) * -2) >= 2 ) << 14 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 2 + ( (v>>24)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>1)%2 ) * 2 + ( (v>>20)%2 ) * 2) >= 6 ) << 16 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2 + ( (v>>31)%2 ) * -2) >= 2 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>21)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2) >= 2 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * -2) >= 0 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>27)%2 ) * 2) >= 2 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>30)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>16)%2 ) * 2 + ( (v>>17)%2 ) * 2) >= 4 ) << 26 ;
        aux |=(unsigned long long) ( ( ( (v>>26)%2 ) * 2) >= 2 ) << 27 ;
        aux |=(unsigned long long) ( ( ( (v>>23)%2 ) * 2 + ( (v>>31)%2 ) * -2) >= 2 ) << 28 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(unsigned long long) ( ( ( (v>>14)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(unsigned long long) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2) >= 2 ) << 33 ;

        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 2

__global__ void passo_bool_2_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
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
        
        
        estado[tid] |= aux;
    }
}

__global__ void passo_bool_2_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
        aux |=(unsigned long long) ( (v>>36)%2 )<< 26 ;
        aux |=(unsigned long long) ( (v>>16)%2 )<< 27 ;
        aux |=(unsigned long long) ( (v>>16)%2 )<< 28 ;
        aux |=(unsigned long long) ( ( ( (v>>27)%2 ) & ( ( ( (v>>28)%2 ) ) ) ) & (! ( (v>>30)%2 )) )<< 29 ;
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
        
        estado[tid] |= aux;
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

__global__ void passo_tlf_2_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
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
        
        estado[tid] |= aux;
    }
}

__global__ void passo_tlf_2_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
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
        
        estado[tid] |= aux;
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

//REDE 3

__global__ void passo_bool_3_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) & ! ( (v>>34)%2 ) ) & ! ( (v>>26)%2 ) )<< 0 ;
        aux |=(unsigned long long) ( (v>>23)%2 )<< 1 ;
        aux |=(unsigned long long) ( (v>>13)%2 )<< 2 ;
        aux |=(unsigned long long) ( ( (v>>8)%2 ) ) | ! ( (v>>8)%2 | (v>>30)%2 )<< 3 ;
        aux |=(unsigned long long) ( (v>>39)%2 & ( ( ( ! (v>>0)%2 ) ) | ( ( (v>>8)%2 ) ) ) ) | ( (v>>8)%2 & ( ( ( (v>>39)%2 ) ) | ( ( ! (v>>0)%2 ) ) ) )<< 4 ;
        aux |=(unsigned long long) ( ( (v>>25)%2 & ( ( ( (v>>39)%2 & (v>>33)%2 ) ) ) ) & ! ( (v>>0)%2 ) )<< 5 ;
        aux |=(unsigned long long) ( (v>>15)%2 & ( ( ( (v>>16)%2 ) ) ) ) | ( (v>>38)%2 & ( ( ( (v>>37)%2 ) ) ) )<< 6 ;
        aux |=(unsigned long long) ( (v>>8)%2 )<< 7 ;
        aux |=(unsigned long long) ( ( (v>>6)%2 ) & ! ( (v>>7)%2 ) ) | ( ( (v>>9)%2 ) & ! ( (v>>7)%2 ) )<< 8 ;
        aux |=(unsigned long long) ( ( ( (v>>40)%2 & ( ( ( ! (v>>41)%2 ) ) ) ) & ! ( (v>>11)%2 ) ) | ( ( (v>>41)%2 & ( ( ( ! (v>>40)%2 ) ) ) ) & ! ( (v>>11)%2 ) ) | ( ( (v>>34)%2 ) & ! ( (v>>11)%2 ) ) ) | ! ( (v>>41)%2 | (v>>34)%2 | (v>>11)%2 | (v>>40)%2 )<< 9 ;
        aux |=(unsigned long long) ( ( (v>>20)%2 & ( ( ( (v>>3)%2 ) ) & ( ( (v>>4)%2 ) ) ) ) & ! ( (v>>21)%2 ) ) | ( ( (v>>18)%2 & ( ( ( (v>>3)%2 ) ) & ( ( (v>>4)%2 ) ) ) ) & ! ( (v>>21)%2 ) )<< 10 ;
        aux |=(unsigned long long) ( ( (v>>20)%2 & ( ( ( ! (v>>4)%2 & ! (v>>8)%2 & ! (v>>19)%2 & ! (v>>14)%2 ) ) ) ) | ( (v>>8)%2 ) | ( (v>>14)%2 & ( ( ( ! (v>>4)%2 & ! (v>>8)%2 & ! (v>>20)%2 & ! (v>>19)%2 ) ) ) ) | ( (v>>19)%2 ) | ( (v>>4)%2 ) ) | ! ( (v>>4)%2 | (v>>8)%2 | (v>>20)%2 | (v>>19)%2 | (v>>14)%2 )<< 11 ;
        aux |=(unsigned long long) ( (v>>23)%2 )<< 12 ;
        aux |=(unsigned long long) ( ( (v>>2)%2 ) & ! ( (v>>42)%2 ) ) | ( (v>>35)%2 & ( ( ( (v>>2)%2 ) ) ) )<< 13 ;
        aux |=(unsigned long long) ! ( ( (v>>39)%2 ) | ( (v>>8)%2 ) | ( (v>>34)%2 ) )<< 14 ;
        aux |=(unsigned long long) ( (v>>28)%2 )<< 15 ;
        aux |=(unsigned long long) ( (v>>17)%2 )<< 16 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 17 ;
        aux |=(unsigned long long) ( ( (v>>11)%2 ) & ! ( (v>>8)%2 & ( ( ( (v>>39)%2 ) ) ) ) )<< 18 ;
        aux |=(unsigned long long) ( (v>>8)%2 )<< 19 ;
    
        estado[tid] |= aux;
    }
}

__global__ void passo_bool_3_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];

        aux |=(unsigned long long) ( (v>>39)%2 & ( ( ( (v>>11)%2 ) ) ) ) | ( ( (v>>11)%2 ) & ! ( (v>>34)%2 & ( ( ( (v>>23)%2 ) ) ) ) )<< 20 ;
        aux |=(unsigned long long) ( ( ( (v>>27)%2 ) & ! ( (v>>43)%2 ) ) & ! ( (v>>4)%2 ) )<< 21 ;
        aux |=(unsigned long long) ( (v>>31)%2 )<< 22 ;
        aux |=(unsigned long long) ( (v>>24)%2 & ( ( ( (v>>22)%2 ) ) ) )<< 23 ;
        aux |=(unsigned long long) ( (v>>8)%2 )<< 24 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 25 ;
        aux |=(unsigned long long) ( (v>>29)%2 )<< 26 ;
        aux |=(unsigned long long) ! ( ( (v>>43)%2 ) )<< 27 ;
        aux |=(unsigned long long) ( (v>>43)%2 & ( ( ( (v>>8)%2 ) ) ) )<< 28 ;
        aux |=(unsigned long long) ( (v>>13)%2 )<< 29 ;
        aux |=(unsigned long long) ! ( ( (v>>43)%2 ) | ( (v>>0)%2 ) )<< 30 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 31 ;
        aux |=(unsigned long long) ( (v>>41)%2 )<< 32 ;
        aux |=(unsigned long long) ( (v>>26)%2 )<< 33 ;
        aux |=(unsigned long long) ( (v>>5)%2 )<< 34 ;
        aux |=(unsigned long long) ( (v>>36)%2 )<< 35 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 36 ;
        aux |=(unsigned long long) ( (v>>1)%2 )<< 37 ;
        aux |=(unsigned long long) ( (v>>12)%2 )<< 38 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 39 ;
        aux |=(unsigned long long) ( (v>>40)%2 )<< 40 ;
        aux |=(unsigned long long) ( (v>>41)%2 )<< 41 ;
        aux |=(unsigned long long) ( (v>>42)%2 )<< 42 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 43 ;
    
        estado[tid] |= aux;
    }
}

unsigned long long confere_bool_3(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) & ! ( (v>>34)%2 ) ) & ! ( (v>>26)%2 ) )<< 0 ;
        aux |=(unsigned long long) ( (v>>23)%2 )<< 1 ;
        aux |=(unsigned long long) ( (v>>13)%2 )<< 2 ;
        aux |=(unsigned long long) ( ( (v>>8)%2 ) ) | ! ( (v>>8)%2 | (v>>30)%2 )<< 3 ;
        aux |=(unsigned long long) ( (v>>39)%2 & ( ( ( ! (v>>0)%2 ) ) | ( ( (v>>8)%2 ) ) ) ) | ( (v>>8)%2 & ( ( ( (v>>39)%2 ) ) | ( ( ! (v>>0)%2 ) ) ) )<< 4 ;
        aux |=(unsigned long long) ( ( (v>>25)%2 & ( ( ( (v>>39)%2 & (v>>33)%2 ) ) ) ) & ! ( (v>>0)%2 ) )<< 5 ;
        aux |=(unsigned long long) ( (v>>15)%2 & ( ( ( (v>>16)%2 ) ) ) ) | ( (v>>38)%2 & ( ( ( (v>>37)%2 ) ) ) )<< 6 ;
        aux |=(unsigned long long) ( (v>>8)%2 )<< 7 ;
        aux |=(unsigned long long) ( ( (v>>6)%2 ) & ! ( (v>>7)%2 ) ) | ( ( (v>>9)%2 ) & ! ( (v>>7)%2 ) )<< 8 ;
        aux |=(unsigned long long) ( ( ( (v>>40)%2 & ( ( ( ! (v>>41)%2 ) ) ) ) & ! ( (v>>11)%2 ) ) | ( ( (v>>41)%2 & ( ( ( ! (v>>40)%2 ) ) ) ) & ! ( (v>>11)%2 ) ) | ( ( (v>>34)%2 ) & ! ( (v>>11)%2 ) ) ) | ! ( (v>>41)%2 | (v>>34)%2 | (v>>11)%2 | (v>>40)%2 )<< 9 ;
        aux |=(unsigned long long) ( ( (v>>20)%2 & ( ( ( (v>>3)%2 ) ) & ( ( (v>>4)%2 ) ) ) ) & ! ( (v>>21)%2 ) ) | ( ( (v>>18)%2 & ( ( ( (v>>3)%2 ) ) & ( ( (v>>4)%2 ) ) ) ) & ! ( (v>>21)%2 ) )<< 10 ;
        aux |=(unsigned long long) ( ( (v>>20)%2 & ( ( ( ! (v>>4)%2 & ! (v>>8)%2 & ! (v>>19)%2 & ! (v>>14)%2 ) ) ) ) | ( (v>>8)%2 ) | ( (v>>14)%2 & ( ( ( ! (v>>4)%2 & ! (v>>8)%2 & ! (v>>20)%2 & ! (v>>19)%2 ) ) ) ) | ( (v>>19)%2 ) | ( (v>>4)%2 ) ) | ! ( (v>>4)%2 | (v>>8)%2 | (v>>20)%2 | (v>>19)%2 | (v>>14)%2 )<< 11 ;
        aux |=(unsigned long long) ( (v>>23)%2 )<< 12 ;
        aux |=(unsigned long long) ( ( (v>>2)%2 ) & ! ( (v>>42)%2 ) ) | ( (v>>35)%2 & ( ( ( (v>>2)%2 ) ) ) )<< 13 ;
        aux |=(unsigned long long) ! ( ( (v>>39)%2 ) | ( (v>>8)%2 ) | ( (v>>34)%2 ) )<< 14 ;
        aux |=(unsigned long long) ( (v>>28)%2 )<< 15 ;
        aux |=(unsigned long long) ( (v>>17)%2 )<< 16 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 17 ;
        aux |=(unsigned long long) ( ( (v>>11)%2 ) & ! ( (v>>8)%2 & ( ( ( (v>>39)%2 ) ) ) ) )<< 18 ;
        aux |=(unsigned long long) ( (v>>8)%2 )<< 19 ;
        aux |=(unsigned long long) ( (v>>39)%2 & ( ( ( (v>>11)%2 ) ) ) ) | ( ( (v>>11)%2 ) & ! ( (v>>34)%2 & ( ( ( (v>>23)%2 ) ) ) ) )<< 20 ;
        aux |=(unsigned long long) ( ( ( (v>>27)%2 ) & ! ( (v>>43)%2 ) ) & ! ( (v>>4)%2 ) )<< 21 ;
        aux |=(unsigned long long) ( (v>>31)%2 )<< 22 ;
        aux |=(unsigned long long) ( (v>>24)%2 & ( ( ( (v>>22)%2 ) ) ) )<< 23 ;
        aux |=(unsigned long long) ( (v>>8)%2 )<< 24 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 25 ;
        aux |=(unsigned long long) ( (v>>29)%2 )<< 26 ;
        aux |=(unsigned long long) ! ( ( (v>>43)%2 ) )<< 27 ;
        aux |=(unsigned long long) ( (v>>43)%2 & ( ( ( (v>>8)%2 ) ) ) )<< 28 ;
        aux |=(unsigned long long) ( (v>>13)%2 )<< 29 ;
        aux |=(unsigned long long) ! ( ( (v>>43)%2 ) | ( (v>>0)%2 ) )<< 30 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 31 ;
        aux |=(unsigned long long) ( (v>>41)%2 )<< 32 ;
        aux |=(unsigned long long) ( (v>>26)%2 )<< 33 ;
        aux |=(unsigned long long) ( (v>>5)%2 )<< 34 ;
        aux |=(unsigned long long) ( (v>>36)%2 )<< 35 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 36 ;
        aux |=(unsigned long long) ( (v>>1)%2 )<< 37 ;
        aux |=(unsigned long long) ( (v>>12)%2 )<< 38 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 39 ;
        aux |=(unsigned long long) ( (v>>40)%2 )<< 40 ;
        aux |=(unsigned long long) ( (v>>41)%2 )<< 41 ;
        aux |=(unsigned long long) ( (v>>42)%2 )<< 42 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 43 ;

        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_3_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 2 + ( (v>>34)%2 ) * -2 + ( (v>>26)%2 ) * -2) >= 2 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>23)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2 + ( (v>>30)%2 ) * -2) >= 0 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 4 + ( (v>>0)%2 ) * -4 + ( (v>>8)%2 ) * 4) >= 4 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2 + ( (v>>39)%2 ) * 2 + ( (v>>33)%2 ) * 2 + ( (v>>0)%2 ) * -2) >= 6 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 6 + ( (v>>16)%2 ) * 6 + ( (v>>38)%2 ) * 6 + ( (v>>37)%2 ) * 6) >= 12 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( ( (v>>6)%2 ) * 2 + ( (v>>7)%2 ) * -6 + ( (v>>9)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( 0 * -2 + 0 * -2 + ( (v>>11)%2 ) * -14 + ( (v>>34)%2 ) * 2) >= -2 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * 2 + ( (v>>3)%2 ) * 6 + ( (v>>4)%2 ) * 6 + ( (v>>21)%2 ) * -6 + ( (v>>18)%2 ) * 2) >= 14 ) << 10 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * -2 + ( (v>>4)%2 ) * 2 + ( (v>>8)%2 ) * 2 + ( (v>>19)%2 ) * 2 + ( (v>>14)%2 ) * -2) >= -2 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>23)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(unsigned long long) ( ( ( (v>>2)%2 ) * 6 + 0 * -2 + ( (v>>35)%2 ) * 2) >= 6 ) << 13 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * -2 + ( (v>>8)%2 ) * -2 + ( (v>>34)%2 ) * -2) >= 0 ) << 14 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>17)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>11)%2 ) * 6 + ( (v>>8)%2 ) * -2 + ( (v>>39)%2 ) * -2) >= 4 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 2 + ( (v>>11)%2 ) * 14 + ( (v>>34)%2 ) * -2 + ( (v>>23)%2 ) * -2) >= 12 ) << 20 ;
        aux |=(unsigned long long) ( ( ( (v>>27)%2 ) * 2 + 0 * -2 + ( (v>>4)%2 ) * -2) >= 2 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 22 ;
    
        estado[tid] |= aux;
    }
}

__global__ void passo_tlf_3_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>24)%2 ) * 2 + ( (v>>22)%2 ) * 2) >= 4 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * -2) >= 0 ) << 27 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>8)%2 ) * 2) >= 4 ) << 28 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(unsigned long long) ( ( 0 * -2 + ( (v>>0)%2 ) * -2) >= 0 ) << 30 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>41)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>26)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(unsigned long long) ( ( ( (v>>12)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 39 ;
        aux |=(unsigned long long) ( (v>>40)%2 )<< 40 ;
        aux |=(unsigned long long) ( (v>>41)%2 )<< 41 ;
        aux |=(unsigned long long) ( (v>>42)%2 )<< 42 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 43 ;
    
        estado[tid] |= aux;
    }
}

unsigned long long confere_tlf_3(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 2 + ( (v>>34)%2 ) * -2 + ( (v>>26)%2 ) * -2) >= 2 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>23)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2 + ( (v>>30)%2 ) * -2) >= 0 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 4 + ( (v>>0)%2 ) * -4 + ( (v>>8)%2 ) * 4) >= 4 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2 + ( (v>>39)%2 ) * 2 + ( (v>>33)%2 ) * 2 + ( (v>>0)%2 ) * -2) >= 6 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 6 + ( (v>>16)%2 ) * 6 + ( (v>>38)%2 ) * 6 + ( (v>>37)%2 ) * 6) >= 12 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( ( (v>>6)%2 ) * 2 + ( (v>>7)%2 ) * -6 + ( (v>>9)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( 0 * -2 + 0 * -2 + ( (v>>11)%2 ) * -14 + ( (v>>34)%2 ) * 2) >= -2 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * 2 + ( (v>>3)%2 ) * 6 + ( (v>>4)%2 ) * 6 + ( (v>>21)%2 ) * -6 + ( (v>>18)%2 ) * 2) >= 14 ) << 10 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * -2 + ( (v>>4)%2 ) * 2 + ( (v>>8)%2 ) * 2 + ( (v>>19)%2 ) * 2 + ( (v>>14)%2 ) * -2) >= -2 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>23)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(unsigned long long) ( ( ( (v>>2)%2 ) * 6 + 0 * -2 + ( (v>>35)%2 ) * 2) >= 6 ) << 13 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * -2 + ( (v>>8)%2 ) * -2 + ( (v>>34)%2 ) * -2) >= 0 ) << 14 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>17)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>11)%2 ) * 6 + ( (v>>8)%2 ) * -2 + ( (v>>39)%2 ) * -2) >= 4 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 2 + ( (v>>11)%2 ) * 14 + ( (v>>34)%2 ) * -2 + ( (v>>23)%2 ) * -2) >= 12 ) << 20 ;
        aux |=(unsigned long long) ( ( ( (v>>27)%2 ) * 2 + 0 * -2 + ( (v>>4)%2 ) * -2) >= 2 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(unsigned long long) ( ( ( (v>>24)%2 ) * 2 + ( (v>>22)%2 ) * 2) >= 4 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * -2) >= 0 ) << 27 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>8)%2 ) * 2) >= 4 ) << 28 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(unsigned long long) ( ( 0 * -2 + ( (v>>0)%2 ) * -2) >= 0 ) << 30 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>41)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>26)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(unsigned long long) ( ( ( (v>>12)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 39 ;
        aux |=(unsigned long long) ( (v>>40)%2 )<< 40 ;
        aux |=(unsigned long long) ( (v>>41)%2 )<< 41 ;
        aux |=(unsigned long long) ( (v>>42)%2 )<< 42 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 43 ;

        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}


//REDE 5
__global__ void passo_bool_5_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( (v>>40)%2 ) & ! ( (v>>29)%2 ) ) | ( ( (v>>26)%2 ) & ! ( (v>>29)%2 ) ) | ( ( (v>>0)%2 ) & ! ( (v>>29)%2 ) )<< 0 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>41)%2 ) ) | ( ( ( (v>>26)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>41)%2 ) ) | ( ( ( (v>>1)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>41)%2 ) )<< 1 ;
        aux |=(unsigned long long) ( (v>>29)%2 ) | ( (v>>39)%2 ) | ( (v>>15)%2 )<< 2 ;
        aux |=(unsigned long long) ( ( ( ( ( (v>>30)%2 ) & ! ( (v>>33)%2 ) ) & ! ( (v>>39)%2 ) ) & ! ( (v>>4)%2 ) ) & ! ( (v>>28)%2 ) ) | ( ( ( ( ( (v>>3)%2 ) & ! ( (v>>33)%2 ) ) & ! ( (v>>39)%2 ) ) & ! ( (v>>4)%2 ) ) & ! ( (v>>28)%2 ) )<< 3 ;
        aux |=(unsigned long long) ( ( ( ( (v>>36)%2 ) & ! ( (v>>28)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>39)%2 ) ) | ( ( ( ( (v>>4)%2 ) & ! ( (v>>28)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>39)%2 ) )<< 4 ;
        aux |=(unsigned long long) ( (v>>2)%2 )<< 5 ;
        aux |=(unsigned long long) ( (v>>42)%2 )<< 6 ;
        aux |=(unsigned long long) ( ( (v>>34)%2 ) & ! ( (v>>33)%2 ) ) | ( ( (v>>22)%2 ) & ! ( (v>>33)%2 ) ) | ( ( (v>>2)%2 ) & ! ( (v>>33)%2 ) ) | ( ( (v>>39)%2 ) & ! ( (v>>33)%2 ) )<< 7 ;
        aux |=(unsigned long long) ( (v>>7)%2 )<< 8 ;
        aux |=(unsigned long long) ( (v>>4)%2 )<< 9 ;
        aux |=(unsigned long long) ( (v>>9)%2 )<< 10 ;
        aux |=(unsigned long long) ( ( (v>>43)%2 ) & ! ( (v>>36)%2 ) )<< 11 ;
        aux |=(unsigned long long) ( (v>>28)%2 )<< 12 ;
        aux |=(unsigned long long) ( ( (v>>44)%2 ) & ! ( (v>>36)%2 ) )<< 13 ;
        aux |=(unsigned long long) ( (v>>45)%2 )<< 14 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 15 ;
        aux |=(unsigned long long) ( (v>>47)%2 )<< 16 ;
        aux |=(unsigned long long) ( ( (v>>4)%2 ) & ! ( (v>>32)%2 ) )<< 17 ;
        aux |=(unsigned long long) ( ( (v>>17)%2 ) & ! ( (v>>31)%2 ) )<< 18 ;
        aux |=(unsigned long long) ( (v>>28)%2 )<< 19 ;
        aux |=(unsigned long long) ( (v>>19)%2 )<< 20 ;
        aux |=(unsigned long long) ( ( (v>>48)%2 ) & ! ( (v>>41)%2 ) )<< 21 ;
        aux |=(unsigned long long) ( (v>>13)%2 )<< 22 ;
        aux |=(unsigned long long) ( (v>>8)%2 )<< 23 ;
        aux |=(unsigned long long) ( (v>>20)%2 )<< 24 ;
        
        estado[tid] |= aux;
    }
}

__global__ void passo_bool_5_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( (v>>41)%2 )<< 25 ;
        aux |=(unsigned long long) ( (v>>49)%2 )<< 26 ;
        aux |=(unsigned long long) ( (v>>2)%2 )<< 27 ;
        aux |=(unsigned long long) ( ( ( ( (v>>30)%2 ) & ! ( (v>>39)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>4)%2 ) ) | ( ( ( ( (v>>28)%2 ) & ! ( (v>>39)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>4)%2 ) ) | ( ( ( ( (v>>33)%2 ) & ! ( (v>>39)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>4)%2 ) )<< 28 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>0)%2 ) ) | ( ( ( (v>>35)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>0)%2 ) ) | ( ( ( (v>>1)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>0)%2 ) )<< 29 ;
        aux |=(unsigned long long) ( (v>>38)%2 )<< 30 ;
        aux |=(unsigned long long) ( (v>>39)%2 ) | ( (v>>32)%2 )<< 31 ;
        aux |=(unsigned long long) ( (v>>6)%2 ) | ( (v>>15)%2 ) | ( (v>>23)%2 )<< 32 ;
        aux |=(unsigned long long) ( (v>>24)%2 ) | ( (v>>14)%2 ) | ( (v>>10)%2 )<< 33 ;
        aux |=(unsigned long long) ( ( (v>>11)%2 ) & ! ( (v>>4)%2 ) )<< 34 ;
        aux |=(unsigned long long) ( ( (v>>21)%2 ) & ! ( (v>>31)%2 ) ) | ( ( (v>>16)%2 ) & ! ( (v>>31)%2 ) )<< 35 ;
        aux |=(unsigned long long) ( (v>>18)%2 )<< 36 ;
        aux |=(unsigned long long) ( (v>>3)%2 )<< 37 ;
        aux |=(unsigned long long) ( (v>>37)%2 )<< 38 ;
        aux |=(unsigned long long) ( ( ( ( (v>>39)%2 ) & ! ( (v>>4)%2 ) ) & ! ( (v>>28)%2 ) ) & ! ( (v>>3)%2 ) ) | ( ( ( ( (v>>32)%2 ) & ! ( (v>>4)%2 ) ) & ! ( (v>>28)%2 ) ) & ! ( (v>>3)%2 ) )<< 39 ;
        aux |=(unsigned long long) ( ( ( (v>>40)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>0)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>41)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>28)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>39)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>4)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>3)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) )<< 40 ;
        aux |=(unsigned long long) ( (v>>41)%2 )<< 41 ;
        aux |=(unsigned long long) ( (v>>42)%2 )<< 42 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 43 ;
        aux |=(unsigned long long) ( (v>>44)%2 )<< 44 ;
        aux |=(unsigned long long) ( (v>>45)%2 )<< 45 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 46 ;
        aux |=(unsigned long long) ( (v>>47)%2 )<< 47 ;
        aux |=(unsigned long long) ( (v>>48)%2 )<< 48 ;
        aux |=(unsigned long long) ( (v>>49)%2 )<< 49 ;
        
        estado[tid] |= aux;
    }
}

unsigned long long confere_bool_5(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( ( (v>>40)%2 ) & ! ( (v>>29)%2 ) ) | ( ( (v>>26)%2 ) & ! ( (v>>29)%2 ) ) | ( ( (v>>0)%2 ) & ! ( (v>>29)%2 ) )<< 0 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>41)%2 ) ) | ( ( ( (v>>26)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>41)%2 ) ) | ( ( ( (v>>1)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>41)%2 ) )<< 1 ;
        aux |=(unsigned long long) ( (v>>29)%2 ) | ( (v>>39)%2 ) | ( (v>>15)%2 )<< 2 ;
        aux |=(unsigned long long) ( ( ( ( ( (v>>30)%2 ) & ! ( (v>>33)%2 ) ) & ! ( (v>>39)%2 ) ) & ! ( (v>>4)%2 ) ) & ! ( (v>>28)%2 ) ) | ( ( ( ( ( (v>>3)%2 ) & ! ( (v>>33)%2 ) ) & ! ( (v>>39)%2 ) ) & ! ( (v>>4)%2 ) ) & ! ( (v>>28)%2 ) )<< 3 ;
        aux |=(unsigned long long) ( ( ( ( (v>>36)%2 ) & ! ( (v>>28)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>39)%2 ) ) | ( ( ( ( (v>>4)%2 ) & ! ( (v>>28)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>39)%2 ) )<< 4 ;
        aux |=(unsigned long long) ( (v>>2)%2 )<< 5 ;
        aux |=(unsigned long long) ( (v>>42)%2 )<< 6 ;
        aux |=(unsigned long long) ( ( (v>>34)%2 ) & ! ( (v>>33)%2 ) ) | ( ( (v>>22)%2 ) & ! ( (v>>33)%2 ) ) | ( ( (v>>2)%2 ) & ! ( (v>>33)%2 ) ) | ( ( (v>>39)%2 ) & ! ( (v>>33)%2 ) )<< 7 ;
        aux |=(unsigned long long) ( (v>>7)%2 )<< 8 ;
        aux |=(unsigned long long) ( (v>>4)%2 )<< 9 ;
        aux |=(unsigned long long) ( (v>>9)%2 )<< 10 ;
        aux |=(unsigned long long) ( ( (v>>43)%2 ) & ! ( (v>>36)%2 ) )<< 11 ;
        aux |=(unsigned long long) ( (v>>28)%2 )<< 12 ;
        aux |=(unsigned long long) ( ( (v>>44)%2 ) & ! ( (v>>36)%2 ) )<< 13 ;
        aux |=(unsigned long long) ( (v>>45)%2 )<< 14 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 15 ;
        aux |=(unsigned long long) ( (v>>47)%2 )<< 16 ;
        aux |=(unsigned long long) ( ( (v>>4)%2 ) & ! ( (v>>32)%2 ) )<< 17 ;
        aux |=(unsigned long long) ( ( (v>>17)%2 ) & ! ( (v>>31)%2 ) )<< 18 ;
        aux |=(unsigned long long) ( (v>>28)%2 )<< 19 ;
        aux |=(unsigned long long) ( (v>>19)%2 )<< 20 ;
        aux |=(unsigned long long) ( ( (v>>48)%2 ) & ! ( (v>>41)%2 ) )<< 21 ;
        aux |=(unsigned long long) ( (v>>13)%2 )<< 22 ;
        aux |=(unsigned long long) ( (v>>8)%2 )<< 23 ;
        aux |=(unsigned long long) ( (v>>20)%2 )<< 24 ;
        aux |=(unsigned long long) ( (v>>41)%2 )<< 25 ;
        aux |=(unsigned long long) ( (v>>49)%2 )<< 26 ;
        aux |=(unsigned long long) ( (v>>2)%2 )<< 27 ;
        aux |=(unsigned long long) ( ( ( ( (v>>30)%2 ) & ! ( (v>>39)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>4)%2 ) ) | ( ( ( ( (v>>28)%2 ) & ! ( (v>>39)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>4)%2 ) ) | ( ( ( ( (v>>33)%2 ) & ! ( (v>>39)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>4)%2 ) )<< 28 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>0)%2 ) ) | ( ( ( (v>>35)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>0)%2 ) ) | ( ( ( (v>>1)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>0)%2 ) )<< 29 ;
        aux |=(unsigned long long) ( (v>>38)%2 )<< 30 ;
        aux |=(unsigned long long) ( (v>>39)%2 ) | ( (v>>32)%2 )<< 31 ;
        aux |=(unsigned long long) ( (v>>6)%2 ) | ( (v>>15)%2 ) | ( (v>>23)%2 )<< 32 ;
        aux |=(unsigned long long) ( (v>>24)%2 ) | ( (v>>14)%2 ) | ( (v>>10)%2 )<< 33 ;
        aux |=(unsigned long long) ( ( (v>>11)%2 ) & ! ( (v>>4)%2 ) )<< 34 ;
        aux |=(unsigned long long) ( ( (v>>21)%2 ) & ! ( (v>>31)%2 ) ) | ( ( (v>>16)%2 ) & ! ( (v>>31)%2 ) )<< 35 ;
        aux |=(unsigned long long) ( (v>>18)%2 )<< 36 ;
        aux |=(unsigned long long) ( (v>>3)%2 )<< 37 ;
        aux |=(unsigned long long) ( (v>>37)%2 )<< 38 ;
        aux |=(unsigned long long) ( ( ( ( (v>>39)%2 ) & ! ( (v>>4)%2 ) ) & ! ( (v>>28)%2 ) ) & ! ( (v>>3)%2 ) ) | ( ( ( ( (v>>32)%2 ) & ! ( (v>>4)%2 ) ) & ! ( (v>>28)%2 ) ) & ! ( (v>>3)%2 ) )<< 39 ;
        aux |=(unsigned long long) ( ( ( (v>>40)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>0)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>41)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>28)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>39)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>4)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>3)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) )<< 40 ;
        aux |=(unsigned long long) ( (v>>41)%2 )<< 41 ;
        aux |=(unsigned long long) ( (v>>42)%2 )<< 42 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 43 ;
        aux |=(unsigned long long) ( (v>>44)%2 )<< 44 ;
        aux |=(unsigned long long) ( (v>>45)%2 )<< 45 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 46 ;
        aux |=(unsigned long long) ( (v>>47)%2 )<< 47 ;
        aux |=(unsigned long long) ( (v>>48)%2 )<< 48 ;
        aux |=(unsigned long long) ( (v>>49)%2 )<< 49 ;

        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_5_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>40)%2 ) * 2 + ( (v>>29)%2 ) * -14 + ( (v>>26)%2 ) * 2 + ( (v>>0)%2 ) * 2) >= 2 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2 + ( (v>>40)%2 ) * -14 + 0 * -14 + ( (v>>26)%2 ) * 2 + ( (v>>1)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2 + ( (v>>39)%2 ) * 2 + ( (v>>15)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>30)%2 ) * 2 + ( (v>>33)%2 ) * -6 + ( (v>>39)%2 ) * -6 + ( (v>>4)%2 ) * -6 + ( (v>>28)%2 ) * -6 + ( (v>>3)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2 + ( (v>>28)%2 ) * -6 + ( (v>>3)%2 ) * -6 + ( (v>>39)%2 ) * -6 + ( (v>>4)%2 ) * 2) >= 2 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>2)%2 ) * 2) >= 2 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>42)%2 ) * 2) >= 2 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>34)%2 ) * 2 + ( (v>>33)%2 ) * -30 + ( (v>>22)%2 ) * 2 + ( (v>>2)%2 ) * 2 + ( (v>>39)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( ( (v>>4)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>9)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>36)%2 ) * -2) >= 2 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>36)%2 ) * -2) >= 2 ) << 13 ;
        aux |=(unsigned long long) ( ( ( (v>>45)%2 ) * 2) >= 2 ) << 14 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(unsigned long long) ( ( ( (v>>4)%2 ) * 2 + ( (v>>32)%2 ) * -2) >= 2 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>17)%2 ) * 2 + ( (v>>31)%2 ) * -2) >= 2 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>41)%2 ) * -2) >= 2 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * 2) >= 2 ) << 24 ;
        
        estado[tid] |= aux;
    }
}

__global__ void passo_tlf_5_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>41)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>49)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(unsigned long long) ( ( ( (v>>2)%2 ) * 2) >= 2 ) << 27 ;
        aux |=(unsigned long long) ( ( ( (v>>30)%2 ) * 2 + ( (v>>39)%2 ) * -14 + ( (v>>3)%2 ) * -14 + ( (v>>4)%2 ) * -14 + ( (v>>28)%2 ) * 2 + ( (v>>33)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2 + ( (v>>40)%2 ) * -14 + ( (v>>0)%2 ) * -14 + ( (v>>35)%2 ) * 2 + ( (v>>1)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(unsigned long long) ( ( ( (v>>38)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 2 + ( (v>>32)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>6)%2 ) * 2 + ( (v>>15)%2 ) * 2 + ( (v>>23)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>24)%2 ) * 2 + ( (v>>14)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(unsigned long long) ( ( ( (v>>11)%2 ) * 2 + ( (v>>4)%2 ) * -2) >= 2 ) << 34 ;
        aux |=(unsigned long long) ( ( ( (v>>21)%2 ) * 2 + ( (v>>31)%2 ) * -6 + ( (v>>16)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(unsigned long long) ( ( ( (v>>3)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(unsigned long long) ( ( ( (v>>37)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 2 + ( (v>>4)%2 ) * -6 + ( (v>>28)%2 ) * -6 + ( (v>>3)%2 ) * -6 + ( (v>>32)%2 ) * 2) >= 2 ) << 39 ;
        aux |=(unsigned long long) ( ( ( (v>>40)%2 ) * 2 + ( (v>>1)%2 ) * -254 + ( (v>>29)%2 ) * -254 + ( (v>>0)%2 ) * 2 + 0 * 2 + ( (v>>28)%2 ) * 2 + ( (v>>39)%2 ) * 2 + ( (v>>4)%2 ) * 2 + ( (v>>3)%2 ) * 2) >= 2 ) << 40 ;
        aux |=(unsigned long long) ( (v>>41)%2 )<< 41 ;
        aux |=(unsigned long long) ( (v>>42)%2 )<< 42 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 43 ;
        aux |=(unsigned long long) ( (v>>44)%2 )<< 44 ;
        aux |=(unsigned long long) ( (v>>45)%2 )<< 45 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 46 ;
        aux |=(unsigned long long) ( (v>>47)%2 )<< 47 ;
        aux |=(unsigned long long) ( (v>>48)%2 )<< 48 ;
        aux |=(unsigned long long) ( (v>>49)%2 )<< 49 ;
        
        estado[tid] |= aux;
    }
}

unsigned long long confere_tlf_5(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( ( ( (v>>40)%2 ) * 2 + ( (v>>29)%2 ) * -14 + ( (v>>26)%2 ) * 2 + ( (v>>0)%2 ) * 2) >= 2 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2 + ( (v>>40)%2 ) * -14 + 0 * -14 + ( (v>>26)%2 ) * 2 + ( (v>>1)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2 + ( (v>>39)%2 ) * 2 + ( (v>>15)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>30)%2 ) * 2 + ( (v>>33)%2 ) * -6 + ( (v>>39)%2 ) * -6 + ( (v>>4)%2 ) * -6 + ( (v>>28)%2 ) * -6 + ( (v>>3)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2 + ( (v>>28)%2 ) * -6 + ( (v>>3)%2 ) * -6 + ( (v>>39)%2 ) * -6 + ( (v>>4)%2 ) * 2) >= 2 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>2)%2 ) * 2) >= 2 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>42)%2 ) * 2) >= 2 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>34)%2 ) * 2 + ( (v>>33)%2 ) * -30 + ( (v>>22)%2 ) * 2 + ( (v>>2)%2 ) * 2 + ( (v>>39)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( ( (v>>4)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>9)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>36)%2 ) * -2) >= 2 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>36)%2 ) * -2) >= 2 ) << 13 ;
        aux |=(unsigned long long) ( ( ( (v>>45)%2 ) * 2) >= 2 ) << 14 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(unsigned long long) ( ( ( (v>>4)%2 ) * 2 + ( (v>>32)%2 ) * -2) >= 2 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>17)%2 ) * 2 + ( (v>>31)%2 ) * -2) >= 2 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>41)%2 ) * -2) >= 2 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * 2) >= 2 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>41)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>49)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(unsigned long long) ( ( ( (v>>2)%2 ) * 2) >= 2 ) << 27 ;
        aux |=(unsigned long long) ( ( ( (v>>30)%2 ) * 2 + ( (v>>39)%2 ) * -14 + ( (v>>3)%2 ) * -14 + ( (v>>4)%2 ) * -14 + ( (v>>28)%2 ) * 2 + ( (v>>33)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2 + ( (v>>40)%2 ) * -14 + ( (v>>0)%2 ) * -14 + ( (v>>35)%2 ) * 2 + ( (v>>1)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(unsigned long long) ( ( ( (v>>38)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 2 + ( (v>>32)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>6)%2 ) * 2 + ( (v>>15)%2 ) * 2 + ( (v>>23)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>24)%2 ) * 2 + ( (v>>14)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(unsigned long long) ( ( ( (v>>11)%2 ) * 2 + ( (v>>4)%2 ) * -2) >= 2 ) << 34 ;
        aux |=(unsigned long long) ( ( ( (v>>21)%2 ) * 2 + ( (v>>31)%2 ) * -6 + ( (v>>16)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(unsigned long long) ( ( ( (v>>3)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(unsigned long long) ( ( ( (v>>37)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 2 + ( (v>>4)%2 ) * -6 + ( (v>>28)%2 ) * -6 + ( (v>>3)%2 ) * -6 + ( (v>>32)%2 ) * 2) >= 2 ) << 39 ;
        aux |=(unsigned long long) ( ( ( (v>>40)%2 ) * 2 + ( (v>>1)%2 ) * -254 + ( (v>>29)%2 ) * -254 + ( (v>>0)%2 ) * 2 + 0 * 2 + ( (v>>28)%2 ) * 2 + ( (v>>39)%2 ) * 2 + ( (v>>4)%2 ) * 2 + ( (v>>3)%2 ) * 2) >= 2 ) << 40 ;
        aux |=(unsigned long long) ( (v>>41)%2 )<< 41 ;
        aux |=(unsigned long long) ( (v>>42)%2 )<< 42 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 43 ;
        aux |=(unsigned long long) ( (v>>44)%2 )<< 44 ;
        aux |=(unsigned long long) ( (v>>45)%2 )<< 45 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 46 ;
        aux |=(unsigned long long) ( (v>>47)%2 )<< 47 ;
        aux |=(unsigned long long) ( (v>>48)%2 )<< 48 ;
        aux |=(unsigned long long) ( (v>>49)%2 )<< 49 ;

        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}


//REDE 6
__global__ void passo_bool_6_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>29)%2 & ( ( ( (v>>0)%2 | (v>>52)%2 ) ) ) ) & ! ( (v>>31)%2 ) ) & ! ( (v>>33)%2 ) )<< 0 ;
        aux |=(unsigned long long) ( (v>>2)%2 & ( ( ( (v>>44)%2 & (v>>31)%2 ) ) & ( ( (v>>5)%2 ) ) ) ) | ( (v>>30)%2 & ( ( ( (v>>5)%2 ) ) & ( ( (v>>6)%2 ) ) & ( ( (v>>44)%2 & (v>>31)%2 ) ) ) )<< 1 ;
        aux |=(unsigned long long) ( (v>>26)%2 & ( ( ( (v>>5)%2 ) ) ) ) | ( (v>>30)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 2 ;
        aux |=(unsigned long long) ( (v>>37)%2 ) | ( (v>>3)%2 )<< 3 ;
        aux |=(unsigned long long) ( (v>>4)%2 ) | ( (v>>37)%2 )<< 4 ;
        aux |=(unsigned long long) ( ( (v>>5)%2 ) & ! ( (v>>35)%2 ) )<< 5 ;
        aux |=(unsigned long long) ( (v>>2)%2 & ( ( ( (v>>30)%2 ) ) ) ) | ( ( (v>>5)%2 ) & ! ( (v>>34)%2 ) )<< 6 ;
        aux |=(unsigned long long) ( (v>>9)%2 )<< 7 ;
        aux |=(unsigned long long) ( (v>>10)%2 )<< 8 ;
        aux |=(unsigned long long) ( (v>>18)%2 & ( ( ( (v>>5)%2 ) ) ) ) | ( (v>>36)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 9 ;
        aux |=(unsigned long long) ( (v>>36)%2 )<< 10 ;
        aux |=(unsigned long long) ( (v>>32)%2 & ( ( ( (v>>40)%2 ) ) ) )<< 11 ;
        aux |=(unsigned long long) ( (v>>5)%2 )<< 12 ;
        aux |=(unsigned long long) ( (v>>52)%2 ) | ( (v>>0)%2 )<< 13 ;
    
        estado[tid] |= aux;
    }
}

__global__ void passo_bool_6_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( (v>>52)%2 ) | ( (v>>0)%2 )<< 13 ;
        aux |=(unsigned long long) ( ( (v>>52)%2 ) & ! ( (v>>15)%2 ) )<< 14 ;
        aux |=(unsigned long long) ( (v>>28)%2 & ( ( ( (v>>25)%2 ) ) ) ) | ( (v>>22)%2 & ( ( ( (v>>25)%2 ) ) ) )<< 15 ;
        aux |=(unsigned long long) ( (v>>18)%2 ) | ( (v>>45)%2 ) | ( (v>>10)%2 )<< 16 ;
        aux |=(unsigned long long) ( (v>>18)%2 ) | ( (v>>16)%2 )<< 17 ;
        aux |=(unsigned long long) ( (v>>9)%2 ) | ( (v>>31)%2 ) | ( ( ( (v>>44)%2 ) & ! ( (v>>20)%2 ) ) & ! ( (v>>23)%2 ) )<< 18 ;
        aux |=(unsigned long long) ( (v>>20)%2 ) | ( (v>>49)%2 )<< 19 ;
        aux |=(unsigned long long) ( (v>>51)%2 ) | ( (v>>31)%2 ) | ( (v>>48)%2 & ( ( ( (v>>40)%2 ) ) ) )<< 20 ;
        aux |=(unsigned long long) ( ( (v>>7)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>24)%2 ) ) | ( ( (v>>8)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>24)%2 ) )<< 21 ;
        aux |=(unsigned long long) ( (v>>48)%2 ) | ( (v>>49)%2 ) | ( (v>>15)%2 ) | ( (v>>14)%2 & ( ( ( (v>>52)%2 ) ) ) )<< 22 ;
        aux |=(unsigned long long) ( (v>>24)%2 )<< 23 ;
        aux |=(unsigned long long) ( (v>>15)%2 ) | ( ( ( (v>>46)%2 ) & ! ( (v>>16)%2 ) ) & ! ( (v>>21)%2 ) ) | ( ( ( (v>>47)%2 ) & ! ( (v>>16)%2 ) ) & ! ( (v>>21)%2 ) ) | ( ( ( (v>>7)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>16)%2 ) ) & ! ( (v>>21)%2 ) ) | ( ( ( (v>>8)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>16)%2 ) ) & ! ( (v>>21)%2 ) )<< 24 ;
        aux |=(unsigned long long) ( (v>>15)%2 ) | ( (v>>47)%2 )<< 25 ;
    
        estado[tid] |= aux;
    }
}

__global__ void passo_bool_6_parte3(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( (v>>3)%2 & ( ( ( (v>>5)%2 ) ) ) ) | ( (v>>26)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 26 ;
        aux |=(unsigned long long) ( (v>>52)%2 & ( ( ( (v>>4)%2 ) ) ) )<< 27 ;
        aux |=(unsigned long long) ( (v>>22)%2 & ( ( ( (v>>4)%2 ) ) ) ) | ( (v>>24)%2 & ( ( ( (v>>4)%2 ) ) ) )<< 28 ;
        aux |=(unsigned long long) ( (v>>4)%2 )<< 29 ;
        aux |=(unsigned long long) ( (v>>3)%2 ) | ( (v>>30)%2 )<< 30 ;
        aux |=(unsigned long long) ( (v>>18)%2 & ( ( ( (v>>5)%2 ) ) ) ) | ( (v>>36)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 31 ;
        aux |=(unsigned long long) ( (v>>36)%2 )<< 32 ;
        aux |=(unsigned long long) ( ( ( (v>>16)%2 ) & ! ( (v>>23)%2 ) ) & ! ( (v>>19)%2 ) ) | ( (v>>36)%2 & ( ( ( (v>>0)%2 ) ) ) )<< 33 ;
        aux |=(unsigned long long) ( (v>>5)%2 )<< 34 ;
        aux |=(unsigned long long) ( (v>>1)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 35 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>27)%2 ) ) | ( ( ( (v>>12)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>27)%2 ) ) | ( ( ( (v>>0)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>27)%2 ) ) | ( ( ( (v>>1)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>27)%2 ) )<< 36 ;
        aux |=(unsigned long long) ( (v>>7)%2 ) | ( (v>>8)%2 )<< 37 ;
        aux |=(unsigned long long) ( (v>>15)%2 ) | ( (v>>14)%2 )<< 38 ;
        aux |=(unsigned long long) ( (v>>33)%2 ) | ( (v>>32)%2 )<< 39 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) & ! ( (v>>30)%2 ) ) & ! ( (v>>26)%2 ) )<< 40 ;
        aux |=(unsigned long long) ( (v>>40)%2 )<< 41 ;
        aux |=(unsigned long long) ( (v>>7)%2 & ( ( ( (v>>21)%2 & (v>>37)%2 ) ) ) )<< 42 ;
        aux |=(unsigned long long) ( (v>>8)%2 & ( ( ( (v>>21)%2 ) ) & ( ( (v>>8)%2 ) ) & ( ( (v>>37)%2 ) ) ) )<< 43 ;
        aux |=(unsigned long long) ( (v>>42)%2 )<< 44 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 45 ;
        aux |=(unsigned long long) ( ( (v>>7)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>21)%2 ) )<< 46 ;
        aux |=(unsigned long long) ( ( (v>>8)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>21)%2 ) )<< 47 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 48 ;
        aux |=(unsigned long long) ( (v>>47)%2 )<< 49 ;
        aux |=(unsigned long long) ( (v>>7)%2 & ( ( ( (v>>41)%2 ) ) & ( ( (v>>37)%2 ) ) ) )<< 50 ;
        aux |=(unsigned long long) ( (v>>50)%2 )<< 51 ;
        aux |=(unsigned long long) ( (v>>52)%2 )<< 52 ;
    
        estado[tid] |= aux;
    }
}

unsigned long long confere_bool_6(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( ( ( (v>>29)%2 & ( ( ( (v>>0)%2 | (v>>52)%2 ) ) ) ) & ! ( (v>>31)%2 ) ) & ! ( (v>>33)%2 ) )<< 0 ;
        aux |=(unsigned long long) ( (v>>2)%2 & ( ( ( (v>>44)%2 & (v>>31)%2 ) ) & ( ( (v>>5)%2 ) ) ) ) | ( (v>>30)%2 & ( ( ( (v>>5)%2 ) ) & ( ( (v>>6)%2 ) ) & ( ( (v>>44)%2 & (v>>31)%2 ) ) ) )<< 1 ;
        aux |=(unsigned long long) ( (v>>26)%2 & ( ( ( (v>>5)%2 ) ) ) ) | ( (v>>30)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 2 ;
        aux |=(unsigned long long) ( (v>>37)%2 ) | ( (v>>3)%2 )<< 3 ;
        aux |=(unsigned long long) ( (v>>4)%2 ) | ( (v>>37)%2 )<< 4 ;
        aux |=(unsigned long long) ( ( (v>>5)%2 ) & ! ( (v>>35)%2 ) )<< 5 ;
        aux |=(unsigned long long) ( (v>>2)%2 & ( ( ( (v>>30)%2 ) ) ) ) | ( ( (v>>5)%2 ) & ! ( (v>>34)%2 ) )<< 6 ;
        aux |=(unsigned long long) ( (v>>9)%2 )<< 7 ;
        aux |=(unsigned long long) ( (v>>10)%2 )<< 8 ;
        aux |=(unsigned long long) ( (v>>18)%2 & ( ( ( (v>>5)%2 ) ) ) ) | ( (v>>36)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 9 ;
        aux |=(unsigned long long) ( (v>>36)%2 )<< 10 ;
        aux |=(unsigned long long) ( (v>>32)%2 & ( ( ( (v>>40)%2 ) ) ) )<< 11 ;
        aux |=(unsigned long long) ( (v>>5)%2 )<< 12 ;
        aux |=(unsigned long long) ( (v>>52)%2 ) | ( (v>>0)%2 )<< 13 ;
        aux |=(unsigned long long) ( ( (v>>52)%2 ) & ! ( (v>>15)%2 ) )<< 14 ;
        aux |=(unsigned long long) ( (v>>28)%2 & ( ( ( (v>>25)%2 ) ) ) ) | ( (v>>22)%2 & ( ( ( (v>>25)%2 ) ) ) )<< 15 ;
        aux |=(unsigned long long) ( (v>>18)%2 ) | ( (v>>45)%2 ) | ( (v>>10)%2 )<< 16 ;
        aux |=(unsigned long long) ( (v>>18)%2 ) | ( (v>>16)%2 )<< 17 ;
        aux |=(unsigned long long) ( (v>>9)%2 ) | ( (v>>31)%2 ) | ( ( ( (v>>44)%2 ) & ! ( (v>>20)%2 ) ) & ! ( (v>>23)%2 ) )<< 18 ;
        aux |=(unsigned long long) ( (v>>20)%2 ) | ( (v>>49)%2 )<< 19 ;
        aux |=(unsigned long long) ( (v>>51)%2 ) | ( (v>>31)%2 ) | ( (v>>48)%2 & ( ( ( (v>>40)%2 ) ) ) )<< 20 ;
        aux |=(unsigned long long) ( ( (v>>7)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>24)%2 ) ) | ( ( (v>>8)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>24)%2 ) )<< 21 ;
        aux |=(unsigned long long) ( (v>>48)%2 ) | ( (v>>49)%2 ) | ( (v>>15)%2 ) | ( (v>>14)%2 & ( ( ( (v>>52)%2 ) ) ) )<< 22 ;
        aux |=(unsigned long long) ( (v>>24)%2 )<< 23 ;
        aux |=(unsigned long long) ( (v>>15)%2 ) | ( ( ( (v>>46)%2 ) & ! ( (v>>16)%2 ) ) & ! ( (v>>21)%2 ) ) | ( ( ( (v>>47)%2 ) & ! ( (v>>16)%2 ) ) & ! ( (v>>21)%2 ) ) | ( ( ( (v>>7)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>16)%2 ) ) & ! ( (v>>21)%2 ) ) | ( ( ( (v>>8)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>16)%2 ) ) & ! ( (v>>21)%2 ) )<< 24 ;
        aux |=(unsigned long long) ( (v>>15)%2 ) | ( (v>>47)%2 )<< 25 ;
        aux |=(unsigned long long) ( (v>>3)%2 & ( ( ( (v>>5)%2 ) ) ) ) | ( (v>>26)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 26 ;
        aux |=(unsigned long long) ( (v>>52)%2 & ( ( ( (v>>4)%2 ) ) ) )<< 27 ;
        aux |=(unsigned long long) ( (v>>22)%2 & ( ( ( (v>>4)%2 ) ) ) ) | ( (v>>24)%2 & ( ( ( (v>>4)%2 ) ) ) )<< 28 ;
        aux |=(unsigned long long) ( (v>>4)%2 )<< 29 ;
        aux |=(unsigned long long) ( (v>>3)%2 ) | ( (v>>30)%2 )<< 30 ;
        aux |=(unsigned long long) ( (v>>18)%2 & ( ( ( (v>>5)%2 ) ) ) ) | ( (v>>36)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 31 ;
        aux |=(unsigned long long) ( (v>>36)%2 )<< 32 ;
        aux |=(unsigned long long) ( ( ( (v>>16)%2 ) & ! ( (v>>23)%2 ) ) & ! ( (v>>19)%2 ) ) | ( (v>>36)%2 & ( ( ( (v>>0)%2 ) ) ) )<< 33 ;
        aux |=(unsigned long long) ( (v>>5)%2 )<< 34 ;
        aux |=(unsigned long long) ( (v>>1)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 35 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>27)%2 ) ) | ( ( ( (v>>12)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>27)%2 ) ) | ( ( ( (v>>0)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>27)%2 ) ) | ( ( ( (v>>1)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>27)%2 ) )<< 36 ;
        aux |=(unsigned long long) ( (v>>7)%2 ) | ( (v>>8)%2 )<< 37 ;
        aux |=(unsigned long long) ( (v>>15)%2 ) | ( (v>>14)%2 )<< 38 ;
        aux |=(unsigned long long) ( (v>>33)%2 ) | ( (v>>32)%2 )<< 39 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) & ! ( (v>>30)%2 ) ) & ! ( (v>>26)%2 ) )<< 40 ;
        aux |=(unsigned long long) ( (v>>40)%2 )<< 41 ;
        aux |=(unsigned long long) ( (v>>7)%2 & ( ( ( (v>>21)%2 & (v>>37)%2 ) ) ) )<< 42 ;
        aux |=(unsigned long long) ( (v>>8)%2 & ( ( ( (v>>21)%2 ) ) & ( ( (v>>8)%2 ) ) & ( ( (v>>37)%2 ) ) ) )<< 43 ;
        aux |=(unsigned long long) ( (v>>42)%2 )<< 44 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 45 ;
        aux |=(unsigned long long) ( ( (v>>7)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>21)%2 ) )<< 46 ;
        aux |=(unsigned long long) ( ( (v>>8)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>21)%2 ) )<< 47 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 48 ;
        aux |=(unsigned long long) ( (v>>47)%2 )<< 49 ;
        aux |=(unsigned long long) ( (v>>7)%2 & ( ( ( (v>>41)%2 ) ) & ( ( (v>>37)%2 ) ) ) )<< 50 ;
        aux |=(unsigned long long) ( (v>>50)%2 )<< 51 ;
        aux |=(unsigned long long) ( (v>>52)%2 )<< 52 ;

        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_6_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 6 + ( (v>>0)%2 ) * 2 + 0 * 2 + ( (v>>31)%2 ) * -6 + ( (v>>33)%2 ) * -6) >= 8 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>2)%2 ) * 6 + ( (v>>44)%2 ) * 10 + ( (v>>31)%2 ) * 10 + ( (v>>5)%2 ) * 10 + ( (v>>30)%2 ) * 2 + ( (v>>6)%2 ) * 2) >= 34 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>26)%2 ) * 2 + ( (v>>5)%2 ) * 6 + ( (v>>30)%2 ) * 2) >= 8 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>37)%2 ) * 2 + ( (v>>3)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>4)%2 ) * 2 + ( (v>>37)%2 ) * 2) >= 2 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * 2 + ( (v>>35)%2 ) * -2) >= 2 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>2)%2 ) * 6 + ( (v>>30)%2 ) * 6 + ( (v>>5)%2 ) * 6 + ( (v>>34)%2 ) * -6) >= 6 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>9)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2 + ( (v>>5)%2 ) * 6 + ( (v>>36)%2 ) * 2) >= 8 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2 + ( (v>>40)%2 ) * 2) >= 4 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>0)%2 ) * 2) >= 2 ) << 13 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>15)%2 ) * -2) >= 2 ) << 14 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2 + ( (v>>25)%2 ) * 6 + ( (v>>22)%2 ) * 2) >= 8 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2 + ( (v>>45)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 16 ;
        
        
        estado[tid] |= aux;
    }
}

__global__ void passo_tlf_6_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2 + ( (v>>16)%2 ) * 2) >= 2 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>9)%2 ) * 14 + ( (v>>31)%2 ) * 14 + ( (v>>44)%2 ) * 2 + ( (v>>20)%2 ) * -2 + ( (v>>23)%2 ) * -2) >= 2 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * 2 + ( (v>>49)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>51)%2 ) * 6 + ( (v>>31)%2 ) * 6 + ( (v>>48)%2 ) * 2 + ( (v>>40)%2 ) * 2) >= 4 ) << 20 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2 + ( (v>>37)%2 ) * 6 + ( (v>>24)%2 ) * -6 + ( (v>>8)%2 ) * 2) >= 8 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>48)%2 ) * 6 + ( (v>>49)%2 ) * 6 + ( (v>>15)%2 ) * 6 + ( (v>>14)%2 ) * 2 + ( (v>>52)%2 ) * 2) >= 4 ) << 22 ;
        aux |=(unsigned long long) ( ( ( (v>>24)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 202 + ( (v>>46)%2 ) * 10 + ( (v>>16)%2 ) * -54 + ( (v>>21)%2 ) * -54 + ( (v>>47)%2 ) * 10 + ( (v>>7)%2 ) * 2 + ( (v>>37)%2 ) * 6 + ( (v>>8)%2 ) * 2) >= 8 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 2 + ( (v>>47)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>3)%2 ) * 2 + ( (v>>5)%2 ) * 6 + ( (v>>26)%2 ) * 2) >= 8 ) << 26 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>4)%2 ) * 2) >= 4 ) << 27 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>4)%2 ) * 6 + ( (v>>24)%2 ) * 2) >= 8 ) << 28 ;
        aux |=(unsigned long long) ( ( ( (v>>4)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(unsigned long long) ( ( ( (v>>3)%2 ) * 2 + ( (v>>30)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2 + ( (v>>5)%2 ) * 6 + ( (v>>36)%2 ) * 2) >= 8 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>16)%2 ) * 6 + ( (v>>23)%2 ) * -6 + ( (v>>19)%2 ) * -6 + ( (v>>36)%2 ) * 14 + ( (v>>0)%2 ) * 14) >= 6 ) << 33 ;
        
        estado[tid] |= aux;
    }
}

__global__ void passo_tlf_6_parte3(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2 + ( (v>>5)%2 ) * 2) >= 4 ) << 35 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2 + ( (v>>19)%2 ) * -30 + ( (v>>27)%2 ) * -30 + ( (v>>12)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>1)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2 + ( (v>>8)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 2 + ( (v>>14)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 2 + ( (v>>32)%2 ) * 2) >= 2 ) << 39 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * 2 + ( (v>>30)%2 ) * -2 + ( (v>>26)%2 ) * -2) >= 2 ) << 40 ;
        aux |=(unsigned long long) ( ( ( (v>>40)%2 ) * 2) >= 2 ) << 41 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2 + ( (v>>21)%2 ) * 2 + ( (v>>37)%2 ) * 2) >= 6 ) << 42 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2 + ( (v>>21)%2 ) * 2 + ( (v>>37)%2 ) * 2) >= 6 ) << 43 ;
        aux |=(unsigned long long) ( ( ( (v>>42)%2 ) * 2) >= 2 ) << 44 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 45 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2 + ( (v>>37)%2 ) * 2 + ( (v>>21)%2 ) * -2) >= 4 ) << 46 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2 + ( (v>>37)%2 ) * 2 + ( (v>>21)%2 ) * -2) >= 4 ) << 47 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 48 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2) >= 2 ) << 49 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2 + ( (v>>41)%2 ) * 2 + ( (v>>37)%2 ) * 2) >= 6 ) << 50 ;
        aux |=(unsigned long long) ( ( ( (v>>50)%2 ) * 2) >= 2 ) << 51 ;
        aux |=(unsigned long long) ( (v>>52)%2 )<< 52 ;
        
        estado[tid] |= aux;
    }
}

unsigned long long confere_tlf_6(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 6 + ( (v>>0)%2 ) * 2 + 0 * 2 + ( (v>>31)%2 ) * -6 + ( (v>>33)%2 ) * -6) >= 8 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>2)%2 ) * 6 + ( (v>>44)%2 ) * 10 + ( (v>>31)%2 ) * 10 + ( (v>>5)%2 ) * 10 + ( (v>>30)%2 ) * 2 + ( (v>>6)%2 ) * 2) >= 34 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>26)%2 ) * 2 + ( (v>>5)%2 ) * 6 + ( (v>>30)%2 ) * 2) >= 8 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>37)%2 ) * 2 + ( (v>>3)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>4)%2 ) * 2 + ( (v>>37)%2 ) * 2) >= 2 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * 2 + ( (v>>35)%2 ) * -2) >= 2 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>2)%2 ) * 6 + ( (v>>30)%2 ) * 6 + ( (v>>5)%2 ) * 6 + ( (v>>34)%2 ) * -6) >= 6 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>9)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2 + ( (v>>5)%2 ) * 6 + ( (v>>36)%2 ) * 2) >= 8 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2 + ( (v>>40)%2 ) * 2) >= 4 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>0)%2 ) * 2) >= 2 ) << 13 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>15)%2 ) * -2) >= 2 ) << 14 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2 + ( (v>>25)%2 ) * 6 + ( (v>>22)%2 ) * 2) >= 8 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2 + ( (v>>45)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2 + ( (v>>16)%2 ) * 2) >= 2 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>9)%2 ) * 14 + ( (v>>31)%2 ) * 14 + ( (v>>44)%2 ) * 2 + ( (v>>20)%2 ) * -2 + ( (v>>23)%2 ) * -2) >= 2 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * 2 + ( (v>>49)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>51)%2 ) * 6 + ( (v>>31)%2 ) * 6 + ( (v>>48)%2 ) * 2 + ( (v>>40)%2 ) * 2) >= 4 ) << 20 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2 + ( (v>>37)%2 ) * 6 + ( (v>>24)%2 ) * -6 + ( (v>>8)%2 ) * 2) >= 8 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>48)%2 ) * 6 + ( (v>>49)%2 ) * 6 + ( (v>>15)%2 ) * 6 + ( (v>>14)%2 ) * 2 + ( (v>>52)%2 ) * 2) >= 4 ) << 22 ;
        aux |=(unsigned long long) ( ( ( (v>>24)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 202 + ( (v>>46)%2 ) * 10 + ( (v>>16)%2 ) * -54 + ( (v>>21)%2 ) * -54 + ( (v>>47)%2 ) * 10 + ( (v>>7)%2 ) * 2 + ( (v>>37)%2 ) * 6 + ( (v>>8)%2 ) * 2) >= 8 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 2 + ( (v>>47)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>3)%2 ) * 2 + ( (v>>5)%2 ) * 6 + ( (v>>26)%2 ) * 2) >= 8 ) << 26 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>4)%2 ) * 2) >= 4 ) << 27 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>4)%2 ) * 6 + ( (v>>24)%2 ) * 2) >= 8 ) << 28 ;
        aux |=(unsigned long long) ( ( ( (v>>4)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(unsigned long long) ( ( ( (v>>3)%2 ) * 2 + ( (v>>30)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2 + ( (v>>5)%2 ) * 6 + ( (v>>36)%2 ) * 2) >= 8 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>16)%2 ) * 6 + ( (v>>23)%2 ) * -6 + ( (v>>19)%2 ) * -6 + ( (v>>36)%2 ) * 14 + ( (v>>0)%2 ) * 14) >= 6 ) << 33 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2 + ( (v>>5)%2 ) * 2) >= 4 ) << 35 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2 + ( (v>>19)%2 ) * -30 + ( (v>>27)%2 ) * -30 + ( (v>>12)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>1)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2 + ( (v>>8)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 2 + ( (v>>14)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 2 + ( (v>>32)%2 ) * 2) >= 2 ) << 39 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * 2 + ( (v>>30)%2 ) * -2 + ( (v>>26)%2 ) * -2) >= 2 ) << 40 ;
        aux |=(unsigned long long) ( ( ( (v>>40)%2 ) * 2) >= 2 ) << 41 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2 + ( (v>>21)%2 ) * 2 + ( (v>>37)%2 ) * 2) >= 6 ) << 42 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2 + ( (v>>21)%2 ) * 2 + ( (v>>37)%2 ) * 2) >= 6 ) << 43 ;
        aux |=(unsigned long long) ( ( ( (v>>42)%2 ) * 2) >= 2 ) << 44 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 45 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2 + ( (v>>37)%2 ) * 2 + ( (v>>21)%2 ) * -2) >= 4 ) << 46 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2 + ( (v>>37)%2 ) * 2 + ( (v>>21)%2 ) * -2) >= 4 ) << 47 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 48 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2) >= 2 ) << 49 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2 + ( (v>>41)%2 ) * 2 + ( (v>>37)%2 ) * 2) >= 6 ) << 50 ;
        aux |=(unsigned long long) ( ( ( (v>>50)%2 ) * 2) >= 2 ) << 51 ;
        aux |=(unsigned long long) ( (v>>52)%2 )<< 52 ;

        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}


//REDE 7
__global__ void passo_bool_7_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( (v>>28)%2 ) & !( (v>>33)%2 ) )<< 0 ;
        aux |=(unsigned long long) ( (v>>20)%2 & ( ( ( (v>>12)%2 | (v>>2)%2 ) ) ) )<< 1 ;
        aux |=(unsigned long long) ( (v>>19)%2 ) | ( (v>>46)%2 )<< 2 ;
        aux |=(unsigned long long) ( (v>>49)%2 )<< 3 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 & ( ( ( (v>>47)%2 ) ) ) ) & !( (v>>5)%2 ) ) & !( (v>>10)%2 ) )<< 4 ;
        aux |=(unsigned long long) ( (v>>6)%2 & ( ( ( (v>>0)%2 ) ) ) )<< 5 ;
        aux |=(unsigned long long) ( (v>>25)%2 )<< 6 ;
        aux |=(unsigned long long) ( (v>>6)%2 )<< 7 ;
        aux |=(unsigned long long) ( ( ( (v>>50)%2 ) & !( (v>>30)%2 ) ) & !( (v>>17)%2 ) ) | ( ( ( (v>>40)%2 ) & !( (v>>30)%2 ) ) & !( (v>>17)%2 ) )<< 8 ;
        aux |=(unsigned long long) ( (v>>46)%2 ) | ( (v>>19)%2 ) | ( (v>>10)%2 )<< 9 ;
        aux |=(unsigned long long) ( (v>>24)%2 )<< 10 ;
        aux |=(unsigned long long) ( ( ( (v>>51)%2 ) & !( (v>>17)%2 ) ) & !( (v>>30)%2 ) )<< 11 ;
        aux |=(unsigned long long) ( (v>>10)%2 & ( ( ( (v>>37)%2 ) & ( ( ( (v>>9)%2 | (v>>6)%2 ) ) ) ) ) )<< 12 ;
        aux |=(unsigned long long) ( ( (v>>19)%2 ) & !( (v>>0)%2 ) )<< 13 ;
        aux |=(unsigned long long) ( ( ( (v>>11)%2 ) & !( (v>>40)%2 ) ) & !( (v>>17)%2 ) )<< 14 ;
        aux |=(unsigned long long) ( (v>>29)%2 ) | ( (v>>17)%2 )<< 15 ;
        aux |=(unsigned long long) ( (v>>47)%2 ) | ( (v>>38)%2 )<< 16 ;
        aux |=(unsigned long long) ( (v>>14)%2 ) | ( (v>>43)%2 ) | ( (v>>8)%2 )<< 17 ;
        aux |=(unsigned long long) ( (v>>45)%2 )<< 18 ;
        aux |=(unsigned long long) ( (v>>41)%2 & ( ( ( (v>>42)%2 ) ) ) ) | ( (v>>21)%2 & ( ( ( (v>>52)%2 ) ) ) ) | ( (v>>26)%2 & ( ( ( (v>>52)%2 ) ) ) ) | ( (v>>42)%2 & ( ( ( (v>>26)%2 ) ) ) )<< 19 ;
        aux |=(unsigned long long) ( (v>>19)%2 )<< 20 ;
        aux |=(unsigned long long) ( (v>>36)%2 )<< 21 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 22 ;
    
        estado[tid] |= aux;
    }
}

__global__ void passo_bool_7_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( (v>>0)%2 ) & !( (v>>44)%2 ) ) | ( ( (v>>47)%2 ) & !( (v>>44)%2 ) )<< 23 ;
        aux |=(unsigned long long) ( ( ( (v>>35)%2 ) & !( (v>>1)%2 ) ) & !( (v>>32)%2 ) ) | ( ( ( (v>>21)%2 ) & !( (v>>1)%2 ) ) & !( (v>>32)%2 ) )<< 24 ;
        aux |=(unsigned long long) ( (v>>46)%2 ) | ( (v>>10)%2 )<< 25 ;
        aux |=(unsigned long long) ( (v>>16)%2 )<< 26 ;
        aux |=(unsigned long long) ( (v>>25)%2 & ( ( ( (v>>0)%2 ) ) ) )<< 27 ;
        aux |=(unsigned long long) ( (v>>29)%2 )<< 28 ;
        aux |=(unsigned long long) ( (v>>15)%2 ) | ( (v>>36)%2 & ( ( ( (v>>39)%2 ) ) ) )<< 29 ;
        aux |=(unsigned long long) ( (v>>31)%2 )<< 30 ;
        aux |=(unsigned long long) ( (v>>8)%2 ) | ( (v>>11)%2 )<< 31 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 32 ;
        aux |=(unsigned long long) ( (v>>47)%2 )<< 33 ;
        aux |=(unsigned long long) ( ( (v>>48)%2 & ( ( ( (v>>27)%2 ) ) ) ) & !( (v>>45)%2 ) )<< 34 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) & !( (v>>0)%2 ) ) & !( (v>>10)%2 ) ) | ( ( ( (v>>30)%2 ) & !( (v>>0)%2 ) ) & !( (v>>10)%2 ) )<< 35 ;
        aux |=(unsigned long long) ( (v>>39)%2 ) | ( (v>>31)%2 )<< 36 ;
        aux |=(unsigned long long) ( (v>>10)%2 )<< 37 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 38 ;
        aux |=(unsigned long long) ( ( (v>>17)%2 ) & !( (v>>37)%2 ) )<< 39 ;
        aux |=(unsigned long long) ( (v>>10)%2 )<< 40 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 41 ;
        aux |=(unsigned long long) ( (v>>3)%2 )<< 42 ;
        aux |=(unsigned long long) ( (v>>53)%2 )<< 43 ;
        aux |=(unsigned long long) ( (v>>27)%2 )<< 44 ;
        aux |=(unsigned long long) ( ( (v>>47)%2 ) & !( (v>>0)%2 ) )<< 45 ;
        aux |=(unsigned long long) ( (v>>41)%2 & ( ( ( (v>>52)%2 ) ) ) ) | ( (v>>21)%2 & ( ( ( (v>>26)%2 ) ) ) ) | ( (v>>26)%2 & ( ( ( (v>>52)%2 ) ) ) ) | ( (v>>42)%2 & ( ( ( (v>>21)%2 ) ) ) )<< 46 ;
        aux |=(unsigned long long) ( (v>>46)%2 & ( ( ( (v>>54)%2 ) ) ) ) | ( (v>>3)%2 & ( ( ( (v>>54)%2 ) ) ) )<< 47 ;
        aux |=(unsigned long long) ( (v>>28)%2 & ( ( ( (v>>10)%2 ) ) ) )<< 48 ;
        aux |=(unsigned long long) ( (v>>49)%2 )<< 49 ;
        aux |=(unsigned long long) ( (v>>50)%2 )<< 50 ;
        aux |=(unsigned long long) ( (v>>51)%2 )<< 51 ;
        aux |=(unsigned long long) ( (v>>52)%2 )<< 52 ;
        aux |=(unsigned long long) ( (v>>53)%2 )<< 53 ;
        aux |=(unsigned long long) ( (v>>54)%2 )<< 54 ;
    
        estado[tid] |= aux;
    }
}

unsigned long long confere_bool_7(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( ( (v>>28)%2 ) & !( (v>>33)%2 ) )<< 0 ;
        aux |=(unsigned long long) ( (v>>20)%2 & ( ( ( (v>>12)%2 | (v>>2)%2 ) ) ) )<< 1 ;
        aux |=(unsigned long long) ( (v>>19)%2 ) | ( (v>>46)%2 )<< 2 ;
        aux |=(unsigned long long) ( (v>>49)%2 )<< 3 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 & ( ( ( (v>>47)%2 ) ) ) ) & !( (v>>5)%2 ) ) & !( (v>>10)%2 ) )<< 4 ;
        aux |=(unsigned long long) ( (v>>6)%2 & ( ( ( (v>>0)%2 ) ) ) )<< 5 ;
        aux |=(unsigned long long) ( (v>>25)%2 )<< 6 ;
        aux |=(unsigned long long) ( (v>>6)%2 )<< 7 ;
        aux |=(unsigned long long) ( ( ( (v>>50)%2 ) & !( (v>>30)%2 ) ) & !( (v>>17)%2 ) ) | ( ( ( (v>>40)%2 ) & !( (v>>30)%2 ) ) & !( (v>>17)%2 ) )<< 8 ;
        aux |=(unsigned long long) ( (v>>46)%2 ) | ( (v>>19)%2 ) | ( (v>>10)%2 )<< 9 ;
        aux |=(unsigned long long) ( (v>>24)%2 )<< 10 ;
        aux |=(unsigned long long) ( ( ( (v>>51)%2 ) & !( (v>>17)%2 ) ) & !( (v>>30)%2 ) )<< 11 ;
        aux |=(unsigned long long) ( (v>>10)%2 & ( ( ( (v>>37)%2 ) & ( ( ( (v>>9)%2 | (v>>6)%2 ) ) ) ) ) )<< 12 ;
        aux |=(unsigned long long) ( ( (v>>19)%2 ) & !( (v>>0)%2 ) )<< 13 ;
        aux |=(unsigned long long) ( ( ( (v>>11)%2 ) & !( (v>>40)%2 ) ) & !( (v>>17)%2 ) )<< 14 ;
        aux |=(unsigned long long) ( (v>>29)%2 ) | ( (v>>17)%2 )<< 15 ;
        aux |=(unsigned long long) ( (v>>47)%2 ) | ( (v>>38)%2 )<< 16 ;
        aux |=(unsigned long long) ( (v>>14)%2 ) | ( (v>>43)%2 ) | ( (v>>8)%2 )<< 17 ;
        aux |=(unsigned long long) ( (v>>45)%2 )<< 18 ;
        aux |=(unsigned long long) ( (v>>41)%2 & ( ( ( (v>>42)%2 ) ) ) ) | ( (v>>21)%2 & ( ( ( (v>>52)%2 ) ) ) ) | ( (v>>26)%2 & ( ( ( (v>>52)%2 ) ) ) ) | ( (v>>42)%2 & ( ( ( (v>>26)%2 ) ) ) )<< 19 ;
        aux |=(unsigned long long) ( (v>>19)%2 )<< 20 ;
        aux |=(unsigned long long) ( (v>>36)%2 )<< 21 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 22 ;
        aux |=(unsigned long long) ( ( (v>>0)%2 ) & !( (v>>44)%2 ) ) | ( ( (v>>47)%2 ) & !( (v>>44)%2 ) )<< 23 ;
        aux |=(unsigned long long) ( ( ( (v>>35)%2 ) & !( (v>>1)%2 ) ) & !( (v>>32)%2 ) ) | ( ( ( (v>>21)%2 ) & !( (v>>1)%2 ) ) & !( (v>>32)%2 ) )<< 24 ;
        aux |=(unsigned long long) ( (v>>46)%2 ) | ( (v>>10)%2 )<< 25 ;
        aux |=(unsigned long long) ( (v>>16)%2 )<< 26 ;
        aux |=(unsigned long long) ( (v>>25)%2 & ( ( ( (v>>0)%2 ) ) ) )<< 27 ;
        aux |=(unsigned long long) ( (v>>29)%2 )<< 28 ;
        aux |=(unsigned long long) ( (v>>15)%2 ) | ( (v>>36)%2 & ( ( ( (v>>39)%2 ) ) ) )<< 29 ;
        aux |=(unsigned long long) ( (v>>31)%2 )<< 30 ;
        aux |=(unsigned long long) ( (v>>8)%2 ) | ( (v>>11)%2 )<< 31 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 32 ;
        aux |=(unsigned long long) ( (v>>47)%2 )<< 33 ;
        aux |=(unsigned long long) ( ( (v>>48)%2 & ( ( ( (v>>27)%2 ) ) ) ) & !( (v>>45)%2 ) )<< 34 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) & !( (v>>0)%2 ) ) & !( (v>>10)%2 ) ) | ( ( ( (v>>30)%2 ) & !( (v>>0)%2 ) ) & !( (v>>10)%2 ) )<< 35 ;
        aux |=(unsigned long long) ( (v>>39)%2 ) | ( (v>>31)%2 )<< 36 ;
        aux |=(unsigned long long) ( (v>>10)%2 )<< 37 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 38 ;
        aux |=(unsigned long long) ( ( (v>>17)%2 ) & !( (v>>37)%2 ) )<< 39 ;
        aux |=(unsigned long long) ( (v>>10)%2 )<< 40 ;
        aux |=(unsigned long long) ( (v>>43)%2 )<< 41 ;
        aux |=(unsigned long long) ( (v>>3)%2 )<< 42 ;
        aux |=(unsigned long long) ( (v>>53)%2 )<< 43 ;
        aux |=(unsigned long long) ( (v>>27)%2 )<< 44 ;
        aux |=(unsigned long long) ( ( (v>>47)%2 ) & !( (v>>0)%2 ) )<< 45 ;
        aux |=(unsigned long long) ( (v>>41)%2 & ( ( ( (v>>52)%2 ) ) ) ) | ( (v>>21)%2 & ( ( ( (v>>26)%2 ) ) ) ) | ( (v>>26)%2 & ( ( ( (v>>52)%2 ) ) ) ) | ( (v>>42)%2 & ( ( ( (v>>21)%2 ) ) ) )<< 46 ;
        aux |=(unsigned long long) ( (v>>46)%2 & ( ( ( (v>>54)%2 ) ) ) ) | ( (v>>3)%2 & ( ( ( (v>>54)%2 ) ) ) )<< 47 ;
        aux |=(unsigned long long) ( (v>>28)%2 & ( ( ( (v>>10)%2 ) ) ) )<< 48 ;
        aux |=(unsigned long long) ( (v>>49)%2 )<< 49 ;
        aux |=(unsigned long long) ( (v>>50)%2 )<< 50 ;
        aux |=(unsigned long long) ( (v>>51)%2 )<< 51 ;
        aux |=(unsigned long long) ( (v>>52)%2 )<< 52 ;
        aux |=(unsigned long long) ( (v>>53)%2 )<< 53 ;
        aux |=(unsigned long long) ( (v>>54)%2 )<< 54 ;

        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_7_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2 + ( (v>>33)%2 ) * -2) >= 2 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * 6 + ( (v>>12)%2 ) * 2 + ( (v>>2)%2 ) * 2) >= 8 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 ) * 2 + ( (v>>46)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>49)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2 + ( (v>>47)%2 ) * 2 + ( (v>>5)%2 ) * -2 + ( (v>>10)%2 ) * -2) >= 4 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>6)%2 ) * 2 + ( (v>>0)%2 ) * 2) >= 4 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2) >= 2 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>6)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>30)%2 ) * -6 + ( (v>>17)%2 ) * -6 + ( (v>>40)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + ( (v>>19)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>24)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>17)%2 ) * -2 + ( (v>>30)%2 ) * -2) >= 2 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 6 + ( (v>>37)%2 ) * 6 + ( (v>>9)%2 ) * 2 + ( (v>>6)%2 ) * 2) >= 14 ) << 12 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 ) * 2 + ( (v>>0)%2 ) * -2) >= 2 ) << 13 ;
        aux |=(unsigned long long) ( ( ( (v>>11)%2 ) * 2 + ( (v>>40)%2 ) * -2 + ( (v>>17)%2 ) * -2) >= 2 ) << 14 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2 + ( (v>>17)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2 + ( (v>>38)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(unsigned long long) ( ( ( (v>>14)%2 ) * 2 + ( (v>>43)%2 ) * 2 + ( (v>>8)%2 ) * 2) >= 2 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>45)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>41)%2 ) * 6 + ( (v>>42)%2 ) * 14 + ( (v>>21)%2 ) * 6 + 0 * 14 + ( (v>>26)%2 ) * 10) >= 20 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 22 ;
        
        estado[tid] |= aux;
    }
}

__global__ void passo_tlf_7_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>44)%2 ) * -6 + ( (v>>47)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>35)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>32)%2 ) * -6 + ( (v>>21)%2 ) * 2) >= 2 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>16)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2 + ( (v>>0)%2 ) * 2) >= 4 ) << 27 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 6 + ( (v>>36)%2 ) * 2 + ( (v>>39)%2 ) * 2) >= 4 ) << 29 ;
        aux |=(unsigned long long) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2 + ( (v>>11)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(unsigned long long) ( ( ( (v>>48)%2 ) * 2 + ( (v>>27)%2 ) * 2 + ( (v>>45)%2 ) * -2) >= 4 ) << 34 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2 + ( (v>>0)%2 ) * -6 + ( (v>>10)%2 ) * -6 + ( (v>>30)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 2 + ( (v>>31)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(unsigned long long) ( ( ( (v>>17)%2 ) * 2 + ( (v>>37)%2 ) * -2) >= 2 ) << 39 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 2) >= 2 ) << 40 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 41 ;
        aux |=(unsigned long long) ( ( ( (v>>3)%2 ) * 2) >= 2 ) << 42 ;
        aux |=(unsigned long long) ( ( ( (v>>53)%2 ) * 2) >= 2 ) << 43 ;
        aux |=(unsigned long long) ( ( ( (v>>27)%2 ) * 2) >= 2 ) << 44 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2 + ( (v>>0)%2 ) * -2) >= 2 ) << 45 ;
        aux |=(unsigned long long) ( ( ( (v>>41)%2 ) * 6 + 0 * 14 + ( (v>>21)%2 ) * 14 + ( (v>>26)%2 ) * 10 + ( (v>>42)%2 ) * 6) >= 20 ) << 46 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + 0 * 6 + ( (v>>3)%2 ) * 2) >= 8 ) << 47 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 4 ) << 48 ;
        aux |=(unsigned long long) ( (v>>49)%2 )<< 49 ;
        aux |=(unsigned long long) ( (v>>50)%2 )<< 50 ;
        aux |=(unsigned long long) ( (v>>51)%2 )<< 51 ;
        aux |=(unsigned long long) ( (v>>52)%2 )<< 52 ;
        aux |=(unsigned long long) ( (v>>53)%2 )<< 53 ;
        aux |=(unsigned long long) ( (v>>54)%2 )<< 54 ;
        
        estado[tid] |= aux;
    }
}


unsigned long long confere_tlf_7(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2 + ( (v>>33)%2 ) * -2) >= 2 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * 6 + ( (v>>12)%2 ) * 2 + ( (v>>2)%2 ) * 2) >= 8 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 ) * 2 + ( (v>>46)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>49)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2 + ( (v>>47)%2 ) * 2 + ( (v>>5)%2 ) * -2 + ( (v>>10)%2 ) * -2) >= 4 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>6)%2 ) * 2 + ( (v>>0)%2 ) * 2) >= 4 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2) >= 2 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>6)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>30)%2 ) * -6 + ( (v>>17)%2 ) * -6 + ( (v>>40)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + ( (v>>19)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>24)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>17)%2 ) * -2 + ( (v>>30)%2 ) * -2) >= 2 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 6 + ( (v>>37)%2 ) * 6 + ( (v>>9)%2 ) * 2 + ( (v>>6)%2 ) * 2) >= 14 ) << 12 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 ) * 2 + ( (v>>0)%2 ) * -2) >= 2 ) << 13 ;
        aux |=(unsigned long long) ( ( ( (v>>11)%2 ) * 2 + ( (v>>40)%2 ) * -2 + ( (v>>17)%2 ) * -2) >= 2 ) << 14 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2 + ( (v>>17)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2 + ( (v>>38)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(unsigned long long) ( ( ( (v>>14)%2 ) * 2 + ( (v>>43)%2 ) * 2 + ( (v>>8)%2 ) * 2) >= 2 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>45)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>41)%2 ) * 6 + ( (v>>42)%2 ) * 14 + ( (v>>21)%2 ) * 6 + 0 * 14 + ( (v>>26)%2 ) * 10) >= 20 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>44)%2 ) * -6 + ( (v>>47)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>35)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>32)%2 ) * -6 + ( (v>>21)%2 ) * 2) >= 2 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>16)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(unsigned long long) ( ( ( (v>>25)%2 ) * 2 + ( (v>>0)%2 ) * 2) >= 4 ) << 27 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 6 + ( (v>>36)%2 ) * 2 + ( (v>>39)%2 ) * 2) >= 4 ) << 29 ;
        aux |=(unsigned long long) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2 + ( (v>>11)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(unsigned long long) ( ( ( (v>>48)%2 ) * 2 + ( (v>>27)%2 ) * 2 + ( (v>>45)%2 ) * -2) >= 4 ) << 34 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2 + ( (v>>0)%2 ) * -6 + ( (v>>10)%2 ) * -6 + ( (v>>30)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 2 + ( (v>>31)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(unsigned long long) ( ( ( (v>>17)%2 ) * 2 + ( (v>>37)%2 ) * -2) >= 2 ) << 39 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 2) >= 2 ) << 40 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 41 ;
        aux |=(unsigned long long) ( ( ( (v>>3)%2 ) * 2) >= 2 ) << 42 ;
        aux |=(unsigned long long) ( ( ( (v>>53)%2 ) * 2) >= 2 ) << 43 ;
        aux |=(unsigned long long) ( ( ( (v>>27)%2 ) * 2) >= 2 ) << 44 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2 + ( (v>>0)%2 ) * -2) >= 2 ) << 45 ;
        aux |=(unsigned long long) ( ( ( (v>>41)%2 ) * 6 + 0 * 14 + ( (v>>21)%2 ) * 14 + ( (v>>26)%2 ) * 10 + ( (v>>42)%2 ) * 6) >= 20 ) << 46 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + 0 * 6 + ( (v>>3)%2 ) * 2) >= 8 ) << 47 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 4 ) << 48 ;
        aux |=(unsigned long long) ( (v>>49)%2 )<< 49 ;
        aux |=(unsigned long long) ( (v>>50)%2 )<< 50 ;
        aux |=(unsigned long long) ( (v>>51)%2 )<< 51 ;
        aux |=(unsigned long long) ( (v>>52)%2 )<< 52 ;
        aux |=(unsigned long long) ( (v>>53)%2 )<< 53 ;
        aux |=(unsigned long long) ( (v>>54)%2 )<< 54 ;

        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 8
__global__ void passo_bool_8_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) )<< 0 ;
        aux |=(unsigned long long) ( (v>>6)%2 ) | ( (v>>1)%2 )<< 1 ;
        aux |=(unsigned long long) ( ( ( ( (v>>6)%2 ) & ! ( (v>>30)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>3)%2 ) ) | ( ( ( ( (v>>19)%2 ) & ! ( (v>>30)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>3)%2 ) )<< 2 ;
        aux |=(unsigned long long) ( ( ( ( ( (v>>46)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>2)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>9)%2 ) ) | ( ( ( ( ( (v>>33)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>2)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>9)%2 ) )<< 3 ;
        aux |=(unsigned long long) ( ( (v>>10)%2 & ( ( ( (v>>21)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 4 ;
        aux |=(unsigned long long) ( ( (v>>48)%2 ) & ! ( (v>>1)%2 ) )<< 5 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 & ( ( ( (v>>2)%2 ) ) ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>20)%2 ) ) | ( ( (v>>9)%2 ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>51)%2 & ( ( ( (v>>2)%2 ) ) ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>20)%2 ) )<< 6 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>42)%2 ) )<< 7 ;
        aux |=(unsigned long long) ( ( (v>>12)%2 ) & ! ( (v>>1)%2 ) )<< 8 ;
        aux |=(unsigned long long) ( ( (v>>15)%2 & ( ( ( (v>>7)%2 ) ) | ( ( (v>>13)%2 ) & ( ( ( ! (v>>11)%2 ) ) ) ) | ( ( (v>>13)%2 & (v>>23)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 9 ;
        aux |=(unsigned long long) ( ( (v>>31)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 10 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) & ! ( (v>>9)%2 ) ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>4)%2 & ( ( ( (v>>21)%2 ) ) ) ) & ! ( (v>>9)%2 ) ) & ! ( (v>>1)%2 ) )<< 11 ;
        aux |=(unsigned long long) ( ( (v>>48)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>26)%2 ) & ! ( (v>>1)%2 ) )<< 12 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 & ( ( ( (v>>14)%2 ) ) ) ) & ! ( (v>>53)%2 ) ) & ! ( (v>>1)%2 ) )<< 13 ;
        aux |=(unsigned long long) ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>32)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>10)%2 ) & ! ( (v>>1)%2 ) )<< 14 ;
        aux |=(unsigned long long) ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) )<< 15 ;
        aux |=(unsigned long long) ( ( ( ( (v>>36)%2 & ( ( ( (v>>16)%2 ) ) ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>23)%2 ) ) & ! ( (v>>54)%2 ) ) | ( ( ( ( (v>>41)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>23)%2 ) ) & ! ( (v>>54)%2 ) )<< 16 ;
        aux |=(unsigned long long) ( ( (v>>42)%2 ) & ! ( (v>>1)%2 ) )<< 17 ;
        aux |=(unsigned long long) ( ( (v>>26)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>52)%2 ) & ! ( (v>>1)%2 ) )<< 18 ;
        aux |=(unsigned long long) ( ( (v>>47)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>4)%2 & ( ( ( (v>>21)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 19 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) & ! ( (v>>2)%2 ) ) & ! ( (v>>1)%2 ) )<< 20 ;
        aux |=(unsigned long long) ( ( ( ( (v>>54)%2 & ( ( ( (v>>22)%2 ) ) ) ) & ! ( (v>>34)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>43)%2 ) ) | ( ( ( ( (v>>23)%2 & ( ( ( (v>>22)%2 ) ) ) ) & ! ( (v>>34)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>43)%2 ) ) | ( ( ( ( (v>>55)%2 & ( ( ( (v>>22)%2 ) ) ) ) & ! ( (v>>34)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>43)%2 ) )<< 21 ;
        aux |=(unsigned long long) ( ( (v>>47)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>32)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) )<< 22 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>47)%2 ) ) | ( ( ( (v>>32)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>47)%2 ) ) | ( ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>47)%2 ) )<< 23 ;
        aux |=(unsigned long long) ( ( ( (v>>23)%2 & ( ( ( (v>>25)%2 ) ) ) ) & ! ( (v>>24)%2 ) ) & ! ( (v>>1)%2 ) )<< 24 ;
        aux |=(unsigned long long) ( ( (v>>23)%2 & ( ( ( (v>>46)%2 | (v>>33)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 25 ;
        aux |=(unsigned long long) ( ( (v>>27)%2 & ( ( ( (v>>23)%2 | (v>>54)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 26 ;
        aux |=(unsigned long long) ( ( (v>>10)%2 & ( ( ( (v>>47)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 27 ;
        aux |=(unsigned long long) ( ( ( ( (v>>21)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>56)%2 ) ) & ! ( (v>>44)%2 ) ) | ( ( ( ( (v>>40)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>56)%2 ) ) & ! ( (v>>44)%2 ) ) | ( ( ( ( (v>>24)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>56)%2 ) ) & ! ( (v>>44)%2 ) ) | ( ( ( ( (v>>26)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>56)%2 ) ) & ! ( (v>>44)%2 ) )<< 28 ;
        aux |=(unsigned long long) ( ( (v>>56)%2 ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>48)%2 ) & ! ( (v>>52)%2 ) ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>26)%2 ) & ! ( (v>>52)%2 ) ) & ! ( (v>>1)%2 ) )<< 29 ;
        aux |=(unsigned long long) ( ( ( (v>>26)%2 & ( ( ( (v>>46)%2 & (v>>37)%2 & (v>>33)%2 ) ) ) ) & ! ( (v>>9)%2 ) ) & ! ( (v>>1)%2 ) )<< 30 ;
        
        estado[tid] |= aux;
    }
}

__global__ void passo_bool_8_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( (v>>41)%2 ) & ! ( (v>>1)%2 ) )<< 31 ;
        aux |=(unsigned long long) ( ( (v>>37)%2 ) & ! ( (v>>1)%2 ) )<< 32 ;
        aux |=(unsigned long long) ( ( (v>>37)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>50)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>11)%2 & ( ( ( (v>>51)%2 & (v>>20)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 33 ;
        aux |=(unsigned long long) ( ( ( (v>>21)%2 ) & ! ( (v>>57)%2 ) ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>34)%2 ) & ! ( (v>>57)%2 ) ) & ! ( (v>>1)%2 ) )<< 34 ;
        aux |=(unsigned long long) ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) )<< 35 ;
        aux |=(unsigned long long) ( ( (v>>58)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>42)%2 ) & ! ( (v>>1)%2 ) )<< 36 ;
        aux |=(unsigned long long) ( ( (v>>36)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>41)%2 ) & ! ( (v>>1)%2 ) )<< 37 ;
        aux |=(unsigned long long) ( ( (v>>36)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>18)%2 ) & ! ( (v>>1)%2 ) )<< 38 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>35)%2 ) )<< 39 ;
        aux |=(unsigned long long) ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) )<< 40 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) & ! ( (v>>16)%2 ) ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>38)%2 ) & ! ( (v>>16)%2 ) ) & ! ( (v>>1)%2 ) )<< 41 ;
        aux |=(unsigned long long) ( ( ( (v>>45)%2 ) & ! ( (v>>7)%2 ) ) & ! ( (v>>1)%2 ) )<< 42 ;
        aux |=(unsigned long long) ( ( (v>>17)%2 ) & ! ( (v>>1)%2 ) )<< 43 ;
        aux |=(unsigned long long) ( ( ( ( (v>>28)%2 ) & ! ( (v>>54)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>23)%2 ) )<< 44 ;
        aux |=(unsigned long long) ( ( (v>>36)%2 ) & ! ( (v>>1)%2 ) )<< 45 ;
        aux |=(unsigned long long) ( ( (v>>28)%2 ) & ! ( (v>>1)%2 ) )<< 46 ;
        aux |=(unsigned long long) ( ( (v>>47)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>28)%2 ) & ! ( (v>>1)%2 ) )<< 47 ;
        aux |=(unsigned long long) ( ( ( (v>>55)%2 ) & ! ( (v>>5)%2 ) ) & ! ( (v>>1)%2 ) )<< 48 ;
        aux |=(unsigned long long) ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) )<< 49 ;
        aux |=(unsigned long long) ( ( (v>>59)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>37)%2 & ( ( ( (v>>49)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 50 ;
        aux |=(unsigned long long) ( ( ( ( (v>>49)%2 ) & ! ( (v>>20)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>0)%2 ) )<< 51 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>12)%2 ) )<< 52 ;
        aux |=(unsigned long long) ( ( (v>>15)%2 & ( ( ( (v>>42)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 53 ;
        aux |=(unsigned long long) ( (v>>54)%2 )<< 54 ;
        aux |=(unsigned long long) ( (v>>55)%2 )<< 55 ;
        aux |=(unsigned long long) ( (v>>56)%2 )<< 56 ;
        aux |=(unsigned long long) ( (v>>57)%2 )<< 57 ;
        aux |=(unsigned long long) ( (v>>58)%2 )<< 58 ;
        aux |=(unsigned long long) ( (v>>59)%2 )<< 59 ;
    
        estado[tid] |= aux;
    }
}



unsigned long long confere_bool_8(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) )<< 0 ;
        aux |=(unsigned long long) ( (v>>6)%2 ) | ( (v>>1)%2 )<< 1 ;
        aux |=(unsigned long long) ( ( ( ( (v>>6)%2 ) & ! ( (v>>30)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>3)%2 ) ) | ( ( ( ( (v>>19)%2 ) & ! ( (v>>30)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>3)%2 ) )<< 2 ;
        aux |=(unsigned long long) ( ( ( ( ( (v>>46)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>2)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>9)%2 ) ) | ( ( ( ( ( (v>>33)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>2)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>9)%2 ) )<< 3 ;
        aux |=(unsigned long long) ( ( (v>>10)%2 & ( ( ( (v>>21)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 4 ;
        aux |=(unsigned long long) ( ( (v>>48)%2 ) & ! ( (v>>1)%2 ) )<< 5 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 & ( ( ( (v>>2)%2 ) ) ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>20)%2 ) ) | ( ( (v>>9)%2 ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>51)%2 & ( ( ( (v>>2)%2 ) ) ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>20)%2 ) )<< 6 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>42)%2 ) )<< 7 ;
        aux |=(unsigned long long) ( ( (v>>12)%2 ) & ! ( (v>>1)%2 ) )<< 8 ;
        aux |=(unsigned long long) ( ( (v>>15)%2 & ( ( ( (v>>7)%2 ) ) | ( ( (v>>13)%2 ) & ( ( ( ! (v>>11)%2 ) ) ) ) | ( ( (v>>13)%2 & (v>>23)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 9 ;
        aux |=(unsigned long long) ( ( (v>>31)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 10 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) & ! ( (v>>9)%2 ) ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>4)%2 & ( ( ( (v>>21)%2 ) ) ) ) & ! ( (v>>9)%2 ) ) & ! ( (v>>1)%2 ) )<< 11 ;
        aux |=(unsigned long long) ( ( (v>>48)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>26)%2 ) & ! ( (v>>1)%2 ) )<< 12 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 & ( ( ( (v>>14)%2 ) ) ) ) & ! ( (v>>53)%2 ) ) & ! ( (v>>1)%2 ) )<< 13 ;
        aux |=(unsigned long long) ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>32)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>10)%2 ) & ! ( (v>>1)%2 ) )<< 14 ;
        aux |=(unsigned long long) ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) )<< 15 ;
        aux |=(unsigned long long) ( ( ( ( (v>>36)%2 & ( ( ( (v>>16)%2 ) ) ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>23)%2 ) ) & ! ( (v>>54)%2 ) ) | ( ( ( ( (v>>41)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>23)%2 ) ) & ! ( (v>>54)%2 ) )<< 16 ;
        aux |=(unsigned long long) ( ( (v>>42)%2 ) & ! ( (v>>1)%2 ) )<< 17 ;
        aux |=(unsigned long long) ( ( (v>>26)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>52)%2 ) & ! ( (v>>1)%2 ) )<< 18 ;
        aux |=(unsigned long long) ( ( (v>>47)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>4)%2 & ( ( ( (v>>21)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 19 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) & ! ( (v>>2)%2 ) ) & ! ( (v>>1)%2 ) )<< 20 ;
        aux |=(unsigned long long) ( ( ( ( (v>>54)%2 & ( ( ( (v>>22)%2 ) ) ) ) & ! ( (v>>34)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>43)%2 ) ) | ( ( ( ( (v>>23)%2 & ( ( ( (v>>22)%2 ) ) ) ) & ! ( (v>>34)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>43)%2 ) ) | ( ( ( ( (v>>55)%2 & ( ( ( (v>>22)%2 ) ) ) ) & ! ( (v>>34)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>43)%2 ) )<< 21 ;
        aux |=(unsigned long long) ( ( (v>>47)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>32)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) )<< 22 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>47)%2 ) ) | ( ( ( (v>>32)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>47)%2 ) ) | ( ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>47)%2 ) )<< 23 ;
        aux |=(unsigned long long) ( ( ( (v>>23)%2 & ( ( ( (v>>25)%2 ) ) ) ) & ! ( (v>>24)%2 ) ) & ! ( (v>>1)%2 ) )<< 24 ;
        aux |=(unsigned long long) ( ( (v>>23)%2 & ( ( ( (v>>46)%2 | (v>>33)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 25 ;
        aux |=(unsigned long long) ( ( (v>>27)%2 & ( ( ( (v>>23)%2 | (v>>54)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 26 ;
        aux |=(unsigned long long) ( ( (v>>10)%2 & ( ( ( (v>>47)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 27 ;
        aux |=(unsigned long long) ( ( ( ( (v>>21)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>56)%2 ) ) & ! ( (v>>44)%2 ) ) | ( ( ( ( (v>>40)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>56)%2 ) ) & ! ( (v>>44)%2 ) ) | ( ( ( ( (v>>24)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>56)%2 ) ) & ! ( (v>>44)%2 ) ) | ( ( ( ( (v>>26)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>56)%2 ) ) & ! ( (v>>44)%2 ) )<< 28 ;
        aux |=(unsigned long long) ( ( (v>>56)%2 ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>48)%2 ) & ! ( (v>>52)%2 ) ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>26)%2 ) & ! ( (v>>52)%2 ) ) & ! ( (v>>1)%2 ) )<< 29 ;
        aux |=(unsigned long long) ( ( ( (v>>26)%2 & ( ( ( (v>>46)%2 & (v>>37)%2 & (v>>33)%2 ) ) ) ) & ! ( (v>>9)%2 ) ) & ! ( (v>>1)%2 ) )<< 30 ;
        aux |=(unsigned long long) ( ( (v>>41)%2 ) & ! ( (v>>1)%2 ) )<< 31 ;
        aux |=(unsigned long long) ( ( (v>>37)%2 ) & ! ( (v>>1)%2 ) )<< 32 ;
        aux |=(unsigned long long) ( ( (v>>37)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>50)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>11)%2 & ( ( ( (v>>51)%2 & (v>>20)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 33 ;
        aux |=(unsigned long long) ( ( ( (v>>21)%2 ) & ! ( (v>>57)%2 ) ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>34)%2 ) & ! ( (v>>57)%2 ) ) & ! ( (v>>1)%2 ) )<< 34 ;
        aux |=(unsigned long long) ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) )<< 35 ;
        aux |=(unsigned long long) ( ( (v>>58)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>42)%2 ) & ! ( (v>>1)%2 ) )<< 36 ;
        aux |=(unsigned long long) ( ( (v>>36)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>41)%2 ) & ! ( (v>>1)%2 ) )<< 37 ;
        aux |=(unsigned long long) ( ( (v>>36)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>18)%2 ) & ! ( (v>>1)%2 ) )<< 38 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>35)%2 ) )<< 39 ;
        aux |=(unsigned long long) ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) )<< 40 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) & ! ( (v>>16)%2 ) ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>38)%2 ) & ! ( (v>>16)%2 ) ) & ! ( (v>>1)%2 ) )<< 41 ;
        aux |=(unsigned long long) ( ( ( (v>>45)%2 ) & ! ( (v>>7)%2 ) ) & ! ( (v>>1)%2 ) )<< 42 ;
        aux |=(unsigned long long) ( ( (v>>17)%2 ) & ! ( (v>>1)%2 ) )<< 43 ;
        aux |=(unsigned long long) ( ( ( ( (v>>28)%2 ) & ! ( (v>>54)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>23)%2 ) )<< 44 ;
        aux |=(unsigned long long) ( ( (v>>36)%2 ) & ! ( (v>>1)%2 ) )<< 45 ;
        aux |=(unsigned long long) ( ( (v>>28)%2 ) & ! ( (v>>1)%2 ) )<< 46 ;
        aux |=(unsigned long long) ( ( (v>>47)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>28)%2 ) & ! ( (v>>1)%2 ) )<< 47 ;
        aux |=(unsigned long long) ( ( ( (v>>55)%2 ) & ! ( (v>>5)%2 ) ) & ! ( (v>>1)%2 ) )<< 48 ;
        aux |=(unsigned long long) ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) )<< 49 ;
        aux |=(unsigned long long) ( ( (v>>59)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>37)%2 & ( ( ( (v>>49)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 50 ;
        aux |=(unsigned long long) ( ( ( ( (v>>49)%2 ) & ! ( (v>>20)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>0)%2 ) )<< 51 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>12)%2 ) )<< 52 ;
        aux |=(unsigned long long) ( ( (v>>15)%2 & ( ( ( (v>>42)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 53 ;
        aux |=(unsigned long long) ( (v>>54)%2 )<< 54 ;
        aux |=(unsigned long long) ( (v>>55)%2 )<< 55 ;
        aux |=(unsigned long long) ( (v>>56)%2 )<< 56 ;
        aux |=(unsigned long long) ( (v>>57)%2 )<< 57 ;
        aux |=(unsigned long long) ( (v>>58)%2 )<< 58 ;
        aux |=(unsigned long long) ( (v>>59)%2 )<< 59 ;

        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_8_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>6)%2 ) * 2 + ( (v>>1)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>6)%2 ) * 2 + ( (v>>30)%2 ) * -6 + ( (v>>1)%2 ) * -6 + ( (v>>3)%2 ) * -6 + ( (v>>19)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + ( (v>>19)%2 ) * -6 + ( (v>>2)%2 ) * -6 + ( (v>>1)%2 ) * -6 + ( (v>>9)%2 ) * -6 + ( (v>>33)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 2 + ( (v>>21)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 4 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>48)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 ) * 2 + ( (v>>2)%2 ) * 6 + ( (v>>1)%2 ) * -38 + ( (v>>20)%2 ) * -6 + ( (v>>9)%2 ) * 26 + ( (v>>51)%2 ) * 2) >= 8 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2 + ( (v>>1)%2 ) * -2 + ( (v>>42)%2 ) * -2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( ( (v>>12)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 22 + ( (v>>7)%2 ) * 10 + ( (v>>13)%2 ) * 6 + ( (v>>11)%2 ) * -2 + ( (v>>23)%2 ) * 2 + ( (v>>1)%2 ) * -22) >= 28 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>31)%2 ) * 2 + ( (v>>37)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 4 ) << 10 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 6 + ( (v>>9)%2 ) * -10 + ( (v>>1)%2 ) * -10 + ( (v>>4)%2 ) * 2 + ( (v>>21)%2 ) * 2) >= 4 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>48)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>26)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 2 + ( (v>>14)%2 ) * 2 + ( (v>>53)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 4 ) << 13 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + ( (v>>1)%2 ) * -30 + ( (v>>32)%2 ) * 2 + ( (v>>33)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 14 ;
        
        estado[tid] |= aux;
    }
}

__global__ void passo_tlf_8_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2 + ( (v>>16)%2 ) * 2 + ( (v>>1)%2 ) * -10 + ( (v>>23)%2 ) * -10 + 0 * -10 + ( (v>>41)%2 ) * 6) >= 4 ) << 16 ;
        aux |=(unsigned long long) ( ( ( (v>>42)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>26)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>52)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 6 + ( (v>>1)%2 ) * -10 + ( (v>>4)%2 ) * 2 + ( (v>>21)%2 ) * 2) >= 4 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 2 + ( (v>>2)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 2 ) << 20 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>22)%2 ) * 14 + ( (v>>34)%2 ) * -14 + ( (v>>1)%2 ) * -14 + ( (v>>43)%2 ) * -14 + ( (v>>23)%2 ) * 2 + ( (v>>55)%2 ) * 2) >= 16 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2 + ( (v>>1)%2 ) * -14 + ( (v>>32)%2 ) * 2 + ( (v>>46)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + ( (v>>1)%2 ) * -14 + ( (v>>47)%2 ) * -14 + ( (v>>32)%2 ) * 2 + ( (v>>33)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>23)%2 ) * 2 + ( (v>>25)%2 ) * 2 + ( (v>>24)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 4 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>23)%2 ) * 6 + ( (v>>46)%2 ) * 2 + ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -6) >= 8 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>27)%2 ) * 6 + ( (v>>23)%2 ) * 2 + 0 * 2 + ( (v>>1)%2 ) * -6) >= 8 ) << 26 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 2 + ( (v>>47)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 4 ) << 27 ;
        aux |=(unsigned long long) ( ( ( (v>>21)%2 ) * 2 + ( (v>>1)%2 ) * -30 + 0 * -30 + ( (v>>44)%2 ) * -30 + ( (v>>40)%2 ) * 2 + ( (v>>24)%2 ) * 2 + ( (v>>26)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(unsigned long long) ( ( 0 * 10 + ( (v>>1)%2 ) * -22 + ( (v>>48)%2 ) * 2 + ( (v>>52)%2 ) * -6 + ( (v>>26)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(unsigned long long) ( ( ( (v>>26)%2 ) * 2 + ( (v>>46)%2 ) * 2 + ( (v>>37)%2 ) * 2 + ( (v>>33)%2 ) * 2 + ( (v>>9)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 8 ) << 30 ;
        
        estado[tid] |= aux;
    }
}


__global__ void passo_tlf_8_parte3(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>41)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>37)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>37)%2 ) * 14 + ( (v>>1)%2 ) * -50 + ( (v>>50)%2 ) * 14 + ( (v>>11)%2 ) * 2 + ( (v>>51)%2 ) * 2 + ( (v>>20)%2 ) * 2) >= 6 ) << 33 ;
        aux |=(unsigned long long) ( ( ( (v>>21)%2 ) * 2 + 0 * -6 + ( (v>>1)%2 ) * -6 + ( (v>>34)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 35 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>1)%2 ) * -6 + ( (v>>42)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>41)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>18)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + ( (v>>1)%2 ) * -2 + ( (v>>35)%2 ) * -2) >= 2 ) << 39 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 40 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2 + ( (v>>16)%2 ) * -6 + ( (v>>1)%2 ) * -6 + ( (v>>38)%2 ) * 2) >= 2 ) << 41 ;
        aux |=(unsigned long long) ( ( ( (v>>45)%2 ) * 2 + ( (v>>7)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 2 ) << 42 ;
        aux |=(unsigned long long) ( ( ( (v>>17)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 43 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2 + 0 * -2 + ( (v>>1)%2 ) * -2 + ( (v>>23)%2 ) * -2) >= 2 ) << 44 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 45 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 46 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>28)%2 ) * 2) >= 2 ) << 47 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>5)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 2 ) << 48 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 49 ;
        aux |=(unsigned long long) ( ( 0 * 6 + ( (v>>1)%2 ) * -10 + ( (v>>37)%2 ) * 2 + ( (v>>49)%2 ) * 2) >= 4 ) << 50 ;
        aux |=(unsigned long long) ( ( ( (v>>49)%2 ) * 2 + ( (v>>20)%2 ) * -2 + ( (v>>1)%2 ) * -2 + ( (v>>0)%2 ) * -2) >= 2 ) << 51 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2 + ( (v>>1)%2 ) * -2 + ( (v>>12)%2 ) * -2) >= 2 ) << 52 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 2 + ( (v>>42)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 4 ) << 53 ;
        aux |=(unsigned long long) ( (v>>54)%2 )<< 54 ;
        aux |=(unsigned long long) ( (v>>55)%2 )<< 55 ;
        aux |=(unsigned long long) ( (v>>56)%2 )<< 56 ;
        aux |=(unsigned long long) ( (v>>57)%2 )<< 57 ;
        aux |=(unsigned long long) ( (v>>58)%2 )<< 58 ;
        aux |=(unsigned long long) ( (v>>59)%2 )<< 59 ;
        
        estado[tid] |= aux;
    }
}

unsigned long long confere_tlf_8(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>6)%2 ) * 2 + ( (v>>1)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>6)%2 ) * 2 + ( (v>>30)%2 ) * -6 + ( (v>>1)%2 ) * -6 + ( (v>>3)%2 ) * -6 + ( (v>>19)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + ( (v>>19)%2 ) * -6 + ( (v>>2)%2 ) * -6 + ( (v>>1)%2 ) * -6 + ( (v>>9)%2 ) * -6 + ( (v>>33)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 2 + ( (v>>21)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 4 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>48)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>19)%2 ) * 2 + ( (v>>2)%2 ) * 6 + ( (v>>1)%2 ) * -38 + ( (v>>20)%2 ) * -6 + ( (v>>9)%2 ) * 26 + ( (v>>51)%2 ) * 2) >= 8 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2 + ( (v>>1)%2 ) * -2 + ( (v>>42)%2 ) * -2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( ( (v>>12)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 22 + ( (v>>7)%2 ) * 10 + ( (v>>13)%2 ) * 6 + ( (v>>11)%2 ) * -2 + ( (v>>23)%2 ) * 2 + ( (v>>1)%2 ) * -22) >= 28 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>31)%2 ) * 2 + ( (v>>37)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 4 ) << 10 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 6 + ( (v>>9)%2 ) * -10 + ( (v>>1)%2 ) * -10 + ( (v>>4)%2 ) * 2 + ( (v>>21)%2 ) * 2) >= 4 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>48)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>26)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 2 + ( (v>>14)%2 ) * 2 + ( (v>>53)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 4 ) << 13 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + ( (v>>1)%2 ) * -30 + ( (v>>32)%2 ) * 2 + ( (v>>33)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 14 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2 + ( (v>>16)%2 ) * 2 + ( (v>>1)%2 ) * -10 + ( (v>>23)%2 ) * -10 + 0 * -10 + ( (v>>41)%2 ) * 6) >= 4 ) << 16 ;
        aux |=(unsigned long long) ( ( ( (v>>42)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>26)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>52)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 6 + ( (v>>1)%2 ) * -10 + ( (v>>4)%2 ) * 2 + ( (v>>21)%2 ) * 2) >= 4 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 2 + ( (v>>2)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 2 ) << 20 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>22)%2 ) * 14 + ( (v>>34)%2 ) * -14 + ( (v>>1)%2 ) * -14 + ( (v>>43)%2 ) * -14 + ( (v>>23)%2 ) * 2 + ( (v>>55)%2 ) * 2) >= 16 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2 + ( (v>>1)%2 ) * -14 + ( (v>>32)%2 ) * 2 + ( (v>>46)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + ( (v>>1)%2 ) * -14 + ( (v>>47)%2 ) * -14 + ( (v>>32)%2 ) * 2 + ( (v>>33)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>23)%2 ) * 2 + ( (v>>25)%2 ) * 2 + ( (v>>24)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 4 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>23)%2 ) * 6 + ( (v>>46)%2 ) * 2 + ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -6) >= 8 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>27)%2 ) * 6 + ( (v>>23)%2 ) * 2 + 0 * 2 + ( (v>>1)%2 ) * -6) >= 8 ) << 26 ;
        aux |=(unsigned long long) ( ( ( (v>>10)%2 ) * 2 + ( (v>>47)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 4 ) << 27 ;
        aux |=(unsigned long long) ( ( ( (v>>21)%2 ) * 2 + ( (v>>1)%2 ) * -30 + 0 * -30 + ( (v>>44)%2 ) * -30 + ( (v>>40)%2 ) * 2 + ( (v>>24)%2 ) * 2 + ( (v>>26)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(unsigned long long) ( ( 0 * 10 + ( (v>>1)%2 ) * -22 + ( (v>>48)%2 ) * 2 + ( (v>>52)%2 ) * -6 + ( (v>>26)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(unsigned long long) ( ( ( (v>>26)%2 ) * 2 + ( (v>>46)%2 ) * 2 + ( (v>>37)%2 ) * 2 + ( (v>>33)%2 ) * 2 + ( (v>>9)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 8 ) << 30 ;
        aux |=(unsigned long long) ( ( ( (v>>41)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>37)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>37)%2 ) * 14 + ( (v>>1)%2 ) * -50 + ( (v>>50)%2 ) * 14 + ( (v>>11)%2 ) * 2 + ( (v>>51)%2 ) * 2 + ( (v>>20)%2 ) * 2) >= 6 ) << 33 ;
        aux |=(unsigned long long) ( ( ( (v>>21)%2 ) * 2 + 0 * -6 + ( (v>>1)%2 ) * -6 + ( (v>>34)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 35 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>1)%2 ) * -6 + ( (v>>42)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>41)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>18)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2 + ( (v>>1)%2 ) * -2 + ( (v>>35)%2 ) * -2) >= 2 ) << 39 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 40 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2 + ( (v>>16)%2 ) * -6 + ( (v>>1)%2 ) * -6 + ( (v>>38)%2 ) * 2) >= 2 ) << 41 ;
        aux |=(unsigned long long) ( ( ( (v>>45)%2 ) * 2 + ( (v>>7)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 2 ) << 42 ;
        aux |=(unsigned long long) ( ( ( (v>>17)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 43 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2 + 0 * -2 + ( (v>>1)%2 ) * -2 + ( (v>>23)%2 ) * -2) >= 2 ) << 44 ;
        aux |=(unsigned long long) ( ( ( (v>>36)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 45 ;
        aux |=(unsigned long long) ( ( ( (v>>28)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 46 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>28)%2 ) * 2) >= 2 ) << 47 ;
        aux |=(unsigned long long) ( ( 0 * 2 + ( (v>>5)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 2 ) << 48 ;
        aux |=(unsigned long long) ( ( ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 49 ;
        aux |=(unsigned long long) ( ( 0 * 6 + ( (v>>1)%2 ) * -10 + ( (v>>37)%2 ) * 2 + ( (v>>49)%2 ) * 2) >= 4 ) << 50 ;
        aux |=(unsigned long long) ( ( ( (v>>49)%2 ) * 2 + ( (v>>20)%2 ) * -2 + ( (v>>1)%2 ) * -2 + ( (v>>0)%2 ) * -2) >= 2 ) << 51 ;
        aux |=(unsigned long long) ( ( ( (v>>29)%2 ) * 2 + ( (v>>1)%2 ) * -2 + ( (v>>12)%2 ) * -2) >= 2 ) << 52 ;
        aux |=(unsigned long long) ( ( ( (v>>15)%2 ) * 2 + ( (v>>42)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 4 ) << 53 ;
        aux |=(unsigned long long) ( (v>>54)%2 )<< 54 ;
        aux |=(unsigned long long) ( (v>>55)%2 )<< 55 ;
        aux |=(unsigned long long) ( (v>>56)%2 )<< 56 ;
        aux |=(unsigned long long) ( (v>>57)%2 )<< 57 ;
        aux |=(unsigned long long) ( (v>>58)%2 )<< 58 ;
        aux |=(unsigned long long) ( (v>>59)%2 )<< 59 ;

        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}


//REDE 9
__global__ void passo_bool_9_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( (v>>44)%2 )<< 0 ;
        aux |=(unsigned long long) ( (v>>18)%2 ) | ( (v>>23)%2 ) | ( (v>>16)%2 ) | ( (v>>24)%2 )<< 1 ;
        aux |=(unsigned long long) ( (v>>7)%2 ) | ( (v>>14)%2 )<< 2 ;
        aux |=(unsigned long long) ( (v>>42)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 3 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>0)%2 )<< 4 ;
        aux |=(unsigned long long) ( (v>>17)%2 )<< 5 ;
        aux |=(unsigned long long) ( (v>>43)%2 ) | ( (v>>7)%2 ) | ( (v>>12)%2 )<< 6 ;
        aux |=(unsigned long long) ( (v>>0)%2 ) | ( (v>>35)%2 ) | ( (v>>52)%2 )<< 7 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 8 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 9 ;
        aux |=(unsigned long long) ( (v>>13)%2 )<< 10 ;
        aux |=(unsigned long long) ( (v>>39)%2 )<< 11 ;
        aux |=(unsigned long long) ( (v>>30)%2 )<< 12 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>12)%2 )<< 13 ;
        aux |=(unsigned long long) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 14 ;
        aux |=(unsigned long long) ( (v>>21)%2 ) | ( (v>>50)%2 )<< 15 ;
    
        estado[tid] |= aux;
    }
}

__global__ void passo_bool_9_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>0)%2 ) | ( (v>>12)%2 )<< 16 ;
        aux |=(unsigned long long) ( (v>>57)%2 )<< 17 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>0)%2 ) | ( (v>>12)%2 )<< 18 ;
        aux |=(unsigned long long) ( (v>>40)%2 )<< 19 ;
        aux |=(unsigned long long) ( (v>>53)%2 )<< 20 ;
        aux |=(unsigned long long) ( (v>>11)%2 )<< 21 ;
        aux |=(unsigned long long) ( (v>>34)%2 ) | ( (v>>32)%2 )<< 22 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>0)%2 ) | ( (v>>12)%2 )<< 23 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>12)%2 )<< 24 ;
        aux |=(unsigned long long) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 25 ;
        aux |=(unsigned long long) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 26 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>0)%2 ) | ( (v>>12)%2 )<< 27 ;
        aux |=(unsigned long long) ( (v>>0)%2 ) | ( (v>>12)%2 ) | ( (v>>43)%2 )<< 28 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>43)%2 )<< 29 ;
        aux |=(unsigned long long) ( (v>>31)%2 ) | ( (v>>49)%2 )<< 30 ;
    
        estado[tid] |= aux;
    }
}

__global__ void passo_bool_9_parte3(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( (v>>48)%2 )<< 31 ;
        aux |=(unsigned long long) ( (v>>48)%2 )<< 32 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 33 ;
        aux |=(unsigned long long) ( (v>>31)%2 )<< 34 ;
        aux |=(unsigned long long) ( (v>>42)%2 ) | ( (v>>12)%2 )<< 35 ;
        aux |=(unsigned long long) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 36 ;
        aux |=(unsigned long long) ( (v>>3)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 37 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 38 ;
        aux |=(unsigned long long) ( (v>>47)%2 )<< 39 ;
        aux |=(unsigned long long) ( (v>>41)%2 )<< 40 ;
        aux |=(unsigned long long) ( (v>>1)%2 )<< 41 ;
        aux |=(unsigned long long) ( (v>>38)%2 ) | ( (v>>33)%2 )<< 42 ;
        aux |=(unsigned long long) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 43 ;
        aux |=(unsigned long long) ( (v>>57)%2 )<< 44 ;
        aux |=(unsigned long long) ( (v>>8)%2 ) | ( (v>>9)%2 )<< 45 ;
        aux |=(unsigned long long) ( (v>>57)%2 ) | ( (v>>19)%2 )<< 46 ;
        aux |=(unsigned long long) ( (v>>59)%2 )<< 47 ;
        aux |=(unsigned long long) ( (v>>51)%2 )<< 48 ;
        aux |=(unsigned long long) ( (v>>45)%2 ) | ( (v>>51)%2 )<< 49 ;
        aux |=(unsigned long long) ( (v>>5)%2 )<< 50 ;
        aux |=(unsigned long long) ( (v>>54)%2 )<< 51 ;
        aux |=(unsigned long long) ( (v>>12)%2 )<< 52 ;
        aux |=(unsigned long long) ( (v>>57)%2 ) | ( (v>>15)%2 )<< 53 ;
        aux |=(unsigned long long) ( (v>>20)%2 )<< 54 ;
        aux |=(unsigned long long) ( (v>>52)%2 )<< 55 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>12)%2 )<< 56 ;
        aux |=(unsigned long long) ( (v>>61)%2 )<< 57 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>12)%2 )<< 58 ;
        aux |=(unsigned long long) ( (v>>60)%2 )<< 59 ;
        aux |=(unsigned long long) ( (v>>1)%2 )<< 60 ;
        aux |=(unsigned long long) ( (v>>61)%2 )<< 61 ;
    
        estado[tid] |= aux;
    }
}


unsigned long long confere_bool_9(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0ULL;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( (v>>44)%2 )<< 0 ;
        aux |=(unsigned long long) ( (v>>18)%2 ) | ( (v>>23)%2 ) | ( (v>>16)%2 ) | ( (v>>24)%2 )<< 1 ;
        aux |=(unsigned long long) ( (v>>7)%2 ) | ( (v>>14)%2 )<< 2 ;
        aux |=(unsigned long long) ( (v>>42)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 3 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>0)%2 )<< 4 ;
        aux |=(unsigned long long) ( (v>>17)%2 )<< 5 ;
        aux |=(unsigned long long) ( (v>>43)%2 ) | ( (v>>7)%2 ) | ( (v>>12)%2 )<< 6 ;
        aux |=(unsigned long long) ( (v>>0)%2 ) | ( (v>>35)%2 ) | ( (v>>52)%2 )<< 7 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 8 ;
        aux |=(unsigned long long) ( (v>>46)%2 )<< 9 ;
        aux |=(unsigned long long) ( (v>>13)%2 )<< 10 ;
        aux |=(unsigned long long) ( (v>>39)%2 )<< 11 ;
        aux |=(unsigned long long) ( (v>>30)%2 )<< 12 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>12)%2 )<< 13 ;
        aux |=(unsigned long long) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 14 ;
        aux |=(unsigned long long) ( (v>>21)%2 ) | ( (v>>50)%2 )<< 15 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>0)%2 ) | ( (v>>12)%2 )<< 16 ;
        aux |=(unsigned long long) ( (v>>57)%2 )<< 17 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>0)%2 ) | ( (v>>12)%2 )<< 18 ;
        aux |=(unsigned long long) ( (v>>40)%2 )<< 19 ;
        aux |=(unsigned long long) ( (v>>53)%2 )<< 20 ;
        aux |=(unsigned long long) ( (v>>11)%2 )<< 21 ;
        aux |=(unsigned long long) ( (v>>34)%2 ) | ( (v>>32)%2 )<< 22 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>0)%2 ) | ( (v>>12)%2 )<< 23 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>12)%2 )<< 24 ;
        aux |=(unsigned long long) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 25 ;
        aux |=(unsigned long long) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 26 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>0)%2 ) | ( (v>>12)%2 )<< 27 ;
        aux |=(unsigned long long) ( (v>>0)%2 ) | ( (v>>12)%2 ) | ( (v>>43)%2 )<< 28 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>43)%2 )<< 29 ;
        aux |=(unsigned long long) ( (v>>31)%2 ) | ( (v>>49)%2 )<< 30 ;
        aux |=(unsigned long long) ( (v>>48)%2 )<< 31 ;
        aux |=(unsigned long long) ( (v>>48)%2 )<< 32 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 33 ;
        aux |=(unsigned long long) ( (v>>31)%2 )<< 34 ;
        aux |=(unsigned long long) ( (v>>42)%2 ) | ( (v>>12)%2 )<< 35 ;
        aux |=(unsigned long long) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 36 ;
        aux |=(unsigned long long) ( (v>>3)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 37 ;
        aux |=(unsigned long long) ( (v>>32)%2 )<< 38 ;
        aux |=(unsigned long long) ( (v>>47)%2 )<< 39 ;
        aux |=(unsigned long long) ( (v>>41)%2 )<< 40 ;
        aux |=(unsigned long long) ( (v>>1)%2 )<< 41 ;
        aux |=(unsigned long long) ( (v>>38)%2 ) | ( (v>>33)%2 )<< 42 ;
        aux |=(unsigned long long) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 43 ;
        aux |=(unsigned long long) ( (v>>57)%2 )<< 44 ;
        aux |=(unsigned long long) ( (v>>8)%2 ) | ( (v>>9)%2 )<< 45 ;
        aux |=(unsigned long long) ( (v>>57)%2 ) | ( (v>>19)%2 )<< 46 ;
        aux |=(unsigned long long) ( (v>>59)%2 )<< 47 ;
        aux |=(unsigned long long) ( (v>>51)%2 )<< 48 ;
        aux |=(unsigned long long) ( (v>>45)%2 ) | ( (v>>51)%2 )<< 49 ;
        aux |=(unsigned long long) ( (v>>5)%2 )<< 50 ;
        aux |=(unsigned long long) ( (v>>54)%2 )<< 51 ;
        aux |=(unsigned long long) ( (v>>12)%2 )<< 52 ;
        aux |=(unsigned long long) ( (v>>57)%2 ) | ( (v>>15)%2 )<< 53 ;
        aux |=(unsigned long long) ( (v>>20)%2 )<< 54 ;
        aux |=(unsigned long long) ( (v>>52)%2 )<< 55 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>12)%2 )<< 56 ;
        aux |=(unsigned long long) ( (v>>61)%2 )<< 57 ;
        aux |=(unsigned long long) ( (v>>22)%2 ) | ( (v>>12)%2 )<< 58 ;
        aux |=(unsigned long long) ( (v>>60)%2 )<< 59 ;
        aux |=(unsigned long long) ( (v>>1)%2 )<< 60 ;
        aux |=(unsigned long long) ( (v>>61)%2 )<< 61 ;

        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_9_parte1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>44)%2 ) * 2) >= 2 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2 + ( (v>>23)%2 ) * 2 + ( (v>>16)%2 ) * 2 + ( (v>>24)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2 + ( (v>>14)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>42)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2) >= 2 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>17)%2 ) * 2) >= 2 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2 + ( (v>>7)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>35)%2 ) * 2 + ( (v>>52)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 2) >= 2 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>30)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 13 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 14 ;
        
        estado[tid] |= aux;
    }
}

__global__ void passo_tlf_9_parte2(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>21)%2 ) * 2 + ( (v>>50)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(unsigned long long) ( ( ( (v>>57)%2 ) * 2) >= 2 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>40)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>53)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(unsigned long long) ( ( ( (v>>11)%2 ) * 2) >= 2 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>34)%2 ) * 2 + ( (v>>32)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 27 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2 + ( (v>>43)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>43)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(unsigned long long) ( ( ( (v>>31)%2 ) * 2 + ( (v>>49)%2 ) * 2) >= 2 ) << 30 ;
        
        estado[tid] |= aux;
    }
}

__global__ void passo_tlf_9_parte3(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        aux |=(unsigned long long) ( ( ( (v>>48)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>48)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(unsigned long long) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(unsigned long long) ( ( ( (v>>42)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(unsigned long long) ( ( ( (v>>3)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2) >= 2 ) << 39 ;
        aux |=(unsigned long long) ( ( ( (v>>41)%2 ) * 2) >= 2 ) << 40 ;
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2) >= 2 ) << 41 ;
        aux |=(unsigned long long) ( ( ( (v>>38)%2 ) * 2 + ( (v>>33)%2 ) * 2) >= 2 ) << 42 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 43 ;
        aux |=(unsigned long long) ( ( ( (v>>57)%2 ) * 2) >= 2 ) << 44 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2 + ( (v>>9)%2 ) * 2) >= 2 ) << 45 ;
        aux |=(unsigned long long) ( ( ( (v>>57)%2 ) * 2 + ( (v>>19)%2 ) * 2) >= 2 ) << 46 ;
        aux |=(unsigned long long) ( ( ( (v>>59)%2 ) * 2) >= 2 ) << 47 ;
        aux |=(unsigned long long) ( ( ( (v>>51)%2 ) * 2) >= 2 ) << 48 ;
        aux |=(unsigned long long) ( ( ( (v>>45)%2 ) * 2 + ( (v>>51)%2 ) * 2) >= 2 ) << 49 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * 2) >= 2 ) << 50 ;
        aux |=(unsigned long long) ( ( ( (v>>54)%2 ) * 2) >= 2 ) << 51 ;
        aux |=(unsigned long long) ( ( ( (v>>12)%2 ) * 2) >= 2 ) << 52 ;
        aux |=(unsigned long long) ( ( ( (v>>57)%2 ) * 2 + ( (v>>15)%2 ) * 2) >= 2 ) << 53 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * 2) >= 2 ) << 54 ;
        aux |=(unsigned long long) ( ( ( (v>>52)%2 ) * 2) >= 2 ) << 55 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 56 ;
        aux |=(unsigned long long) ( ( ( (v>>61)%2 ) * 2) >= 2 ) << 57 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 58 ;
        aux |=(unsigned long long) ( ( ( (v>>60)%2 ) * 2) >= 2 ) << 59 ;
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2) >= 2 ) << 60 ;
        aux |=(unsigned long long) ( (v>>61)%2 )<< 61 ;
        
        estado[tid] |= aux;
    }
}


unsigned long long confere_tlf_9(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        aux |=(unsigned long long) ( ( ( (v>>44)%2 ) * 2) >= 2 ) << 0 ;
        aux |=(unsigned long long) ( ( ( (v>>18)%2 ) * 2 + ( (v>>23)%2 ) * 2 + ( (v>>16)%2 ) * 2 + ( (v>>24)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(unsigned long long) ( ( ( (v>>7)%2 ) * 2 + ( (v>>14)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(unsigned long long) ( ( ( (v>>42)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2) >= 2 ) << 4 ;
        aux |=(unsigned long long) ( ( ( (v>>17)%2 ) * 2) >= 2 ) << 5 ;
        aux |=(unsigned long long) ( ( ( (v>>43)%2 ) * 2 + ( (v>>7)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 6 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>35)%2 ) * 2 + ( (v>>52)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(unsigned long long) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(unsigned long long) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(unsigned long long) ( ( ( (v>>39)%2 ) * 2) >= 2 ) << 11 ;
        aux |=(unsigned long long) ( ( ( (v>>30)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 13 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 14 ;
        aux |=(unsigned long long) ( ( ( (v>>21)%2 ) * 2 + ( (v>>50)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(unsigned long long) ( ( ( (v>>57)%2 ) * 2) >= 2 ) << 17 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(unsigned long long) ( ( ( (v>>40)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(unsigned long long) ( ( ( (v>>53)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(unsigned long long) ( ( ( (v>>11)%2 ) * 2) >= 2 ) << 21 ;
        aux |=(unsigned long long) ( ( ( (v>>34)%2 ) * 2 + ( (v>>32)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 24 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 27 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2 + ( (v>>43)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>43)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(unsigned long long) ( ( ( (v>>31)%2 ) * 2 + ( (v>>49)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(unsigned long long) ( ( ( (v>>48)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(unsigned long long) ( ( ( (v>>48)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(unsigned long long) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(unsigned long long) ( ( ( (v>>42)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(unsigned long long) ( ( ( (v>>3)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(unsigned long long) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(unsigned long long) ( ( ( (v>>47)%2 ) * 2) >= 2 ) << 39 ;
        aux |=(unsigned long long) ( ( ( (v>>41)%2 ) * 2) >= 2 ) << 40 ;
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2) >= 2 ) << 41 ;
        aux |=(unsigned long long) ( ( ( (v>>38)%2 ) * 2 + ( (v>>33)%2 ) * 2) >= 2 ) << 42 ;
        aux |=(unsigned long long) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 43 ;
        aux |=(unsigned long long) ( ( ( (v>>57)%2 ) * 2) >= 2 ) << 44 ;
        aux |=(unsigned long long) ( ( ( (v>>8)%2 ) * 2 + ( (v>>9)%2 ) * 2) >= 2 ) << 45 ;
        aux |=(unsigned long long) ( ( ( (v>>57)%2 ) * 2 + ( (v>>19)%2 ) * 2) >= 2 ) << 46 ;
        aux |=(unsigned long long) ( ( ( (v>>59)%2 ) * 2) >= 2 ) << 47 ;
        aux |=(unsigned long long) ( ( ( (v>>51)%2 ) * 2) >= 2 ) << 48 ;
        aux |=(unsigned long long) ( ( ( (v>>45)%2 ) * 2 + ( (v>>51)%2 ) * 2) >= 2 ) << 49 ;
        aux |=(unsigned long long) ( ( ( (v>>5)%2 ) * 2) >= 2 ) << 50 ;
        aux |=(unsigned long long) ( ( ( (v>>54)%2 ) * 2) >= 2 ) << 51 ;
        aux |=(unsigned long long) ( ( ( (v>>12)%2 ) * 2) >= 2 ) << 52 ;
        aux |=(unsigned long long) ( ( ( (v>>57)%2 ) * 2 + ( (v>>15)%2 ) * 2) >= 2 ) << 53 ;
        aux |=(unsigned long long) ( ( ( (v>>20)%2 ) * 2) >= 2 ) << 54 ;
        aux |=(unsigned long long) ( ( ( (v>>52)%2 ) * 2) >= 2 ) << 55 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 56 ;
        aux |=(unsigned long long) ( ( ( (v>>61)%2 ) * 2) >= 2 ) << 57 ;
        aux |=(unsigned long long) ( ( ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 58 ;
        aux |=(unsigned long long) ( ( ( (v>>60)%2 ) * 2) >= 2 ) << 59 ;
        aux |=(unsigned long long) ( ( ( (v>>1)%2 ) * 2) >= 2 ) << 60 ;
        aux |=(unsigned long long) ( (v>>61)%2 )<< 61 ;

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
        for(int j = 0; j < nEq && j < 32; j++)
            init_rand[i] |= ((rand1>>j)%2)<<j;
        for(int j = 32; j < nEq && j < 64 ; j++)
            init_rand[i] |= ((rand2>>(j-32))%2)<<j;
    }
}

int main(int argc, char **argv)
{
    unsigned long long MAX_ESTADO = 0;
    unsigned int n=0;
    string argv2 ;
    if (argc >= 3) {
        n = atoi(argv[1]);
        argv2 = argv[2];
    } else {
        printf("\nERROR: Number of parameters insufficient\n");
        printf("Example: ./a.out 1 1000\n\n");
        return 1;
    }
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
    
    unsigned int nEq = 64;
    srand(MAX_ESTADO);
    preenche_init_rand(h_init_rand,MAX_ESTADO,nEq);

    for(unsigned long long i = 0; i < MAX_ESTADO; i++)
        h_estado[i] = 0;

    cudaMemcpy(d_init_rand, h_init_rand, sizeof(unsigned long long)*MAX_ESTADO, cudaMemcpyHostToDevice);
    cudaMemcpy(d_estado, h_estado, sizeof(unsigned long long)*MAX_ESTADO, cudaMemcpyHostToDevice);

    switch (n) {
        case 0: passo_bool_1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); 
                break;
        case 1: passo_tlf_1_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize(); 
                passo_tlf_1_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                
                break;
        case 2: passo_bool_2_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_2_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); 
                break;
        case 3: passo_tlf_2_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_2_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); 
                break;
        case 4: passo_bool_3_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_3_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 5: passo_tlf_3_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_3_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        //case 7: passo_bool_4<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); break;
        //case 8: passo_tlf_4<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); break;
        case 6: passo_bool_5_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_5_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 7: passo_tlf_5_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_5_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 8: passo_bool_6_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_6_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_6_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 9: passo_tlf_6_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_6_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); 
                cudaDeviceSynchronize();
                passo_tlf_6_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 10: passo_bool_7_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_7_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); 
                break;
        case 11: passo_tlf_7_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_7_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); 
                break;
        case 12: passo_bool_8_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_8_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 13: passo_tlf_8_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_8_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_8_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 14:passo_bool_9_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_9_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_9_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); 
                break;
        case 15: passo_tlf_9_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_9_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_9_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        default: 
                break;
    }
    cudaDeviceSynchronize();
    
    cudaMemcpy(h_estado, d_estado, sizeof(unsigned long long)*MAX_ESTADO, cudaMemcpyDeviceToHost);


    unsigned long long i = 0;
    switch (n) {
        case 0:i= confere_bool_1(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 1:i= confere_tlf_1(h_init_rand,h_estado,MAX_ESTADO);
                break;
        case 2: i= confere_bool_2(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 3: i= confere_tlf_2(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 4: i= confere_bool_3(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 5: i= confere_tlf_3(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        //case 7: passo_bool_4<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); 
                break;
        //case 8: passo_tlf_4<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); 
                break;
        case 6: i= confere_bool_5(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 7: i= confere_tlf_5(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 8: i= confere_bool_6(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 9: i= confere_tlf_6(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 10: i= confere_bool_7(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 11: i= confere_tlf_7(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 12: i= confere_bool_8(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 13: i= confere_tlf_8(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 14: i= confere_bool_9(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 15: i= confere_tlf_9(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        default: i= confere_bool_1(h_init_rand,h_estado,MAX_ESTADO); 
                break;
    }
    
    if(i == MAX_ESTADO)
        cerr << "Resultados da GPU batem com os da CPU\n";
    else
        cerr << "Resultados não batem!\n";
    
    delete [] h_estado;
    delete [] h_init_rand;
    cudaFree(d_init_rand);
    cudaFree(d_estado);
    cudaDeviceReset();
    return 0;
}
