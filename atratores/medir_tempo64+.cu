#include <iostream>
#include <chrono>
#include <ctime>
#include <string>
#include <limits>
#include <stdio.h>
#include <stdlib.h>

#define CLOCKS_PER_SEC_CPU 1100000000
using namespace std;

//REDE 10
__global__ void passo_bool_10_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( (v.x>>41)%2 ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( (v.x>>20)%2 ) ) | ( ( (v.x>>14)%2 ) )<< 1 ;
        aux.x |=(unsigned long long) ( ( (v.x>>17)%2 ) )<< 2 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>0)%2 ) ) )<< 3 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>6)%2 ) ) & ! ( ( (v.x>>7)%2 ) ) ) & ! ( ( (v.x>>5)%2 ) ) ) | ( ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>7)%2 ) ) ) & ! ( ( (v.x>>5)%2 ) ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>61)%2 ) ) & ! ( ( (v.x>>57)%2 ) ) ) & ! ( ( (v.x>>3)%2 ) ) ) | ( ( ( ( (v.x>>59)%2 ) ) & ! ( ( (v.x>>57)%2 ) ) ) & ! ( ( (v.x>>3)%2 ) ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>49)%2 ) ) & ! ( ( (v.x>>5)%2 ) ) ) & ! ( ( (v.x>>7)%2 ) ) ) | ( ( ( ( (v.x>>15)%2 ) ) & ! ( ( (v.x>>5)%2 ) ) ) & ! ( ( (v.x>>7)%2 ) ) ) | ( ( ( ( (v.x>>23)%2 ) ) & ! ( ( (v.x>>5)%2 ) ) ) & ! ( ( (v.x>>7)%2 ) ) )<< 6 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>61)%2 ) ) & ! ( ( (v.x>>3)%2 ) ) ) & ! ( ( (v.x>>4)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) ) | ( ( ( ( ( (v.x>>59)%2 ) ) & ! ( ( (v.x>>3)%2 ) ) ) & ! ( ( (v.x>>4)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>13)%2 ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 8 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>12)%2 ) ) & ! ( ( (v.x>>56)%2 ) ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>62)%2 ) )<< 11 ;
        aux.x |=(unsigned long long) ( ( (v.x>>0)%2 ) ) | ( ( (v.x>>38)%2 ) ) | ( ( (v.x>>21)%2 ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.x>>38)%2 ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) ) & ! ( ( (v.x>>52)%2 ) ) ) | ( ( ( (v.x>>16)%2 ) ) & ! ( ( (v.x>>52)%2 ) ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>23)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) & ! ( ( (v.x>>22)%2 ) ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>18)%2 ) ) & ! ( ( (v.x>>52)%2 ) ) ) & ! ( ( (v.x>>0)%2 ) ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( (v.x>>36)%2 ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( (v.x>>1)%2 ) )<< 19 ;
        aux.x |=(unsigned long long) ( ( (v.x>>49)%2 ) ) | ( ( (v.x>>14)%2 ) )<< 20 ;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_10_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) )<< 21 ;
        aux.x |=(unsigned long long) ( ( (v.x>>59)%2 ) )<< 22 ;
        aux.x |=(unsigned long long) ( ( (v.x>>24)%2 ) ) | ( ( (v.x>>57)%2 ) )<< 23 ;
        aux.x |=(unsigned long long) ( ( (v.x>>53)%2 ) ) | ( ( (v.x>>23)%2 ) )<< 24 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( (v.x>>47)%2 ) & ( ( ( ( (v.x>>39)%2 ) ) ) ) ) | ( ( (v.x>>0)%2 ) )<< 26 ;
        aux.x |=(unsigned long long) ( ( (v.x>>59)%2 ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( (v.x>>54)%2 ) & ( ( ( ( (v.x>>27)%2 ) ) ) ) )<< 28 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) & ( ( ( ( (v.x>>54)%2 ) ) ) ) ) & ! ( ( (v.x>>63)%2 ) ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>37)%2 ) ) & ! ( ( (v.x>>43)%2 ) ) )<< 30 ;
        aux.x |=(unsigned long long) ( ( (v.x>>33)%2 ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>0)%2 ) ) & ! ( ( (v.x>>1)%2 ) ) ) | ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>1)%2 ) ) )<< 32 ;
        aux.x |=(unsigned long long) ( ( (v.x>>45)%2 ) )<< 33 ;
        aux.x |=(unsigned long long) ( ( (v.x>>33)%2 ) )<< 34 ;
        aux.x |=(unsigned long long) ( ( (v.x>>44)%2 ) )<< 35 ;
        aux.x |=(unsigned long long) ( ( (v.x>>4)%2 ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.x>>35)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) ) | ( ( (v.x>>34)%2 ) ) | ( ( (v.x>>21)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>51)%2 ) ) )<< 39 ;
        aux.x |=(unsigned long long) ( ( (v.x>>27)%2 ) & ( ( ( ( (v.x>>54)%2 ) ) ) ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) ) & ! ( ( (v.x>>42)%2 ) ) )<< 41 ;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_10_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( (v.x>>57)%2 ) )<< 42 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.y>>0)%2 ) ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( (v.x>>49)%2 ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.x>>46)%2 ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( (v.x>>27)%2 ) & ( ( ( ( (v.x>>54)%2 ) ) ) ) ) | ( ( (v.x>>63)%2 ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) ) | ( ( (v.x>>62)%2 ) & ( ( ( ( (v.y>>1)%2 ) ) ) ) )<< 47 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>14)%2 ) ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>20)%2 ) ) ) | ! ( ( (v.x>>20)%2 ) | ( (v.x>>43)%2 ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( (v.x>>36)%2 ) )<< 50 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>11)%2 ) ) )<< 51 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>61)%2 ) ) & ! ( ( (v.x>>50)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) ) | ( ( ( ( (v.x>>59)%2 ) ) & ! ( ( (v.x>>50)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) )<< 52 ;
        aux.x |=(unsigned long long) ( ( (v.x>>30)%2 ) )<< 53 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>14)%2 ) ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( ( ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>38)%2 ) ) ) & ! ( ( (v.x>>0)%2 ) ) ) & ! ( ( (v.x>>32)%2 ) ) ) & ! ( ( (v.x>>9)%2 ) ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>9)%2 ) ) ) & ! ( ( (v.x>>0)%2 ) ) ) & ! ( ( (v.x>>38)%2 ) ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>19)%2 ) ) & ! ( ( (v.x>>32)%2 ) & ( ( ( ( (v.x>>43)%2 ) ) ) ) ) ) | ( ( ( (v.x>>30)%2 ) ) & ! ( ( (v.x>>32)%2 ) & ( ( ( ( (v.x>>43)%2 ) ) ) ) ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( (v.x>>26)%2 ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) ) | ( ( (v.x>>58)%2 ) ) | ( ( (v.y>>2)%2 ) ) | ( ( (v.x>>43)%2 ) & ( ( ( ( (v.x>>58)%2 ) ) ) ) )<< 59 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) & ( ( ( ( (v.x>>10)%2 ) ) ) ) ) | ( ( (v.x>>8)%2 ) & ( ( ( ( (v.x>>10)%2 ) & ( (v.x>>9)%2 ) ) ) ) )<< 60 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>48)%2 ) & ( (v.x>>28)%2 ) ) & ( ( ( ! ( (v.x>>26)%2 ) ) ) ) ) ) ) & ! ( ( (v.x>>30)%2 ) ) ) | ( ( (v.x>>28)%2 ) & ( ( ( ( (v.x>>48)%2 ) & ( (v.x>>29)%2 ) ) ) ) )<< 61 ;

        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}


unsigned long long confere_bool_10(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( (v.x>>41)%2 ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( (v.x>>20)%2 ) ) | ( ( (v.x>>14)%2 ) )<< 1 ;
        aux.x |=(unsigned long long) ( ( (v.x>>17)%2 ) )<< 2 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>0)%2 ) ) )<< 3 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>6)%2 ) ) & ! ( ( (v.x>>7)%2 ) ) ) & ! ( ( (v.x>>5)%2 ) ) ) | ( ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>7)%2 ) ) ) & ! ( ( (v.x>>5)%2 ) ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>61)%2 ) ) & ! ( ( (v.x>>57)%2 ) ) ) & ! ( ( (v.x>>3)%2 ) ) ) | ( ( ( ( (v.x>>59)%2 ) ) & ! ( ( (v.x>>57)%2 ) ) ) & ! ( ( (v.x>>3)%2 ) ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>49)%2 ) ) & ! ( ( (v.x>>5)%2 ) ) ) & ! ( ( (v.x>>7)%2 ) ) ) | ( ( ( ( (v.x>>15)%2 ) ) & ! ( ( (v.x>>5)%2 ) ) ) & ! ( ( (v.x>>7)%2 ) ) ) | ( ( ( ( (v.x>>23)%2 ) ) & ! ( ( (v.x>>5)%2 ) ) ) & ! ( ( (v.x>>7)%2 ) ) )<< 6 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>61)%2 ) ) & ! ( ( (v.x>>3)%2 ) ) ) & ! ( ( (v.x>>4)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) ) | ( ( ( ( ( (v.x>>59)%2 ) ) & ! ( ( (v.x>>3)%2 ) ) ) & ! ( ( (v.x>>4)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>13)%2 ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 8 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>12)%2 ) ) & ! ( ( (v.x>>56)%2 ) ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>62)%2 ) )<< 11 ;
        aux.x |=(unsigned long long) ( ( (v.x>>0)%2 ) ) | ( ( (v.x>>38)%2 ) ) | ( ( (v.x>>21)%2 ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.x>>38)%2 ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) ) & ! ( ( (v.x>>52)%2 ) ) ) | ( ( ( (v.x>>16)%2 ) ) & ! ( ( (v.x>>52)%2 ) ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>23)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) & ! ( ( (v.x>>22)%2 ) ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>18)%2 ) ) & ! ( ( (v.x>>52)%2 ) ) ) & ! ( ( (v.x>>0)%2 ) ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( (v.x>>36)%2 ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( (v.x>>1)%2 ) )<< 19 ;
        aux.x |=(unsigned long long) ( ( (v.x>>49)%2 ) ) | ( ( (v.x>>14)%2 ) )<< 20 ;
        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) )<< 21 ;
        aux.x |=(unsigned long long) ( ( (v.x>>59)%2 ) )<< 22 ;
        aux.x |=(unsigned long long) ( ( (v.x>>24)%2 ) ) | ( ( (v.x>>57)%2 ) )<< 23 ;
        aux.x |=(unsigned long long) ( ( (v.x>>53)%2 ) ) | ( ( (v.x>>23)%2 ) )<< 24 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( (v.x>>47)%2 ) & ( ( ( ( (v.x>>39)%2 ) ) ) ) ) | ( ( (v.x>>0)%2 ) )<< 26 ;
        aux.x |=(unsigned long long) ( ( (v.x>>59)%2 ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( (v.x>>54)%2 ) & ( ( ( ( (v.x>>27)%2 ) ) ) ) )<< 28 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) & ( ( ( ( (v.x>>54)%2 ) ) ) ) ) & ! ( ( (v.x>>63)%2 ) ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>37)%2 ) ) & ! ( ( (v.x>>43)%2 ) ) )<< 30 ;
        aux.x |=(unsigned long long) ( ( (v.x>>33)%2 ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>0)%2 ) ) & ! ( ( (v.x>>1)%2 ) ) ) | ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>1)%2 ) ) )<< 32 ;
        aux.x |=(unsigned long long) ( ( (v.x>>45)%2 ) )<< 33 ;
        aux.x |=(unsigned long long) ( ( (v.x>>33)%2 ) )<< 34 ;
        aux.x |=(unsigned long long) ( ( (v.x>>44)%2 ) )<< 35 ;
        aux.x |=(unsigned long long) ( ( (v.x>>4)%2 ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.x>>35)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) ) | ( ( (v.x>>34)%2 ) ) | ( ( (v.x>>21)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>51)%2 ) ) )<< 39 ;
        aux.x |=(unsigned long long) ( ( (v.x>>27)%2 ) & ( ( ( ( (v.x>>54)%2 ) ) ) ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) ) & ! ( ( (v.x>>42)%2 ) ) )<< 41 ;
        aux.x |=(unsigned long long) ( ( (v.x>>57)%2 ) )<< 42 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.y>>0)%2 ) ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( (v.x>>49)%2 ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.x>>46)%2 ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( (v.x>>27)%2 ) & ( ( ( ( (v.x>>54)%2 ) ) ) ) ) | ( ( (v.x>>63)%2 ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) ) | ( ( (v.x>>62)%2 ) & ( ( ( ( (v.y>>1)%2 ) ) ) ) )<< 47 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>14)%2 ) ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>20)%2 ) ) ) | ! ( ( (v.x>>20)%2 ) | ( (v.x>>43)%2 ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( (v.x>>36)%2 ) )<< 50 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>11)%2 ) ) )<< 51 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>61)%2 ) ) & ! ( ( (v.x>>50)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) ) | ( ( ( ( (v.x>>59)%2 ) ) & ! ( ( (v.x>>50)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) )<< 52 ;
        aux.x |=(unsigned long long) ( ( (v.x>>30)%2 ) )<< 53 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>14)%2 ) ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( ( ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>38)%2 ) ) ) & ! ( ( (v.x>>0)%2 ) ) ) & ! ( ( (v.x>>32)%2 ) ) ) & ! ( ( (v.x>>9)%2 ) ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>9)%2 ) ) ) & ! ( ( (v.x>>0)%2 ) ) ) & ! ( ( (v.x>>38)%2 ) ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>19)%2 ) ) & ! ( ( (v.x>>32)%2 ) & ( ( ( ( (v.x>>43)%2 ) ) ) ) ) ) | ( ( ( (v.x>>30)%2 ) ) & ! ( ( (v.x>>32)%2 ) & ( ( ( ( (v.x>>43)%2 ) ) ) ) ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( (v.x>>26)%2 ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) ) | ( ( (v.x>>58)%2 ) ) | ( ( (v.y>>2)%2 ) ) | ( ( (v.x>>43)%2 ) & ( ( ( ( (v.x>>58)%2 ) ) ) ) )<< 59 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) & ( ( ( ( (v.x>>10)%2 ) ) ) ) ) | ( ( (v.x>>8)%2 ) & ( ( ( ( (v.x>>10)%2 ) & ( (v.x>>9)%2 ) ) ) ) )<< 60 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>48)%2 ) & ( (v.x>>28)%2 ) ) & ( ( ( ! ( (v.x>>26)%2 ) ) ) ) ) ) ) & ! ( ( (v.x>>30)%2 ) ) ) | ( ( (v.x>>28)%2 ) & ( ( ( ( (v.x>>48)%2 ) & ( (v.x>>29)%2 ) ) ) ) )<< 61 ;

        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_10_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2) >= 2 ) <<0;
        aux.x |=(unsigned long long) ( ( ( (v.x>>20)%2 ) * 2 + ( (v.x>>14)%2 ) * 2) >= 2 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2) >= 2 ) <<2;
        aux.x |=(unsigned long long) ( ( ( (v.x>>0)%2 ) * -2) >= 0 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.x>>6)%2 ) * 2 + ( (v.x>>7)%2 ) * -6 + ( (v.x>>5)%2 ) * -6 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>57)%2 ) * -6 + ( (v.x>>3)%2 ) * -6 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>49)%2 ) * 2 + ( (v.x>>5)%2 ) * -14 + ( (v.x>>7)%2 ) * -14 + ( (v.x>>15)%2 ) * 2 + ( (v.x>>23)%2 ) * 2) >= 2 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>3)%2 ) * -6 + ( (v.x>>4)%2 ) * -6 + ( (v.x>>57)%2 ) * -6 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.x>>13)%2 ) * 2 + ( (v.x>>55)%2 ) * -2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2 + ( (v.x>>56)%2 ) * -2 + ( (v.x>>55)%2 ) * -2) >= 2 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>62)%2 ) * 2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>0)%2 ) * 2 + ( (v.x>>38)%2 ) * 2 + ( (v.x>>21)%2 ) * 2) >= 2 ) <<12;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2) >= 2 ) <<13;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) * 2 + ( (v.x>>52)%2 ) * -6 + ( (v.x>>16)%2 ) * 2) >= 2 ) <<14;
        aux.x |=(unsigned long long) ( ( ( (v.x>>23)%2 ) * 2 + ( (v.x>>24)%2 ) * 2 + ( (v.x>>22)%2 ) * -2) >= 4 ) <<15;
        aux.x |=(unsigned long long) ( ( ( (v.x>>18)%2 ) * 2 + ( (v.x>>52)%2 ) * -2 + ( (v.x>>0)%2 ) * -2) >= 2 ) <<16;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<17;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) * 2) >= 2 ) <<18;
        aux.x |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * 2) >= 2 ) <<19;
        aux.x |=(unsigned long long) ( ( ( (v.x>>49)%2 ) * 2 + ( (v.x>>14)%2 ) * 2) >= 2 ) <<20;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_10_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 2) >= 2 ) <<21;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2) >= 2 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.x>>53)%2 ) * 2 + ( (v.x>>23)%2 ) * 2) >= 2 ) <<24;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.x>>47)%2 ) * 2 + ( (v.x>>39)%2 ) * 2 + ( (v.x>>0)%2 ) * 6) >= 4 ) <<26;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2) >= 2 ) <<27;
        aux.x |=(unsigned long long) ( ( ( (v.x>>54)%2 ) * 2 + ( (v.x>>27)%2 ) * 2) >= 4 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 2 + ( (v.x>>54)%2 ) * 2 + ( (v.x>>63)%2 ) * -2) >= 4 ) <<29;
        aux.x |=(unsigned long long) ( ( ( (v.x>>37)%2 ) * 2 + ( (v.x>>43)%2 ) * -2) >= 2 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 2) >= 2 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.x>>0)%2 ) * 2 + ( (v.x>>1)%2 ) * -6 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.x>>45)%2 ) * 2) >= 2 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 2) >= 2 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>44)%2 ) * 2) >= 2 ) <<35;
        aux.x |=(unsigned long long) ( ( ( (v.x>>4)%2 ) * 2) >= 2 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.x>>35)%2 ) * 2) >= 2 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + ( (v.x>>21)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.x>>51)%2 ) * -2) >= 0 ) <<39;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 2 + ( (v.x>>54)%2 ) * 2) >= 4 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2 + ( (v.x>>42)%2 ) * -2) >= 2 ) <<41;

    
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_10_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * 2) >= 2 ) <<42;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * -2) >= 0 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.x>>49)%2 ) * 2) >= 2 ) <<44;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * 2) >= 2 ) <<45;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 2 + ( (v.x>>54)%2 ) * 2 + ( (v.x>>63)%2 ) * 6) >= 4 ) <<46;
        aux.x |=(unsigned long long) ( ( 0 * 6 + 0 * 2 + ( (v.y>>1)%2 ) * 2) >= 4 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * -2) >= 0 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.x>>20)%2 ) * 2 + ( (v.x>>43)%2 ) * -2) >= 0 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) * 2) >= 2 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.x>>11)%2 ) * -2) >= 0 ) <<51;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>50)%2 ) * -6 + ( (v.x>>57)%2 ) * -6 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.x>>30)%2 ) * 2) >= 2 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * -2) >= 0 ) <<54;
        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * 2 + ( (v.x>>38)%2 ) * -2 + ( (v.x>>0)%2 ) * -2 + ( (v.x>>32)%2 ) * -2 + ( (v.x>>9)%2 ) * -2) >= 2 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * 2 + ( (v.x>>9)%2 ) * -2 + ( (v.x>>0)%2 ) * -2 + ( (v.x>>38)%2 ) * -2) >= 2 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.x>>19)%2 ) * 6 + ( (v.x>>32)%2 ) * -6 + ( (v.x>>43)%2 ) * -6 + ( (v.x>>30)%2 ) * 6) >= 0 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.x>>26)%2 ) * 2) >= 2 ) <<58;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 4 + ( (v.x>>58)%2 ) * 4 + 0 * 4 + ( (v.x>>43)%2 ) * 0) >= 4 ) <<59;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 4 + ( (v.x>>10)%2 ) * 4 + ( (v.x>>8)%2 ) * 0) >= 8 ) <<60;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 8 + ( (v.x>>48)%2 ) * 8 + ( (v.x>>28)%2 ) * 8 + ( (v.x>>26)%2 ) * 0 + ( (v.x>>30)%2 ) * 0) >= 24 ) <<61;

        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

unsigned long long confere_tlf_10(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2) >= 2 ) <<0;
        aux.x |=(unsigned long long) ( ( ( (v.x>>20)%2 ) * 2 + ( (v.x>>14)%2 ) * 2) >= 2 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2) >= 2 ) <<2;
        aux.x |=(unsigned long long) ( ( ( (v.x>>0)%2 ) * -2) >= 0 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.x>>6)%2 ) * 2 + ( (v.x>>7)%2 ) * -6 + ( (v.x>>5)%2 ) * -6 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>57)%2 ) * -6 + ( (v.x>>3)%2 ) * -6 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>49)%2 ) * 2 + ( (v.x>>5)%2 ) * -14 + ( (v.x>>7)%2 ) * -14 + ( (v.x>>15)%2 ) * 2 + ( (v.x>>23)%2 ) * 2) >= 2 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>3)%2 ) * -6 + ( (v.x>>4)%2 ) * -6 + ( (v.x>>57)%2 ) * -6 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.x>>13)%2 ) * 2 + ( (v.x>>55)%2 ) * -2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2 + ( (v.x>>56)%2 ) * -2 + ( (v.x>>55)%2 ) * -2) >= 2 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>62)%2 ) * 2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>0)%2 ) * 2 + ( (v.x>>38)%2 ) * 2 + ( (v.x>>21)%2 ) * 2) >= 2 ) <<12;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2) >= 2 ) <<13;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) * 2 + ( (v.x>>52)%2 ) * -6 + ( (v.x>>16)%2 ) * 2) >= 2 ) <<14;
        aux.x |=(unsigned long long) ( ( ( (v.x>>23)%2 ) * 2 + ( (v.x>>24)%2 ) * 2 + ( (v.x>>22)%2 ) * -2) >= 4 ) <<15;
        aux.x |=(unsigned long long) ( ( ( (v.x>>18)%2 ) * 2 + ( (v.x>>52)%2 ) * -2 + ( (v.x>>0)%2 ) * -2) >= 2 ) <<16;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<17;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) * 2) >= 2 ) <<18;
        aux.x |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * 2) >= 2 ) <<19;
        aux.x |=(unsigned long long) ( ( ( (v.x>>49)%2 ) * 2 + ( (v.x>>14)%2 ) * 2) >= 2 ) <<20;
        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 2) >= 2 ) <<21;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2) >= 2 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.x>>53)%2 ) * 2 + ( (v.x>>23)%2 ) * 2) >= 2 ) <<24;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.x>>47)%2 ) * 2 + ( (v.x>>39)%2 ) * 2 + ( (v.x>>0)%2 ) * 6) >= 4 ) <<26;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2) >= 2 ) <<27;
        aux.x |=(unsigned long long) ( ( ( (v.x>>54)%2 ) * 2 + ( (v.x>>27)%2 ) * 2) >= 4 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 2 + ( (v.x>>54)%2 ) * 2 + ( (v.x>>63)%2 ) * -2) >= 4 ) <<29;
        aux.x |=(unsigned long long) ( ( ( (v.x>>37)%2 ) * 2 + ( (v.x>>43)%2 ) * -2) >= 2 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 2) >= 2 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.x>>0)%2 ) * 2 + ( (v.x>>1)%2 ) * -6 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.x>>45)%2 ) * 2) >= 2 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 2) >= 2 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>44)%2 ) * 2) >= 2 ) <<35;
        aux.x |=(unsigned long long) ( ( ( (v.x>>4)%2 ) * 2) >= 2 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.x>>35)%2 ) * 2) >= 2 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + ( (v.x>>21)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.x>>51)%2 ) * -2) >= 0 ) <<39;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 2 + ( (v.x>>54)%2 ) * 2) >= 4 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2 + ( (v.x>>42)%2 ) * -2) >= 2 ) <<41;
        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * 2) >= 2 ) <<42;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * -2) >= 0 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.x>>49)%2 ) * 2) >= 2 ) <<44;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * 2) >= 2 ) <<45;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 2 + ( (v.x>>54)%2 ) * 2 + ( (v.x>>63)%2 ) * 6) >= 4 ) <<46;
        aux.x |=(unsigned long long) ( ( 0 * 6 + 0 * 2 + ( (v.y>>1)%2 ) * 2) >= 4 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * -2) >= 0 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.x>>20)%2 ) * 2 + ( (v.x>>43)%2 ) * -2) >= 0 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) * 2) >= 2 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.x>>11)%2 ) * -2) >= 0 ) <<51;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>50)%2 ) * -6 + ( (v.x>>57)%2 ) * -6 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.x>>30)%2 ) * 2) >= 2 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * -2) >= 0 ) <<54;
        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * 2 + ( (v.x>>38)%2 ) * -2 + ( (v.x>>0)%2 ) * -2 + ( (v.x>>32)%2 ) * -2 + ( (v.x>>9)%2 ) * -2) >= 2 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * 2 + ( (v.x>>9)%2 ) * -2 + ( (v.x>>0)%2 ) * -2 + ( (v.x>>38)%2 ) * -2) >= 2 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.x>>19)%2 ) * 6 + ( (v.x>>32)%2 ) * -6 + ( (v.x>>43)%2 ) * -6 + ( (v.x>>30)%2 ) * 6) >= 0 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.x>>26)%2 ) * 2) >= 2 ) <<58;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 4 + ( (v.x>>58)%2 ) * 4 + 0 * 4 + ( (v.x>>43)%2 ) * 0) >= 4 ) <<59;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 4 + ( (v.x>>10)%2 ) * 4 + ( (v.x>>8)%2 ) * 0) >= 8 ) <<60;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 8 + ( (v.x>>48)%2 ) * 8 + ( (v.x>>28)%2 ) * 8 + ( (v.x>>26)%2 ) * 0 + ( (v.x>>30)%2 ) * 0) >= 24 ) <<61;

        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 11
__global__ void passo_bool_11_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( (v.x>>56)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>59)%2 ) ) ) ) )<< 1 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>43)%2 ) ) & ! ( ( (v.x>>62)%2 ) ) )<< 2 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) )<< 3 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) & ( ( ( ! ( (v.x>>7)%2 ) ) ) | ( ( ! ( (v.x>>6)%2 ) ) ) ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( (v.x>>54)%2 ) )<< 6 ;
        aux.x |=(unsigned long long) ( ( (v.x>>21)%2 ) ) | ( ( (v.x>>20)%2 ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( (v.x>>49)%2 ) )<< 8 ;
        aux.x |=(unsigned long long) ( ( (v.x>>24)%2 ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( (v.x>>59)%2 ) ) | ( ( (v.x>>22)%2 ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>27)%2 ) )<< 11 ;
        aux.x |=(unsigned long long) ( ( (v.x>>2)%2 ) & ( ( ( ( (v.x>>16)%2 ) & ( (v.x>>52)%2 ) ) ) ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.x>>26)%2 ) & ( ( ( ( (v.x>>10)%2 ) & ( (v.x>>4)%2 ) & ( (v.x>>46)%2 ) ) ) ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( (v.x>>21)%2 ) ) | ( ( (v.x>>1)%2 ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( (v.x>>45)%2 ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( (v.x>>32)%2 ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) ) | ( ( (v.x>>25)%2 ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 19 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 20 ;
    
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_11_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( (v.x>>29)%2 ) ) | ( ( (v.x>>22)%2 ) )<< 21 ;
        aux.x |=(unsigned long long) ( ( (v.x>>33)%2 ) )<< 22 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) & ( ( ( ( (v.x>>51)%2 ) ) ) ) ) & ! ( ( (v.x>>62)%2 ) ) )<< 23 ;
        aux.x |=(unsigned long long) ( ( (v.x>>55)%2 ) )<< 24 ;
        aux.x |=(unsigned long long) ( ( (v.x>>59)%2 ) ) | ( ( (v.x>>22)%2 ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( (v.x>>59)%2 ) ) | ( ( (v.x>>22)%2 ) )<< 26 ;
        aux.x |=(unsigned long long) ( ( (v.x>>45)%2 ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( (v.x>>17)%2 ) )<< 28 ;
        aux.x |=(unsigned long long) ( ( (v.x>>36)%2 ) & ( ( ( ( (v.x>>38)%2 ) ) ) ) ) | ( ( (v.x>>41)%2 ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) )<< 30 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( (v.x>>47)%2 ) )<< 32 ;
        aux.x |=(unsigned long long) ( ( (v.x>>50)%2 ) ) | ( ( (v.x>>34)%2 ) )<< 33 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) )<< 34 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) )<< 35 ;
        aux.x |=(unsigned long long) ( ( (v.x>>34)%2 ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.x>>35)%2 ) ) | ( ( (v.x>>34)%2 ) ) | ( ( (v.x>>31)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) )<< 39 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) )<< 41 ;
        
    
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_11_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) )<< 42 ;
        aux.x |=(unsigned long long) ( ( (v.x>>18)%2 ) & ( ( ( ( (v.x>>23)%2 ) ) ) ) ) | ( ( (v.x>>30)%2 ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) & ( ( ( ( (v.x>>11)%2 ) ) ) ) ) & ! ( ( (v.y>>1)%2 ) ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.x>>18)%2 ) ) | ( ( (v.x>>30)%2 ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( (v.x>>56)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) | ( ( (v.x>>1)%2 ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) & ( ( ( ( (v.y>>2)%2 ) ) ) ) )<< 47 ;
        aux.x |=(unsigned long long) ( ( (v.x>>5)%2 ) & ( ( ( ( (v.x>>14)%2 ) ) ) ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( (v.x>>52)%2 ) & ( ( ( ( (v.x>>42)%2 ) & ( (v.x>>44)%2 ) ) ) ) )<< 50 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) )<< 51 ;
        aux.x |=(unsigned long long) ( ( (v.x>>53)%2 ) )<< 52 ;
        aux.x |=(unsigned long long) ( ( (v.x>>24)%2 ) )<< 53 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( (v.x>>30)%2 ) ) | ( ( (v.x>>23)%2 ) ) | ( ( (v.x>>18)%2 ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>59)%2 ) ) ) ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>37)%2 ) & ( ( ( ( (v.x>>39)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( (v.x>>40)%2 ) )<< 59 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) )<< 60 ;
        aux.x |=(unsigned long long) ( ( (v.x>>0)%2 ) )<< 61 ;

    
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}


unsigned long long confere_bool_11(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( (v.x>>56)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>59)%2 ) ) ) ) )<< 1 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>43)%2 ) ) & ! ( ( (v.x>>62)%2 ) ) )<< 2 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) )<< 3 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) & ( ( ( ! ( (v.x>>7)%2 ) ) ) | ( ( ! ( (v.x>>6)%2 ) ) ) ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( (v.x>>54)%2 ) )<< 6 ;
        aux.x |=(unsigned long long) ( ( (v.x>>21)%2 ) ) | ( ( (v.x>>20)%2 ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( (v.x>>49)%2 ) )<< 8 ;
        aux.x |=(unsigned long long) ( ( (v.x>>24)%2 ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( (v.x>>59)%2 ) ) | ( ( (v.x>>22)%2 ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>27)%2 ) )<< 11 ;
        aux.x |=(unsigned long long) ( ( (v.x>>2)%2 ) & ( ( ( ( (v.x>>16)%2 ) & ( (v.x>>52)%2 ) ) ) ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.x>>26)%2 ) & ( ( ( ( (v.x>>10)%2 ) & ( (v.x>>4)%2 ) & ( (v.x>>46)%2 ) ) ) ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( (v.x>>21)%2 ) ) | ( ( (v.x>>1)%2 ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( (v.x>>45)%2 ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( (v.x>>32)%2 ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) ) | ( ( (v.x>>25)%2 ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 19 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 20 ;
        aux.x |=(unsigned long long) ( ( (v.x>>29)%2 ) ) | ( ( (v.x>>22)%2 ) )<< 21 ;
        aux.x |=(unsigned long long) ( ( (v.x>>33)%2 ) )<< 22 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) & ( ( ( ( (v.x>>51)%2 ) ) ) ) ) & ! ( ( (v.x>>62)%2 ) ) )<< 23 ;
        aux.x |=(unsigned long long) ( ( (v.x>>55)%2 ) )<< 24 ;
        aux.x |=(unsigned long long) ( ( (v.x>>59)%2 ) ) | ( ( (v.x>>22)%2 ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( (v.x>>59)%2 ) ) | ( ( (v.x>>22)%2 ) )<< 26 ;
        aux.x |=(unsigned long long) ( ( (v.x>>45)%2 ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( (v.x>>17)%2 ) )<< 28 ;
        aux.x |=(unsigned long long) ( ( (v.x>>36)%2 ) & ( ( ( ( (v.x>>38)%2 ) ) ) ) ) | ( ( (v.x>>41)%2 ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) )<< 30 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( (v.x>>47)%2 ) )<< 32 ;
        aux.x |=(unsigned long long) ( ( (v.x>>50)%2 ) ) | ( ( (v.x>>34)%2 ) )<< 33 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) )<< 34 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) )<< 35 ;
        aux.x |=(unsigned long long) ( ( (v.x>>34)%2 ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.x>>35)%2 ) ) | ( ( (v.x>>34)%2 ) ) | ( ( (v.x>>31)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) )<< 39 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) )<< 41 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) )<< 42 ;
        aux.x |=(unsigned long long) ( ( (v.x>>18)%2 ) & ( ( ( ( (v.x>>23)%2 ) ) ) ) ) | ( ( (v.x>>30)%2 ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) & ( ( ( ( (v.x>>11)%2 ) ) ) ) ) & ! ( ( (v.y>>1)%2 ) ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.x>>18)%2 ) ) | ( ( (v.x>>30)%2 ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( (v.x>>56)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) | ( ( (v.x>>1)%2 ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) & ( ( ( ( (v.y>>2)%2 ) ) ) ) )<< 47 ;
        aux.x |=(unsigned long long) ( ( (v.x>>5)%2 ) & ( ( ( ( (v.x>>14)%2 ) ) ) ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( (v.x>>52)%2 ) & ( ( ( ( (v.x>>42)%2 ) & ( (v.x>>44)%2 ) ) ) ) )<< 50 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) )<< 51 ;
        aux.x |=(unsigned long long) ( ( (v.x>>53)%2 ) )<< 52 ;
        aux.x |=(unsigned long long) ( ( (v.x>>24)%2 ) )<< 53 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( (v.x>>30)%2 ) ) | ( ( (v.x>>23)%2 ) ) | ( ( (v.x>>18)%2 ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>59)%2 ) ) ) ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>37)%2 ) & ( ( ( ( (v.x>>39)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( (v.x>>40)%2 ) )<< 59 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) )<< 60 ;
        aux.x |=(unsigned long long) ( ( (v.x>>0)%2 ) )<< 61 ;

        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_11_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 4 ) <<0;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>59)%2 ) * 2) >= 4 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>43)%2 ) * 2 + ( (v.x>>62)%2 ) * -2) >= 2 ) <<2;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2) >= 2 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 6 + ( (v.x>>7)%2 ) * -2 + ( (v.x>>6)%2 ) * -2) >= 4 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>54)%2 ) * 2) >= 2 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.x>>21)%2 ) * 2 + ( (v.x>>20)%2 ) * 2) >= 2 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.x>>49)%2 ) * 2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 2) >= 2 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2 + ( (v.x>>22)%2 ) * 2) >= 2 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>2)%2 ) * 2 + ( (v.x>>16)%2 ) * 2 + ( (v.x>>52)%2 ) * 2) >= 6 ) <<12;
        aux.x |=(unsigned long long) ( ( ( (v.x>>26)%2 ) * 2 + ( (v.x>>10)%2 ) * 2 + ( (v.x>>4)%2 ) * 2 + ( (v.x>>46)%2 ) * 2) >= 8 ) <<13;
        aux.x |=(unsigned long long) ( ( ( (v.x>>21)%2 ) * 2 + ( (v.x>>1)%2 ) * 2) >= 2 ) <<14;
        aux.x |=(unsigned long long) ( ( ( (v.x>>45)%2 ) * 2) >= 2 ) <<15;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2) >= 2 ) <<16;
        aux.x |=(unsigned long long) ( ( ( (v.x>>32)%2 ) * 2) >= 2 ) <<17;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>25)%2 ) * 2) >= 2 ) <<18;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<19;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<20;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_11_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>22)%2 ) * 2) >= 2 ) <<21;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 2) >= 2 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2 + ( (v.x>>51)%2 ) * 2 + ( (v.x>>62)%2 ) * -2) >= 4 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.x>>55)%2 ) * 2) >= 2 ) <<24;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2 + ( (v.x>>22)%2 ) * 2) >= 2 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2 + ( (v.x>>22)%2 ) * 2) >= 2 ) <<26;
        aux.x |=(unsigned long long) ( ( ( (v.x>>45)%2 ) * 2) >= 2 ) <<27;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2) >= 2 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) * 2 + ( (v.x>>38)%2 ) * 2 + ( (v.x>>41)%2 ) * 6) >= 4 ) <<29;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2) >= 2 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.x>>47)%2 ) * 2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.x>>50)%2 ) * 2 + ( (v.x>>34)%2 ) * 2) >= 2 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<35;
        aux.x |=(unsigned long long) ( ( ( (v.x>>34)%2 ) * 2) >= 2 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 2) >= 2 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.x>>35)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + ( (v.x>>31)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 2) >= 2 ) <<39;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<41;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_11_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<42;
        aux.x |=(unsigned long long) ( ( ( (v.x>>18)%2 ) * 2 + ( (v.x>>23)%2 ) * 2 + ( (v.x>>30)%2 ) * 6) >= 4 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) * 2 + ( (v.x>>11)%2 ) * 2 + ( (v.y>>1)%2 ) * -2) >= 4 ) <<44;
        aux.x |=(unsigned long long) ( ( ( (v.x>>18)%2 ) * 2 + ( (v.x>>30)%2 ) * 2) >= 2 ) <<45;
        aux.x |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>57)%2 ) * 2 + ( (v.x>>1)%2 ) * 6) >= 4 ) <<46;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2 + ( (v.y>>2)%2 ) * 2) >= 4 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.x>>5)%2 ) * 2 + ( (v.x>>14)%2 ) * 2) >= 4 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>52)%2 ) * 2 + ( (v.x>>42)%2 ) * 2 + ( (v.x>>44)%2 ) * 2) >= 6 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2) >= 2 ) <<51;
        aux.x |=(unsigned long long) ( ( ( (v.x>>53)%2 ) * 2) >= 2 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 2) >= 2 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<54;
        aux.x |=(unsigned long long) ( ( ( (v.x>>30)%2 ) * 2 + ( (v.x>>23)%2 ) * 2 + ( (v.x>>18)%2 ) * 2) >= 2 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>59)%2 ) * 2) >= 4 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<58;
        aux.x |=(unsigned long long) ( ( ( (v.x>>37)%2 ) * 2 + ( (v.x>>39)%2 ) * 2 + 0 * -2 + ( (v.x>>40)%2 ) * 14) >= 4 ) <<59;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2) >= 2 ) <<60;
        aux.x |=(unsigned long long) ( ( ( (v.x>>0)%2 ) * 2) >= 2 ) <<61;
    
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}


unsigned long long confere_tlf_11(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 4 ) <<0;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>59)%2 ) * 2) >= 4 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>43)%2 ) * 2 + ( (v.x>>62)%2 ) * -2) >= 2 ) <<2;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2) >= 2 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 6 + ( (v.x>>7)%2 ) * -2 + ( (v.x>>6)%2 ) * -2) >= 4 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>54)%2 ) * 2) >= 2 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.x>>21)%2 ) * 2 + ( (v.x>>20)%2 ) * 2) >= 2 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.x>>49)%2 ) * 2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 2) >= 2 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2 + ( (v.x>>22)%2 ) * 2) >= 2 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>2)%2 ) * 2 + ( (v.x>>16)%2 ) * 2 + ( (v.x>>52)%2 ) * 2) >= 6 ) <<12;
        aux.x |=(unsigned long long) ( ( ( (v.x>>26)%2 ) * 2 + ( (v.x>>10)%2 ) * 2 + ( (v.x>>4)%2 ) * 2 + ( (v.x>>46)%2 ) * 2) >= 8 ) <<13;
        aux.x |=(unsigned long long) ( ( ( (v.x>>21)%2 ) * 2 + ( (v.x>>1)%2 ) * 2) >= 2 ) <<14;
        aux.x |=(unsigned long long) ( ( ( (v.x>>45)%2 ) * 2) >= 2 ) <<15;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2) >= 2 ) <<16;
        aux.x |=(unsigned long long) ( ( ( (v.x>>32)%2 ) * 2) >= 2 ) <<17;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>25)%2 ) * 2) >= 2 ) <<18;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<19;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<20;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>22)%2 ) * 2) >= 2 ) <<21;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 2) >= 2 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2 + ( (v.x>>51)%2 ) * 2 + ( (v.x>>62)%2 ) * -2) >= 4 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.x>>55)%2 ) * 2) >= 2 ) <<24;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2 + ( (v.x>>22)%2 ) * 2) >= 2 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2 + ( (v.x>>22)%2 ) * 2) >= 2 ) <<26;
        aux.x |=(unsigned long long) ( ( ( (v.x>>45)%2 ) * 2) >= 2 ) <<27;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2) >= 2 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) * 2 + ( (v.x>>38)%2 ) * 2 + ( (v.x>>41)%2 ) * 6) >= 4 ) <<29;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2) >= 2 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.x>>47)%2 ) * 2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.x>>50)%2 ) * 2 + ( (v.x>>34)%2 ) * 2) >= 2 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<35;
        aux.x |=(unsigned long long) ( ( ( (v.x>>34)%2 ) * 2) >= 2 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 2) >= 2 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.x>>35)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + ( (v.x>>31)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 2) >= 2 ) <<39;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<41;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<42;
        aux.x |=(unsigned long long) ( ( ( (v.x>>18)%2 ) * 2 + ( (v.x>>23)%2 ) * 2 + ( (v.x>>30)%2 ) * 6) >= 4 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) * 2 + ( (v.x>>11)%2 ) * 2 + ( (v.y>>1)%2 ) * -2) >= 4 ) <<44;
        aux.x |=(unsigned long long) ( ( ( (v.x>>18)%2 ) * 2 + ( (v.x>>30)%2 ) * 2) >= 2 ) <<45;
        aux.x |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>57)%2 ) * 2 + ( (v.x>>1)%2 ) * 6) >= 4 ) <<46;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2 + ( (v.y>>2)%2 ) * 2) >= 4 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.x>>5)%2 ) * 2 + ( (v.x>>14)%2 ) * 2) >= 4 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>52)%2 ) * 2 + ( (v.x>>42)%2 ) * 2 + ( (v.x>>44)%2 ) * 2) >= 6 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2) >= 2 ) <<51;
        aux.x |=(unsigned long long) ( ( ( (v.x>>53)%2 ) * 2) >= 2 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 2) >= 2 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<54;
        aux.x |=(unsigned long long) ( ( ( (v.x>>30)%2 ) * 2 + ( (v.x>>23)%2 ) * 2 + ( (v.x>>18)%2 ) * 2) >= 2 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>59)%2 ) * 2) >= 4 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<58;
        aux.x |=(unsigned long long) ( ( ( (v.x>>37)%2 ) * 2 + ( (v.x>>39)%2 ) * 2 + 0 * -2 + ( (v.x>>40)%2 ) * 14) >= 4 ) <<59;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2) >= 2 ) <<60;
        aux.x |=(unsigned long long) ( ( ( (v.x>>0)%2 ) * 2) >= 2 ) <<61;

        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 12
__global__ void passo_bool_12_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ! ( ( ( (v.x>>61)%2 ) ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) )<< 1 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>41)%2 ) ) )<< 2 ;
        aux.x |=(unsigned long long) ( ( (v.x>>55)%2 ) ) | ( ( (v.x>>2)%2 ) )<< 3 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) ) | ( ( (v.x>>54)%2 ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) ) & ! ( ( (v.x>>41)%2 ) ) ) | ( ( (v.x>>13)%2 ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) )<< 6 ;
        aux.x |=(unsigned long long) ( ( (v.x>>13)%2 ) ) | ( ( (v.x>>17)%2 ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( (v.x>>17)%2 ) )<< 8 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>41)%2 ) ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( (v.x>>17)%2 ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) )<< 11 ;
        aux.x |=(unsigned long long) ( ( (v.x>>17)%2 ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.x>>62)%2 ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( (v.x>>5)%2 ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( (v.x>>7)%2 ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( (v.x>>8)%2 ) ) | ( ( (v.x>>59)%2 ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) ) & ! ( ( (v.x>>18)%2 ) ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>12)%2 ) ) & ! ( ( (v.x>>14)%2 ) ) ) & ! ( ( (v.x>>16)%2 ) ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) ) | ( ( (v.y>>0)%2 ) ) | ( ( (v.y>>1)%2 ) )<< 19 ;
    
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_12_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ! ( ( ( (v.x>>57)%2 ) ) | ( ( (v.x>>46)%2 ) ) | ( ( (v.x>>44)%2 ) ) )<< 20 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) ) | ( ( (v.x>>44)%2 ) ) )<< 21 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) ) | ( ( (v.x>>44)%2 ) ) )<< 22 ;
        aux.x |=(unsigned long long) ( ( (v.x>>41)%2 ) & ( ( ( ( (v.x>>46)%2 ) | ( (v.x>>44)%2 ) ) ) ) )<< 23 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) ) )<< 24 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( (v.x>>54)%2 ) ) | ( ( (v.x>>3)%2 ) )<< 26 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) )<< 28 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>41)%2 ) ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) ) & ! ( ( (v.x>>41)%2 ) ) )<< 30 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) ) & ! ( ( (v.x>>41)%2 ) ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( (v.x>>54)%2 ) ) | ( ( (v.x>>3)%2 ) )<< 32 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) ) & ! ( ( (v.x>>41)%2 ) ) )<< 33 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>43)%2 ) ) | ( ( (v.x>>42)%2 ) ) )<< 34 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) ) )<< 35 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.x>>54)%2 ) ) | ( ( (v.x>>3)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.x>>17)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) ) | ( ( (v.x>>29)%2 ) )<< 39 ;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_12_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>34)%2 ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 41 ;
        aux.x |=(unsigned long long) ( ( (v.x>>35)%2 ) )<< 42 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>38)%2 ) ) & ! ( ( (v.x>>56)%2 ) & ( ( ( ( (v.x>>47)%2 ) ) ) ) ) ) & ! ( ( (v.x>>58)%2 ) ) ) & ! ( ( (v.x>>48)%2 ) ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) & ( ( ( ( (v.x>>44)%2 ) | ( (v.x>>57)%2 ) ) ) ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( (v.y>>2)%2 ) ) | ( ( (v.y>>0)%2 ) )<< 47 ;
        aux.x |=(unsigned long long) ( ( (v.y>>3)%2 ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) )<< 50 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>41)%2 ) ) | ( ( (v.x>>43)%2 ) ) | ( ( (v.x>>42)%2 ) ) )<< 51 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) ) )<< 52 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>41)%2 ) ) | ( ( (v.x>>42)%2 ) ) )<< 53 ;
        aux.x |=(unsigned long long) ( ( (v.x>>50)%2 ) ) | ( ( (v.x>>55)%2 ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>4)%2 ) ) & ! ( ( (v.x>>19)%2 ) ) ) | ( ( ( (v.y>>5)%2 ) ) & ! ( ( (v.x>>19)%2 ) ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( (v.x>>51)%2 ) ) | ( ( (v.y>>0)%2 ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>52)%2 ) ) & ! ( ( (v.x>>48)%2 ) ) ) & ! ( ( (v.x>>58)%2 ) ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( (v.y>>6)%2 ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( (v.x>>15)%2 ) ) | ( ( (v.y>>7)%2 ) )<< 59 ;
        aux.x |=(unsigned long long) ( ( (v.x>>40)%2 ) ) | ( ( (v.y>>8)%2 ) )<< 60 ;
    
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

unsigned long long confere_bool_12(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ! ( ( ( (v.x>>61)%2 ) ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) )<< 1 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>41)%2 ) ) )<< 2 ;
        aux.x |=(unsigned long long) ( ( (v.x>>55)%2 ) ) | ( ( (v.x>>2)%2 ) )<< 3 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) ) | ( ( (v.x>>54)%2 ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) ) & ! ( ( (v.x>>41)%2 ) ) ) | ( ( (v.x>>13)%2 ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) )<< 6 ;
        aux.x |=(unsigned long long) ( ( (v.x>>13)%2 ) ) | ( ( (v.x>>17)%2 ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( (v.x>>17)%2 ) )<< 8 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>41)%2 ) ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( (v.x>>17)%2 ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) )<< 11 ;
        aux.x |=(unsigned long long) ( ( (v.x>>17)%2 ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.x>>62)%2 ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( (v.x>>5)%2 ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( (v.x>>7)%2 ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( (v.x>>8)%2 ) ) | ( ( (v.x>>59)%2 ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) ) & ! ( ( (v.x>>18)%2 ) ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>12)%2 ) ) & ! ( ( (v.x>>14)%2 ) ) ) & ! ( ( (v.x>>16)%2 ) ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) ) | ( ( (v.y>>0)%2 ) ) | ( ( (v.y>>1)%2 ) )<< 19 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>57)%2 ) ) | ( ( (v.x>>46)%2 ) ) | ( ( (v.x>>44)%2 ) ) )<< 20 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) ) | ( ( (v.x>>44)%2 ) ) )<< 21 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) ) | ( ( (v.x>>44)%2 ) ) )<< 22 ;
        aux.x |=(unsigned long long) ( ( (v.x>>41)%2 ) & ( ( ( ( (v.x>>46)%2 ) | ( (v.x>>44)%2 ) ) ) ) )<< 23 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) ) )<< 24 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( (v.x>>54)%2 ) ) | ( ( (v.x>>3)%2 ) )<< 26 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) )<< 28 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>41)%2 ) ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) ) & ! ( ( (v.x>>41)%2 ) ) )<< 30 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) ) & ! ( ( (v.x>>41)%2 ) ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( (v.x>>54)%2 ) ) | ( ( (v.x>>3)%2 ) )<< 32 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) ) & ! ( ( (v.x>>41)%2 ) ) )<< 33 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>43)%2 ) ) | ( ( (v.x>>42)%2 ) ) )<< 34 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) ) )<< 35 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.x>>54)%2 ) ) | ( ( (v.x>>3)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.x>>17)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) ) | ( ( (v.x>>29)%2 ) )<< 39 ;
        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>34)%2 ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 41 ;
        aux.x |=(unsigned long long) ( ( (v.x>>35)%2 ) )<< 42 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>38)%2 ) ) & ! ( ( (v.x>>56)%2 ) & ( ( ( ( (v.x>>47)%2 ) ) ) ) ) ) & ! ( ( (v.x>>58)%2 ) ) ) & ! ( ( (v.x>>48)%2 ) ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) & ( ( ( ( (v.x>>44)%2 ) | ( (v.x>>57)%2 ) ) ) ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( (v.y>>2)%2 ) ) | ( ( (v.y>>0)%2 ) )<< 47 ;
        aux.x |=(unsigned long long) ( ( (v.y>>3)%2 ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( (v.x>>3)%2 ) )<< 50 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>41)%2 ) ) | ( ( (v.x>>43)%2 ) ) | ( ( (v.x>>42)%2 ) ) )<< 51 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) ) )<< 52 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>41)%2 ) ) | ( ( (v.x>>42)%2 ) ) )<< 53 ;
        aux.x |=(unsigned long long) ( ( (v.x>>50)%2 ) ) | ( ( (v.x>>55)%2 ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>4)%2 ) ) & ! ( ( (v.x>>19)%2 ) ) ) | ( ( ( (v.y>>5)%2 ) ) & ! ( ( (v.x>>19)%2 ) ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( (v.x>>51)%2 ) ) | ( ( (v.y>>0)%2 ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>52)%2 ) ) & ! ( ( (v.x>>48)%2 ) ) ) & ! ( ( (v.x>>58)%2 ) ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( (v.y>>6)%2 ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( (v.x>>15)%2 ) ) | ( ( (v.y>>7)%2 ) )<< 59 ;
        aux.x |=(unsigned long long) ( ( (v.x>>40)%2 ) ) | ( ( (v.y>>8)%2 ) )<< 60 ;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_12_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * -2) >= 0 ) <<0;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2) >= 2 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * -2) >= 0 ) <<2;
        aux.x |=(unsigned long long) ( ( ( (v.x>>55)%2 ) * 2 + ( (v.x>>2)%2 ) * 2) >= 2 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2 + ( (v.x>>54)%2 ) * 2) >= 2 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2 + ( (v.x>>41)%2 ) * -2 + ( (v.x>>13)%2 ) * 6) >= 2 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2) >= 2 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.x>>13)%2 ) * 2 + ( (v.x>>17)%2 ) * 2) >= 2 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * -2) >= 0 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2) >= 2 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2) >= 2 ) <<12;
        aux.x |=(unsigned long long) ( ( ( (v.x>>62)%2 ) * 2) >= 2 ) <<13;
        aux.x |=(unsigned long long) ( ( ( (v.x>>5)%2 ) * 2) >= 2 ) <<14;
        aux.x |=(unsigned long long) ( ( ( (v.x>>7)%2 ) * 2) >= 2 ) <<15;
        aux.x |=(unsigned long long) ( ( ( (v.x>>8)%2 ) * 2 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<16;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2 + ( (v.x>>18)%2 ) * -2) >= 2 ) <<17;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2 + ( (v.x>>14)%2 ) * -2 + ( (v.x>>16)%2 ) * -2) >= 2 ) <<18;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 2 + ( (v.y>>1)%2 ) * 2) >= 2 ) <<19;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_12_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * -2 + ( (v.x>>46)%2 ) * -2 + ( (v.x>>44)%2 ) * -2) >= 0 ) <<20;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2 + ( (v.x>>44)%2 ) * -2) >= 0 ) <<21;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2 + ( (v.x>>44)%2 ) * -2) >= 0 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 6 + ( (v.x>>46)%2 ) * 2 + ( (v.x>>44)%2 ) * 2) >= 8 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2) >= 0 ) <<24;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2) >= 0 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.x>>54)%2 ) * 2 + ( (v.x>>3)%2 ) * 2) >= 2 ) <<26;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2) >= 2 ) <<27;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2) >= 2 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * -2) >= 0 ) <<29;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) * 2 + ( (v.x>>41)%2 ) * -2) >= 2 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) * 2 + ( (v.x>>41)%2 ) * -2) >= 2 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.x>>54)%2 ) * 2 + ( (v.x>>3)%2 ) * 2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2 + ( (v.x>>41)%2 ) * -2) >= 2 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.x>>43)%2 ) * -2 + ( (v.x>>42)%2 ) * -2) >= 0 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2) >= 0 ) <<35;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2) >= 0 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.x>>54)%2 ) * 2 + ( (v.x>>3)%2 ) * 2) >= 2 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2 + ( (v.x>>29)%2 ) * 2) >= 2 ) <<39;
    
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_12_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 2) >= 2 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.x>>34)%2 ) * 2 + ( (v.x>>55)%2 ) * -2) >= 2 ) <<41;
        aux.x |=(unsigned long long) ( ( ( (v.x>>35)%2 ) * 2) >= 2 ) <<42;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) * 2 + ( (v.x>>55)%2 ) * -2) >= 2 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 6 + ( (v.x>>56)%2 ) * -2 + ( (v.x>>47)%2 ) * -2 + ( (v.x>>58)%2 ) * -6 + ( (v.x>>48)%2 ) * -6) >= 4 ) <<44;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2) >= 2 ) <<45;
        aux.x |=(unsigned long long) ( ( 0 * 6 + ( (v.x>>44)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 8 ) <<46;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.y>>0)%2 ) * 2) >= 2 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.y>>3)%2 ) * 2) >= 2 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2) >= 2 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2) >= 2 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * -2 + ( (v.x>>43)%2 ) * -2 + ( (v.x>>42)%2 ) * -2) >= 0 ) <<51;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2) >= 0 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * -2 + ( (v.x>>42)%2 ) * -2) >= 0 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.x>>50)%2 ) * 2 + ( (v.x>>55)%2 ) * 2) >= 2 ) <<54;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>19)%2 ) * -6 + ( (v.y>>5)%2 ) * 2) >= 2 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>51)%2 ) * 2 + ( (v.y>>0)%2 ) * 2) >= 2 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.x>>52)%2 ) * 2 + ( (v.x>>48)%2 ) * -2 + ( (v.x>>58)%2 ) * -2) >= 2 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.y>>6)%2 ) * 2) >= 2 ) <<58;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) * 2 + ( (v.y>>7)%2 ) * 2) >= 2 ) <<59;
        aux.x |=(unsigned long long) ( ( ( (v.x>>40)%2 ) * 2 + ( (v.y>>8)%2 ) * 2) >= 2 ) <<60;
    
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

unsigned long long confere_tlf_12(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * -2) >= 0 ) <<0;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2) >= 2 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * -2) >= 0 ) <<2;
        aux.x |=(unsigned long long) ( ( ( (v.x>>55)%2 ) * 2 + ( (v.x>>2)%2 ) * 2) >= 2 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2 + ( (v.x>>54)%2 ) * 2) >= 2 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2 + ( (v.x>>41)%2 ) * -2 + ( (v.x>>13)%2 ) * 6) >= 2 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2) >= 2 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.x>>13)%2 ) * 2 + ( (v.x>>17)%2 ) * 2) >= 2 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * -2) >= 0 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2) >= 2 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2) >= 2 ) <<12;
        aux.x |=(unsigned long long) ( ( ( (v.x>>62)%2 ) * 2) >= 2 ) <<13;
        aux.x |=(unsigned long long) ( ( ( (v.x>>5)%2 ) * 2) >= 2 ) <<14;
        aux.x |=(unsigned long long) ( ( ( (v.x>>7)%2 ) * 2) >= 2 ) <<15;
        aux.x |=(unsigned long long) ( ( ( (v.x>>8)%2 ) * 2 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<16;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2 + ( (v.x>>18)%2 ) * -2) >= 2 ) <<17;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2 + ( (v.x>>14)%2 ) * -2 + ( (v.x>>16)%2 ) * -2) >= 2 ) <<18;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 2 + ( (v.y>>1)%2 ) * 2) >= 2 ) <<19;
        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * -2 + ( (v.x>>46)%2 ) * -2 + ( (v.x>>44)%2 ) * -2) >= 0 ) <<20;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2 + ( (v.x>>44)%2 ) * -2) >= 0 ) <<21;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2 + ( (v.x>>44)%2 ) * -2) >= 0 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 6 + ( (v.x>>46)%2 ) * 2 + ( (v.x>>44)%2 ) * 2) >= 8 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2) >= 0 ) <<24;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2) >= 0 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.x>>54)%2 ) * 2 + ( (v.x>>3)%2 ) * 2) >= 2 ) <<26;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2) >= 2 ) <<27;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2) >= 2 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * -2) >= 0 ) <<29;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) * 2 + ( (v.x>>41)%2 ) * -2) >= 2 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) * 2 + ( (v.x>>41)%2 ) * -2) >= 2 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.x>>54)%2 ) * 2 + ( (v.x>>3)%2 ) * 2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2 + ( (v.x>>41)%2 ) * -2) >= 2 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.x>>43)%2 ) * -2 + ( (v.x>>42)%2 ) * -2) >= 0 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2) >= 0 ) <<35;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2) >= 0 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.x>>54)%2 ) * 2 + ( (v.x>>3)%2 ) * 2) >= 2 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2 + ( (v.x>>29)%2 ) * 2) >= 2 ) <<39;
        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 2) >= 2 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.x>>34)%2 ) * 2 + ( (v.x>>55)%2 ) * -2) >= 2 ) <<41;
        aux.x |=(unsigned long long) ( ( ( (v.x>>35)%2 ) * 2) >= 2 ) <<42;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) * 2 + ( (v.x>>55)%2 ) * -2) >= 2 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 6 + ( (v.x>>56)%2 ) * -2 + ( (v.x>>47)%2 ) * -2 + ( (v.x>>58)%2 ) * -6 + ( (v.x>>48)%2 ) * -6) >= 4 ) <<44;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2) >= 2 ) <<45;
        aux.x |=(unsigned long long) ( ( 0 * 6 + ( (v.x>>44)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 8 ) <<46;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.y>>0)%2 ) * 2) >= 2 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.y>>3)%2 ) * 2) >= 2 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2) >= 2 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>3)%2 ) * 2) >= 2 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * -2 + ( (v.x>>43)%2 ) * -2 + ( (v.x>>42)%2 ) * -2) >= 0 ) <<51;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2) >= 0 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * -2 + ( (v.x>>42)%2 ) * -2) >= 0 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.x>>50)%2 ) * 2 + ( (v.x>>55)%2 ) * 2) >= 2 ) <<54;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>19)%2 ) * -6 + ( (v.y>>5)%2 ) * 2) >= 2 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>51)%2 ) * 2 + ( (v.y>>0)%2 ) * 2) >= 2 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.x>>52)%2 ) * 2 + ( (v.x>>48)%2 ) * -2 + ( (v.x>>58)%2 ) * -2) >= 2 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.y>>6)%2 ) * 2) >= 2 ) <<58;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) * 2 + ( (v.y>>7)%2 ) * 2) >= 2 ) <<59;
        aux.x |=(unsigned long long) ( ( ( (v.x>>40)%2 ) * 2 + ( (v.y>>8)%2 ) * 2) >= 2 ) <<60;

        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 13
__global__ void passo_bool_13_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( (v.x>>0)%2 ) )<< 1 ;
        aux.x |=(unsigned long long) ( ( (v.x>>41)%2 ) ) | ( ( (v.x>>61)%2 ) )<< 2 ;
        aux.x |=(unsigned long long) ( ( (v.x>>62)%2 ) & ( ( ( ( (v.x>>63)%2 ) ) ) ) ) | ( ( (v.x>>43)%2 ) ) | ( ( ( (v.x>>59)%2 ) ) & ! ( ( (v.x>>4)%2 ) ) ) | ( ( (v.y>>0)%2 ) & ( ( ( ! ( (v.x>>37)%2 ) ) ) ) ) | ( ( (v.x>>10)%2 ) ) | ( ( (v.y>>1)%2 ) & ( ( ( ! ( (v.x>>37)%2 ) ) ) ) )<< 3 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>33)%2 ) ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( (v.x>>2)%2 ) ) | ( ( (v.x>>57)%2 ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 6 ;
        aux.x |=(unsigned long long) ( ( (v.y>>2)%2 ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( (v.x>>6)%2 ) ) | ( ( (v.x>>9)%2 ) )<< 8 ;
        aux.x |=(unsigned long long) ( ( (v.x>>23)%2 ) ) | ( ( (v.y>>1)%2 ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>58)%2 ) ) ) | ! ( ( (v.x>>58)%2 ) | ( (v.x>>55)%2 ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 11 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>47)%2 ) ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( (v.x>>45)%2 ) ) | ( ( (v.x>>53)%2 ) ) | ( ( (v.x>>1)%2 ) ) | ( ( (v.x>>20)%2 ) ) | ( ( (v.x>>35)%2 ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) ) | ( ( (v.x>>39)%2 ) & ( ( ( ! ( (v.x>>38)%2 ) & ! ( (v.x>>61)%2 ) ) ) ) ) | ( ( (v.x>>38)%2 ) & ( ( ( ! ( (v.x>>39)%2 ) & ! ( (v.x>>61)%2 ) ) ) ) ) ) | ! ( ( (v.x>>39)%2 ) | ( (v.x>>38)%2 ) | ( (v.x>>61)%2 ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( (v.x>>18)%2 ) )<< 19 ;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_13_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) )<< 20 ;
        aux.x |=(unsigned long long) ( ( (v.x>>34)%2 ) )<< 21 ;
        aux.x |=(unsigned long long) ( ( (v.y>>3)%2 ) )<< 22 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 23 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) )<< 24 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( (v.y>>4)%2 ) )<< 26 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( (v.x>>36)%2 ) )<< 28 ;
        aux.x |=(unsigned long long) ( ( (v.x>>41)%2 ) ) | ( ( (v.x>>27)%2 ) ) | ( ( (v.x>>30)%2 ) ) | ( ( (v.x>>36)%2 ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) ) & ! ( ( (v.x>>11)%2 ) ) ) | ( ( (v.x>>29)%2 ) ) | ( ( ( (v.x>>25)%2 ) ) & ! ( ( (v.x>>15)%2 ) ) )<< 30 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( (v.y>>5)%2 ) )<< 32 ;
        aux.x |=(unsigned long long) ( ( (v.x>>32)%2 ) )<< 33 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) )<< 34 ;
        aux.x |=(unsigned long long) ( ( (v.x>>21)%2 ) )<< 35 ;
        aux.x |=(unsigned long long) ( ( (v.x>>41)%2 ) ) | ( ( (v.y>>5)%2 ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.x>>42)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ( ( (v.x>>19)%2 ) )<< 39 ;

        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_13_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( (v.x>>7)%2 ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( (v.x>>57)%2 ) ) | ( ( (v.y>>6)%2 ) )<< 41 ;
        aux.x |=(unsigned long long) ( ( (v.x>>18)%2 ) ) | ( ( (v.x>>47)%2 ) )<< 42 ;
        aux.x |=(unsigned long long) ( ( (v.y>>7)%2 ) ) | ( ( (v.x>>6)%2 ) ) | ( ( (v.x>>41)%2 ) ) | ( ( (v.x>>12)%2 ) ) | ( ( (v.x>>31)%2 ) ) | ( ( (v.y>>6)%2 ) ) | ( ( ( ( (v.y>>0)%2 ) ) & ! ( ( (v.x>>13)%2 ) ) ) & ! ( ( (v.x>>56)%2 ) ) ) | ( ( ( (v.y>>1)%2 ) ) & ! ( ( (v.x>>56)%2 ) ) ) | ( ( (v.x>>14)%2 ) ) | ( ( (v.x>>49)%2 ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) & ( ( ( ! ( (v.x>>50)%2 ) ) ) ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( (v.x>>28)%2 ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) ) | ( ( (v.y>>5)%2 ) ) | ( ( (v.x>>38)%2 ) & ( ( ( ! ( (v.y>>5)%2 ) & ! ( (v.x>>46)%2 ) & ! ( (v.x>>61)%2 ) & ! ( (v.x>>42)%2 ) ) ) ) ) | ( ( (v.x>>46)%2 ) & ( ( ( ! ( (v.x>>38)%2 ) & ! ( (v.y>>5)%2 ) & ! ( (v.x>>61)%2 ) & ! ( (v.x>>42)%2 ) ) ) ) ) | ( ( (v.x>>61)%2 ) & ( ( ( ( (v.x>>46)%2 ) ) & ( ( ( ! ( (v.x>>38)%2 ) & ! ( (v.y>>5)%2 ) & ! ( (v.x>>42)%2 ) ) ) ) ) ) ) ) | ! ( ( (v.x>>38)%2 ) | ( (v.x>>46)%2 ) | ( (v.y>>5)%2 ) | ( (v.x>>61)%2 ) | ( (v.x>>42)%2 ) )<< 47 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( (v.y>>5)%2 ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 50 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 51 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 52 ;
        aux.x |=(unsigned long long) ( ( (v.x>>52)%2 ) )<< 53 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>54)%2 ) ) & ! ( ( (v.x>>40)%2 ) ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( (v.y>>8)%2 ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>7)%2 ) ) & ! ( ( (v.x>>51)%2 ) ) ) | ( ( (v.x>>30)%2 ) ) | ( ( (v.x>>26)%2 ) ) | ( ( (v.x>>43)%2 ) ) | ( ( (v.y>>6)%2 ) ) | ( ( (v.x>>8)%2 ) )<< 59 ;


        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

unsigned long long confere_bool_13(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( (v.x>>0)%2 ) )<< 1 ;
        aux.x |=(unsigned long long) ( ( (v.x>>41)%2 ) ) | ( ( (v.x>>61)%2 ) )<< 2 ;
        aux.x |=(unsigned long long) ( ( (v.x>>62)%2 ) & ( ( ( ( (v.x>>63)%2 ) ) ) ) ) | ( ( (v.x>>43)%2 ) ) | ( ( ( (v.x>>59)%2 ) ) & ! ( ( (v.x>>4)%2 ) ) ) | ( ( (v.y>>0)%2 ) & ( ( ( ! ( (v.x>>37)%2 ) ) ) ) ) | ( ( (v.x>>10)%2 ) ) | ( ( (v.y>>1)%2 ) & ( ( ( ! ( (v.x>>37)%2 ) ) ) ) )<< 3 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>33)%2 ) ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( (v.x>>2)%2 ) ) | ( ( (v.x>>57)%2 ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 6 ;
        aux.x |=(unsigned long long) ( ( (v.y>>2)%2 ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( (v.x>>6)%2 ) ) | ( ( (v.x>>9)%2 ) )<< 8 ;
        aux.x |=(unsigned long long) ( ( (v.x>>23)%2 ) ) | ( ( (v.y>>1)%2 ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>58)%2 ) ) ) | ! ( ( (v.x>>58)%2 ) | ( (v.x>>55)%2 ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 11 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>47)%2 ) ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( (v.x>>45)%2 ) ) | ( ( (v.x>>53)%2 ) ) | ( ( (v.x>>1)%2 ) ) | ( ( (v.x>>20)%2 ) ) | ( ( (v.x>>35)%2 ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) ) | ( ( (v.x>>39)%2 ) & ( ( ( ! ( (v.x>>38)%2 ) & ! ( (v.x>>61)%2 ) ) ) ) ) | ( ( (v.x>>38)%2 ) & ( ( ( ! ( (v.x>>39)%2 ) & ! ( (v.x>>61)%2 ) ) ) ) ) ) | ! ( ( (v.x>>39)%2 ) | ( (v.x>>38)%2 ) | ( (v.x>>61)%2 ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( (v.x>>18)%2 ) )<< 19 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) )<< 20 ;
        aux.x |=(unsigned long long) ( ( (v.x>>34)%2 ) )<< 21 ;
        aux.x |=(unsigned long long) ( ( (v.y>>3)%2 ) )<< 22 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 23 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) )<< 24 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( (v.y>>4)%2 ) )<< 26 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( (v.x>>36)%2 ) )<< 28 ;
        aux.x |=(unsigned long long) ( ( (v.x>>41)%2 ) ) | ( ( (v.x>>27)%2 ) ) | ( ( (v.x>>30)%2 ) ) | ( ( (v.x>>36)%2 ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) ) & ! ( ( (v.x>>11)%2 ) ) ) | ( ( (v.x>>29)%2 ) ) | ( ( ( (v.x>>25)%2 ) ) & ! ( ( (v.x>>15)%2 ) ) )<< 30 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( (v.y>>5)%2 ) )<< 32 ;
        aux.x |=(unsigned long long) ( ( (v.x>>32)%2 ) )<< 33 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) )<< 34 ;
        aux.x |=(unsigned long long) ( ( (v.x>>21)%2 ) )<< 35 ;
        aux.x |=(unsigned long long) ( ( (v.x>>41)%2 ) ) | ( ( (v.y>>5)%2 ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.x>>42)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ( ( (v.x>>19)%2 ) )<< 39 ;
        aux.x |=(unsigned long long) ( ( (v.x>>7)%2 ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( (v.x>>57)%2 ) ) | ( ( (v.y>>6)%2 ) )<< 41 ;
        aux.x |=(unsigned long long) ( ( (v.x>>18)%2 ) ) | ( ( (v.x>>47)%2 ) )<< 42 ;
        aux.x |=(unsigned long long) ( ( (v.y>>7)%2 ) ) | ( ( (v.x>>6)%2 ) ) | ( ( (v.x>>41)%2 ) ) | ( ( (v.x>>12)%2 ) ) | ( ( (v.x>>31)%2 ) ) | ( ( (v.y>>6)%2 ) ) | ( ( ( ( (v.y>>0)%2 ) ) & ! ( ( (v.x>>13)%2 ) ) ) & ! ( ( (v.x>>56)%2 ) ) ) | ( ( ( (v.y>>1)%2 ) ) & ! ( ( (v.x>>56)%2 ) ) ) | ( ( (v.x>>14)%2 ) ) | ( ( (v.x>>49)%2 ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) & ( ( ( ! ( (v.x>>50)%2 ) ) ) ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( (v.x>>28)%2 ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) ) | ( ( (v.y>>5)%2 ) ) | ( ( (v.x>>38)%2 ) & ( ( ( ! ( (v.y>>5)%2 ) & ! ( (v.x>>46)%2 ) & ! ( (v.x>>61)%2 ) & ! ( (v.x>>42)%2 ) ) ) ) ) | ( ( (v.x>>46)%2 ) & ( ( ( ! ( (v.x>>38)%2 ) & ! ( (v.y>>5)%2 ) & ! ( (v.x>>61)%2 ) & ! ( (v.x>>42)%2 ) ) ) ) ) | ( ( (v.x>>61)%2 ) & ( ( ( ( (v.x>>46)%2 ) ) & ( ( ( ! ( (v.x>>38)%2 ) & ! ( (v.y>>5)%2 ) & ! ( (v.x>>42)%2 ) ) ) ) ) ) ) ) | ! ( ( (v.x>>38)%2 ) | ( (v.x>>46)%2 ) | ( (v.y>>5)%2 ) | ( (v.x>>61)%2 ) | ( (v.x>>42)%2 ) )<< 47 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( (v.y>>5)%2 ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 50 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 51 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 52 ;
        aux.x |=(unsigned long long) ( ( (v.x>>52)%2 ) )<< 53 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>54)%2 ) ) & ! ( ( (v.x>>40)%2 ) ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( (v.y>>8)%2 ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>7)%2 ) ) & ! ( ( (v.x>>51)%2 ) ) ) | ( ( (v.x>>30)%2 ) ) | ( ( (v.x>>26)%2 ) ) | ( ( (v.x>>43)%2 ) ) | ( ( (v.y>>6)%2 ) ) | ( ( (v.x>>8)%2 ) )<< 59 ;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_13_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<0;
        aux.x |=(unsigned long long) ( ( ( (v.x>>0)%2 ) * 2) >= 2 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2 + ( (v.x>>61)%2 ) * 2) >= 2 ) <<2;
        aux.x |=(unsigned long long) ( ( 0 * 30 + 0 * 30 + ( (v.x>>43)%2 ) * 90 + ( (v.x>>59)%2 ) * 30 + ( (v.x>>4)%2 ) * -30 + 0 * 18 + ( (v.x>>37)%2 ) * -54 + ( (v.x>>10)%2 ) * 90 + ( (v.y>>1)%2 ) * 18) >= -24 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * -2) >= 0 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>2)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.y>>2)%2 ) * 2) >= 2 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.x>>6)%2 ) * 2 + ( (v.x>>9)%2 ) * 2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.x>>23)%2 ) * 2 + ( (v.y>>1)%2 ) * 2) >= 2 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>58)%2 ) * 2 + ( (v.x>>55)%2 ) * -2) >= 0 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>47)%2 ) * -2) >= 0 ) <<12;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<13;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2) >= 2 ) <<14;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<15;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<16;
        aux.x |=(unsigned long long) ( ( ( (v.x>>45)%2 ) * 2 + ( (v.x>>53)%2 ) * 2 + ( (v.x>>1)%2 ) * 2 + ( (v.x>>20)%2 ) * 2 + ( (v.x>>35)%2 ) * 2) >= 2 ) <<17;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>39)%2 ) * -2 + ( (v.x>>38)%2 ) * -2) >= -2 ) <<18;
        aux.x |=(unsigned long long) ( ( ( (v.x>>18)%2 ) * 2) >= 2 ) <<19;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_13_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2) >= 2 ) <<20;
        aux.x |=(unsigned long long) ( ( ( (v.x>>34)%2 ) * 2) >= 2 ) <<21;
        aux.x |=(unsigned long long) ( ( ( (v.y>>3)%2 ) * 2) >= 2 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<24;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.y>>4)%2 ) * 2) >= 2 ) <<26;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<27;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) * 2) >= 2 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2 + ( (v.x>>27)%2 ) * 2 + ( (v.x>>30)%2 ) * 2 + ( (v.x>>36)%2 ) * 2) >= 2 ) <<29;
        aux.x |=(unsigned long long) ( ( 0 * 6 + ( (v.x>>11)%2 ) * -6 + ( (v.x>>29)%2 ) * 18 + ( (v.x>>25)%2 ) * 6 + ( (v.x>>15)%2 ) * -6) >= 0 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.y>>5)%2 ) * 2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.x>>32)%2 ) * 2) >= 2 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2) >= 2 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>21)%2 ) * 2) >= 2 ) <<35;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2 + ( (v.y>>5)%2 ) * 2) >= 2 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.x>>19)%2 ) * 2) >= 2 ) <<39;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_13_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( ( (v.x>>7)%2 ) * 2) >= 2 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * 2 + ( (v.y>>6)%2 ) * 2) >= 2 ) <<41;
        aux.x |=(unsigned long long) ( ( ( (v.x>>18)%2 ) * 2 + ( (v.x>>47)%2 ) * 2) >= 2 ) <<42;
        aux.x |=(unsigned long long) ( ( 0 * 22 + ( (v.x>>6)%2 ) * 22 + ( (v.x>>41)%2 ) * 22 + ( (v.x>>12)%2 ) * 22 + ( (v.x>>31)%2 ) * 22 + 0 * 22 + 0 * 2 + ( (v.x>>13)%2 ) * -2 + ( (v.x>>56)%2 ) * -10 + 0 * 6 + ( (v.x>>14)%2 ) * 22 + ( (v.x>>49)%2 ) * 22) >= 2 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 2 + ( (v.x>>50)%2 ) * -2) >= 2 ) <<44;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2) >= 2 ) <<45;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2) >= 2 ) <<46;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) * 8 + 0 * 8 + ( (v.x>>38)%2 ) * -4 + ( (v.x>>46)%2 ) * 0 + ( (v.x>>61)%2 ) * -4) >= -4 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.y>>5)%2 ) * 2) >= 2 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<51;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.x>>52)%2 ) * 2) >= 2 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<54;
        aux.x |=(unsigned long long) ( ( ( (v.x>>54)%2 ) * 2 + ( (v.x>>40)%2 ) * -2) >= 2 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2) >= 2 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.y>>8)%2 ) * 2) >= 2 ) <<58;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>51)%2 ) * -2 + ( (v.x>>30)%2 ) * 6 + ( (v.x>>26)%2 ) * 6 + ( (v.x>>43)%2 ) * 6 + 0 * 6 + ( (v.x>>8)%2 ) * 6) >= 2 ) <<59;

        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

unsigned long long confere_tlf_13(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<0;
        aux.x |=(unsigned long long) ( ( ( (v.x>>0)%2 ) * 2) >= 2 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2 + ( (v.x>>61)%2 ) * 2) >= 2 ) <<2;
        aux.x |=(unsigned long long) ( ( 0 * 30 + 0 * 30 + ( (v.x>>43)%2 ) * 90 + ( (v.x>>59)%2 ) * 30 + ( (v.x>>4)%2 ) * -30 + 0 * 18 + ( (v.x>>37)%2 ) * -54 + ( (v.x>>10)%2 ) * 90 + ( (v.y>>1)%2 ) * 18) >= -24 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * -2) >= 0 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>2)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.y>>2)%2 ) * 2) >= 2 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.x>>6)%2 ) * 2 + ( (v.x>>9)%2 ) * 2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.x>>23)%2 ) * 2 + ( (v.y>>1)%2 ) * 2) >= 2 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>58)%2 ) * 2 + ( (v.x>>55)%2 ) * -2) >= 0 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>47)%2 ) * -2) >= 0 ) <<12;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<13;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2) >= 2 ) <<14;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<15;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<16;
        aux.x |=(unsigned long long) ( ( ( (v.x>>45)%2 ) * 2 + ( (v.x>>53)%2 ) * 2 + ( (v.x>>1)%2 ) * 2 + ( (v.x>>20)%2 ) * 2 + ( (v.x>>35)%2 ) * 2) >= 2 ) <<17;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>39)%2 ) * -2 + ( (v.x>>38)%2 ) * -2) >= -2 ) <<18;
        aux.x |=(unsigned long long) ( ( ( (v.x>>18)%2 ) * 2) >= 2 ) <<19;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2) >= 2 ) <<20;
        aux.x |=(unsigned long long) ( ( ( (v.x>>34)%2 ) * 2) >= 2 ) <<21;
        aux.x |=(unsigned long long) ( ( ( (v.y>>3)%2 ) * 2) >= 2 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<24;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.y>>4)%2 ) * 2) >= 2 ) <<26;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<27;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) * 2) >= 2 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2 + ( (v.x>>27)%2 ) * 2 + ( (v.x>>30)%2 ) * 2 + ( (v.x>>36)%2 ) * 2) >= 2 ) <<29;
        aux.x |=(unsigned long long) ( ( 0 * 6 + ( (v.x>>11)%2 ) * -6 + ( (v.x>>29)%2 ) * 18 + ( (v.x>>25)%2 ) * 6 + ( (v.x>>15)%2 ) * -6) >= 0 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.y>>5)%2 ) * 2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.x>>32)%2 ) * 2) >= 2 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2) >= 2 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>21)%2 ) * 2) >= 2 ) <<35;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2 + ( (v.y>>5)%2 ) * 2) >= 2 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.x>>19)%2 ) * 2) >= 2 ) <<39;
        aux.x |=(unsigned long long) ( ( ( (v.x>>7)%2 ) * 2) >= 2 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * 2 + ( (v.y>>6)%2 ) * 2) >= 2 ) <<41;
        aux.x |=(unsigned long long) ( ( ( (v.x>>18)%2 ) * 2 + ( (v.x>>47)%2 ) * 2) >= 2 ) <<42;
        aux.x |=(unsigned long long) ( ( 0 * 22 + ( (v.x>>6)%2 ) * 22 + ( (v.x>>41)%2 ) * 22 + ( (v.x>>12)%2 ) * 22 + ( (v.x>>31)%2 ) * 22 + 0 * 22 + 0 * 2 + ( (v.x>>13)%2 ) * -2 + ( (v.x>>56)%2 ) * -10 + 0 * 6 + ( (v.x>>14)%2 ) * 22 + ( (v.x>>49)%2 ) * 22) >= 2 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 2 + ( (v.x>>50)%2 ) * -2) >= 2 ) <<44;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2) >= 2 ) <<45;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2) >= 2 ) <<46;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) * 8 + 0 * 8 + ( (v.x>>38)%2 ) * -4 + ( (v.x>>46)%2 ) * 0 + ( (v.x>>61)%2 ) * -4) >= -4 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.y>>5)%2 ) * 2) >= 2 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<51;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.x>>52)%2 ) * 2) >= 2 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<54;
        aux.x |=(unsigned long long) ( ( ( (v.x>>54)%2 ) * 2 + ( (v.x>>40)%2 ) * -2) >= 2 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2) >= 2 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.y>>8)%2 ) * 2) >= 2 ) <<58;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>51)%2 ) * -2 + ( (v.x>>30)%2 ) * 6 + ( (v.x>>26)%2 ) * 6 + ( (v.x>>43)%2 ) * 6 + 0 * 6 + ( (v.x>>8)%2 ) * 6) >= 2 ) <<59;

        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 14
__global__ void passo_bool_14_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( (v.x>>62)%2 ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( (v.x>>4)%2 ) ) | ( ( (v.x>>46)%2 ) )<< 1 ;
        aux.x |=(unsigned long long) ( ( (v.x>>44)%2 ) & ( ( ( ( (v.x>>59)%2 ) ) ) ) )<< 2 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) ) | ( ( (v.x>>57)%2 ) )<< 3 ;
        aux.x |=(unsigned long long) ( ( (v.x>>28)%2 ) & ( ( ( ( (v.x>>11)%2 ) ) & ( ( ( ! ( (v.x>>5)%2 ) & ! ( (v.x>>39)%2 ) ) ) ) ) ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( (v.x>>39)%2 ) & ( ( ( ! ( (v.x>>46)%2 ) & ! ( (v.x>>4)%2 ) & ! ( (v.x>>1)%2 ) ) ) ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( (v.x>>46)%2 ) )<< 6 ;
        aux.x |=(unsigned long long) ( ( (v.y>>1)%2 ) & ( ( ( ! ( (v.x>>11)%2 ) & ! ( (v.x>>50)%2 ) ) ) ) ) | ( ( (v.x>>44)%2 ) & ( ( ( ! ( (v.x>>11)%2 ) & ! ( (v.x>>50)%2 ) ) ) ) ) | ( ( (v.x>>7)%2 ) & ( ( ( ! ( (v.x>>11)%2 ) & ! ( (v.x>>50)%2 ) ) ) ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( (v.x>>50)%2 ) & ( ( ( ! ( (v.y>>3)%2 ) & ! ( (v.y>>1)%2 ) & ! ( (v.x>>11)%2 ) ) ) ) ) | ( ( (v.x>>44)%2 ) & ( ( ( ! ( (v.y>>3)%2 ) & ! ( (v.y>>1)%2 ) & ! ( (v.x>>11)%2 ) ) ) ) ) | ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.y>>3)%2 ) & ! ( (v.y>>1)%2 ) & ! ( (v.x>>11)%2 ) ) ) ) )<< 8 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) & ( ( ( ( (v.x>>50)%2 ) ) ) ) ) | ( ( (v.x>>30)%2 ) & ( ( ( ( (v.x>>50)%2 ) ) ) ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( (v.x>>13)%2 ) ) | ( ( (v.y>>4)%2 ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>49)%2 ) & ( ( ( ! ( (v.x>>50)%2 ) ) ) ) )<< 11 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.y>>6)%2 ) & ( ( ( ! ( (v.x>>46)%2 ) ) ) ) ) | ( ( (v.y>>7)%2 ) & ( ( ( ! ( (v.x>>46)%2 ) ) ) ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>15)%2 ) & ! ( (v.x>>55)%2 ) & ! ( (v.y>>0)%2 ) ) ) ) ) | ( ( (v.x>>51)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>15)%2 ) & ! ( (v.x>>55)%2 ) & ! ( (v.y>>0)%2 ) ) ) ) ) | ( ( (v.x>>52)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>15)%2 ) & ! ( (v.x>>55)%2 ) & ! ( (v.y>>0)%2 ) ) ) ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( (v.x>>59)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>49)%2 ) & ! ( (v.x>>18)%2 ) & ! ( (v.y>>0)%2 ) & ! ( (v.x>>14)%2 ) ) ) ) ) | ( ( (v.x>>58)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>49)%2 ) & ! ( (v.x>>18)%2 ) & ! ( (v.y>>0)%2 ) & ! ( (v.x>>14)%2 ) ) ) ) ) | ( ( (v.x>>15)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>49)%2 ) & ! ( (v.x>>18)%2 ) & ! ( (v.y>>0)%2 ) & ! ( (v.x>>14)%2 ) ) ) ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( (v.x>>38)%2 ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( (v.x>>44)%2 ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( (v.x>>43)%2 ) )<< 19 ;
        aux.x |=(unsigned long long) ( ( (v.y>>8)%2 ) )<< 20 ;
        aux.x |=(unsigned long long) ( ( (v.x>>56)%2 ) & ( ( ( ! ( (v.x>>55)%2 ) ) ) ) ) | ( ( (v.x>>9)%2 ) & ( ( ( ! ( (v.x>>55)%2 ) ) ) ) ) | ( ( (v.x>>37)%2 ) & ( ( ( ! ( (v.x>>55)%2 ) ) ) ) ) | ( ( (v.y>>0)%2 ) & ( ( ( ! ( (v.x>>55)%2 ) ) ) ) )<< 21 ;

        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_14_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( (v.x>>21)%2 ) )<< 22 ;
        aux.x |=(unsigned long long) ( ( (v.x>>15)%2 ) )<< 23 ;
        aux.x |=(unsigned long long) ( ( (v.x>>23)%2 ) )<< 24 ;
        aux.x |=(unsigned long long) ( ( (v.y>>9)%2 ) & ( ( ( ! ( (v.x>>58)%2 ) ) ) ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( (v.x>>48)%2 ) )<< 26 ;
        aux.x |=(unsigned long long) ( ( (v.y>>10)%2 ) & ( ( ( ! ( (v.x>>58)%2 ) ) ) ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( (v.y>>11)%2 ) )<< 28 ;
        aux.x |=(unsigned long long) ( ( (v.y>>12)%2 ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( (v.y>>13)%2 ) )<< 30 ;
        aux.x |=(unsigned long long) ( ( (v.y>>14)%2 ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( (v.x>>15)%2 ) & ( ( ( ! ( (v.x>>54)%2 ) ) ) ) )<< 32 ;
        aux.x |=(unsigned long long) ( ( (v.x>>32)%2 ) & ( ( ( ! ( (v.x>>53)%2 ) ) ) ) )<< 33 ;
        aux.x |=(unsigned long long) ( ( (v.x>>48)%2 ) )<< 34 ;
        aux.x |=(unsigned long long) ( ( (v.x>>34)%2 ) )<< 35 ;
        aux.x |=(unsigned long long) ( ( (v.y>>15)%2 ) & ( ( ( ! ( (v.y>>3)%2 ) ) ) ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.x>>27)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.x>>45)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ( ( (v.x>>5)%2 ) & ( ( ( ! ( (v.x>>13)%2 ) ) & ( ( ( ( (v.x>>11)%2 ) ) ) ) ) ) ) | ( ( (v.x>>43)%2 ) & ( ( ( ! ( (v.x>>13)%2 ) ) & ( ( ( ( (v.x>>11)%2 ) ) ) ) ) ) )<< 39 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( (v.x>>36)%2 ) & ( ( ( ! ( (v.x>>44)%2 ) ) ) ) ) | ( ( (v.x>>35)%2 ) & ( ( ( ! ( (v.x>>44)%2 ) ) ) ) )<< 41 ;
        aux.x |=(unsigned long long) ( ( (v.y>>3)%2 ) )<< 42 ;
        aux.x |=(unsigned long long) ( ( (v.y>>4)%2 ) )<< 43 ;


        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_14_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( (v.y>>16)%2 ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.x>>39)%2 ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( (v.x>>11)%2 ) & ( ( ( ! ( (v.y>>1)%2 ) & ! ( (v.x>>5)%2 ) & ! ( (v.x>>39)%2 ) & ! ( (v.x>>13)%2 ) ) ) ) ) | ( ( (v.x>>57)%2 ) & ( ( ( ! ( (v.y>>1)%2 ) & ! ( (v.x>>5)%2 ) & ! ( (v.x>>39)%2 ) ) & ( ( ( ( (v.x>>11)%2 ) ) ) ) ) ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) )<< 47 ;
        aux.x |=(unsigned long long) ( ( (v.x>>48)%2 ) & ( ( ( ! ( (v.x>>15)%2 ) & ! ( (v.y>>0)%2 ) & ! ( (v.x>>14)%2 ) ) ) ) ) | ( ( (v.x>>51)%2 ) & ( ( ( ( (v.x>>55)%2 ) ) ) ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( (v.x>>49)%2 ) & ( ( ( ! ( (v.y>>3)%2 ) & ! ( (v.y>>1)%2 ) & ! ( (v.x>>44)%2 ) & ! ( (v.x>>50)%2 ) ) ) ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.x>>57)%2 ) & ! ( (v.y>>1)%2 ) & ! ( (v.x>>7)%2 ) ) ) ) ) | ( ( (v.x>>57)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) )<< 50 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) )<< 51 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) & ( ( ( ! ( (v.x>>0)%2 ) ) ) ) )<< 52 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) ) | ( ( (v.x>>54)%2 ) )<< 53 ;
        aux.x |=(unsigned long long) ( ( (v.x>>20)%2 ) ) | ( ( (v.x>>30)%2 ) ) | ( ( (v.x>>40)%2 ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( (v.x>>28)%2 ) ) | ( ( (v.x>>41)%2 ) ) | ( ( (v.x>>29)%2 ) ) | ( ( (v.x>>24)%2 ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( (v.x>>25)%2 ) & ( ( ( ! ( (v.x>>15)%2 ) ) ) ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( (v.x>>41)%2 ) & ( ( ( ! ( (v.x>>53)%2 ) ) ) ) ) | ( ( (v.x>>31)%2 ) & ( ( ( ! ( (v.x>>53)%2 ) ) ) ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( (v.x>>33)%2 ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( (v.x>>44)%2 ) )<< 59 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) )<< 60 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 61 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) )<< 62 ;
        aux.x |=(unsigned long long) ( ( (v.x>>48)%2 ) )<< 63 ;
        aux.y |=(unsigned long long) ( ( (v.y>>0)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>15)%2 ) & ! ( (v.x>>14)%2 ) ) ) ) ) | ( ( (v.x>>54)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>15)%2 ) & ! ( (v.x>>14)%2 ) ) ) ) )<<0;
        aux.y |=(unsigned long long) ( ( (v.y>>1)%2 ) ) | ( ( (v.y>>3)%2 ) ) | ( ( (v.y>>0)%2 ) & ( ( ( ! ( (v.x>>50)%2 ) ) ) ) ) | ( ( (v.x>>48)%2 ) ) | ( ( (v.x>>7)%2 ) & ( ( ( ! ( (v.x>>8)%2 ) ) ) ) ) | ( ( (v.x>>15)%2 ) ) | ( ( (v.x>>14)%2 ) )<<1;
        aux.y |=(unsigned long long) ( ( (v.x>>5)%2 ) )<<2;


        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}


unsigned long long confere_bool_14(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( (v.x>>62)%2 ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( (v.x>>4)%2 ) ) | ( ( (v.x>>46)%2 ) )<< 1 ;
        aux.x |=(unsigned long long) ( ( (v.x>>44)%2 ) & ( ( ( ( (v.x>>59)%2 ) ) ) ) )<< 2 ;
        aux.x |=(unsigned long long) ( ( (v.x>>12)%2 ) ) | ( ( (v.x>>57)%2 ) )<< 3 ;
        aux.x |=(unsigned long long) ( ( (v.x>>28)%2 ) & ( ( ( ( (v.x>>11)%2 ) ) & ( ( ( ! ( (v.x>>5)%2 ) & ! ( (v.x>>39)%2 ) ) ) ) ) ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( (v.x>>39)%2 ) & ( ( ( ! ( (v.x>>46)%2 ) & ! ( (v.x>>4)%2 ) & ! ( (v.x>>1)%2 ) ) ) ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( (v.x>>46)%2 ) )<< 6 ;
        aux.x |=(unsigned long long) ( ( (v.y>>1)%2 ) & ( ( ( ! ( (v.x>>11)%2 ) & ! ( (v.x>>50)%2 ) ) ) ) ) | ( ( (v.x>>44)%2 ) & ( ( ( ! ( (v.x>>11)%2 ) & ! ( (v.x>>50)%2 ) ) ) ) ) | ( ( (v.x>>7)%2 ) & ( ( ( ! ( (v.x>>11)%2 ) & ! ( (v.x>>50)%2 ) ) ) ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( (v.x>>50)%2 ) & ( ( ( ! ( (v.y>>3)%2 ) & ! ( (v.y>>1)%2 ) & ! ( (v.x>>11)%2 ) ) ) ) ) | ( ( (v.x>>44)%2 ) & ( ( ( ! ( (v.y>>3)%2 ) & ! ( (v.y>>1)%2 ) & ! ( (v.x>>11)%2 ) ) ) ) ) | ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.y>>3)%2 ) & ! ( (v.y>>1)%2 ) & ! ( (v.x>>11)%2 ) ) ) ) )<< 8 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) & ( ( ( ( (v.x>>50)%2 ) ) ) ) ) | ( ( (v.x>>30)%2 ) & ( ( ( ( (v.x>>50)%2 ) ) ) ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( (v.x>>13)%2 ) ) | ( ( (v.y>>4)%2 ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>49)%2 ) & ( ( ( ! ( (v.x>>50)%2 ) ) ) ) )<< 11 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.y>>6)%2 ) & ( ( ( ! ( (v.x>>46)%2 ) ) ) ) ) | ( ( (v.y>>7)%2 ) & ( ( ( ! ( (v.x>>46)%2 ) ) ) ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>15)%2 ) & ! ( (v.x>>55)%2 ) & ! ( (v.y>>0)%2 ) ) ) ) ) | ( ( (v.x>>51)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>15)%2 ) & ! ( (v.x>>55)%2 ) & ! ( (v.y>>0)%2 ) ) ) ) ) | ( ( (v.x>>52)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>15)%2 ) & ! ( (v.x>>55)%2 ) & ! ( (v.y>>0)%2 ) ) ) ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( (v.x>>59)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>49)%2 ) & ! ( (v.x>>18)%2 ) & ! ( (v.y>>0)%2 ) & ! ( (v.x>>14)%2 ) ) ) ) ) | ( ( (v.x>>58)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>49)%2 ) & ! ( (v.x>>18)%2 ) & ! ( (v.y>>0)%2 ) & ! ( (v.x>>14)%2 ) ) ) ) ) | ( ( (v.x>>15)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>49)%2 ) & ! ( (v.x>>18)%2 ) & ! ( (v.y>>0)%2 ) & ! ( (v.x>>14)%2 ) ) ) ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( (v.x>>38)%2 ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( (v.x>>44)%2 ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( (v.x>>43)%2 ) )<< 19 ;
        aux.x |=(unsigned long long) ( ( (v.y>>8)%2 ) )<< 20 ;
        aux.x |=(unsigned long long) ( ( (v.x>>56)%2 ) & ( ( ( ! ( (v.x>>55)%2 ) ) ) ) ) | ( ( (v.x>>9)%2 ) & ( ( ( ! ( (v.x>>55)%2 ) ) ) ) ) | ( ( (v.x>>37)%2 ) & ( ( ( ! ( (v.x>>55)%2 ) ) ) ) ) | ( ( (v.y>>0)%2 ) & ( ( ( ! ( (v.x>>55)%2 ) ) ) ) )<< 21 ;
        aux.x |=(unsigned long long) ( ( (v.x>>21)%2 ) )<< 22 ;
        aux.x |=(unsigned long long) ( ( (v.x>>15)%2 ) )<< 23 ;
        aux.x |=(unsigned long long) ( ( (v.x>>23)%2 ) )<< 24 ;
        aux.x |=(unsigned long long) ( ( (v.y>>9)%2 ) & ( ( ( ! ( (v.x>>58)%2 ) ) ) ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( (v.x>>48)%2 ) )<< 26 ;
        aux.x |=(unsigned long long) ( ( (v.y>>10)%2 ) & ( ( ( ! ( (v.x>>58)%2 ) ) ) ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( (v.y>>11)%2 ) )<< 28 ;
        aux.x |=(unsigned long long) ( ( (v.y>>12)%2 ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( (v.y>>13)%2 ) )<< 30 ;
        aux.x |=(unsigned long long) ( ( (v.y>>14)%2 ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( (v.x>>15)%2 ) & ( ( ( ! ( (v.x>>54)%2 ) ) ) ) )<< 32 ;
        aux.x |=(unsigned long long) ( ( (v.x>>32)%2 ) & ( ( ( ! ( (v.x>>53)%2 ) ) ) ) )<< 33 ;
        aux.x |=(unsigned long long) ( ( (v.x>>48)%2 ) )<< 34 ;
        aux.x |=(unsigned long long) ( ( (v.x>>34)%2 ) )<< 35 ;
        aux.x |=(unsigned long long) ( ( (v.y>>15)%2 ) & ( ( ( ! ( (v.y>>3)%2 ) ) ) ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.x>>27)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.x>>45)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ( ( (v.x>>5)%2 ) & ( ( ( ! ( (v.x>>13)%2 ) ) & ( ( ( ( (v.x>>11)%2 ) ) ) ) ) ) ) | ( ( (v.x>>43)%2 ) & ( ( ( ! ( (v.x>>13)%2 ) ) & ( ( ( ( (v.x>>11)%2 ) ) ) ) ) ) )<< 39 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( (v.x>>36)%2 ) & ( ( ( ! ( (v.x>>44)%2 ) ) ) ) ) | ( ( (v.x>>35)%2 ) & ( ( ( ! ( (v.x>>44)%2 ) ) ) ) )<< 41 ;
        aux.x |=(unsigned long long) ( ( (v.y>>3)%2 ) )<< 42 ;
        aux.x |=(unsigned long long) ( ( (v.y>>4)%2 ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( (v.y>>16)%2 ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.x>>39)%2 ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( (v.x>>11)%2 ) & ( ( ( ! ( (v.y>>1)%2 ) & ! ( (v.x>>5)%2 ) & ! ( (v.x>>39)%2 ) & ! ( (v.x>>13)%2 ) ) ) ) ) | ( ( (v.x>>57)%2 ) & ( ( ( ! ( (v.y>>1)%2 ) & ! ( (v.x>>5)%2 ) & ! ( (v.x>>39)%2 ) ) & ( ( ( ( (v.x>>11)%2 ) ) ) ) ) ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) )<< 47 ;
        aux.x |=(unsigned long long) ( ( (v.x>>48)%2 ) & ( ( ( ! ( (v.x>>15)%2 ) & ! ( (v.y>>0)%2 ) & ! ( (v.x>>14)%2 ) ) ) ) ) | ( ( (v.x>>51)%2 ) & ( ( ( ( (v.x>>55)%2 ) ) ) ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( (v.x>>49)%2 ) & ( ( ( ! ( (v.y>>3)%2 ) & ! ( (v.y>>1)%2 ) & ! ( (v.x>>44)%2 ) & ! ( (v.x>>50)%2 ) ) ) ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.x>>57)%2 ) & ! ( (v.y>>1)%2 ) & ! ( (v.x>>7)%2 ) ) ) ) ) | ( ( (v.x>>57)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) )<< 50 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) )<< 51 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) & ( ( ( ! ( (v.x>>0)%2 ) ) ) ) )<< 52 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) ) | ( ( (v.x>>54)%2 ) )<< 53 ;
        aux.x |=(unsigned long long) ( ( (v.x>>20)%2 ) ) | ( ( (v.x>>30)%2 ) ) | ( ( (v.x>>40)%2 ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( (v.x>>28)%2 ) ) | ( ( (v.x>>41)%2 ) ) | ( ( (v.x>>29)%2 ) ) | ( ( (v.x>>24)%2 ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( (v.x>>25)%2 ) & ( ( ( ! ( (v.x>>15)%2 ) ) ) ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( (v.x>>41)%2 ) & ( ( ( ! ( (v.x>>53)%2 ) ) ) ) ) | ( ( (v.x>>31)%2 ) & ( ( ( ! ( (v.x>>53)%2 ) ) ) ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( (v.x>>33)%2 ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( (v.x>>44)%2 ) )<< 59 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) )<< 60 ;
        aux.x |=(unsigned long long) ( ( (v.x>>60)%2 ) )<< 61 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) )<< 62 ;
        aux.x |=(unsigned long long) ( ( (v.x>>48)%2 ) )<< 63 ;
        aux.y |=(unsigned long long) ( ( (v.y>>0)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>15)%2 ) & ! ( (v.x>>14)%2 ) ) ) ) ) | ( ( (v.x>>54)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) & ! ( (v.x>>15)%2 ) & ! ( (v.x>>14)%2 ) ) ) ) )<<0;
        aux.y |=(unsigned long long) ( ( (v.y>>1)%2 ) ) | ( ( (v.y>>3)%2 ) ) | ( ( (v.y>>0)%2 ) & ( ( ( ! ( (v.x>>50)%2 ) ) ) ) ) | ( ( (v.x>>48)%2 ) ) | ( ( (v.x>>7)%2 ) & ( ( ( ! ( (v.x>>8)%2 ) ) ) ) ) | ( ( (v.x>>15)%2 ) ) | ( ( (v.x>>14)%2 ) )<<1;
        aux.y |=(unsigned long long) ( ( (v.x>>5)%2 ) )<<2;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_14_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( ( (v.x>>62)%2 ) * 2) >= 2 ) <<0;
        aux.x |=(unsigned long long) ( ( ( (v.x>>4)%2 ) * 2 + ( (v.x>>46)%2 ) * 2) >= 2 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>44)%2 ) * 2 + ( (v.x>>59)%2 ) * 2) >= 4 ) <<2;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2 + ( (v.x>>11)%2 ) * 2 + ( (v.x>>5)%2 ) * -2 + ( (v.x>>39)%2 ) * -2) >= 4 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) * 2 + ( (v.x>>46)%2 ) * -2 + ( (v.x>>4)%2 ) * -2 + ( (v.x>>1)%2 ) * -2) >= 2 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * 2) >= 2 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.y>>1)%2 ) * 2 + ( (v.x>>11)%2 ) * -14 + ( (v.x>>50)%2 ) * -14 + ( (v.x>>44)%2 ) * 2 + ( (v.x>>7)%2 ) * 2) >= 2 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.x>>50)%2 ) * 2 + 0 * -14 + ( (v.y>>1)%2 ) * -14 + ( (v.x>>11)%2 ) * -14 + ( (v.x>>44)%2 ) * 2 + ( (v.x>>8)%2 ) * 2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2 + ( (v.x>>50)%2 ) * 6 + ( (v.x>>30)%2 ) * 2) >= 8 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>13)%2 ) * 2 + ( (v.y>>4)%2 ) * 2) >= 2 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>49)%2 ) * 2 + ( (v.x>>50)%2 ) * -2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.y>>5)%2 ) * 2) >= 4 ) <<12;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>46)%2 ) * -6 + ( (v.y>>7)%2 ) * 2) >= 2 ) <<13;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.x>>48)%2 ) * -14 + ( (v.x>>15)%2 ) * -14 + ( (v.x>>55)%2 ) * -14 + ( (v.y>>0)%2 ) * -14 + ( (v.x>>51)%2 ) * 2 + ( (v.x>>52)%2 ) * 2) >= 2 ) <<14;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2 + ( (v.x>>48)%2 ) * -14 + ( (v.x>>49)%2 ) * -14 + ( (v.x>>18)%2 ) * -14 + ( (v.y>>0)%2 ) * -14 + ( (v.x>>14)%2 ) * -14 + ( (v.x>>58)%2 ) * 2 + ( (v.x>>15)%2 ) * 2) >= 2 ) <<15;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2) >= 2 ) <<16;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2) >= 2 ) <<17;
        aux.x |=(unsigned long long) ( ( ( (v.x>>44)%2 ) * 2) >= 2 ) <<18;
        aux.x |=(unsigned long long) ( ( ( (v.x>>43)%2 ) * 2) >= 2 ) <<19;
        aux.x |=(unsigned long long) ( ( ( (v.y>>8)%2 ) * 2) >= 2 ) <<20;
        aux.x |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>55)%2 ) * -30 + ( (v.x>>9)%2 ) * 2 + ( (v.x>>37)%2 ) * 2 + ( (v.y>>0)%2 ) * 2) >= 2 ) <<21;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_14_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( ( (v.x>>21)%2 ) * 2) >= 2 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) * 2) >= 2 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.x>>23)%2 ) * 2) >= 2 ) <<24;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>58)%2 ) * -2) >= 2 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.x>>48)%2 ) * 2) >= 2 ) <<26;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>58)%2 ) * -2) >= 2 ) <<27;
        aux.x |=(unsigned long long) ( ( ( (v.y>>11)%2 ) * 2) >= 2 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.y>>12)%2 ) * 2) >= 2 ) <<29;
        aux.x |=(unsigned long long) ( ( ( (v.y>>13)%2 ) * 2) >= 2 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.y>>14)%2 ) * 2) >= 2 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) * 2 + ( (v.x>>54)%2 ) * -2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.x>>32)%2 ) * 2 + ( (v.x>>53)%2 ) * -2) >= 2 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.x>>48)%2 ) * 2) >= 2 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>34)%2 ) * 2) >= 2 ) <<35;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.y>>3)%2 ) * -2) >= 2 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 2) >= 2 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.x>>45)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.x>>5)%2 ) * 2 + ( (v.x>>13)%2 ) * -6 + ( (v.x>>11)%2 ) * 6 + ( (v.x>>43)%2 ) * 2) >= 8 ) <<39;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) * 2 + ( (v.x>>44)%2 ) * -6 + ( (v.x>>35)%2 ) * 2) >= 2 ) <<41;
        aux.x |=(unsigned long long) ( ( ( (v.y>>3)%2 ) * 2) >= 2 ) <<42;
        aux.x |=(unsigned long long) ( ( ( (v.y>>4)%2 ) * 2) >= 2 ) <<43;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_14_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( ( (v.y>>16)%2 ) * 2) >= 2 ) <<44;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) * 2) >= 2 ) <<45;
        aux.x |=(unsigned long long) ( ( ( (v.x>>11)%2 ) * 6 + ( (v.y>>1)%2 ) * -6 + ( (v.x>>5)%2 ) * -6 + ( (v.x>>39)%2 ) * -6 + ( (v.x>>13)%2 ) * -2 + ( (v.x>>57)%2 ) * 2) >= 6 ) <<46;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2) >= 2 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.x>>48)%2 ) * 6 + ( (v.x>>15)%2 ) * -6 + ( (v.y>>0)%2 ) * -6 + ( (v.x>>14)%2 ) * -6 + ( (v.x>>51)%2 ) * 30 + ( (v.x>>55)%2 ) * 30) >= 6 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.x>>49)%2 ) * 2 + 0 * -2 + ( (v.y>>1)%2 ) * -2 + ( (v.x>>44)%2 ) * -2 + ( (v.x>>50)%2 ) * -2) >= 2 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>8)%2 ) * 10 + ( (v.x>>57)%2 ) * 6 + ( (v.y>>1)%2 ) * -2 + ( (v.x>>7)%2 ) * -2) >= 10 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2) >= 2 ) <<51;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>0)%2 ) * -2) >= 2 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2 + ( (v.x>>54)%2 ) * 2) >= 2 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.x>>20)%2 ) * 2 + ( (v.x>>30)%2 ) * 2 + ( (v.x>>40)%2 ) * 2) >= 2 ) <<54;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2 + ( (v.x>>41)%2 ) * 2 + ( (v.x>>29)%2 ) * 2 + ( (v.x>>24)%2 ) * 2) >= 2 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>25)%2 ) * 2 + ( (v.x>>15)%2 ) * -2) >= 2 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2 + ( (v.x>>53)%2 ) * -6 + ( (v.x>>31)%2 ) * 2) >= 2 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 2) >= 2 ) <<58;
        aux.x |=(unsigned long long) ( ( ( (v.x>>44)%2 ) * 2) >= 2 ) <<59;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<60;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<61;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2) >= 2 ) <<62;
        aux.x |=(unsigned long long) ( ( ( (v.x>>48)%2 ) * 2) >= 2 ) <<63;
        aux.y |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2 + ( (v.x>>48)%2 ) * -6 + ( (v.x>>15)%2 ) * -6 + ( (v.x>>14)%2 ) * -6 + ( (v.x>>54)%2 ) * 2) >= 2 ) <<0;
        aux.y |=(unsigned long long) ( ( ( (v.y>>1)%2 ) * 18 + 0 * 18 + ( (v.y>>0)%2 ) * 6 + ( (v.x>>50)%2 ) * -6 + ( (v.x>>48)%2 ) * 18 + ( (v.x>>7)%2 ) * 6 + ( (v.x>>8)%2 ) * -6 + ( (v.x>>15)%2 ) * 18 + ( (v.x>>14)%2 ) * 18) >= 0 ) <<1;
        aux.y |=(unsigned long long) ( ( ( (v.x>>5)%2 ) * 2) >= 2 ) <<2;

        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

unsigned long long confere_tlf_14(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>62)%2 ) * 2) >= 2 ) <<0;
        aux.x |=(unsigned long long) ( ( ( (v.x>>4)%2 ) * 2 + ( (v.x>>46)%2 ) * 2) >= 2 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>44)%2 ) * 2 + ( (v.x>>59)%2 ) * 2) >= 4 ) <<2;
        aux.x |=(unsigned long long) ( ( ( (v.x>>12)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2 + ( (v.x>>11)%2 ) * 2 + ( (v.x>>5)%2 ) * -2 + ( (v.x>>39)%2 ) * -2) >= 4 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) * 2 + ( (v.x>>46)%2 ) * -2 + ( (v.x>>4)%2 ) * -2 + ( (v.x>>1)%2 ) * -2) >= 2 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * 2) >= 2 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.y>>1)%2 ) * 2 + ( (v.x>>11)%2 ) * -14 + ( (v.x>>50)%2 ) * -14 + ( (v.x>>44)%2 ) * 2 + ( (v.x>>7)%2 ) * 2) >= 2 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.x>>50)%2 ) * 2 + 0 * -14 + ( (v.y>>1)%2 ) * -14 + ( (v.x>>11)%2 ) * -14 + ( (v.x>>44)%2 ) * 2 + ( (v.x>>8)%2 ) * 2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2 + ( (v.x>>50)%2 ) * 6 + ( (v.x>>30)%2 ) * 2) >= 8 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>13)%2 ) * 2 + ( (v.y>>4)%2 ) * 2) >= 2 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>49)%2 ) * 2 + ( (v.x>>50)%2 ) * -2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.y>>5)%2 ) * 2) >= 4 ) <<12;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>46)%2 ) * -6 + ( (v.y>>7)%2 ) * 2) >= 2 ) <<13;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.x>>48)%2 ) * -14 + ( (v.x>>15)%2 ) * -14 + ( (v.x>>55)%2 ) * -14 + ( (v.y>>0)%2 ) * -14 + ( (v.x>>51)%2 ) * 2 + ( (v.x>>52)%2 ) * 2) >= 2 ) <<14;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2 + ( (v.x>>48)%2 ) * -14 + ( (v.x>>49)%2 ) * -14 + ( (v.x>>18)%2 ) * -14 + ( (v.y>>0)%2 ) * -14 + ( (v.x>>14)%2 ) * -14 + ( (v.x>>58)%2 ) * 2 + ( (v.x>>15)%2 ) * 2) >= 2 ) <<15;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2) >= 2 ) <<16;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2) >= 2 ) <<17;
        aux.x |=(unsigned long long) ( ( ( (v.x>>44)%2 ) * 2) >= 2 ) <<18;
        aux.x |=(unsigned long long) ( ( ( (v.x>>43)%2 ) * 2) >= 2 ) <<19;
        aux.x |=(unsigned long long) ( ( ( (v.y>>8)%2 ) * 2) >= 2 ) <<20;
        aux.x |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>55)%2 ) * -30 + ( (v.x>>9)%2 ) * 2 + ( (v.x>>37)%2 ) * 2 + ( (v.y>>0)%2 ) * 2) >= 2 ) <<21;
        aux.x |=(unsigned long long) ( ( ( (v.x>>21)%2 ) * 2) >= 2 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) * 2) >= 2 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.x>>23)%2 ) * 2) >= 2 ) <<24;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>58)%2 ) * -2) >= 2 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.x>>48)%2 ) * 2) >= 2 ) <<26;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>58)%2 ) * -2) >= 2 ) <<27;
        aux.x |=(unsigned long long) ( ( ( (v.y>>11)%2 ) * 2) >= 2 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.y>>12)%2 ) * 2) >= 2 ) <<29;
        aux.x |=(unsigned long long) ( ( ( (v.y>>13)%2 ) * 2) >= 2 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.y>>14)%2 ) * 2) >= 2 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) * 2 + ( (v.x>>54)%2 ) * -2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.x>>32)%2 ) * 2 + ( (v.x>>53)%2 ) * -2) >= 2 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.x>>48)%2 ) * 2) >= 2 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>34)%2 ) * 2) >= 2 ) <<35;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.y>>3)%2 ) * -2) >= 2 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 2) >= 2 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.x>>45)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.x>>5)%2 ) * 2 + ( (v.x>>13)%2 ) * -6 + ( (v.x>>11)%2 ) * 6 + ( (v.x>>43)%2 ) * 2) >= 8 ) <<39;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) * 2 + ( (v.x>>44)%2 ) * -6 + ( (v.x>>35)%2 ) * 2) >= 2 ) <<41;
        aux.x |=(unsigned long long) ( ( ( (v.y>>3)%2 ) * 2) >= 2 ) <<42;
        aux.x |=(unsigned long long) ( ( ( (v.y>>4)%2 ) * 2) >= 2 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.y>>16)%2 ) * 2) >= 2 ) <<44;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) * 2) >= 2 ) <<45;
        aux.x |=(unsigned long long) ( ( ( (v.x>>11)%2 ) * 6 + ( (v.y>>1)%2 ) * -6 + ( (v.x>>5)%2 ) * -6 + ( (v.x>>39)%2 ) * -6 + ( (v.x>>13)%2 ) * -2 + ( (v.x>>57)%2 ) * 2) >= 6 ) <<46;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2) >= 2 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.x>>48)%2 ) * 6 + ( (v.x>>15)%2 ) * -6 + ( (v.y>>0)%2 ) * -6 + ( (v.x>>14)%2 ) * -6 + ( (v.x>>51)%2 ) * 30 + ( (v.x>>55)%2 ) * 30) >= 6 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.x>>49)%2 ) * 2 + 0 * -2 + ( (v.y>>1)%2 ) * -2 + ( (v.x>>44)%2 ) * -2 + ( (v.x>>50)%2 ) * -2) >= 2 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>8)%2 ) * 10 + ( (v.x>>57)%2 ) * 6 + ( (v.y>>1)%2 ) * -2 + ( (v.x>>7)%2 ) * -2) >= 10 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2) >= 2 ) <<51;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>0)%2 ) * -2) >= 2 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2 + ( (v.x>>54)%2 ) * 2) >= 2 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.x>>20)%2 ) * 2 + ( (v.x>>30)%2 ) * 2 + ( (v.x>>40)%2 ) * 2) >= 2 ) <<54;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2 + ( (v.x>>41)%2 ) * 2 + ( (v.x>>29)%2 ) * 2 + ( (v.x>>24)%2 ) * 2) >= 2 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>25)%2 ) * 2 + ( (v.x>>15)%2 ) * -2) >= 2 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2 + ( (v.x>>53)%2 ) * -6 + ( (v.x>>31)%2 ) * 2) >= 2 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 2) >= 2 ) <<58;
        aux.x |=(unsigned long long) ( ( ( (v.x>>44)%2 ) * 2) >= 2 ) <<59;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<60;
        aux.x |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<61;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2) >= 2 ) <<62;
        aux.x |=(unsigned long long) ( ( ( (v.x>>48)%2 ) * 2) >= 2 ) <<63;
        aux.y |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2 + ( (v.x>>48)%2 ) * -6 + ( (v.x>>15)%2 ) * -6 + ( (v.x>>14)%2 ) * -6 + ( (v.x>>54)%2 ) * 2) >= 2 ) <<0;
        aux.y |=(unsigned long long) ( ( ( (v.y>>1)%2 ) * 18 + 0 * 18 + ( (v.y>>0)%2 ) * 6 + ( (v.x>>50)%2 ) * -6 + ( (v.x>>48)%2 ) * 18 + ( (v.x>>7)%2 ) * 6 + ( (v.x>>8)%2 ) * -6 + ( (v.x>>15)%2 ) * 18 + ( (v.x>>14)%2 ) * 18) >= 0 ) <<1;
        aux.y |=(unsigned long long) ( ( ( (v.x>>5)%2 ) * 2) >= 2 ) <<2;

        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 15
__global__ void passo_bool_15_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) ) & !( ( (v.y>>7)%2 ) ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.y>>8)%2 ) & ( ( ( ( (v.x>>42)%2 ) & ( (v.x>>46)%2 ) ) ) ) ) & !( ( (v.y>>9)%2 ) ) ) & !( ( (v.y>>10)%2 ) ) )<< 1 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>63)%2 ) ) & !( ( (v.x>>27)%2 ) ) ) & !( ( (v.x>>7)%2 ) ) ) & !( ( (v.x>>3)%2 ) ) )<< 2 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>1)%2 ) ) ) ) | !( ( (v.x>>1)%2 ) )<< 3 ;
        aux.x |=(unsigned long long) ( ( (v.x>>30)%2 ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( (v.x>>4)%2 ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( (v.x>>5)%2 ) )<< 6 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>1)%2 ) ) ) ) | !( ( (v.x>>1)%2 ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) ) | ( ( (v.x>>43)%2 ) )<< 8 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) )<< 11 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>10)%2 ) & ( ( ( ( (v.x>>63)%2 ) ) ) ) ) & !( ( (v.y>>7)%2 ) ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.x>>8)%2 ) ) | ( ( (v.x>>9)%2 ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( (v.x>>34)%2 ) ) | ( ( (v.y>>11)%2 ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( (v.x>>24)%2 ) ) | ( ( (v.x>>25)%2 ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( (v.x>>29)%2 ) ) | ( ( (v.x>>26)%2 ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( (v.x>>47)%2 ) ) | ( ( (v.x>>41)%2 ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( (v.x>>47)%2 ) ) | ( ( (v.x>>6)%2 ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( (v.x>>36)%2 ) )<< 19 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>1)%2 ) ) ) ) | !( ( (v.x>>1)%2 ) )<< 20 ;
        aux.x |=(unsigned long long) ( ( (v.x>>26)%2 ) ) | ( ( (v.x>>19)%2 ) & ( ( ( ( (v.x>>46)%2 ) ) ) ) )<< 21 ;
        aux.x |=(unsigned long long) ( ( (v.x>>21)%2 ) & ( ( ( ( (v.x>>14)%2 ) ) ) ) )<< 22 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>6)%2 ) ) | ( ( (v.x>>40)%2 ) ) ) ) | !( ( (v.x>>40)%2 ) | ( (v.x>>6)%2 ) )<< 23 ;

        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_15_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( (v.y>>12)%2 ) )<< 24 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>12)%2 ) ) & !( ( (v.x>>23)%2 ) ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( (v.x>>29)%2 ) ) | ( ( (v.x>>56)%2 ) )<< 26 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>1)%2 ) ) ) ) | !( ( (v.x>>1)%2 ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( (v.y>>13)%2 ) & ( ( ( ( (v.x>>15)%2 ) ) ) ) )<< 28 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>28)%2 ) & ( ( ( ( (v.x>>34)%2 ) ) ) ) ) & !( ( (v.x>>57)%2 ) ) ) & !( ( (v.x>>56)%2 ) ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( (v.x>>48)%2 ) )<< 30 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>59)%2 ) ) | ( ( (v.x>>58)%2 ) ) ) ) | !( ( (v.x>>58)%2 ) | ( (v.x>>59)%2 ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( (v.x>>47)%2 ) ) | ( ( (v.x>>19)%2 ) )<< 32 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>32)%2 ) ) | ( ( (v.x>>56)%2 ) ) | ( ( (v.x>>57)%2 ) ) ) ) | !( ( (v.x>>32)%2 ) | ( (v.x>>56)%2 ) | ( (v.x>>57)%2 ) )<< 33 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>58)%2 ) ) | ( ( (v.x>>56)%2 ) ) | ( ( (v.x>>57)%2 ) ) | ( ( (v.x>>59)%2 ) ) ) ) | !( ( (v.x>>56)%2 ) | ( (v.x>>58)%2 ) | ( (v.x>>57)%2 ) | ( (v.x>>59)%2 ) )<< 34 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) )<< 35 ;
        aux.x |=(unsigned long long) ( ( (v.x>>52)%2 ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.x>>39)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.x>>29)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ( ( (v.x>>51)%2 ) )<< 39 ;
        aux.x |=(unsigned long long) ( ( (v.x>>43)%2 ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( (v.y>>14)%2 ) )<< 41 ;
        aux.x |=(unsigned long long) ( ( (v.y>>14)%2 ) )<< 42 ;
        aux.x |=(unsigned long long) ( ( (v.x>>38)%2 ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( (v.x>>41)%2 ) ) | ( ( (v.x>>1)%2 ) ) | ( ( (v.x>>19)%2 ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) & ( ( ( ( (v.y>>15)%2 ) ) ) ) ) | ( ( (v.x>>53)%2 ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>45)%2 ) ) & !( ( (v.y>>16)%2 ) ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( (v.x>>37)%2 ) )<< 47 ;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_15_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) ) | ( ( (v.x>>8)%2 ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) ) | ( ( (v.x>>44)%2 ) ) | ( ( (v.x>>6)%2 ) ) | ( ( (v.x>>19)%2 ) ) ) | !( ( (v.x>>8)%2 ) | ( (v.x>>63)%2 ) | ( (v.x>>44)%2 ) | ( (v.x>>20)%2 ) | ( (v.x>>19)%2 ) | ( (v.x>>6)%2 ) )<< 50 ;
        aux.x |=(unsigned long long) ( ( (v.y>>6)%2 ) )<< 51 ;
        aux.x |=(unsigned long long) ( ( (v.x>>53)%2 ) )<< 52 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>26)%2 ) ) & !( ( (v.x>>54)%2 ) ) )<< 53 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) ) & !( ( (v.x>>57)%2 ) ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( (v.x>>13)%2 ) & ( ( ( ( (v.y>>7)%2 ) & ( (v.x>>63)%2 ) ) ) ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>34)%2 ) ) ) ) ) & !( ( (v.y>>17)%2 ) ) ) & !( ( (v.x>>59)%2 ) ) ) & !( ( (v.y>>18)%2 ) ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>22)%2 ) & ( ( ( ( (v.x>>56)%2 ) ) ) ) ) & !( ( (v.y>>18)%2 ) ) ) & !( ( (v.y>>17)%2 ) ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( (v.x>>43)%2 ) ) | ( ( (v.y>>7)%2 ) ) | ( ( (v.x>>63)%2 ) ) | ( ( (v.x>>19)%2 ) )<< 59 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>34)%2 ) ) ) ) ) & !( ( (v.x>>56)%2 ) ) ) & !( ( (v.y>>19)%2 ) ) ) & !( ( (v.x>>57)%2 ) ) )<< 60 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>18)%2 ) & ( ( ( ( (v.x>>60)%2 ) ) ) ) ) & !( ( (v.y>>20)%2 ) ) ) & !( ( (v.y>>21)%2 ) ) )<< 61 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>34)%2 ) ) ) ) ) & !( ( (v.x>>56)%2 ) ) ) & !( ( (v.y>>19)%2 ) ) ) & !( ( (v.x>>57)%2 ) ) )<< 62 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>17)%2 ) & ( ( ( ( (v.x>>62)%2 ) ) ) ) ) & !( ( (v.y>>20)%2 ) ) ) & !( ( (v.y>>22)%2 ) ) )<< 63 ;
        aux.y |=(unsigned long long) ( ( (v.x>>56)%2 ) ) | ( ( (v.x>>57)%2 ) )<<0;
        aux.y |=(unsigned long long) ( ( (v.x>>56)%2 ) ) | ( ( (v.x>>57)%2 ) )<<1;
        aux.y |=(unsigned long long) ( ( (v.x>>56)%2 ) ) | ( ( (v.x>>57)%2 ) )<<2;
        aux.y |=(unsigned long long) ( ( (v.x>>58)%2 ) )<<3;
        aux.y |=(unsigned long long) ( ( (v.x>>59)%2 ) )<<4;
        aux.y |=(unsigned long long) ( ( (v.x>>8)%2 ) ) | ( ( (v.x>>9)%2 ) )<<5;
        aux.y |=(unsigned long long) ( ( ( (v.x>>16)%2 ) ) & !( ( (v.x>>58)%2 ) ) )<<6;

        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

unsigned long long confere_bool_15(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) ) & !( ( (v.y>>7)%2 ) ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.y>>8)%2 ) & ( ( ( ( (v.x>>42)%2 ) & ( (v.x>>46)%2 ) ) ) ) ) & !( ( (v.y>>9)%2 ) ) ) & !( ( (v.y>>10)%2 ) ) )<< 1 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>63)%2 ) ) & !( ( (v.x>>27)%2 ) ) ) & !( ( (v.x>>7)%2 ) ) ) & !( ( (v.x>>3)%2 ) ) )<< 2 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>1)%2 ) ) ) ) | !( ( (v.x>>1)%2 ) )<< 3 ;
        aux.x |=(unsigned long long) ( ( (v.x>>30)%2 ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( (v.x>>4)%2 ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( (v.x>>5)%2 ) )<< 6 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>1)%2 ) ) ) ) | !( ( (v.x>>1)%2 ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) ) | ( ( (v.x>>43)%2 ) )<< 8 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) )<< 11 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>10)%2 ) & ( ( ( ( (v.x>>63)%2 ) ) ) ) ) & !( ( (v.y>>7)%2 ) ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.x>>8)%2 ) ) | ( ( (v.x>>9)%2 ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( (v.x>>34)%2 ) ) | ( ( (v.y>>11)%2 ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( (v.x>>24)%2 ) ) | ( ( (v.x>>25)%2 ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( (v.x>>29)%2 ) ) | ( ( (v.x>>26)%2 ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( (v.x>>47)%2 ) ) | ( ( (v.x>>41)%2 ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( (v.x>>47)%2 ) ) | ( ( (v.x>>6)%2 ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( (v.x>>36)%2 ) )<< 19 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>1)%2 ) ) ) ) | !( ( (v.x>>1)%2 ) )<< 20 ;
        aux.x |=(unsigned long long) ( ( (v.x>>26)%2 ) ) | ( ( (v.x>>19)%2 ) & ( ( ( ( (v.x>>46)%2 ) ) ) ) )<< 21 ;
        aux.x |=(unsigned long long) ( ( (v.x>>21)%2 ) & ( ( ( ( (v.x>>14)%2 ) ) ) ) )<< 22 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>6)%2 ) ) | ( ( (v.x>>40)%2 ) ) ) ) | !( ( (v.x>>40)%2 ) | ( (v.x>>6)%2 ) )<< 23 ;
        aux.x |=(unsigned long long) ( ( (v.y>>12)%2 ) )<< 24 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>12)%2 ) ) & !( ( (v.x>>23)%2 ) ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( (v.x>>29)%2 ) ) | ( ( (v.x>>56)%2 ) )<< 26 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>1)%2 ) ) ) ) | !( ( (v.x>>1)%2 ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( (v.y>>13)%2 ) & ( ( ( ( (v.x>>15)%2 ) ) ) ) )<< 28 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>28)%2 ) & ( ( ( ( (v.x>>34)%2 ) ) ) ) ) & !( ( (v.x>>57)%2 ) ) ) & !( ( (v.x>>56)%2 ) ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( (v.x>>48)%2 ) )<< 30 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>59)%2 ) ) | ( ( (v.x>>58)%2 ) ) ) ) | !( ( (v.x>>58)%2 ) | ( (v.x>>59)%2 ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( (v.x>>47)%2 ) ) | ( ( (v.x>>19)%2 ) )<< 32 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>32)%2 ) ) | ( ( (v.x>>56)%2 ) ) | ( ( (v.x>>57)%2 ) ) ) ) | !( ( (v.x>>32)%2 ) | ( (v.x>>56)%2 ) | ( (v.x>>57)%2 ) )<< 33 ;
        aux.x |=(unsigned long long) ( !( ( ( (v.x>>58)%2 ) ) | ( ( (v.x>>56)%2 ) ) | ( ( (v.x>>57)%2 ) ) | ( ( (v.x>>59)%2 ) ) ) ) | !( ( (v.x>>56)%2 ) | ( (v.x>>58)%2 ) | ( (v.x>>57)%2 ) | ( (v.x>>59)%2 ) )<< 34 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) )<< 35 ;
        aux.x |=(unsigned long long) ( ( (v.x>>52)%2 ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.x>>39)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.x>>29)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ( ( (v.x>>51)%2 ) )<< 39 ;
        aux.x |=(unsigned long long) ( ( (v.x>>43)%2 ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( (v.y>>14)%2 ) )<< 41 ;
        aux.x |=(unsigned long long) ( ( (v.y>>14)%2 ) )<< 42 ;
        aux.x |=(unsigned long long) ( ( (v.x>>38)%2 ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( (v.x>>41)%2 ) ) | ( ( (v.x>>1)%2 ) ) | ( ( (v.x>>19)%2 ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) & ( ( ( ( (v.y>>15)%2 ) ) ) ) ) | ( ( (v.x>>53)%2 ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>45)%2 ) ) & !( ( (v.y>>16)%2 ) ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( (v.x>>37)%2 ) )<< 47 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( (v.x>>9)%2 ) ) | ( ( (v.x>>8)%2 ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) ) | ( ( (v.x>>44)%2 ) ) | ( ( (v.x>>6)%2 ) ) | ( ( (v.x>>19)%2 ) ) ) | !( ( (v.x>>8)%2 ) | ( (v.x>>63)%2 ) | ( (v.x>>44)%2 ) | ( (v.x>>20)%2 ) | ( (v.x>>19)%2 ) | ( (v.x>>6)%2 ) )<< 50 ;
        aux.x |=(unsigned long long) ( ( (v.y>>6)%2 ) )<< 51 ;
        aux.x |=(unsigned long long) ( ( (v.x>>53)%2 ) )<< 52 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>26)%2 ) ) & !( ( (v.x>>54)%2 ) ) )<< 53 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) ) & !( ( (v.x>>57)%2 ) ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( (v.x>>13)%2 ) & ( ( ( ( (v.y>>7)%2 ) & ( (v.x>>63)%2 ) ) ) ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>34)%2 ) ) ) ) ) & !( ( (v.y>>17)%2 ) ) ) & !( ( (v.x>>59)%2 ) ) ) & !( ( (v.y>>18)%2 ) ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>22)%2 ) & ( ( ( ( (v.x>>56)%2 ) ) ) ) ) & !( ( (v.y>>18)%2 ) ) ) & !( ( (v.y>>17)%2 ) ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( (v.x>>63)%2 ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( (v.x>>43)%2 ) ) | ( ( (v.y>>7)%2 ) ) | ( ( (v.x>>63)%2 ) ) | ( ( (v.x>>19)%2 ) )<< 59 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>34)%2 ) ) ) ) ) & !( ( (v.x>>56)%2 ) ) ) & !( ( (v.y>>19)%2 ) ) ) & !( ( (v.x>>57)%2 ) ) )<< 60 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>18)%2 ) & ( ( ( ( (v.x>>60)%2 ) ) ) ) ) & !( ( (v.y>>20)%2 ) ) ) & !( ( (v.y>>21)%2 ) ) )<< 61 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>34)%2 ) ) ) ) ) & !( ( (v.x>>56)%2 ) ) ) & !( ( (v.y>>19)%2 ) ) ) & !( ( (v.x>>57)%2 ) ) )<< 62 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>17)%2 ) & ( ( ( ( (v.x>>62)%2 ) ) ) ) ) & !( ( (v.y>>20)%2 ) ) ) & !( ( (v.y>>22)%2 ) ) )<< 63 ;
        aux.y |=(unsigned long long) ( ( (v.x>>56)%2 ) ) | ( ( (v.x>>57)%2 ) )<<0;
        aux.y |=(unsigned long long) ( ( (v.x>>56)%2 ) ) | ( ( (v.x>>57)%2 ) )<<1;
        aux.y |=(unsigned long long) ( ( (v.x>>56)%2 ) ) | ( ( (v.x>>57)%2 ) )<<2;
        aux.y |=(unsigned long long) ( ( (v.x>>58)%2 ) )<<3;
        aux.y |=(unsigned long long) ( ( (v.x>>59)%2 ) )<<4;
        aux.y |=(unsigned long long) ( ( (v.x>>8)%2 ) ) | ( ( (v.x>>9)%2 ) )<<5;
        aux.y |=(unsigned long long) ( ( ( (v.x>>16)%2 ) ) & !( ( (v.x>>58)%2 ) ) )<<6;

        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_15_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
        
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2 + ( (v.y>>7)%2 ) * -2) >= 2 ) <<0;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>42)%2 ) * 2 + ( (v.x>>46)%2 ) * 2 + 0 * -2 + ( (v.y>>10)%2 ) * -2) >= 6 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2 + ( (v.x>>27)%2 ) * -2 + ( (v.x>>7)%2 ) * -2 + ( (v.x>>3)%2 ) * -2) >= 2 ) <<2;
        aux.x |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * -2) >= 0 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.x>>30)%2 ) * 2) >= 2 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>4)%2 ) * 2) >= 2 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>5)%2 ) * 2) >= 2 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * -2) >= 0 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2 + ( (v.x>>43)%2 ) * 2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2) >= 2 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2) >= 2 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>10)%2 ) * 2 + ( (v.x>>63)%2 ) * 2 + ( (v.y>>7)%2 ) * -2) >= 4 ) <<12;
        aux.x |=(unsigned long long) ( ( ( (v.x>>8)%2 ) * 2 + ( (v.x>>9)%2 ) * 2) >= 2 ) <<13;
        aux.x |=(unsigned long long) ( ( ( (v.x>>34)%2 ) * 2 + ( (v.y>>11)%2 ) * 2) >= 2 ) <<14;
        aux.x |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 2 + ( (v.x>>25)%2 ) * 2) >= 2 ) <<15;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>26)%2 ) * 2) >= 2 ) <<16;
        aux.x |=(unsigned long long) ( ( ( (v.x>>47)%2 ) * 2 + ( (v.x>>41)%2 ) * 2) >= 2 ) <<17;
        aux.x |=(unsigned long long) ( ( ( (v.x>>47)%2 ) * 2 + ( (v.x>>6)%2 ) * 2) >= 2 ) <<18;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) * 2) >= 2 ) <<19;
        aux.x |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * -2) >= 0 ) <<20;
        aux.x |=(unsigned long long) ( ( ( (v.x>>26)%2 ) * 6 + ( (v.x>>19)%2 ) * 2 + ( (v.x>>46)%2 ) * 2) >= 4 ) <<21;
        aux.x |=(unsigned long long) ( ( ( (v.x>>21)%2 ) * 2 + ( (v.x>>14)%2 ) * 2) >= 4 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>6)%2 ) * -2 + ( (v.x>>40)%2 ) * -2) >= 0 ) <<23;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_15_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
        
        aux.x |=(unsigned long long) ( ( ( (v.y>>12)%2 ) * 2) >= 2 ) <<24;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>23)%2 ) * -2) >= 2 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>56)%2 ) * 2) >= 2 ) <<26;
        aux.x |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * -2) >= 0 ) <<27;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>15)%2 ) * 2) >= 4 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + ( (v.x>>57)%2 ) * -2 + ( (v.x>>56)%2 ) * -2) >= 4 ) <<29;
        aux.x |=(unsigned long long) ( ( ( (v.x>>48)%2 ) * 2) >= 2 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * -2 + ( (v.x>>58)%2 ) * -2) >= 0 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.x>>47)%2 ) * 2 + ( (v.x>>19)%2 ) * 2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.x>>32)%2 ) * -2 + ( (v.x>>56)%2 ) * -2 + ( (v.x>>57)%2 ) * -2) >= 0 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.x>>58)%2 ) * -2 + ( (v.x>>56)%2 ) * -2 + ( (v.x>>57)%2 ) * -2 + ( (v.x>>59)%2 ) * -2) >= 0 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2) >= 2 ) <<35;
        aux.x |=(unsigned long long) ( ( ( (v.x>>52)%2 ) * 2) >= 2 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) * 2) >= 2 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.x>>51)%2 ) * 2) >= 2 ) <<39;
        aux.x |=(unsigned long long) ( ( ( (v.x>>43)%2 ) * 2) >= 2 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.y>>14)%2 ) * 2) >= 2 ) <<41;
        aux.x |=(unsigned long long) ( ( ( (v.y>>14)%2 ) * 2) >= 2 ) <<42;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2) >= 2 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2 + ( (v.x>>1)%2 ) * 2 + ( (v.x>>19)%2 ) * 2) >= 2 ) <<44;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2 + 0 * 2 + ( (v.x>>53)%2 ) * 6) >= 4 ) <<45;
        aux.x |=(unsigned long long) ( ( ( (v.x>>45)%2 ) * 2 + ( (v.y>>16)%2 ) * -2) >= 2 ) <<46;
        aux.x |=(unsigned long long) ( ( ( (v.x>>37)%2 ) * 2) >= 2 ) <<47;
    
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_15_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
        
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2 + ( (v.x>>8)%2 ) * 2) >= 2 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 6 + ( (v.x>>44)%2 ) * 6 + ( (v.x>>6)%2 ) * 6 + ( (v.x>>19)%2 ) * 6 + ( (v.x>>8)%2 ) * -2 + ( (v.x>>20)%2 ) * -2) >= 0 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.y>>6)%2 ) * 2) >= 2 ) <<51;
        aux.x |=(unsigned long long) ( ( ( (v.x>>53)%2 ) * 2) >= 2 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.x>>26)%2 ) * 2 + ( (v.x>>54)%2 ) * -2) >= 2 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2 + ( (v.x>>57)%2 ) * -2) >= 2 ) <<54;
        aux.x |=(unsigned long long) ( ( ( (v.x>>13)%2 ) * 2 + 0 * 2 + ( (v.x>>63)%2 ) * 2) >= 6 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + 0 * -2 + ( (v.x>>59)%2 ) * -2 + ( (v.y>>18)%2 ) * -2) >= 4 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2 + ( (v.x>>56)%2 ) * 2 + 0 * -2 + ( (v.y>>17)%2 ) * -2) >= 4 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2) >= 2 ) <<58;
        aux.x |=(unsigned long long) ( ( ( (v.x>>43)%2 ) * 2 + 0 * 2 + ( (v.x>>63)%2 ) * 2 + ( (v.x>>19)%2 ) * 2) >= 2 ) <<59;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + ( (v.x>>56)%2 ) * -2 + 0 * -2 + ( (v.x>>57)%2 ) * -2) >= 4 ) <<60;
        aux.x |=(unsigned long long) ( ( ( (v.x>>18)%2 ) * 2 + ( (v.x>>60)%2 ) * 2 + 0 * -2 + ( (v.y>>21)%2 ) * -2) >= 4 ) <<61;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + ( (v.x>>56)%2 ) * -2 + 0 * -2 + ( (v.x>>57)%2 ) * -2) >= 4 ) <<62;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2 + ( (v.x>>62)%2 ) * 2 + 0 * -2 + ( (v.y>>22)%2 ) * -2) >= 4 ) <<63;
        aux.y |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<0;
        aux.y |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<1;
        aux.y |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<2;
        aux.y |=(unsigned long long) ( ( ( (v.x>>58)%2 ) * 2) >= 2 ) <<3;
        aux.y |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2) >= 2 ) <<4;
        aux.y |=(unsigned long long) ( ( ( (v.x>>8)%2 ) * 2 + ( (v.x>>9)%2 ) * 2) >= 2 ) <<5;
        aux.y |=(unsigned long long) ( ( ( (v.x>>16)%2 ) * 2 + ( (v.x>>58)%2 ) * -2) >= 2 ) <<6;

        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

unsigned long long confere_tlf_15(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2 + ( (v.y>>7)%2 ) * -2) >= 2 ) <<0;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>42)%2 ) * 2 + ( (v.x>>46)%2 ) * 2 + 0 * -2 + ( (v.y>>10)%2 ) * -2) >= 6 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2 + ( (v.x>>27)%2 ) * -2 + ( (v.x>>7)%2 ) * -2 + ( (v.x>>3)%2 ) * -2) >= 2 ) <<2;
        aux.x |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * -2) >= 0 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.x>>30)%2 ) * 2) >= 2 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>4)%2 ) * 2) >= 2 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>5)%2 ) * 2) >= 2 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * -2) >= 0 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2 + ( (v.x>>43)%2 ) * 2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2) >= 2 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2) >= 2 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>10)%2 ) * 2 + ( (v.x>>63)%2 ) * 2 + ( (v.y>>7)%2 ) * -2) >= 4 ) <<12;
        aux.x |=(unsigned long long) ( ( ( (v.x>>8)%2 ) * 2 + ( (v.x>>9)%2 ) * 2) >= 2 ) <<13;
        aux.x |=(unsigned long long) ( ( ( (v.x>>34)%2 ) * 2 + ( (v.y>>11)%2 ) * 2) >= 2 ) <<14;
        aux.x |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 2 + ( (v.x>>25)%2 ) * 2) >= 2 ) <<15;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>26)%2 ) * 2) >= 2 ) <<16;
        aux.x |=(unsigned long long) ( ( ( (v.x>>47)%2 ) * 2 + ( (v.x>>41)%2 ) * 2) >= 2 ) <<17;
        aux.x |=(unsigned long long) ( ( ( (v.x>>47)%2 ) * 2 + ( (v.x>>6)%2 ) * 2) >= 2 ) <<18;
        aux.x |=(unsigned long long) ( ( ( (v.x>>36)%2 ) * 2) >= 2 ) <<19;
        aux.x |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * -2) >= 0 ) <<20;
        aux.x |=(unsigned long long) ( ( ( (v.x>>26)%2 ) * 6 + ( (v.x>>19)%2 ) * 2 + ( (v.x>>46)%2 ) * 2) >= 4 ) <<21;
        aux.x |=(unsigned long long) ( ( ( (v.x>>21)%2 ) * 2 + ( (v.x>>14)%2 ) * 2) >= 4 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>6)%2 ) * -2 + ( (v.x>>40)%2 ) * -2) >= 0 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.y>>12)%2 ) * 2) >= 2 ) <<24;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>23)%2 ) * -2) >= 2 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>56)%2 ) * 2) >= 2 ) <<26;
        aux.x |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * -2) >= 0 ) <<27;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>15)%2 ) * 2) >= 4 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + ( (v.x>>57)%2 ) * -2 + ( (v.x>>56)%2 ) * -2) >= 4 ) <<29;
        aux.x |=(unsigned long long) ( ( ( (v.x>>48)%2 ) * 2) >= 2 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * -2 + ( (v.x>>58)%2 ) * -2) >= 0 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.x>>47)%2 ) * 2 + ( (v.x>>19)%2 ) * 2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.x>>32)%2 ) * -2 + ( (v.x>>56)%2 ) * -2 + ( (v.x>>57)%2 ) * -2) >= 0 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.x>>58)%2 ) * -2 + ( (v.x>>56)%2 ) * -2 + ( (v.x>>57)%2 ) * -2 + ( (v.x>>59)%2 ) * -2) >= 0 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2) >= 2 ) <<35;
        aux.x |=(unsigned long long) ( ( ( (v.x>>52)%2 ) * 2) >= 2 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) * 2) >= 2 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.x>>51)%2 ) * 2) >= 2 ) <<39;
        aux.x |=(unsigned long long) ( ( ( (v.x>>43)%2 ) * 2) >= 2 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.y>>14)%2 ) * 2) >= 2 ) <<41;
        aux.x |=(unsigned long long) ( ( ( (v.y>>14)%2 ) * 2) >= 2 ) <<42;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2) >= 2 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2 + ( (v.x>>1)%2 ) * 2 + ( (v.x>>19)%2 ) * 2) >= 2 ) <<44;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2 + 0 * 2 + ( (v.x>>53)%2 ) * 6) >= 4 ) <<45;
        aux.x |=(unsigned long long) ( ( ( (v.x>>45)%2 ) * 2 + ( (v.y>>16)%2 ) * -2) >= 2 ) <<46;
        aux.x |=(unsigned long long) ( ( ( (v.x>>37)%2 ) * 2) >= 2 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2) >= 2 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.x>>9)%2 ) * 2 + ( (v.x>>8)%2 ) * 2) >= 2 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 6 + ( (v.x>>44)%2 ) * 6 + ( (v.x>>6)%2 ) * 6 + ( (v.x>>19)%2 ) * 6 + ( (v.x>>8)%2 ) * -2 + ( (v.x>>20)%2 ) * -2) >= 0 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.y>>6)%2 ) * 2) >= 2 ) <<51;
        aux.x |=(unsigned long long) ( ( ( (v.x>>53)%2 ) * 2) >= 2 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.x>>26)%2 ) * 2 + ( (v.x>>54)%2 ) * -2) >= 2 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2 + ( (v.x>>57)%2 ) * -2) >= 2 ) <<54;
        aux.x |=(unsigned long long) ( ( ( (v.x>>13)%2 ) * 2 + 0 * 2 + ( (v.x>>63)%2 ) * 2) >= 6 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + 0 * -2 + ( (v.x>>59)%2 ) * -2 + ( (v.y>>18)%2 ) * -2) >= 4 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2 + ( (v.x>>56)%2 ) * 2 + 0 * -2 + ( (v.y>>17)%2 ) * -2) >= 4 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.x>>63)%2 ) * 2) >= 2 ) <<58;
        aux.x |=(unsigned long long) ( ( ( (v.x>>43)%2 ) * 2 + 0 * 2 + ( (v.x>>63)%2 ) * 2 + ( (v.x>>19)%2 ) * 2) >= 2 ) <<59;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + ( (v.x>>56)%2 ) * -2 + 0 * -2 + ( (v.x>>57)%2 ) * -2) >= 4 ) <<60;
        aux.x |=(unsigned long long) ( ( ( (v.x>>18)%2 ) * 2 + ( (v.x>>60)%2 ) * 2 + 0 * -2 + ( (v.y>>21)%2 ) * -2) >= 4 ) <<61;
        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + ( (v.x>>56)%2 ) * -2 + 0 * -2 + ( (v.x>>57)%2 ) * -2) >= 4 ) <<62;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2 + ( (v.x>>62)%2 ) * 2 + 0 * -2 + ( (v.y>>22)%2 ) * -2) >= 4 ) <<63;
        aux.y |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<0;
        aux.y |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<1;
        aux.y |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<2;
        aux.y |=(unsigned long long) ( ( ( (v.x>>58)%2 ) * 2) >= 2 ) <<3;
        aux.y |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2) >= 2 ) <<4;
        aux.y |=(unsigned long long) ( ( ( (v.x>>8)%2 ) * 2 + ( (v.x>>9)%2 ) * 2) >= 2 ) <<5;
        aux.y |=(unsigned long long) ( ( ( (v.x>>16)%2 ) * 2 + ( (v.x>>58)%2 ) * -2) >= 2 ) <<6;

        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 17
__global__ void passo_bool_17_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( (v.x>>29)%2 ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>12)%2 ) & ( ( ( ( (v.x>>51)%2 ) & ( (v.x>>40)%2 ) ) ) ) ) & ! ( ( (v.y>>13)%2 ) ) ) | ( ( ( (v.x>>49)%2 ) & ( ( ( ( (v.y>>12)%2 ) & ( (v.x>>40)%2 ) ) ) ) ) & ! ( ( (v.y>>13)%2 ) ) )<< 1 ;
        aux.x |=(unsigned long long) ( ( (v.x>>1)%2 ) )<< 2 ;
        aux.x |=(unsigned long long) ( ( (v.x>>7)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) )<< 3 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>1)%2 ) ) ) ) ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( (v.x>>27)%2 ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) )<< 6 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) & ( ( ( ( (v.x>>22)%2 ) ) ) ) ) & ! ( ( (v.y>>13)%2 ) ) ) | ( ( ( (v.x>>28)%2 ) ) & ! ( ( (v.y>>13)%2 ) ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( (v.x>>28)%2 ) )<< 8 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) ) & ! ( ( (v.x>>25)%2 ) ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( (v.x>>46)%2 ) ) | ( ( (v.x>>33)%2 ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>53)%2 ) )<< 11 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) ) & ! ( ( (v.y>>14)%2 ) ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.x>>6)%2 ) & ( ( ( ( (v.x>>56)%2 ) ) ) ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>17)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>18)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>19)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>20)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>21)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>22)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) ) | ! ( ( (v.y>>17)%2 ) | ( (v.y>>22)%2 ) | ( (v.y>>20)%2 ) | ( (v.y>>21)%2 ) | ( (v.y>>15)%2 ) | ( (v.y>>3)%2 ) | ( (v.y>>18)%2 ) | ( (v.y>>16)%2 ) | ( (v.y>>19)%2 ) | ( (v.x>>13)%2 ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>17)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>19)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>20)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>21)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>22)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.y>>24)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( ( (v.y>>17)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( (v.y>>18)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>26)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( ( (v.y>>20)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( ( (v.y>>22)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( ( (v.y>>27)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) & ! ( ( (v.y>>23)%2 ) ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.y>>28)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>24)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>26)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>30)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>20)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>22)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>27)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( (v.y>>24)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) | ( ( (v.y>>28)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) | ( ( (v.y>>17)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) | ( ( (v.y>>19)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) | ( ( (v.y>>22)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) | ( ( (v.y>>27)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>23)%2 ) ) ) ) )<< 18 ;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_17_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( (v.y>>17)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>24)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>28)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>26)%2 ) & ( ( ( ( (v.y>>30)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) | ( ( (v.y>>30)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>31)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>20)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>22)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>27)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>19)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>21)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) )<< 19 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>24)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( (v.y>>28)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( (v.y>>26)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( (v.y>>27)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) )<< 20 ;
        aux.x |=(unsigned long long) ( ( (v.y>>24)%2 ) & ( ( ( ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>28)%2 ) & ( ( ( ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>17)%2 ) & ( ( ( ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>30)%2 ) & ( ( ( ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>19)%2 ) & ( ( ( ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>31)%2 ) & ( ( ( ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>27)%2 ) & ( ( ( ( (v.y>>29)%2 ) ) ) ) )<< 21 ;
        aux.x |=(unsigned long long) ( ( (v.x>>30)%2 ) )<< 22 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) ) | ( ( (v.x>>51)%2 ) ) | ( ( (v.x>>24)%2 ) )<< 23 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) ) | ( ( (v.x>>21)%2 ) ) | ( ( (v.x>>19)%2 ) ) | ( ( (v.x>>16)%2 ) ) | ( ( (v.x>>18)%2 ) ) | ( ( (v.x>>20)%2 ) ) | ( ( (v.x>>15)%2 ) ) | ( ( (v.x>>17)%2 ) ) | ( ( (v.y>>0)%2 ) )<< 24 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) & ( ( ( ( (v.x>>1)%2 ) ) ) ) ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( (v.x>>33)%2 ) )<< 26 ;
        aux.x |=(unsigned long long) ( ( (v.x>>53)%2 ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( (v.x>>37)%2 ) & ( ( ( ( (v.x>>35)%2 ) ) ) ) )<< 28 ;
        aux.x |=(unsigned long long) ( ( (v.x>>48)%2 ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) ) | ( ( (v.x>>58)%2 ) )<< 30 ;
        aux.x |=(unsigned long long) ( ( (v.x>>57)%2 ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( (v.x>>57)%2 ) )<< 32 ;
        aux.x |=(unsigned long long) ( ( (v.x>>43)%2 ) )<< 33 ;
        aux.x |=(unsigned long long) ( ( (v.x>>38)%2 ) )<< 34 ;
        aux.x |=(unsigned long long) ( ( (v.x>>38)%2 ) ) | ( ( (v.x>>31)%2 ) ) | ( ( (v.x>>32)%2 ) )<< 35 ;
        aux.x |=(unsigned long long) ( ( (v.x>>38)%2 ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) )<< 37 ;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_17_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( (v.x>>57)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) & ( ( ( ( (v.y>>32)%2 ) ) ) ) )<< 39 ;
        aux.x |=(unsigned long long) ( ( (v.y>>32)%2 ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) ) | ( ( (v.x>>21)%2 ) ) | ( ( (v.x>>17)%2 ) )<< 41 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) ) & ! ( ( (v.y>>33)%2 ) ) )<< 42 ;
        aux.x |=(unsigned long long) ( ( (v.x>>35)%2 ) ) | ( ( (v.x>>34)%2 ) ) | ( ( (v.x>>36)%2 ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( (v.x>>28)%2 ) ) | ( ( (v.x>>22)%2 ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.y>>12)%2 ) & ( ( ( ( (v.x>>44)%2 ) & ( (v.x>>39)%2 ) ) ) ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) & ( ( ( ( (v.y>>12)%2 ) ) ) ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( (v.x>>46)%2 ) & ( ( ( ( (v.x>>22)%2 ) ) ) ) )<< 47 ;
        aux.x |=(unsigned long long) ( ( (v.x>>24)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) | ( ( (v.x>>41)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>1)%2 ) & ( ( ( ( (v.x>>50)%2 ) ) ) ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( (v.x>>16)%2 ) & ( ( ( ( (v.y>>34)%2 ) ) ) ) ) | ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>34)%2 ) ) ) ) ) | ( ( (v.x>>20)%2 ) & ( ( ( ( (v.y>>34)%2 ) ) ) ) ) | ( ( (v.y>>34)%2 ) & ( ( ( ( (v.x>>23)%2 ) ) ) ) ) | ( ( (v.x>>59)%2 ) & ( ( ( ( (v.y>>34)%2 ) ) ) ) )<< 50 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>50)%2 ) ) & ! ( ( (v.y>>1)%2 ) ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 51 ;
        aux.x |=(unsigned long long) ( ( (v.y>>12)%2 ) & ( ( ( ( (v.x>>5)%2 ) & ( (v.x>>11)%2 ) ) ) ) )<< 52 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) )<< 53 ;
        aux.x |=(unsigned long long) ( ( (v.x>>4)%2 ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( (v.y>>35)%2 ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>62)%2 ) ) & ! ( ( (v.x>>63)%2 ) ) )<< 56 ;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_17_parte4(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( (v.y>>6)%2 ) ) | ( ( (v.y>>11)%2 ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) & ( ( ( ( (v.y>>36)%2 ) ) ) ) ) & ! ( ( (v.x>>2)%2 ) ) ) | ( ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>59)%2 ) ) ) ) ) & ! ( ( (v.x>>2)%2 ) ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>5)%2 ) ) & ! ( ( (v.x>>60)%2 ) ) )<< 59 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>23)%2 ) ) & ! ( ( (v.y>>4)%2 ) ) )<< 60 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.y>>10)%2 ) ) )<< 61 ;
        aux.x |=(unsigned long long) ( ( (v.x>>59)%2 ) )<< 62 ;
        aux.x |=(unsigned long long) ( ( (v.y>>37)%2 ) & ( ( ( ( (v.x>>14)%2 ) ) ) ) )<< 63 ;
        aux.y |=(unsigned long long) ( ( (v.x>>14)%2 ) ) | ( ( (v.x>>21)%2 ) ) | ( ( (v.x>>19)%2 ) ) | ( ( (v.x>>16)%2 ) ) | ( ( (v.x>>15)%2 ) ) | ( ( (v.x>>18)%2 ) ) | ( ( (v.x>>20)%2 ) ) | ( ( (v.x>>17)%2 ) )<<0;
        aux.y |=(unsigned long long) ( ( (v.y>>38)%2 ) )<<1;
        aux.y |=(unsigned long long) ( ( (v.x>>14)%2 ) )<<2;
        aux.y |=(unsigned long long) ( ( (v.y>>2)%2 ) )<<3;
        aux.y |=(unsigned long long) ( ( (v.x>>23)%2 ) )<<4;
        aux.y |=(unsigned long long) ( ( ( (v.y>>39)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) & ! ( ( (v.x>>47)%2 ) ) )<<5;
        aux.y |=(unsigned long long) ( ( (v.y>>39)%2 ) & ( ( ( ( (v.x>>51)%2 ) & ( (v.y>>37)%2 ) & ( (v.y>>34)%2 ) ) ) ) )<<6;
        aux.y |=(unsigned long long) ( ( (v.x>>14)%2 ) & ( ( ( ( (v.y>>36)%2 ) ) ) ) )<<7;
        aux.y |=(unsigned long long) ( ( (v.x>>14)%2 ) & ( ( ( ( (v.y>>36)%2 ) ) ) ) )<<8;
        aux.y |=(unsigned long long) ( ( (v.x>>19)%2 ) & ( ( ( ( (v.y>>36)%2 ) ) ) ) ) | ( ( (v.x>>14)%2 ) & ( ( ( ( (v.y>>36)%2 ) ) ) ) )<<9;
        aux.y |= ! ( ( ( (v.x>>1)%2 ) ) )<<10;
        aux.y |=(unsigned long long) ( ( (v.x>>14)%2 ) & ( ( ( ( (v.x>>51)%2 ) ) ) ) ) | ( ( (v.x>>49)%2 ) & ( ( ( ( (v.x>>14)%2 ) ) ) ) )<<11;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}


unsigned long long confere_bool_17(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( (v.x>>29)%2 ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>12)%2 ) & ( ( ( ( (v.x>>51)%2 ) & ( (v.x>>40)%2 ) ) ) ) ) & ! ( ( (v.y>>13)%2 ) ) ) | ( ( ( (v.x>>49)%2 ) & ( ( ( ( (v.y>>12)%2 ) & ( (v.x>>40)%2 ) ) ) ) ) & ! ( ( (v.y>>13)%2 ) ) )<< 1 ;
        aux.x |=(unsigned long long) ( ( (v.x>>1)%2 ) )<< 2 ;
        aux.x |=(unsigned long long) ( ( (v.x>>7)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) )<< 3 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>1)%2 ) ) ) ) ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( (v.x>>27)%2 ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) )<< 6 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) & ( ( ( ( (v.x>>22)%2 ) ) ) ) ) & ! ( ( (v.y>>13)%2 ) ) ) | ( ( ( (v.x>>28)%2 ) ) & ! ( ( (v.y>>13)%2 ) ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( (v.x>>28)%2 ) )<< 8 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) ) & ! ( ( (v.x>>25)%2 ) ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( (v.x>>46)%2 ) ) | ( ( (v.x>>33)%2 ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>53)%2 ) )<< 11 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) ) & ! ( ( (v.y>>14)%2 ) ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.x>>6)%2 ) & ( ( ( ( (v.x>>56)%2 ) ) ) ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>17)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>18)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>19)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>20)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>21)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>22)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) ) | ! ( ( (v.y>>17)%2 ) | ( (v.y>>22)%2 ) | ( (v.y>>20)%2 ) | ( (v.y>>21)%2 ) | ( (v.y>>15)%2 ) | ( (v.y>>3)%2 ) | ( (v.y>>18)%2 ) | ( (v.y>>16)%2 ) | ( (v.y>>19)%2 ) | ( (v.x>>13)%2 ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>17)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>19)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>20)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>21)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( (v.y>>22)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.y>>24)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( ( (v.y>>17)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( (v.y>>18)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>26)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( ( (v.y>>20)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( ( (v.y>>22)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( ( (v.y>>27)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) & ! ( ( (v.y>>23)%2 ) ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.y>>28)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>24)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>26)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>30)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>20)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>22)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) ) | ( ( ( ( (v.y>>27)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) & ! ( ( (v.y>>3)%2 ) ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( (v.y>>24)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) | ( ( (v.y>>28)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) | ( ( (v.y>>17)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) | ( ( (v.y>>19)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) | ( ( (v.y>>22)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) | ( ( (v.y>>27)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>23)%2 ) ) ) ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( (v.y>>17)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>24)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>28)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>26)%2 ) & ( ( ( ( (v.y>>30)%2 ) & ( (v.y>>23)%2 ) ) ) ) ) | ( ( (v.y>>30)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>31)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>20)%2 ) & ( ( ( ( (v.y>>16)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>22)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>27)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>19)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>21)%2 ) & ( ( ( ( (v.y>>23)%2 ) & ( (v.y>>29)%2 ) ) ) ) )<< 19 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>24)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( (v.y>>28)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( (v.y>>26)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) ) | ( ( ( (v.y>>27)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>29)%2 ) ) ) ) ) & ! ( ( (v.y>>23)%2 ) ) )<< 20 ;
        aux.x |=(unsigned long long) ( ( (v.y>>24)%2 ) & ( ( ( ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>28)%2 ) & ( ( ( ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>17)%2 ) & ( ( ( ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>30)%2 ) & ( ( ( ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>19)%2 ) & ( ( ( ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>31)%2 ) & ( ( ( ( (v.y>>29)%2 ) ) ) ) ) | ( ( (v.y>>27)%2 ) & ( ( ( ( (v.y>>29)%2 ) ) ) ) )<< 21 ;
        aux.x |=(unsigned long long) ( ( (v.x>>30)%2 ) )<< 22 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) ) | ( ( (v.x>>51)%2 ) ) | ( ( (v.x>>24)%2 ) )<< 23 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) ) | ( ( (v.x>>21)%2 ) ) | ( ( (v.x>>19)%2 ) ) | ( ( (v.x>>16)%2 ) ) | ( ( (v.x>>18)%2 ) ) | ( ( (v.x>>20)%2 ) ) | ( ( (v.x>>15)%2 ) ) | ( ( (v.x>>17)%2 ) ) | ( ( (v.y>>0)%2 ) )<< 24 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.x>>46)%2 ) & ( ( ( ( (v.x>>1)%2 ) ) ) ) ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( (v.x>>33)%2 ) )<< 26 ;
        aux.x |=(unsigned long long) ( ( (v.x>>53)%2 ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( (v.x>>37)%2 ) & ( ( ( ( (v.x>>35)%2 ) ) ) ) )<< 28 ;
        aux.x |=(unsigned long long) ( ( (v.x>>48)%2 ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) ) | ( ( (v.x>>58)%2 ) )<< 30 ;
        aux.x |=(unsigned long long) ( ( (v.x>>57)%2 ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( (v.x>>57)%2 ) )<< 32 ;
        aux.x |=(unsigned long long) ( ( (v.x>>43)%2 ) )<< 33 ;
        aux.x |=(unsigned long long) ( ( (v.x>>38)%2 ) )<< 34 ;
        aux.x |=(unsigned long long) ( ( (v.x>>38)%2 ) ) | ( ( (v.x>>31)%2 ) ) | ( ( (v.x>>32)%2 ) )<< 35 ;
        aux.x |=(unsigned long long) ( ( (v.x>>38)%2 ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.x>>57)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ( ( (v.x>>61)%2 ) & ( ( ( ( (v.y>>32)%2 ) ) ) ) )<< 39 ;
        aux.x |=(unsigned long long) ( ( (v.y>>32)%2 ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) ) | ( ( (v.x>>21)%2 ) ) | ( ( (v.x>>17)%2 ) )<< 41 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) ) & ! ( ( (v.y>>33)%2 ) ) )<< 42 ;
        aux.x |=(unsigned long long) ( ( (v.x>>35)%2 ) ) | ( ( (v.x>>34)%2 ) ) | ( ( (v.x>>36)%2 ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( (v.x>>28)%2 ) ) | ( ( (v.x>>22)%2 ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.y>>12)%2 ) & ( ( ( ( (v.x>>44)%2 ) & ( (v.x>>39)%2 ) ) ) ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( (v.x>>22)%2 ) & ( ( ( ( (v.y>>12)%2 ) ) ) ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( (v.x>>46)%2 ) & ( ( ( ( (v.x>>22)%2 ) ) ) ) )<< 47 ;
        aux.x |=(unsigned long long) ( ( (v.x>>24)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) | ( ( (v.x>>41)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>1)%2 ) & ( ( ( ( (v.x>>50)%2 ) ) ) ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( (v.x>>16)%2 ) & ( ( ( ( (v.y>>34)%2 ) ) ) ) ) | ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>34)%2 ) ) ) ) ) | ( ( (v.x>>20)%2 ) & ( ( ( ( (v.y>>34)%2 ) ) ) ) ) | ( ( (v.y>>34)%2 ) & ( ( ( ( (v.x>>23)%2 ) ) ) ) ) | ( ( (v.x>>59)%2 ) & ( ( ( ( (v.y>>34)%2 ) ) ) ) )<< 50 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>50)%2 ) ) & ! ( ( (v.y>>1)%2 ) ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 51 ;
        aux.x |=(unsigned long long) ( ( (v.y>>12)%2 ) & ( ( ( ( (v.x>>5)%2 ) & ( (v.x>>11)%2 ) ) ) ) )<< 52 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) )<< 53 ;
        aux.x |=(unsigned long long) ( ( (v.x>>4)%2 ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( (v.y>>35)%2 ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>62)%2 ) ) & ! ( ( (v.x>>63)%2 ) ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( (v.y>>6)%2 ) ) | ( ( (v.y>>11)%2 ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) & ( ( ( ( (v.y>>36)%2 ) ) ) ) ) & ! ( ( (v.x>>2)%2 ) ) ) | ( ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>59)%2 ) ) ) ) ) & ! ( ( (v.x>>2)%2 ) ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>5)%2 ) ) & ! ( ( (v.x>>60)%2 ) ) )<< 59 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>23)%2 ) ) & ! ( ( (v.y>>4)%2 ) ) )<< 60 ;
        aux.x |=(unsigned long long) ! ( ( ( (v.y>>10)%2 ) ) )<< 61 ;
        aux.x |=(unsigned long long) ( ( (v.x>>59)%2 ) )<< 62 ;
        aux.x |=(unsigned long long) ( ( (v.y>>37)%2 ) & ( ( ( ( (v.x>>14)%2 ) ) ) ) )<< 63 ;
        aux.y |=(unsigned long long) ( ( (v.x>>14)%2 ) ) | ( ( (v.x>>21)%2 ) ) | ( ( (v.x>>19)%2 ) ) | ( ( (v.x>>16)%2 ) ) | ( ( (v.x>>15)%2 ) ) | ( ( (v.x>>18)%2 ) ) | ( ( (v.x>>20)%2 ) ) | ( ( (v.x>>17)%2 ) )<<0;
        aux.y |=(unsigned long long) ( ( (v.y>>38)%2 ) )<<1;
        aux.y |=(unsigned long long) ( ( (v.x>>14)%2 ) )<<2;
        aux.y |=(unsigned long long) ( ( (v.y>>2)%2 ) )<<3;
        aux.y |=(unsigned long long) ( ( (v.x>>23)%2 ) )<<4;
        aux.y |=(unsigned long long) ( ( ( (v.y>>39)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) & ! ( ( (v.x>>47)%2 ) ) )<<5;
        aux.y |=(unsigned long long) ( ( (v.y>>39)%2 ) & ( ( ( ( (v.x>>51)%2 ) & ( (v.y>>37)%2 ) & ( (v.y>>34)%2 ) ) ) ) )<<6;
        aux.y |=(unsigned long long) ( ( (v.x>>14)%2 ) & ( ( ( ( (v.y>>36)%2 ) ) ) ) )<<7;
        aux.y |=(unsigned long long) ( ( (v.x>>14)%2 ) & ( ( ( ( (v.y>>36)%2 ) ) ) ) )<<8;
        aux.y |=(unsigned long long) ( ( (v.x>>19)%2 ) & ( ( ( ( (v.y>>36)%2 ) ) ) ) ) | ( ( (v.x>>14)%2 ) & ( ( ( ( (v.y>>36)%2 ) ) ) ) )<<9;
        aux.y |= ! ( ( ( (v.x>>1)%2 ) ) )<<10;
        aux.y |=(unsigned long long) ( ( (v.x>>14)%2 ) & ( ( ( ( (v.x>>51)%2 ) ) ) ) ) | ( ( (v.x>>49)%2 ) & ( ( ( ( (v.x>>14)%2 ) ) ) ) )<<11;

        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_17_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2) >= 2 ) <<0;
        aux.x |=(unsigned long long) ( ( 0 * 6 + ( (v.x>>51)%2 ) * 2 + ( (v.x>>40)%2 ) * 6 + 0 * -6 + ( (v.x>>49)%2 ) * 2) >= 14 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * 2) >= 2 ) <<2;
        aux.x |=(unsigned long long) ( ( ( (v.x>>7)%2 ) * 2 + ( (v.x>>8)%2 ) * 2) >= 4 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.x>>48)%2 ) * -2 + ( (v.x>>1)%2 ) * -2) >= -2 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 2) >= 2 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * 2 + ( (v.x>>22)%2 ) * 2 + 0 * -10 + ( (v.x>>28)%2 ) * 6) >= 4 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) * 2 + ( (v.x>>25)%2 ) * -2) >= 2 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * 2 + ( (v.x>>33)%2 ) * 2) >= 2 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>53)%2 ) * 2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) * 2 + ( (v.y>>14)%2 ) * -2) >= 2 ) <<12;
        aux.x |=(unsigned long long) ( ( ( (v.x>>6)%2 ) * 2 + ( (v.x>>56)%2 ) * 2) >= 4 ) <<13;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 506 + ( (v.y>>3)%2 ) * -510 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + ( (v.x>>13)%2 ) * -2) >= 0 ) <<14;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 126 + 0 * 126 + ( (v.y>>3)%2 ) * -126 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + ( (v.y>>22)%2 ) * 2) >= 254 ) <<15;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 766 + 0 * 766 + ( (v.y>>3)%2 ) * -766 + 0 * -254 + 0 * 2 + 0 * 2 + 0 * 258 + 0 * 2 + 0 * 2 + 0 * 2 + ( (v.y>>27)%2 ) * 2) >= 1534 ) <<16;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 510 + 0 * 510 + 0 * -510 + ( (v.y>>3)%2 ) * -510 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + ( (v.y>>27)%2 ) * 2) >= 1022 ) <<17;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 126 + 0 * 126 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + ( (v.y>>27)%2 ) * 2) >= 254 ) <<18;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_17_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( 0 * 12 + 0 * 16372 + 0 * 16372 + 0 * 12 + 0 * 12 + 0 * 4096 + 0 * 4108 + 0 * 12 + 0 * 4100 + 0 * 4100 + 0 * 12 + 0 * 12 + 0 * 12 + 0 * 12 + ( (v.y>>21)%2 ) * 12) >= 24572 ) <<19;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 30 + 0 * 30 + 0 * -30 + 0 * 2 + 0 * 2 + ( (v.y>>27)%2 ) * 2) >= 62 ) <<20;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 254 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + ( (v.y>>27)%2 ) * 2) >= 256 ) <<21;
        aux.x |=(unsigned long long) ( ( ( (v.x>>30)%2 ) * 2) >= 2 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.x>>51)%2 ) * 2 + ( (v.x>>24)%2 ) * 2) >= 2 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.x>>21)%2 ) * 2 + ( (v.x>>19)%2 ) * 2 + ( (v.x>>16)%2 ) * 2 + ( (v.x>>18)%2 ) * 2 + ( (v.x>>20)%2 ) * 2 + ( (v.x>>15)%2 ) * 2 + ( (v.x>>17)%2 ) * 2 + ( (v.y>>0)%2 ) * 2) >= 2 ) <<24;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2 + ( (v.x>>1)%2 ) * -2) >= -2 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 2) >= 2 ) <<26;
        aux.x |=(unsigned long long) ( ( ( (v.x>>53)%2 ) * 2) >= 2 ) <<27;
        aux.x |=(unsigned long long) ( ( ( (v.x>>37)%2 ) * 2 + ( (v.x>>35)%2 ) * 2) >= 4 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.x>>48)%2 ) * 2) >= 2 ) <<29;
        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 2 + ( (v.x>>58)%2 ) * 2) >= 2 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * 2) >= 2 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * 2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.x>>43)%2 ) * 2) >= 2 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2) >= 2 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2 + ( (v.x>>31)%2 ) * 2 + ( (v.x>>32)%2 ) * 2) >= 2 ) <<35;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2) >= 2 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 2) >= 2 ) <<37;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_17_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
        
        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2 + ( (v.y>>32)%2 ) * 2) >= 4 ) <<39;
        aux.x |=(unsigned long long) ( ( ( (v.y>>32)%2 ) * 2) >= 2 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.x>>21)%2 ) * 2 + ( (v.x>>17)%2 ) * 2) >= 2 ) <<41;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2 + ( (v.y>>33)%2 ) * -2) >= 2 ) <<42;
        aux.x |=(unsigned long long) ( ( ( (v.x>>35)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + ( (v.x>>36)%2 ) * 2) >= 2 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2 + ( (v.x>>22)%2 ) * 2) >= 2 ) <<44;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>44)%2 ) * 2 + ( (v.x>>39)%2 ) * 2) >= 6 ) <<45;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2 + ( (v.y>>12)%2 ) * 2) >= 4 ) <<46;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * 2 + ( (v.x>>22)%2 ) * 2) >= 4 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 2 + ( (v.x>>57)%2 ) * 6 + ( (v.x>>41)%2 ) * 2) >= 8 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.y>>1)%2 ) * 2 + ( (v.x>>50)%2 ) * 2 + ( (v.x>>55)%2 ) * -2) >= 4 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>16)%2 ) * 2 + 0 * 62 + ( (v.x>>18)%2 ) * 2 + ( (v.x>>20)%2 ) * 2 + ( (v.x>>23)%2 ) * 2 + ( (v.x>>59)%2 ) * 2) >= 64 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.x>>50)%2 ) * 2 + ( (v.y>>1)%2 ) * -2 + ( (v.x>>55)%2 ) * -2) >= 2 ) <<51;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>5)%2 ) * 2 + ( (v.x>>11)%2 ) * 2) >= 6 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.x>>4)%2 ) * 2) >= 2 ) <<54;
        aux.x |=(unsigned long long) ( ( ( (v.y>>35)%2 ) * 2) >= 2 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>62)%2 ) * 2 + ( (v.x>>63)%2 ) * -2) >= 2 ) <<56;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_17_parte4(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
        
        aux.x |=(unsigned long long) ( ( ( (v.y>>6)%2 ) * 2 + ( (v.y>>11)%2 ) * 2) >= 2 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 6 + 0 * 2 + ( (v.x>>2)%2 ) * -6 + ( (v.x>>48)%2 ) * 2) >= 8 ) <<58;
        aux.x |=(unsigned long long) ( ( ( (v.y>>5)%2 ) * 2 + ( (v.x>>60)%2 ) * -2) >= 2 ) <<59;
        aux.x |=(unsigned long long) ( ( ( (v.x>>23)%2 ) * 2 + ( (v.y>>4)%2 ) * -2) >= 2 ) <<60;
        aux.x |=(unsigned long long) ( ( ( (v.y>>10)%2 ) * -2) >= 0 ) <<61;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2) >= 2 ) <<62;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>14)%2 ) * 2) >= 4 ) <<63;
        aux.y |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.x>>21)%2 ) * 2 + ( (v.x>>19)%2 ) * 2 + ( (v.x>>16)%2 ) * 2 + ( (v.x>>15)%2 ) * 2 + ( (v.x>>18)%2 ) * 2 + ( (v.x>>20)%2 ) * 2 + ( (v.x>>17)%2 ) * 2) >= 2 ) <<0;
        aux.y |=(unsigned long long) ( ( ( (v.y>>38)%2 ) * 2) >= 2 ) <<1;
        aux.y |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<2;
        aux.y |=(unsigned long long) ( ( ( (v.y>>2)%2 ) * 2) >= 2 ) <<3;
        aux.y |=(unsigned long long) ( ( ( (v.x>>23)%2 ) * 2) >= 2 ) <<4;
        aux.y |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>24)%2 ) * 2 + ( (v.x>>47)%2 ) * -2) >= 4 ) <<5;
        aux.y |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>51)%2 ) * 2 + 0 * 2 + ( (v.y>>34)%2 ) * 2) >= 8 ) <<6;
        aux.y |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.y>>36)%2 ) * 2) >= 4 ) <<7;
        aux.y |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.y>>36)%2 ) * 2) >= 4 ) <<8;
        aux.y |=(unsigned long long) ( ( ( (v.x>>19)%2 ) * 2 + 0 * 6 + ( (v.x>>14)%2 ) * 2) >= 8 ) <<9;
        aux.y |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * -2) >= 0 ) <<10;
        aux.y |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 6 + ( (v.x>>51)%2 ) * 2 + ( (v.x>>49)%2 ) * 2) >= 8 ) <<11;
    
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}


unsigned long long confere_tlf_17(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>29)%2 ) * 2) >= 2 ) <<0;
        aux.x |=(unsigned long long) ( ( 0 * 6 + ( (v.x>>51)%2 ) * 2 + ( (v.x>>40)%2 ) * 6 + 0 * -6 + ( (v.x>>49)%2 ) * 2) >= 14 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * 2) >= 2 ) <<2;
        aux.x |=(unsigned long long) ( ( ( (v.x>>7)%2 ) * 2 + ( (v.x>>8)%2 ) * 2) >= 4 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.x>>48)%2 ) * -2 + ( (v.x>>1)%2 ) * -2) >= -2 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 2) >= 2 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * 2 + ( (v.x>>22)%2 ) * 2 + 0 * -10 + ( (v.x>>28)%2 ) * 6) >= 4 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) * 2 + ( (v.x>>25)%2 ) * -2) >= 2 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * 2 + ( (v.x>>33)%2 ) * 2) >= 2 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>53)%2 ) * 2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) * 2 + ( (v.y>>14)%2 ) * -2) >= 2 ) <<12;
        aux.x |=(unsigned long long) ( ( ( (v.x>>6)%2 ) * 2 + ( (v.x>>56)%2 ) * 2) >= 4 ) <<13;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 506 + ( (v.y>>3)%2 ) * -510 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + ( (v.x>>13)%2 ) * -2) >= 0 ) <<14;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 126 + 0 * 126 + ( (v.y>>3)%2 ) * -126 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + ( (v.y>>22)%2 ) * 2) >= 254 ) <<15;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 766 + 0 * 766 + ( (v.y>>3)%2 ) * -766 + 0 * -254 + 0 * 2 + 0 * 2 + 0 * 258 + 0 * 2 + 0 * 2 + 0 * 2 + ( (v.y>>27)%2 ) * 2) >= 1534 ) <<16;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 510 + 0 * 510 + 0 * -510 + ( (v.y>>3)%2 ) * -510 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + ( (v.y>>27)%2 ) * 2) >= 1022 ) <<17;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 126 + 0 * 126 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + ( (v.y>>27)%2 ) * 2) >= 254 ) <<18;
        aux.x |=(unsigned long long) ( ( 0 * 12 + 0 * 16372 + 0 * 16372 + 0 * 12 + 0 * 12 + 0 * 4096 + 0 * 4108 + 0 * 12 + 0 * 4100 + 0 * 4100 + 0 * 12 + 0 * 12 + 0 * 12 + 0 * 12 + ( (v.y>>21)%2 ) * 12) >= 24572 ) <<19;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 30 + 0 * 30 + 0 * -30 + 0 * 2 + 0 * 2 + ( (v.y>>27)%2 ) * 2) >= 62 ) <<20;
        aux.x |=(unsigned long long) ( ( 0 * 2 + 0 * 254 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + 0 * 2 + ( (v.y>>27)%2 ) * 2) >= 256 ) <<21;
        aux.x |=(unsigned long long) ( ( ( (v.x>>30)%2 ) * 2) >= 2 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.x>>51)%2 ) * 2 + ( (v.x>>24)%2 ) * 2) >= 2 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.x>>21)%2 ) * 2 + ( (v.x>>19)%2 ) * 2 + ( (v.x>>16)%2 ) * 2 + ( (v.x>>18)%2 ) * 2 + ( (v.x>>20)%2 ) * 2 + ( (v.x>>15)%2 ) * 2 + ( (v.x>>17)%2 ) * 2 + ( (v.y>>0)%2 ) * 2) >= 2 ) <<24;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * -2 + ( (v.x>>1)%2 ) * -2) >= -2 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 2) >= 2 ) <<26;
        aux.x |=(unsigned long long) ( ( ( (v.x>>53)%2 ) * 2) >= 2 ) <<27;
        aux.x |=(unsigned long long) ( ( ( (v.x>>37)%2 ) * 2 + ( (v.x>>35)%2 ) * 2) >= 4 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.x>>48)%2 ) * 2) >= 2 ) <<29;
        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 2 + ( (v.x>>58)%2 ) * 2) >= 2 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * 2) >= 2 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * 2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.x>>43)%2 ) * 2) >= 2 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2) >= 2 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2 + ( (v.x>>31)%2 ) * 2 + ( (v.x>>32)%2 ) * 2) >= 2 ) <<35;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2) >= 2 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 2) >= 2 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.x>>57)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 2 + ( (v.y>>32)%2 ) * 2) >= 4 ) <<39;
        aux.x |=(unsigned long long) ( ( ( (v.y>>32)%2 ) * 2) >= 2 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.x>>21)%2 ) * 2 + ( (v.x>>17)%2 ) * 2) >= 2 ) <<41;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2 + ( (v.y>>33)%2 ) * -2) >= 2 ) <<42;
        aux.x |=(unsigned long long) ( ( ( (v.x>>35)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + ( (v.x>>36)%2 ) * 2) >= 2 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2 + ( (v.x>>22)%2 ) * 2) >= 2 ) <<44;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>44)%2 ) * 2 + ( (v.x>>39)%2 ) * 2) >= 6 ) <<45;
        aux.x |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 2 + ( (v.y>>12)%2 ) * 2) >= 4 ) <<46;
        aux.x |=(unsigned long long) ( ( ( (v.x>>46)%2 ) * 2 + ( (v.x>>22)%2 ) * 2) >= 4 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 2 + ( (v.x>>57)%2 ) * 6 + ( (v.x>>41)%2 ) * 2) >= 8 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.y>>1)%2 ) * 2 + ( (v.x>>50)%2 ) * 2 + ( (v.x>>55)%2 ) * -2) >= 4 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>16)%2 ) * 2 + 0 * 62 + ( (v.x>>18)%2 ) * 2 + ( (v.x>>20)%2 ) * 2 + ( (v.x>>23)%2 ) * 2 + ( (v.x>>59)%2 ) * 2) >= 64 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.x>>50)%2 ) * 2 + ( (v.y>>1)%2 ) * -2 + ( (v.x>>55)%2 ) * -2) >= 2 ) <<51;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>5)%2 ) * 2 + ( (v.x>>11)%2 ) * 2) >= 6 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.x>>4)%2 ) * 2) >= 2 ) <<54;
        aux.x |=(unsigned long long) ( ( ( (v.y>>35)%2 ) * 2) >= 2 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>62)%2 ) * 2 + ( (v.x>>63)%2 ) * -2) >= 2 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.y>>6)%2 ) * 2 + ( (v.y>>11)%2 ) * 2) >= 2 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 6 + 0 * 2 + ( (v.x>>2)%2 ) * -6 + ( (v.x>>48)%2 ) * 2) >= 8 ) <<58;
        aux.x |=(unsigned long long) ( ( ( (v.y>>5)%2 ) * 2 + ( (v.x>>60)%2 ) * -2) >= 2 ) <<59;
        aux.x |=(unsigned long long) ( ( ( (v.x>>23)%2 ) * 2 + ( (v.y>>4)%2 ) * -2) >= 2 ) <<60;
        aux.x |=(unsigned long long) ( ( ( (v.y>>10)%2 ) * -2) >= 0 ) <<61;
        aux.x |=(unsigned long long) ( ( ( (v.x>>59)%2 ) * 2) >= 2 ) <<62;
        aux.x |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>14)%2 ) * 2) >= 4 ) <<63;
        aux.y |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.x>>21)%2 ) * 2 + ( (v.x>>19)%2 ) * 2 + ( (v.x>>16)%2 ) * 2 + ( (v.x>>15)%2 ) * 2 + ( (v.x>>18)%2 ) * 2 + ( (v.x>>20)%2 ) * 2 + ( (v.x>>17)%2 ) * 2) >= 2 ) <<0;
        aux.y |=(unsigned long long) ( ( ( (v.y>>38)%2 ) * 2) >= 2 ) <<1;
        aux.y |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<2;
        aux.y |=(unsigned long long) ( ( ( (v.y>>2)%2 ) * 2) >= 2 ) <<3;
        aux.y |=(unsigned long long) ( ( ( (v.x>>23)%2 ) * 2) >= 2 ) <<4;
        aux.y |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>24)%2 ) * 2 + ( (v.x>>47)%2 ) * -2) >= 4 ) <<5;
        aux.y |=(unsigned long long) ( ( 0 * 2 + ( (v.x>>51)%2 ) * 2 + 0 * 2 + ( (v.y>>34)%2 ) * 2) >= 8 ) <<6;
        aux.y |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.y>>36)%2 ) * 2) >= 4 ) <<7;
        aux.y |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.y>>36)%2 ) * 2) >= 4 ) <<8;
        aux.y |=(unsigned long long) ( ( ( (v.x>>19)%2 ) * 2 + 0 * 6 + ( (v.x>>14)%2 ) * 2) >= 8 ) <<9;
        aux.y |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * -2) >= 0 ) <<10;
        aux.y |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 6 + ( (v.x>>51)%2 ) * 2 + ( (v.x>>49)%2 ) * 2) >= 8 ) <<11;

        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 18
__global__ void passo_bool_18_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( (v.y>>10)%2 ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( (v.x>>42)%2 ) & ( ( ( ( (v.z>>2)%2 ) ) & ( ( ( ( (v.x>>33)%2 ) ) ) & ( ( ( (v.x>>31)%2 ) ) ) ) ) ) )<< 1 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) )<< 2 ;
        aux.x |=(unsigned long long) ( ( (v.y>>5)%2 ) ) | ( ( (v.y>>4)%2 ) )<< 3 ;
        aux.x |=(unsigned long long) ( ( (v.y>>53)%2 ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( (v.x>>7)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( (v.x>>13)%2 ) & ( ( ( ( (v.y>>5)%2 ) | ( (v.y>>3)%2 ) ) ) & ( ( ( (v.x>>39)%2 ) & ( (v.y>>45)%2 ) ) ) & ( ( ! ( (v.x>>6)%2 ) ) ) ) ) | ( ( (v.x>>6)%2 ) & ( ( ( ! ( (v.y>>14)%2 ) ) ) ) ) | ( ( (v.x>>63)%2 ) & ( ( ( ( (v.x>>39)%2 ) & ( (v.y>>45)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) | ( (v.y>>3)%2 ) ) ) & ( ( ! ( (v.x>>6)%2 ) ) ) ) )<< 6 ;
        aux.x |=(unsigned long long) ( ( (v.y>>55)%2 ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( (v.y>>20)%2 ) ) | ( ( (v.y>>21)%2 ) ) | ( ( (v.y>>19)%2 ) ) | ( ( (v.y>>22)%2 ) )<< 8 ;
        aux.x |=(unsigned long long) ( ( (v.x>>39)%2 ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) ) & ! ( ( (v.z>>3)%2 ) ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>10)%2 ) )<< 11 ;
        aux.x |=(unsigned long long) ( ( (v.x>>13)%2 ) & ( ( ( ( (v.x>>11)%2 ) ) ) ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.x>>11)%2 ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) & ! ( ( (v.y>>17)%2 ) & ( ( ( ( (v.x>>14)%2 ) ) ) ) ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>45)%2 ) ) & ! ( ( (v.y>>41)%2 ) ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>16)%2 ) & ( ( ( ! ( (v.y>>38)%2 ) ) ) & ( ( ( (v.y>>23)%2 ) ) ) ) ) & ! ( ( (v.y>>38)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) ) | ( ( ( (v.y>>23)%2 ) & ( ( ( ! ( (v.y>>26)%2 ) & ! ( (v.x>>16)%2 ) ) ) & ( ( ( (v.x>>33)%2 ) & ( (v.x>>61)%2 ) ) ) ) ) & ! ( ( (v.y>>38)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) & ( ( ( ( (v.x>>24)%2 ) | ( (v.y>>45)%2 ) ) ) ) ) & ! ( ( (v.y>>17)%2 ) ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( (v.x>>15)%2 ) & ( ( ( ( (v.x>>33)%2 ) | ( (v.y>>7)%2 ) | ( (v.x>>32)%2 ) | ( (v.x>>34)%2 ) ) ) | ( ( ! ( (v.y>>41)%2 ) & ! ( (v.x>>33)%2 ) & ! ( (v.y>>7)%2 ) & ! ( (v.x>>32)%2 ) & ! ( (v.x>>34)%2 ) ) ) ) ) | ( ( ( (v.x>>24)%2 ) & ( ( ( ( (v.y>>45)%2 ) & ( (v.x>>15)%2 ) ) ) ) ) & ! ( ( (v.y>>41)%2 ) ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>11)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) & ! ( ( (v.x>>20)%2 ) & ( ( ( ( (v.x>>19)%2 ) ) ) ) ) ) | ( ( ( (v.y>>12)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) & ! ( ( (v.x>>20)%2 ) & ( ( ( ( (v.x>>19)%2 ) ) ) ) ) ) | ( ( (v.x>>19)%2 ) & ( ( ( ! ( (v.x>>20)%2 ) ) ) ) )<< 19 ;
        aux.x |=(unsigned long long) ( ( (v.y>>8)%2 ) & ( ( ( ( (v.x>>19)%2 ) ) ) ) ) | ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>60)%2 ) & ( (v.x>>10)%2 ) ) ) ) ) | ( ( (v.x>>22)%2 ) )<< 20 ;
        aux.x |=(unsigned long long) ( ( (v.x>>17)%2 ) & ( ( ( ( (v.x>>14)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) ) ) ) )<< 21 ;
        aux.x |=(unsigned long long) ( ( (v.z>>4)%2 ) & ( ( ( ! ( (v.y>>8)%2 ) ) ) ) ) | ( ( (v.y>>58)%2 ) & ( ( ( ( (v.y>>8)%2 ) & ( (v.x>>10)%2 ) ) ) ) ) | ( ( (v.y>>57)%2 ) & ( ( ( ( (v.y>>8)%2 ) & ( (v.x>>10)%2 ) ) ) ) ) | ( ( (v.y>>56)%2 ) & ( ( ( ( (v.y>>8)%2 ) & ( (v.x>>10)%2 ) ) ) ) )<< 22 ;
        aux.x |=(unsigned long long) ( ( (v.x>>52)%2 ) ) | ( ( ( ( (v.x>>23)%2 ) ) & ! ( ( (v.y>>14)%2 ) ) ) & ! ( ( (v.x>>46)%2 ) ) )<< 23 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) & ! ( ( (v.y>>15)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) ) | ( ( ( (v.x>>42)%2 ) & ( ( ( ( (v.y>>49)%2 ) ) ) ) ) & ! ( ( (v.y>>15)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) )<< 24 ;
        aux.x |=(unsigned long long) ( ( (v.y>>52)%2 ) )<< 25 ;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_18_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>33)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) & ! ( ( (v.y>>25)%2 ) ) ) & ! ( ( (v.x>>23)%2 ) ) ) | ( ( ( ( (v.x>>34)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) & ! ( ( (v.y>>25)%2 ) ) ) & ! ( ( (v.x>>23)%2 ) ) ) | ( ( ( ( (v.x>>8)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) & ! ( ( (v.y>>25)%2 ) ) ) & ! ( ( (v.x>>23)%2 ) ) ) | ( ( ( ( (v.x>>32)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) & ! ( ( (v.y>>25)%2 ) ) ) & ! ( ( (v.x>>23)%2 ) ) ) | ( ( ( ( (v.x>>35)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) & ! ( ( (v.y>>25)%2 ) ) ) & ! ( ( (v.x>>23)%2 ) ) )<< 26 ;
        aux.x |=(unsigned long long) ( ( (v.x>>27)%2 ) & ( ( ( ! ( (v.y>>61)%2 ) ) ) & ( ( ( (v.x>>32)%2 ) ) ) ) ) | ( ( (v.y>>56)%2 ) & ( ( ( ! ( (v.x>>32)%2 ) & ! ( (v.x>>27)%2 ) ) ) ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) & ( ( ( ( (v.y>>5)%2 ) & ( (v.x>>22)%2 ) ) ) ) ) & ! ( ( (v.y>>41)%2 ) ) ) | ( ( ( (v.x>>37)%2 ) & ( ( ( ( (v.x>>22)%2 ) ) & ( ( ( ! ( (v.x>>28)%2 ) ) ) ) ) ) ) & ! ( ( (v.y>>41)%2 ) ) )<< 28 ;
        aux.x |=(unsigned long long) ( ( (v.x>>33)%2 ) & ( ( ( ! ( (v.y>>24)%2 ) ) ) & ( ( ( (v.x>>29)%2 ) ) ) ) ) | ( ( (v.y>>57)%2 ) & ( ( ( ! ( (v.x>>33)%2 ) & ! ( (v.x>>29)%2 ) ) ) ) ) | ( ( (v.y>>7)%2 ) & ( ( ( ! ( (v.x>>29)%2 ) ) ) & ( ( ! ( (v.y>>59)%2 ) ) ) & ( ( ( (v.z>>5)%2 ) ) ) & ( ( ! ( (v.x>>33)%2 ) ) ) ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( (v.y>>58)%2 ) & ( ( ( ! ( (v.x>>30)%2 ) ) & ( ( ( ! ( (v.x>>34)%2 ) ) ) ) ) ) ) | ( ( (v.x>>30)%2 ) & ( ( ( ! ( (v.y>>24)%2 ) & ! ( (v.y>>11)%2 ) ) ) & ( ( ( (v.x>>34)%2 ) ) ) ) )<< 30 ;
        aux.x |=(unsigned long long) ( ( (v.y>>59)%2 ) & ( ( ( ! ( (v.x>>35)%2 ) ) ) & ( ( ! ( (v.y>>7)%2 ) ) ) & ( ( ! ( (v.x>>31)%2 ) ) ) ) ) | ( ( (v.x>>35)%2 ) & ( ( ( ! ( (v.y>>24)%2 ) ) ) & ( ( ( (v.x>>31)%2 ) ) ) ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( (v.x>>27)%2 ) ) | ( ( (v.y>>56)%2 ) & ( ( ( ! ( (v.x>>27)%2 ) ) ) & ( ( ! ( (v.x>>32)%2 ) ) ) ) )<< 32 ;
        aux.x |=(unsigned long long) ( ( (v.y>>57)%2 ) & ( ( ( ! ( (v.x>>29)%2 ) ) ) & ( ( ! ( (v.x>>33)%2 ) ) ) ) ) | ( ( (v.x>>29)%2 ) )<< 33 ;
        aux.x |=(unsigned long long) ( ( (v.y>>58)%2 ) & ( ( ( ! ( (v.x>>30)%2 ) ) ) & ( ( ! ( (v.x>>34)%2 ) ) ) ) ) | ( ( (v.x>>30)%2 ) )<< 34 ;
        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) ) | ( ( (v.y>>59)%2 ) & ( ( ( ! ( (v.x>>35)%2 ) ) ) & ( ( ! ( (v.x>>31)%2 ) ) ) ) )<< 35 ;
        aux.x |=(unsigned long long) ( ( (v.x>>24)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) | ( ( (v.x>>22)%2 ) ) | ( ( (v.y>>43)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.z>>6)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ( ( (v.y>>5)%2 ) )<< 39 ;
        aux.x |=(unsigned long long) ( ( (v.y>>11)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) | ( ( (v.y>>12)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>33)%2 ) ) & ! ( ( (v.x>>10)%2 ) & ( ( ( ( (v.x>>41)%2 ) ) ) & ( ( ! ( (v.x>>40)%2 ) ) ) ) ) ) & ! ( ( (v.x>>11)%2 ) & ( ( ( ( (v.x>>41)%2 ) ) ) & ( ( ( (v.x>>10)%2 ) ) ) ) ) ) & ! ( ( (v.x>>41)%2 ) & ( ( ( ( (v.x>>11)%2 ) & ( (v.x>>33)%2 ) ) ) & ( ( ! ( (v.x>>40)%2 ) & ! ( (v.y>>14)%2 ) & ! ( (v.y>>7)%2 ) & ! ( (v.x>>10)%2 ) ) ) ) ) ) | ( ( ( ( (v.x>>40)%2 ) & ( ( ( ( (v.x>>10)%2 ) ) ) ) ) & ! ( ( (v.x>>10)%2 ) & ( ( ( ( (v.x>>41)%2 ) ) ) & ( ( ! ( (v.x>>40)%2 ) ) ) ) ) ) & ! ( ( (v.x>>11)%2 ) & ( ( ( ( (v.x>>41)%2 ) ) ) & ( ( ( (v.x>>10)%2 ) ) ) ) ) ) | ( ( ( ( ( (v.y>>7)%2 ) ) & ! ( ( (v.x>>10)%2 ) & ( ( ( ( (v.x>>41)%2 ) ) ) & ( ( ! ( (v.x>>40)%2 ) ) ) ) ) ) & ! ( ( (v.x>>11)%2 ) & ( ( ( ( (v.x>>41)%2 ) ) ) & ( ( ( (v.x>>10)%2 ) ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.x>>41)%2 ) ) ) ) ) )<< 41 ;
        aux.x |=(unsigned long long) ( ( (v.y>>49)%2 ) & ( ( ( ( (v.z>>2)%2 ) ) ) & ( ( ! ( (v.x>>39)%2 ) & ! ( (v.x>>42)%2 ) ) ) ) ) | ( ( (v.y>>45)%2 ) & ( ( ( ! ( (v.x>>39)%2 ) & ! ( (v.z>>2)%2 ) & ! ( (v.y>>49)%2 ) & ! ( (v.y>>14)%2 ) & ! ( (v.x>>42)%2 ) ) ) ) ) | ( ( (v.y>>14)%2 ) & ( ( ( ! ( (v.x>>42)%2 ) ) ) & ( ( ( (v.x>>39)%2 ) & ( (v.z>>2)%2 ) & ( (v.y>>49)%2 ) ) ) ) ) | ( ( (v.x>>42)%2 ) & ( ( ( ! ( (v.x>>39)%2 ) & ! ( (v.y>>45)%2 ) ) ) ) )<< 42 ;
        aux.x |=(unsigned long long) ( ( (v.x>>56)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>49)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>50)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>51)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>46)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>51)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>54)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>55)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>61)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>47)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( (v.x>>56)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>61)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>51)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>46)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>51)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>47)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.x>>56)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>49)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>50)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>51)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>53)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>54)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>55)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( (v.z>>0)%2 ) & ( ( ( ( (v.y>>60)%2 ) ) ) ) ) | ( ( (v.x>>23)%2 ) & ( ( ( ( (v.y>>60)%2 ) ) ) ) ) | ( ( (v.y>>40)%2 ) & ( ( ( ( (v.y>>60)%2 ) ) ) ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>11)%2 ) & ( ( ( ! ( (v.x>>61)%2 ) ) ) & ( ( ! ( (v.y>>7)%2 ) ) ) ) ) & ! ( ( (v.y>>7)%2 ) ) ) & ! ( ( (v.x>>61)%2 ) ) ) | ( ( ( ( (v.x>>23)%2 ) & ( ( ( ! ( (v.y>>7)%2 ) ) ) & ( ( ! ( (v.x>>61)%2 ) ) ) ) ) & ! ( ( (v.y>>7)%2 ) ) ) & ! ( ( (v.x>>61)%2 ) ) )<< 47 ;
        aux.x |=(unsigned long long) ( ( ( ( ( ( ( (v.y>>7)%2 ) & ( ( ( ( (v.y>>39)%2 ) ) ) ) ) & ! ( ( (v.x>>39)%2 ) ) ) & ! ( ( (v.y>>8)%2 ) ) ) & ! ( ( (v.x>>61)%2 ) ) ) & ! ( ( (v.y>>27)%2 ) ) ) ) | ! ( ( (v.x>>39)%2 ) | ( (v.y>>8)%2 ) | ( (v.y>>39)%2 ) | ( (v.y>>7)%2 ) | ( (v.y>>27)%2 ) | ( (v.x>>61)%2 ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( (v.y>>26)%2 ) ) | ( ( (v.x>>16)%2 ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( (v.x>>16)%2 ) & ( ( ( ( (v.y>>40)%2 ) ) ) ) ) | ( ( (v.y>>26)%2 ) & ( ( ( ( (v.y>>40)%2 ) ) ) ) )<< 50 ;
        aux.x |=(unsigned long long) ( ( (v.x>>38)%2 ) ) | ( ( (v.y>>26)%2 ) ) | ( ( (v.x>>16)%2 ) )<< 51 ;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_18_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) & ( ( ( ( (v.y>>51)%2 ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.x>>52)%2 ) ) ) ) ) ) | ( ( ( (v.y>>51)%2 ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.x>>52)%2 ) ) ) ) ) ) | ( ( ( (v.x>>53)%2 ) & ( ( ( ( (v.y>>27)%2 ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.x>>52)%2 ) ) ) ) ) ) | ( ( ( (v.x>>54)%2 ) & ( ( ( ( (v.y>>27)%2 ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.x>>52)%2 ) ) ) ) ) ) | ( ( ( (v.y>>27)%2 ) & ( ( ( ( (v.y>>51)%2 ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.x>>52)%2 ) ) ) ) ) ) | ( ( ( (v.x>>55)%2 ) & ( ( ( ( (v.y>>27)%2 ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.x>>52)%2 ) ) ) ) ) )<< 52 ;
        aux.x |=(unsigned long long) ( ( (v.y>>37)%2 ) & ( ( ( ( (v.y>>43)%2 ) ) ) | ( ( ( (v.x>>37)%2 ) ) ) ) ) | ( ( (v.x>>58)%2 ) & ( ( ( ( (v.y>>43)%2 ) ) ) | ( ( ( (v.x>>37)%2 ) ) ) ) ) | ( ( (v.x>>37)%2 ) & ( ( ( ( (v.y>>43)%2 ) ) ) ) ) | ( ( (v.y>>52)%2 ) ) | ( ( (v.y>>26)%2 ) ) | ( ( (v.y>>35)%2 ) ) | ( ( (v.x>>25)%2 ) ) | ( ( (v.x>>16)%2 ) )<< 53 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) & ( ( ( ! ( (v.x>>54)%2 ) ) ) & ( ( ( (v.x>>22)%2 ) ) ) ) ) | ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>22)%2 ) ) ) & ( ( ! ( (v.x>>54)%2 ) ) ) ) ) | ( ( (v.y>>12)%2 ) & ( ( ( ( (v.x>>22)%2 ) ) ) & ( ( ! ( (v.x>>54)%2 ) ) ) ) ) | ( ( (v.x>>37)%2 ) & ( ( ( ! ( (v.x>>54)%2 ) ) ) & ( ( ( (v.x>>22)%2 ) ) ) ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>52)%2 ) ) & ! ( ( (v.x>>28)%2 ) ) ) | ( ( ( (v.y>>26)%2 ) ) & ! ( ( (v.x>>28)%2 ) ) ) | ( ( ( (v.x>>38)%2 ) ) & ! ( ( (v.x>>28)%2 ) ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( (v.x>>16)%2 ) ) | ( ( (v.y>>26)%2 ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) & ( ( ( ! ( (v.x>>57)%2 ) ) ) | ( ( ! ( (v.x>>48)%2 ) ) ) ) ) & ! ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) ) | ( ( ( (v.x>>47)%2 ) & ( ( ( ( (v.x>>11)%2 ) ) ) & ( ( ! ( (v.x>>48)%2 ) ) ) ) ) & ! ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) ) | ( ( ( (v.x>>61)%2 ) & ( ( ( ! ( (v.x>>57)%2 ) ) ) | ( ( ! ( (v.x>>48)%2 ) ) ) ) ) & ! ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) ) | ( ( ( (v.y>>39)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) ) ) | ( ( ! ( (v.x>>57)%2 ) ) ) ) ) & ! ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) ) | ( ( ( (v.x>>11)%2 ) & ( ( ( ( (v.x>>47)%2 ) ) ) & ( ( ! ( (v.x>>57)%2 ) ) ) ) ) & ! ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) ) | ( ( ( (v.x>>57)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) ) ) ) ) & ! ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( (v.y>>46)%2 ) ) | ( ( (v.x>>59)%2 ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) ) | ( ( (v.x>>22)%2 ) )<< 59 ;
        aux.x |=(unsigned long long) ( ( (v.y>>13)%2 ) )<< 60 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>26)%2 ) & ( ( ( ( (v.x>>59)%2 ) ) & ( ( ( ! ( (v.x>>6)%2 ) ) ) ) ) | ( ( ( (v.x>>37)%2 ) ) ) ) ) & ! ( ( (v.y>>7)%2 ) ) ) | ( ( ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>61)%2 ) ) & ( ( ( ( (v.y>>26)%2 ) | ( (v.x>>16)%2 ) ) ) ) ) ) ) & ! ( ( (v.y>>7)%2 ) ) ) & ! ( ( (v.y>>16)%2 ) ) ) | ( ( ( (v.x>>16)%2 ) & ( ( ( ( (v.x>>59)%2 ) ) & ( ( ( ! ( (v.x>>6)%2 ) ) ) ) ) | ( ( ( (v.x>>37)%2 ) ) ) ) ) & ! ( ( (v.y>>7)%2 ) ) )<< 61 ;
        aux.x |=(unsigned long long) ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.x>>23)%2 ) ) ) ) ) | ( ( (v.y>>7)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) )<< 62 ;
        aux.x |=(unsigned long long) ( ( (v.z>>1)%2 ) ) | ( ( (v.y>>45)%2 ) )<< 63 ;
        aux.y |=(unsigned long long) ( ( (v.x>>33)%2 ) ) | ( ( (v.x>>28)%2 ) ) | ( ( (v.x>>24)%2 ) ) | ( ( (v.x>>17)%2 ) ) | ( ( (v.y>>35)%2 ) ) | ( ( (v.x>>22)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) )<<0;
        aux.y |=(unsigned long long) ( ( (v.y>>37)%2 ) ) | ( ( (v.y>>8)%2 ) ) | ( ( (v.x>>3)%2 ) ) | ( ( (v.x>>29)%2 ) ) | ( ( (v.x>>30)%2 ) )<<1;
        aux.y |=(unsigned long long) ( ( (v.x>>60)%2 ) ) | ( ( (v.y>>2)%2 ) & ( ( ( ( (v.y>>49)%2 ) ) ) ) ) | ( ( (v.y>>39)%2 ) ) | ( ( (v.y>>45)%2 ) & ( ( ( ! ( (v.y>>2)%2 ) ) ) & ( ( ! ( (v.y>>49)%2 ) ) ) & ( ( ( (v.x>>24)%2 ) ) ) ) ) | ( ( (v.x>>3)%2 ) )<<2;
        aux.y |=(unsigned long long) ( ( (v.y>>3)%2 ) & ( ( ( ! ( (v.y>>15)%2 ) ) ) & ( ( ! ( (v.y>>2)%2 ) ) ) ) ) | ( ( (v.y>>1)%2 ) & ( ( ( ! ( (v.y>>3)%2 ) ) ) & ( ( ( (v.y>>0)%2 ) ) ) ) )<<3;
        aux.y |=(unsigned long long) ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) ) | ( ( (v.y>>1)%2 ) & ( ( ( ( (v.y>>2)%2 ) ) ) ) ) | ( ( (v.y>>4)%2 ) )<<4;
        aux.y |=(unsigned long long) ( ( ( (v.y>>0)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) & ! ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) ) ) | ( ( ( (v.y>>2)%2 ) & ( ( ( ( (v.y>>3)%2 ) ) ) ) ) & ! ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) ) )<<5;
        aux.y |=(unsigned long long) ( ( ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>3)%2 ) ) ) & ( ( ! ( (v.y>>6)%2 ) ) ) ) ) & ! ( ( (v.y>>0)%2 ) & ( ( ( ( (v.y>>6)%2 ) ) ) ) ) ) & ! ( ( (v.y>>2)%2 ) & ( ( ( ( (v.y>>6)%2 ) ) ) ) ) ) | ( ( ( ( (v.y>>6)%2 ) & ( ( ( ! ( (v.y>>0)%2 ) ) ) & ( ( ! ( (v.y>>2)%2 ) ) ) ) ) & ! ( ( (v.y>>0)%2 ) & ( ( ( ( (v.y>>6)%2 ) ) ) ) ) ) & ! ( ( (v.y>>2)%2 ) & ( ( ( ( (v.y>>6)%2 ) ) ) ) ) ) | ( ( ( ( (v.y>>1)%2 ) & ( ( ( ! ( (v.y>>6)%2 ) ) ) ) ) & ! ( ( (v.y>>0)%2 ) & ( ( ( ( (v.y>>6)%2 ) ) ) ) ) ) & ! ( ( (v.y>>2)%2 ) & ( ( ( ( (v.y>>6)%2 ) ) ) ) ) )<<6;
        aux.y |=(unsigned long long) ( ( ( (v.y>>7)%2 ) & ( ( ( ( (v.y>>60)%2 ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.y>>7)%2 ) ) ) ) ) ) | ( ( ( (v.x>>63)%2 ) & ( ( ( ( (v.y>>60)%2 ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.y>>7)%2 ) ) ) ) ) )<<7;
        aux.y |=(unsigned long long) ( ( ( (v.x>>0)%2 ) & ( ( ( ( (v.x>>10)%2 ) ) ) & ( ( ( (v.y>>9)%2 ) ) ) ) ) & ! ( ( (v.y>>53)%2 ) & ( ( ( ( (v.y>>8)%2 ) ) ) ) ) ) | ( ( ( (v.y>>8)%2 ) & ( ( ( ! ( (v.y>>14)%2 ) ) ) & ( ( ! ( (v.y>>53)%2 ) ) ) ) ) & ! ( ( (v.y>>53)%2 ) & ( ( ( ( (v.y>>8)%2 ) ) ) ) ) ) | ( ( ( (v.x>>19)%2 ) & ( ( ( ( (v.x>>10)%2 ) ) ) & ( ( ( (v.y>>9)%2 ) ) ) ) ) & ! ( ( (v.y>>53)%2 ) & ( ( ( ( (v.y>>8)%2 ) ) ) ) ) )<<8;
        aux.y |=(unsigned long long) ( ( (v.y>>8)%2 ) & ( ( ( ! ( (v.y>>9)%2 ) ) ) & ( ( ( (v.x>>63)%2 ) ) ) ) ) | ( ( (v.y>>9)%2 ) & ( ( ( ! ( (v.y>>8)%2 ) ) ) ) ) | ( ( (v.x>>63)%2 ) & ( ( ( ! ( (v.y>>8)%2 ) ) ) ) )<<9;
        aux.y |=(unsigned long long) ( ( (v.y>>4)%2 ) & ( ( ( ( (v.x>>23)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) ) ) ) ) | ( ( (v.y>>5)%2 ) & ( ( ( ( (v.x>>12)%2 ) ) ) & ( ( ( (v.y>>4)%2 ) ) ) ) ) | ( ( (v.x>>12)%2 ) & ( ( ( ( (v.x>>10)%2 ) ) ) ) ) | ( ( (v.x>>23)%2 ) & ( ( ( ( (v.x>>10)%2 ) ) ) ) )<<10;
        aux.y |=(unsigned long long) ( ( (v.x>>30)%2 ) ) | ( ( ( (v.x>>33)%2 ) & ( ( ( ( (v.y>>11)%2 ) ) ) ) ) & ! ( ( (v.y>>7)%2 ) & ( ( ( ! ( (v.x>>30)%2 ) ) ) ) ) )<<11;
        aux.y |=(unsigned long long) ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>24)%2 ) & ( (v.y>>5)%2 ) ) ) ) ) | ( ( (v.x>>24)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) & ( ( ! ( (v.y>>5)%2 ) & ! ( (v.x>>0)%2 ) & ! ( (v.x>>22)%2 ) & ! ( (v.x>>60)%2 ) ) ) ) ) | ( ( ( (v.x>>22)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) ) & ! ( ( (v.x>>60)%2 ) & ( ( ( ! ( (v.x>>24)%2 ) & ! ( (v.y>>45)%2 ) ) ) & ( ( ( (v.x>>0)%2 ) ) ) ) ) )<<12;
        aux.y |=(unsigned long long) ( ( (v.y>>37)%2 ) & ( ( ( ! ( (v.x>>3)%2 ) ) ) & ( ( ( (v.x>>5)%2 ) ) & ( ( ( ( (v.y>>4)%2 ) ) ) | ( ( ( (v.y>>5)%2 ) ) ) ) ) ) ) | ( ( (v.y>>8)%2 ) & ( ( ( ! ( (v.x>>3)%2 ) ) ) & ( ( ( (v.x>>5)%2 ) ) & ( ( ( ( (v.y>>4)%2 ) ) ) | ( ( ( (v.y>>5)%2 ) ) ) ) ) ) ) | ( ( (v.x>>3)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) | ( ( ( (v.y>>4)%2 ) ) ) ) ) | ( ( (v.y>>26)%2 ) & ( ( ( ! ( (v.x>>3)%2 ) ) ) & ( ( ( (v.x>>5)%2 ) ) & ( ( ( ( (v.y>>5)%2 ) ) ) | ( ( ( (v.y>>4)%2 ) ) ) ) ) ) ) | ( ( (v.x>>16)%2 ) & ( ( ( ! ( (v.x>>3)%2 ) ) ) & ( ( ( (v.x>>5)%2 ) ) & ( ( ( ( (v.y>>5)%2 ) ) ) | ( ( ( (v.y>>4)%2 ) ) ) ) ) ) )<<13;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_18_parte4(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.y |=(unsigned long long) ( ! ( ( ( (v.x>>22)%2 ) ) ) ) | ! ( ( (v.x>>22)%2 ) )<<14;
        aux.y |=(unsigned long long) ( ( ( (v.z>>7)%2 ) ) & ! ( ( (v.y>>45)%2 ) & ( ( ( ( (v.y>>15)%2 ) ) ) ) ) ) | ( ( ( (v.y>>23)%2 ) & ( ( ( ( (v.y>>0)%2 ) ) ) & ( ( ( (v.y>>37)%2 ) ) ) & ( ( ( (v.x>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>45)%2 ) & ( ( ( ( (v.y>>15)%2 ) ) ) ) ) )<<15;
        aux.y |=(unsigned long long) ( ! ( ( ( (v.z>>7)%2 ) ) | ( ( (v.x>>22)%2 ) & ( ( ( ( (v.z>>4)%2 ) ) ) ) ) ) ) | ! ( ( (v.x>>22)%2 ) | ( (v.z>>7)%2 ) | ( (v.z>>4)%2 ) )<<16;
        aux.y |=(unsigned long long) ( ( ( ( (v.x>>42)%2 ) & ( ( ( ( (v.z>>2)%2 ) ) ) ) ) & ! ( ( (v.y>>8)%2 ) ) ) & ! ( ( (v.y>>7)%2 ) ) )<<17;
        aux.y |=(unsigned long long) ( ( (v.y>>8)%2 ) )<<18;
        aux.y |=(unsigned long long) ( ( (v.y>>56)%2 ) & ( ( ( ( (v.x>>26)%2 ) ) ) ) )<<19;
        aux.y |=(unsigned long long) ( ( (v.y>>57)%2 ) & ( ( ( ( (v.x>>26)%2 ) ) ) ) )<<20;
        aux.y |=(unsigned long long) ( ( (v.y>>58)%2 ) & ( ( ( ( (v.x>>26)%2 ) ) ) ) )<<21;
        aux.y |=(unsigned long long) ( ( (v.y>>59)%2 ) & ( ( ( ( (v.x>>26)%2 ) ) ) ) )<<22;
        aux.y |=(unsigned long long) ( ( (v.y>>3)%2 ) & ( ( ( ( (v.x>>9)%2 ) ) ) ) ) | ( ( (v.y>>5)%2 ) & ( ( ( ( (v.x>>9)%2 ) ) ) ) )<<23;
        aux.y |=(unsigned long long) ( ( (v.x>>11)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) )<<24;
        aux.y |=(unsigned long long) ( ( (v.y>>8)%2 ) )<<25;
        aux.y |=(unsigned long long) ( ( ( ( ( (v.y>>36)%2 ) & ( ( ( ( (v.z>>2)%2 ) & ( (v.x>>42)%2 ) ) ) ) ) & ! ( ( (v.y>>32)%2 ) & ( ( ( ( (v.y>>26)%2 ) ) ) ) ) ) & ! ( ( (v.y>>63)%2 ) & ( ( ( ( (v.y>>26)%2 ) ) ) ) ) ) & ! ( ( (v.y>>38)%2 ) & ( ( ( ! ( (v.x>>61)%2 ) ) ) ) ) ) | ( ( ( (v.y>>23)%2 ) & ( ( ( ! ( (v.x>>61)%2 ) ) & ( ( ( ! ( (v.y>>38)%2 ) ) ) & ( ( ( (v.z>>2)%2 ) & ( (v.x>>42)%2 ) ) ) & ( ( ! ( (v.y>>26)%2 ) ) ) & ( ( ! ( (v.x>>21)%2 ) & ! ( (v.y>>36)%2 ) & ! ( (v.y>>50)%2 ) ) ) & ( ( ( (v.x>>16)%2 ) ) ) ) ) | ( ( ! ( (v.x>>33)%2 ) ) & ( ( ( ( (v.x>>16)%2 ) ) ) & ( ( ( (v.z>>2)%2 ) & ( (v.x>>42)%2 ) ) ) & ( ( ! ( (v.y>>26)%2 ) ) ) ) ) | ( ( ( (v.x>>33)%2 ) & ( (v.x>>61)%2 ) ) & ( ( ( ! ( (v.y>>26)%2 ) & ! ( (v.x>>16)%2 ) ) ) & ( ( ( (v.z>>2)%2 ) & ( (v.x>>42)%2 ) ) ) ) ) ) ) & ! ( ( (v.y>>38)%2 ) & ( ( ( ! ( (v.x>>61)%2 ) ) ) ) ) ) | ( ( ( ( ( (v.y>>50)%2 ) & ( ( ( ( (v.z>>2)%2 ) & ( (v.x>>42)%2 ) ) ) ) ) & ! ( ( (v.y>>32)%2 ) & ( ( ( ( (v.y>>26)%2 ) ) ) ) ) ) & ! ( ( (v.y>>63)%2 ) & ( ( ( ( (v.y>>26)%2 ) ) ) ) ) ) & ! ( ( (v.y>>38)%2 ) & ( ( ( ! ( (v.x>>61)%2 ) ) ) ) ) ) | ( ( ( ( ( (v.x>>21)%2 ) & ( ( ( ( (v.z>>2)%2 ) & ( (v.x>>42)%2 ) ) ) ) ) & ! ( ( (v.y>>32)%2 ) & ( ( ( ( (v.y>>26)%2 ) ) ) ) ) ) & ! ( ( (v.y>>63)%2 ) & ( ( ( ( (v.y>>26)%2 ) ) ) ) ) ) & ! ( ( (v.y>>38)%2 ) & ( ( ( ! ( (v.x>>61)%2 ) ) ) ) ) )<<26;
        aux.y |=(unsigned long long) ( ( (v.y>>45)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>29)%2 ) & ( (v.x>>61)%2 ) ) ) & ( ( ! ( (v.y>>27)%2 ) ) ) ) ) | ( ( (v.y>>35)%2 ) & ( ( ( ( (v.y>>27)%2 ) ) ) ) ) | ( ( (v.y>>27)%2 ) & ( ( ( ! ( (v.y>>7)%2 ) & ! ( (v.x>>6)%2 ) & ! ( (v.x>>23)%2 ) ) ) ) ) | ( ( (v.x>>61)%2 ) & ( ( ( ! ( (v.y>>35)%2 ) & ! ( (v.x>>6)%2 ) & ! ( (v.x>>23)%2 ) ) ) & ( ( ( (v.y>>27)%2 ) ) ) ) )<<27;
        aux.y |=(unsigned long long) ( ( (v.y>>14)%2 ) & ( ( ( ( (v.y>>30)%2 ) ) ) & ( ( ! ( (v.y>>28)%2 ) ) ) ) ) | ( ( (v.y>>28)%2 ) & ( ( ( ! ( (v.y>>29)%2 ) ) ) ) )<<28;
        aux.y |=(unsigned long long) ( ( (v.y>>29)%2 ) & ( ( ( ! ( (v.y>>27)%2 ) ) ) ) ) | ( ( (v.y>>35)%2 ) & ( ( ( ! ( (v.y>>29)%2 ) ) ) & ( ( ( (v.y>>28)%2 ) ) ) ) )<<29;
        aux.y |=(unsigned long long) ( ( ( (v.y>>30)%2 ) & ( ( ( ! ( (v.y>>28)%2 ) ) ) ) ) | ( ( (v.y>>28)%2 ) & ( ( ( ! ( (v.y>>27)%2 ) & ! ( (v.y>>30)%2 ) ) ) ) ) ) | ! ( ( (v.y>>27)%2 ) | ( (v.y>>28)%2 ) | ( (v.y>>30)%2 ) )<<30;
        aux.y |=(unsigned long long) ( ( (v.x>>11)%2 ) ) | ( ( (v.y>>33)%2 ) ) | ( ( (v.x>>2)%2 ) )<<31;
        aux.y |=(unsigned long long) ( ( (v.y>>31)%2 ) )<<32;
        aux.y |=(unsigned long long) ( ( ( ( (v.y>>59)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.y>>8)%2 ) ) ) & ! ( ( (v.y>>35)%2 ) & ( ( ( ( (v.x>>63)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) ) ) ) ) ) | ( ( ( ( (v.y>>57)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.y>>8)%2 ) ) ) & ! ( ( (v.y>>35)%2 ) & ( ( ( ( (v.x>>63)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) ) ) ) ) ) | ( ( ( ( (v.y>>58)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.y>>8)%2 ) ) ) & ! ( ( (v.y>>35)%2 ) & ( ( ( ( (v.x>>63)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) ) ) ) ) ) | ( ( ( ( (v.y>>56)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.y>>8)%2 ) ) ) & ! ( ( (v.y>>35)%2 ) & ( ( ( ( (v.x>>63)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) ) ) ) ) )<<33;
        aux.y |=(unsigned long long) ( ( (v.y>>7)%2 ) & ( ( ( ( (v.y>>45)%2 ) & ( (v.y>>60)%2 ) ) ) & ( ( ! ( (v.y>>34)%2 ) | ! ( (v.x>>29)%2 ) ) ) ) ) | ( ( (v.x>>12)%2 ) & ( ( ( ( (v.y>>45)%2 ) & ( (v.y>>60)%2 ) ) ) & ( ( ! ( (v.y>>34)%2 ) | ! ( (v.x>>29)%2 ) ) ) ) )<<34;
        aux.y |=(unsigned long long) ( ( (v.y>>36)%2 ) ) | ( ( (v.y>>41)%2 ) ) | ( ( (v.y>>44)%2 ) )<<35;
        aux.y |=(unsigned long long) ( ( (v.x>>11)%2 ) & ( ( ( ( (v.x>>16)%2 ) ) ) ) ) | ( ( (v.x>>19)%2 ) & ( ( ( ( (v.x>>16)%2 ) ) ) ) )<<36;
        aux.y |=(unsigned long long) ( ( (v.y>>37)%2 ) & ( ( ( ! ( (v.x>>36)%2 ) & ! ( (v.y>>63)%2 ) & ! ( (v.y>>7)%2 ) ) ) ) ) | ( ( (v.y>>61)%2 ) & ( ( ( ! ( (v.y>>38)%2 ) & ! ( (v.y>>37)%2 ) ) ) ) )<<37;
        aux.y |=(unsigned long long) ( ! ( ( ( (v.x>>0)%2 ) ) | ( ( (v.y>>8)%2 ) ) | ( ( (v.y>>4)%2 ) ) ) ) | ! ( ( (v.y>>4)%2 ) | ( (v.x>>0)%2 ) | ( (v.y>>8)%2 ) )<<38;
        aux.y |=(unsigned long long) ( ( (v.y>>37)%2 ) )<<39;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_bool_18_parte5(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;
    
        aux.y |=(unsigned long long) ( ( ( ( (v.x>>45)%2 ) ) & ! ( ( (v.x>>46)%2 ) & ( ( ( ( (v.y>>40)%2 ) ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.y>>40)%2 ) ) ) ) ) ) | ( ( ( ( (v.y>>42)%2 ) ) & ! ( ( (v.x>>46)%2 ) & ( ( ( ( (v.y>>40)%2 ) ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.y>>40)%2 ) ) ) ) ) )<<40;
        aux.y |=(unsigned long long) ( ( (v.x>>28)%2 ) )<<41;
        aux.y |=(unsigned long long) ( ( (v.x>>56)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>49)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>50)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>51)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>46)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>53)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>51)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>54)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>55)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) )<<42;
        aux.y |=(unsigned long long) ( ( ( (v.x>>22)%2 ) & ( ( ( ( (v.x>>24)%2 ) & ( (v.y>>45)%2 ) ) ) ) ) & ! ( ( (v.y>>43)%2 ) & ( ( ( ( (v.x>>24)%2 ) & ( (v.x>>22)%2 ) & ( (v.y>>45)%2 ) & ( (v.y>>15)%2 ) ) ) ) ) )<<43;
        aux.y |=(unsigned long long) ( ( ( (v.x>>37)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) ) & ! ( ( (v.x>>23)%2 ) ) ) | ( ( (v.x>>59)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) & ( ( ( (v.x>>17)%2 ) ) ) ) )<<44;
        aux.y |=(unsigned long long) ( ( ( (v.x>>31)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) ) | ( ( ( (v.y>>18)%2 ) ) & ! ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) ) | ( ( ( (v.y>>59)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) ) | ( ( ( (v.x>>24)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) ) | ( ( ( (v.x>>14)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) ) | ( ( ( (v.x>>22)%2 ) ) & ! ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) ) | ( ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) )<<45;
        aux.y |=(unsigned long long) ( ( (v.y>>48)%2 ) )<<46;
        aux.y |=(unsigned long long) ( ( (v.z>>7)%2 ) )<<47;
        aux.y |=(unsigned long long) ( ( ( (v.y>>52)%2 ) ) & ! ( ( (v.z>>0)%2 ) ) )<<48;
        aux.y |=(unsigned long long) ( ( (v.y>>4)%2 ) & ( ( ( ! ( (v.y>>49)%2 ) ) ) ) ) | ( ( (v.y>>49)%2 ) & ( ( ( ! ( (v.y>>45)%2 ) ) ) ) )<<49;
        aux.y |=(unsigned long long) ( ( (v.y>>8)%2 ) & ( ( ( ( (v.y>>4)%2 ) | ( (v.y>>35)%2 ) | ( (v.y>>34)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) | ( (v.y>>3)%2 ) ) ) ) ) | ( ( (v.y>>45)%2 ) & ( ( ( ( (v.y>>4)%2 ) | ( (v.y>>35)%2 ) | ( (v.y>>34)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) | ( (v.y>>3)%2 ) ) ) ) ) | ( ( (v.x>>12)%2 ) & ( ( ( ( (v.y>>5)%2 ) | ( (v.y>>3)%2 ) ) ) & ( ( ( (v.y>>4)%2 ) | ( (v.y>>35)%2 ) | ( (v.y>>34)%2 ) ) ) ) )<<50;
        aux.y |=(unsigned long long) ( ( (v.y>>52)%2 ) )<<51;
        aux.y |=(unsigned long long) ( ( (v.x>>38)%2 ) )<<52;
        aux.y |=(unsigned long long) ( ( (v.z>>7)%2 ) ) | ( ( (v.y>>52)%2 ) )<<53;
        aux.y |=(unsigned long long) ( ( (v.y>>49)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) | ( ( (v.x>>5)%2 ) & ( ( ( ( (v.y>>49)%2 ) & ( (v.y>>54)%2 ) ) ) & ( ( ! ( (v.y>>4)%2 ) ) ) ) )<<54;
        aux.y |=(unsigned long long) ( ( ( (v.x>>24)%2 ) & ( ( ( ( (v.y>>4)%2 ) | ( (v.x>>59)%2 ) | ( (v.x>>37)%2 ) ) ) & ( ( ( (v.x>>17)%2 ) & ( (v.x>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>17)%2 ) ) ) | ( ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>17)%2 ) & ( (v.x>>16)%2 ) ) ) & ( ( ( (v.y>>4)%2 ) | ( (v.x>>59)%2 ) | ( (v.x>>37)%2 ) ) ) ) ) & ! ( ( (v.y>>17)%2 ) ) ) | ( ( ( (v.x>>16)%2 ) & ( ( ( ! ( (v.y>>17)%2 ) & ! ( (v.x>>17)%2 ) ) ) & ( ( ( (v.x>>24)%2 ) | ( (v.y>>45)%2 ) ) ) & ( ( ( (v.y>>4)%2 ) | ( (v.x>>59)%2 ) | ( (v.x>>37)%2 ) ) ) ) ) & ! ( ( (v.y>>17)%2 ) ) )<<55;
        aux.y |=(unsigned long long) ( ( ( (v.z>>8)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.y>>19)%2 ) & ! ( (v.z>>8)%2 ) & ! ( (v.y>>56)%2 ) ) ) | ( ( ( (v.y>>19)%2 ) ) ) ) ) ) | ( ( ( (v.y>>19)%2 ) & ( ( ( ! ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.y>>19)%2 ) & ! ( (v.z>>8)%2 ) & ! ( (v.y>>56)%2 ) ) ) | ( ( ( (v.y>>19)%2 ) ) ) ) ) ) | ( ( ( (v.y>>56)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.y>>19)%2 ) & ! ( (v.z>>8)%2 ) & ! ( (v.y>>56)%2 ) ) ) | ( ( ( (v.y>>19)%2 ) ) ) ) ) )<<56;
        aux.y |=(unsigned long long) ( ( ( (v.z>>9)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.z>>9)%2 ) & ! ( (v.y>>57)%2 ) & ! ( (v.y>>20)%2 ) ) ) | ( ( ( (v.y>>20)%2 ) ) ) ) ) ) | ( ( ( (v.y>>20)%2 ) & ( ( ( ! ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.z>>9)%2 ) & ! ( (v.y>>57)%2 ) & ! ( (v.y>>20)%2 ) ) ) | ( ( ( (v.y>>20)%2 ) ) ) ) ) ) | ( ( ( (v.y>>57)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.z>>9)%2 ) & ! ( (v.y>>57)%2 ) & ! ( (v.y>>20)%2 ) ) ) | ( ( ( (v.y>>20)%2 ) ) ) ) ) )<<57;
        aux.y |=(unsigned long long) ( ( ( (v.z>>10)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ( (v.y>>20)%2 ) ) ) | ( ( ! ( (v.z>>10)%2 ) & ! ( (v.y>>58)%2 ) & ! ( (v.y>>20)%2 ) ) ) ) ) ) | ( ( ( (v.y>>20)%2 ) & ( ( ( ! ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ( (v.y>>20)%2 ) ) ) | ( ( ! ( (v.z>>10)%2 ) & ! ( (v.y>>58)%2 ) & ! ( (v.y>>20)%2 ) ) ) ) ) ) | ( ( ( (v.y>>58)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ( (v.y>>20)%2 ) ) ) | ( ( ! ( (v.z>>10)%2 ) & ! ( (v.y>>58)%2 ) & ! ( (v.y>>20)%2 ) ) ) ) ) )<<58;
        aux.y |=(unsigned long long) ( ( ( (v.y>>59)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.z>>5)%2 ) & ! ( (v.y>>59)%2 ) & ! ( (v.y>>22)%2 ) ) ) | ( ( ( (v.y>>22)%2 ) ) ) ) ) ) | ( ( ( (v.z>>5)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.z>>5)%2 ) & ! ( (v.y>>59)%2 ) & ! ( (v.y>>22)%2 ) ) ) | ( ( ( (v.y>>22)%2 ) ) ) ) ) ) | ( ( ( (v.y>>22)%2 ) & ( ( ( ! ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.z>>5)%2 ) & ! ( (v.y>>59)%2 ) & ! ( (v.y>>22)%2 ) ) ) | ( ( ( (v.y>>22)%2 ) ) ) ) ) )<<59;
        aux.y |=(unsigned long long) ( ( ( (v.x>>1)%2 ) ) & ! ( ( (v.x>>62)%2 ) ) ) | ( ( ( (v.y>>60)%2 ) ) & ! ( ( (v.x>>62)%2 ) ) )<<60;
        aux.y |=(unsigned long long) ( ( (v.x>>27)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) )<<61;
        aux.y |=(unsigned long long) ( ( ( ( (v.y>>5)%2 ) ) & ! ( ( (v.x>>24)%2 ) ) ) & ! ( ( (v.y>>45)%2 ) ) ) | ( ( ( ( (v.y>>3)%2 ) ) & ! ( ( (v.x>>24)%2 ) ) ) & ! ( ( (v.y>>45)%2 ) ) ) | ( ( ( ( (v.y>>4)%2 ) ) & ! ( ( (v.x>>24)%2 ) ) ) & ! ( ( (v.y>>45)%2 ) ) ) | ( ( ( ( (v.x>>10)%2 ) ) & ! ( ( (v.x>>24)%2 ) ) ) & ! ( ( (v.y>>45)%2 ) ) ) | ( ( ( ( ( (v.x>>22)%2 ) ) & ! ( ( (v.x>>24)%2 ) ) ) & ! ( ( (v.y>>41)%2 ) ) ) & ! ( ( (v.y>>45)%2 ) ) )<<62;
        aux.y |=(unsigned long long) ( ( (v.x>>24)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) | ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) | ( ( ! ( (v.y>>63)%2 ) ) ) | ( ( ! ( (v.y>>62)%2 ) ) ) ) )<<63;
        aux.z |=(unsigned long long) ( ( ( ( (v.x>>44)%2 ) ) & ! ( ( (v.y>>14)%2 ) ) ) & ! ( ( (v.x>>46)%2 ) ) ) | ( ( ( ( (v.x>>43)%2 ) ) & ! ( ( (v.y>>14)%2 ) ) ) & ! ( ( (v.x>>46)%2 ) ) ) | ( ( ( ( (v.y>>42)%2 ) ) & ! ( ( (v.y>>14)%2 ) ) ) & ! ( ( (v.x>>46)%2 ) ) )<<0;
        aux.z |=(unsigned long long) ( ( (v.x>>23)%2 ) & ( ( ( ! ( (v.z>>1)%2 ) ) ) & ( ( ( (v.x>>63)%2 ) ) ) ) )<<1;

        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

unsigned long long confere_bool_18(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( (v.y>>10)%2 ) )<< 0 ;
        aux.x |=(unsigned long long) ( ( (v.x>>42)%2 ) & ( ( ( ( (v.z>>2)%2 ) ) & ( ( ( ( (v.x>>33)%2 ) ) ) & ( ( ( (v.x>>31)%2 ) ) ) ) ) ) )<< 1 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) )<< 2 ;
        aux.x |=(unsigned long long) ( ( (v.y>>5)%2 ) ) | ( ( (v.y>>4)%2 ) )<< 3 ;
        aux.x |=(unsigned long long) ( ( (v.y>>53)%2 ) )<< 4 ;
        aux.x |=(unsigned long long) ( ( (v.x>>7)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) )<< 5 ;
        aux.x |=(unsigned long long) ( ( (v.x>>13)%2 ) & ( ( ( ( (v.y>>5)%2 ) | ( (v.y>>3)%2 ) ) ) & ( ( ( (v.x>>39)%2 ) & ( (v.y>>45)%2 ) ) ) & ( ( ! ( (v.x>>6)%2 ) ) ) ) ) | ( ( (v.x>>6)%2 ) & ( ( ( ! ( (v.y>>14)%2 ) ) ) ) ) | ( ( (v.x>>63)%2 ) & ( ( ( ( (v.x>>39)%2 ) & ( (v.y>>45)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) | ( (v.y>>3)%2 ) ) ) & ( ( ! ( (v.x>>6)%2 ) ) ) ) )<< 6 ;
        aux.x |=(unsigned long long) ( ( (v.y>>55)%2 ) )<< 7 ;
        aux.x |=(unsigned long long) ( ( (v.y>>20)%2 ) ) | ( ( (v.y>>21)%2 ) ) | ( ( (v.y>>19)%2 ) ) | ( ( (v.y>>22)%2 ) )<< 8 ;
        aux.x |=(unsigned long long) ( ( (v.x>>39)%2 ) )<< 9 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) ) & ! ( ( (v.z>>3)%2 ) ) )<< 10 ;
        aux.x |=(unsigned long long) ( ( (v.x>>10)%2 ) )<< 11 ;
        aux.x |=(unsigned long long) ( ( (v.x>>13)%2 ) & ( ( ( ( (v.x>>11)%2 ) ) ) ) )<< 12 ;
        aux.x |=(unsigned long long) ( ( (v.x>>11)%2 ) )<< 13 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) & ! ( ( (v.y>>17)%2 ) & ( ( ( ( (v.x>>14)%2 ) ) ) ) ) )<< 14 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>45)%2 ) ) & ! ( ( (v.y>>41)%2 ) ) )<< 15 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>16)%2 ) & ( ( ( ! ( (v.y>>38)%2 ) ) ) & ( ( ( (v.y>>23)%2 ) ) ) ) ) & ! ( ( (v.y>>38)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) ) | ( ( ( (v.y>>23)%2 ) & ( ( ( ! ( (v.y>>26)%2 ) & ! ( (v.x>>16)%2 ) ) ) & ( ( ( (v.x>>33)%2 ) & ( (v.x>>61)%2 ) ) ) ) ) & ! ( ( (v.y>>38)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) )<< 16 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) & ( ( ( ( (v.x>>24)%2 ) | ( (v.y>>45)%2 ) ) ) ) ) & ! ( ( (v.y>>17)%2 ) ) )<< 17 ;
        aux.x |=(unsigned long long) ( ( (v.x>>15)%2 ) & ( ( ( ( (v.x>>33)%2 ) | ( (v.y>>7)%2 ) | ( (v.x>>32)%2 ) | ( (v.x>>34)%2 ) ) ) | ( ( ! ( (v.y>>41)%2 ) & ! ( (v.x>>33)%2 ) & ! ( (v.y>>7)%2 ) & ! ( (v.x>>32)%2 ) & ! ( (v.x>>34)%2 ) ) ) ) ) | ( ( ( (v.x>>24)%2 ) & ( ( ( ( (v.y>>45)%2 ) & ( (v.x>>15)%2 ) ) ) ) ) & ! ( ( (v.y>>41)%2 ) ) )<< 18 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>11)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) & ! ( ( (v.x>>20)%2 ) & ( ( ( ( (v.x>>19)%2 ) ) ) ) ) ) | ( ( ( (v.y>>12)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) & ! ( ( (v.x>>20)%2 ) & ( ( ( ( (v.x>>19)%2 ) ) ) ) ) ) | ( ( (v.x>>19)%2 ) & ( ( ( ! ( (v.x>>20)%2 ) ) ) ) )<< 19 ;
        aux.x |=(unsigned long long) ( ( (v.y>>8)%2 ) & ( ( ( ( (v.x>>19)%2 ) ) ) ) ) | ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>60)%2 ) & ( (v.x>>10)%2 ) ) ) ) ) | ( ( (v.x>>22)%2 ) )<< 20 ;
        aux.x |=(unsigned long long) ( ( (v.x>>17)%2 ) & ( ( ( ( (v.x>>14)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) ) ) ) )<< 21 ;
        aux.x |=(unsigned long long) ( ( (v.z>>4)%2 ) & ( ( ( ! ( (v.y>>8)%2 ) ) ) ) ) | ( ( (v.y>>58)%2 ) & ( ( ( ( (v.y>>8)%2 ) & ( (v.x>>10)%2 ) ) ) ) ) | ( ( (v.y>>57)%2 ) & ( ( ( ( (v.y>>8)%2 ) & ( (v.x>>10)%2 ) ) ) ) ) | ( ( (v.y>>56)%2 ) & ( ( ( ( (v.y>>8)%2 ) & ( (v.x>>10)%2 ) ) ) ) )<< 22 ;
        aux.x |=(unsigned long long) ( ( (v.x>>52)%2 ) ) | ( ( ( ( (v.x>>23)%2 ) ) & ! ( ( (v.y>>14)%2 ) ) ) & ! ( ( (v.x>>46)%2 ) ) )<< 23 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) & ! ( ( (v.y>>15)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) ) | ( ( ( (v.x>>42)%2 ) & ( ( ( ( (v.y>>49)%2 ) ) ) ) ) & ! ( ( (v.y>>15)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) )<< 24 ;
        aux.x |=(unsigned long long) ( ( (v.y>>52)%2 ) )<< 25 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>33)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) & ! ( ( (v.y>>25)%2 ) ) ) & ! ( ( (v.x>>23)%2 ) ) ) | ( ( ( ( (v.x>>34)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) & ! ( ( (v.y>>25)%2 ) ) ) & ! ( ( (v.x>>23)%2 ) ) ) | ( ( ( ( (v.x>>8)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) & ! ( ( (v.y>>25)%2 ) ) ) & ! ( ( (v.x>>23)%2 ) ) ) | ( ( ( ( (v.x>>32)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) & ! ( ( (v.y>>25)%2 ) ) ) & ! ( ( (v.x>>23)%2 ) ) ) | ( ( ( ( (v.x>>35)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) & ! ( ( (v.y>>25)%2 ) ) ) & ! ( ( (v.x>>23)%2 ) ) )<< 26 ;
        aux.x |=(unsigned long long) ( ( (v.x>>27)%2 ) & ( ( ( ! ( (v.y>>61)%2 ) ) ) & ( ( ( (v.x>>32)%2 ) ) ) ) ) | ( ( (v.y>>56)%2 ) & ( ( ( ! ( (v.x>>32)%2 ) & ! ( (v.x>>27)%2 ) ) ) ) )<< 27 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) & ( ( ( ( (v.y>>5)%2 ) & ( (v.x>>22)%2 ) ) ) ) ) & ! ( ( (v.y>>41)%2 ) ) ) | ( ( ( (v.x>>37)%2 ) & ( ( ( ( (v.x>>22)%2 ) ) & ( ( ( ! ( (v.x>>28)%2 ) ) ) ) ) ) ) & ! ( ( (v.y>>41)%2 ) ) )<< 28 ;
        aux.x |=(unsigned long long) ( ( (v.x>>33)%2 ) & ( ( ( ! ( (v.y>>24)%2 ) ) ) & ( ( ( (v.x>>29)%2 ) ) ) ) ) | ( ( (v.y>>57)%2 ) & ( ( ( ! ( (v.x>>33)%2 ) & ! ( (v.x>>29)%2 ) ) ) ) ) | ( ( (v.y>>7)%2 ) & ( ( ( ! ( (v.x>>29)%2 ) ) ) & ( ( ! ( (v.y>>59)%2 ) ) ) & ( ( ( (v.z>>5)%2 ) ) ) & ( ( ! ( (v.x>>33)%2 ) ) ) ) )<< 29 ;
        aux.x |=(unsigned long long) ( ( (v.y>>58)%2 ) & ( ( ( ! ( (v.x>>30)%2 ) ) & ( ( ( ! ( (v.x>>34)%2 ) ) ) ) ) ) ) | ( ( (v.x>>30)%2 ) & ( ( ( ! ( (v.y>>24)%2 ) & ! ( (v.y>>11)%2 ) ) ) & ( ( ( (v.x>>34)%2 ) ) ) ) )<< 30 ;
        aux.x |=(unsigned long long) ( ( (v.y>>59)%2 ) & ( ( ( ! ( (v.x>>35)%2 ) ) ) & ( ( ! ( (v.y>>7)%2 ) ) ) & ( ( ! ( (v.x>>31)%2 ) ) ) ) ) | ( ( (v.x>>35)%2 ) & ( ( ( ! ( (v.y>>24)%2 ) ) ) & ( ( ( (v.x>>31)%2 ) ) ) ) )<< 31 ;
        aux.x |=(unsigned long long) ( ( (v.x>>27)%2 ) ) | ( ( (v.y>>56)%2 ) & ( ( ( ! ( (v.x>>27)%2 ) ) ) & ( ( ! ( (v.x>>32)%2 ) ) ) ) )<< 32 ;
        aux.x |=(unsigned long long) ( ( (v.y>>57)%2 ) & ( ( ( ! ( (v.x>>29)%2 ) ) ) & ( ( ! ( (v.x>>33)%2 ) ) ) ) ) | ( ( (v.x>>29)%2 ) )<< 33 ;
        aux.x |=(unsigned long long) ( ( (v.y>>58)%2 ) & ( ( ( ! ( (v.x>>30)%2 ) ) ) & ( ( ! ( (v.x>>34)%2 ) ) ) ) ) | ( ( (v.x>>30)%2 ) )<< 34 ;
        aux.x |=(unsigned long long) ( ( (v.x>>31)%2 ) ) | ( ( (v.y>>59)%2 ) & ( ( ( ! ( (v.x>>35)%2 ) ) ) & ( ( ! ( (v.x>>31)%2 ) ) ) ) )<< 35 ;
        aux.x |=(unsigned long long) ( ( (v.x>>24)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) )<< 36 ;
        aux.x |=(unsigned long long) ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) | ( ( (v.x>>22)%2 ) ) | ( ( (v.y>>43)%2 ) )<< 37 ;
        aux.x |=(unsigned long long) ( ( (v.z>>6)%2 ) )<< 38 ;
        aux.x |=(unsigned long long) ( ( (v.y>>5)%2 ) )<< 39 ;
        aux.x |=(unsigned long long) ( ( (v.y>>11)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) | ( ( (v.y>>12)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) )<< 40 ;
        aux.x |=(unsigned long long) ( ( ( ( ( (v.x>>33)%2 ) ) & ! ( ( (v.x>>10)%2 ) & ( ( ( ( (v.x>>41)%2 ) ) ) & ( ( ! ( (v.x>>40)%2 ) ) ) ) ) ) & ! ( ( (v.x>>11)%2 ) & ( ( ( ( (v.x>>41)%2 ) ) ) & ( ( ( (v.x>>10)%2 ) ) ) ) ) ) & ! ( ( (v.x>>41)%2 ) & ( ( ( ( (v.x>>11)%2 ) & ( (v.x>>33)%2 ) ) ) & ( ( ! ( (v.x>>40)%2 ) & ! ( (v.y>>14)%2 ) & ! ( (v.y>>7)%2 ) & ! ( (v.x>>10)%2 ) ) ) ) ) ) | ( ( ( ( (v.x>>40)%2 ) & ( ( ( ( (v.x>>10)%2 ) ) ) ) ) & ! ( ( (v.x>>10)%2 ) & ( ( ( ( (v.x>>41)%2 ) ) ) & ( ( ! ( (v.x>>40)%2 ) ) ) ) ) ) & ! ( ( (v.x>>11)%2 ) & ( ( ( ( (v.x>>41)%2 ) ) ) & ( ( ( (v.x>>10)%2 ) ) ) ) ) ) | ( ( ( ( ( (v.y>>7)%2 ) ) & ! ( ( (v.x>>10)%2 ) & ( ( ( ( (v.x>>41)%2 ) ) ) & ( ( ! ( (v.x>>40)%2 ) ) ) ) ) ) & ! ( ( (v.x>>11)%2 ) & ( ( ( ( (v.x>>41)%2 ) ) ) & ( ( ( (v.x>>10)%2 ) ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.x>>41)%2 ) ) ) ) ) )<< 41 ;
        aux.x |=(unsigned long long) ( ( (v.y>>49)%2 ) & ( ( ( ( (v.z>>2)%2 ) ) ) & ( ( ! ( (v.x>>39)%2 ) & ! ( (v.x>>42)%2 ) ) ) ) ) | ( ( (v.y>>45)%2 ) & ( ( ( ! ( (v.x>>39)%2 ) & ! ( (v.z>>2)%2 ) & ! ( (v.y>>49)%2 ) & ! ( (v.y>>14)%2 ) & ! ( (v.x>>42)%2 ) ) ) ) ) | ( ( (v.y>>14)%2 ) & ( ( ( ! ( (v.x>>42)%2 ) ) ) & ( ( ( (v.x>>39)%2 ) & ( (v.z>>2)%2 ) & ( (v.y>>49)%2 ) ) ) ) ) | ( ( (v.x>>42)%2 ) & ( ( ( ! ( (v.x>>39)%2 ) & ! ( (v.y>>45)%2 ) ) ) ) )<< 42 ;
        aux.x |=(unsigned long long) ( ( (v.x>>56)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>49)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>50)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>51)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>46)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>51)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>54)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>55)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>61)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>47)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) )<< 43 ;
        aux.x |=(unsigned long long) ( ( (v.x>>56)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>61)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>51)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>46)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>51)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>47)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) )<< 44 ;
        aux.x |=(unsigned long long) ( ( (v.x>>56)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>49)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>50)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>51)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>53)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>54)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>55)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) )<< 45 ;
        aux.x |=(unsigned long long) ( ( (v.z>>0)%2 ) & ( ( ( ( (v.y>>60)%2 ) ) ) ) ) | ( ( (v.x>>23)%2 ) & ( ( ( ( (v.y>>60)%2 ) ) ) ) ) | ( ( (v.y>>40)%2 ) & ( ( ( ( (v.y>>60)%2 ) ) ) ) )<< 46 ;
        aux.x |=(unsigned long long) ( ( ( ( (v.x>>11)%2 ) & ( ( ( ! ( (v.x>>61)%2 ) ) ) & ( ( ! ( (v.y>>7)%2 ) ) ) ) ) & ! ( ( (v.y>>7)%2 ) ) ) & ! ( ( (v.x>>61)%2 ) ) ) | ( ( ( ( (v.x>>23)%2 ) & ( ( ( ! ( (v.y>>7)%2 ) ) ) & ( ( ! ( (v.x>>61)%2 ) ) ) ) ) & ! ( ( (v.y>>7)%2 ) ) ) & ! ( ( (v.x>>61)%2 ) ) )<< 47 ;
        aux.x |=(unsigned long long) ( ( ( ( ( ( ( (v.y>>7)%2 ) & ( ( ( ( (v.y>>39)%2 ) ) ) ) ) & ! ( ( (v.x>>39)%2 ) ) ) & ! ( ( (v.y>>8)%2 ) ) ) & ! ( ( (v.x>>61)%2 ) ) ) & ! ( ( (v.y>>27)%2 ) ) ) ) | ! ( ( (v.x>>39)%2 ) | ( (v.y>>8)%2 ) | ( (v.y>>39)%2 ) | ( (v.y>>7)%2 ) | ( (v.y>>27)%2 ) | ( (v.x>>61)%2 ) )<< 48 ;
        aux.x |=(unsigned long long) ( ( (v.y>>26)%2 ) ) | ( ( (v.x>>16)%2 ) )<< 49 ;
        aux.x |=(unsigned long long) ( ( (v.x>>16)%2 ) & ( ( ( ( (v.y>>40)%2 ) ) ) ) ) | ( ( (v.y>>26)%2 ) & ( ( ( ( (v.y>>40)%2 ) ) ) ) )<< 50 ;
        aux.x |=(unsigned long long) ( ( (v.x>>38)%2 ) ) | ( ( (v.y>>26)%2 ) ) | ( ( (v.x>>16)%2 ) )<< 51 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) & ( ( ( ( (v.y>>51)%2 ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.x>>52)%2 ) ) ) ) ) ) | ( ( ( (v.y>>51)%2 ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.x>>52)%2 ) ) ) ) ) ) | ( ( ( (v.x>>53)%2 ) & ( ( ( ( (v.y>>27)%2 ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.x>>52)%2 ) ) ) ) ) ) | ( ( ( (v.x>>54)%2 ) & ( ( ( ( (v.y>>27)%2 ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.x>>52)%2 ) ) ) ) ) ) | ( ( ( (v.y>>27)%2 ) & ( ( ( ( (v.y>>51)%2 ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.x>>52)%2 ) ) ) ) ) ) | ( ( ( (v.x>>55)%2 ) & ( ( ( ( (v.y>>27)%2 ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.x>>52)%2 ) ) ) ) ) )<< 52 ;
        aux.x |=(unsigned long long) ( ( (v.y>>37)%2 ) & ( ( ( ( (v.y>>43)%2 ) ) ) | ( ( ( (v.x>>37)%2 ) ) ) ) ) | ( ( (v.x>>58)%2 ) & ( ( ( ( (v.y>>43)%2 ) ) ) | ( ( ( (v.x>>37)%2 ) ) ) ) ) | ( ( (v.x>>37)%2 ) & ( ( ( ( (v.y>>43)%2 ) ) ) ) ) | ( ( (v.y>>52)%2 ) ) | ( ( (v.y>>26)%2 ) ) | ( ( (v.y>>35)%2 ) ) | ( ( (v.x>>25)%2 ) ) | ( ( (v.x>>16)%2 ) )<< 53 ;
        aux.x |=(unsigned long long) ( ( (v.y>>0)%2 ) & ( ( ( ! ( (v.x>>54)%2 ) ) ) & ( ( ( (v.x>>22)%2 ) ) ) ) ) | ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>22)%2 ) ) ) & ( ( ! ( (v.x>>54)%2 ) ) ) ) ) | ( ( (v.y>>12)%2 ) & ( ( ( ( (v.x>>22)%2 ) ) ) & ( ( ! ( (v.x>>54)%2 ) ) ) ) ) | ( ( (v.x>>37)%2 ) & ( ( ( ! ( (v.x>>54)%2 ) ) ) & ( ( ( (v.x>>22)%2 ) ) ) ) )<< 54 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>52)%2 ) ) & ! ( ( (v.x>>28)%2 ) ) ) | ( ( ( (v.y>>26)%2 ) ) & ! ( ( (v.x>>28)%2 ) ) ) | ( ( ( (v.x>>38)%2 ) ) & ! ( ( (v.x>>28)%2 ) ) )<< 55 ;
        aux.x |=(unsigned long long) ( ( (v.x>>16)%2 ) ) | ( ( (v.y>>26)%2 ) )<< 56 ;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) & ( ( ( ! ( (v.x>>57)%2 ) ) ) | ( ( ! ( (v.x>>48)%2 ) ) ) ) ) & ! ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) ) | ( ( ( (v.x>>47)%2 ) & ( ( ( ( (v.x>>11)%2 ) ) ) & ( ( ! ( (v.x>>48)%2 ) ) ) ) ) & ! ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) ) | ( ( ( (v.x>>61)%2 ) & ( ( ( ! ( (v.x>>57)%2 ) ) ) | ( ( ! ( (v.x>>48)%2 ) ) ) ) ) & ! ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) ) | ( ( ( (v.y>>39)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) ) ) | ( ( ! ( (v.x>>57)%2 ) ) ) ) ) & ! ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) ) | ( ( ( (v.x>>11)%2 ) & ( ( ( ( (v.x>>47)%2 ) ) ) & ( ( ! ( (v.x>>57)%2 ) ) ) ) ) & ! ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) ) | ( ( ( (v.x>>57)%2 ) & ( ( ( ! ( (v.x>>48)%2 ) ) ) ) ) & ! ( ( (v.x>>48)%2 ) & ( ( ( ( (v.x>>57)%2 ) ) ) ) ) )<< 57 ;
        aux.x |=(unsigned long long) ( ( (v.y>>46)%2 ) ) | ( ( (v.x>>59)%2 ) )<< 58 ;
        aux.x |=(unsigned long long) ( ( (v.x>>14)%2 ) ) | ( ( (v.x>>22)%2 ) )<< 59 ;
        aux.x |=(unsigned long long) ( ( (v.y>>13)%2 ) )<< 60 ;
        aux.x |=(unsigned long long) ( ( ( (v.y>>26)%2 ) & ( ( ( ( (v.x>>59)%2 ) ) & ( ( ( ! ( (v.x>>6)%2 ) ) ) ) ) | ( ( ( (v.x>>37)%2 ) ) ) ) ) & ! ( ( (v.y>>7)%2 ) ) ) | ( ( ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>61)%2 ) ) & ( ( ( ( (v.y>>26)%2 ) | ( (v.x>>16)%2 ) ) ) ) ) ) ) & ! ( ( (v.y>>7)%2 ) ) ) & ! ( ( (v.y>>16)%2 ) ) ) | ( ( ( (v.x>>16)%2 ) & ( ( ( ( (v.x>>59)%2 ) ) & ( ( ( ! ( (v.x>>6)%2 ) ) ) ) ) | ( ( ( (v.x>>37)%2 ) ) ) ) ) & ! ( ( (v.y>>7)%2 ) ) )<< 61 ;
        aux.x |=(unsigned long long) ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.x>>23)%2 ) ) ) ) ) | ( ( (v.y>>7)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) )<< 62 ;
        aux.x |=(unsigned long long) ( ( (v.z>>1)%2 ) ) | ( ( (v.y>>45)%2 ) )<< 63 ;
        aux.y |=(unsigned long long) ( ( (v.x>>33)%2 ) ) | ( ( (v.x>>28)%2 ) ) | ( ( (v.x>>24)%2 ) ) | ( ( (v.x>>17)%2 ) ) | ( ( (v.y>>35)%2 ) ) | ( ( (v.x>>22)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) )<<0;
        aux.y |=(unsigned long long) ( ( (v.y>>37)%2 ) ) | ( ( (v.y>>8)%2 ) ) | ( ( (v.x>>3)%2 ) ) | ( ( (v.x>>29)%2 ) ) | ( ( (v.x>>30)%2 ) )<<1;
        aux.y |=(unsigned long long) ( ( (v.x>>60)%2 ) ) | ( ( (v.y>>2)%2 ) & ( ( ( ( (v.y>>49)%2 ) ) ) ) ) | ( ( (v.y>>39)%2 ) ) | ( ( (v.y>>45)%2 ) & ( ( ( ! ( (v.y>>2)%2 ) ) ) & ( ( ! ( (v.y>>49)%2 ) ) ) & ( ( ( (v.x>>24)%2 ) ) ) ) ) | ( ( (v.x>>3)%2 ) )<<2;
        aux.y |=(unsigned long long) ( ( (v.y>>3)%2 ) & ( ( ( ! ( (v.y>>15)%2 ) ) ) & ( ( ! ( (v.y>>2)%2 ) ) ) ) ) | ( ( (v.y>>1)%2 ) & ( ( ( ! ( (v.y>>3)%2 ) ) ) & ( ( ( (v.y>>0)%2 ) ) ) ) )<<3;
        aux.y |=(unsigned long long) ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) ) | ( ( (v.y>>1)%2 ) & ( ( ( ( (v.y>>2)%2 ) ) ) ) ) | ( ( (v.y>>4)%2 ) )<<4;
        aux.y |=(unsigned long long) ( ( ( (v.y>>0)%2 ) & ( ( ( ( (v.y>>4)%2 ) ) ) ) ) & ! ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) ) ) | ( ( ( (v.y>>2)%2 ) & ( ( ( ( (v.y>>3)%2 ) ) ) ) ) & ! ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) ) )<<5;
        aux.y |=(unsigned long long) ( ( ( ( (v.y>>15)%2 ) & ( ( ( ( (v.y>>3)%2 ) ) ) & ( ( ! ( (v.y>>6)%2 ) ) ) ) ) & ! ( ( (v.y>>0)%2 ) & ( ( ( ( (v.y>>6)%2 ) ) ) ) ) ) & ! ( ( (v.y>>2)%2 ) & ( ( ( ( (v.y>>6)%2 ) ) ) ) ) ) | ( ( ( ( (v.y>>6)%2 ) & ( ( ( ! ( (v.y>>0)%2 ) ) ) & ( ( ! ( (v.y>>2)%2 ) ) ) ) ) & ! ( ( (v.y>>0)%2 ) & ( ( ( ( (v.y>>6)%2 ) ) ) ) ) ) & ! ( ( (v.y>>2)%2 ) & ( ( ( ( (v.y>>6)%2 ) ) ) ) ) ) | ( ( ( ( (v.y>>1)%2 ) & ( ( ( ! ( (v.y>>6)%2 ) ) ) ) ) & ! ( ( (v.y>>0)%2 ) & ( ( ( ( (v.y>>6)%2 ) ) ) ) ) ) & ! ( ( (v.y>>2)%2 ) & ( ( ( ( (v.y>>6)%2 ) ) ) ) ) )<<6;
        aux.y |=(unsigned long long) ( ( ( (v.y>>7)%2 ) & ( ( ( ( (v.y>>60)%2 ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.y>>7)%2 ) ) ) ) ) ) | ( ( ( (v.x>>63)%2 ) & ( ( ( ( (v.y>>60)%2 ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.y>>7)%2 ) ) ) ) ) )<<7;
        aux.y |=(unsigned long long) ( ( ( (v.x>>0)%2 ) & ( ( ( ( (v.x>>10)%2 ) ) ) & ( ( ( (v.y>>9)%2 ) ) ) ) ) & ! ( ( (v.y>>53)%2 ) & ( ( ( ( (v.y>>8)%2 ) ) ) ) ) ) | ( ( ( (v.y>>8)%2 ) & ( ( ( ! ( (v.y>>14)%2 ) ) ) & ( ( ! ( (v.y>>53)%2 ) ) ) ) ) & ! ( ( (v.y>>53)%2 ) & ( ( ( ( (v.y>>8)%2 ) ) ) ) ) ) | ( ( ( (v.x>>19)%2 ) & ( ( ( ( (v.x>>10)%2 ) ) ) & ( ( ( (v.y>>9)%2 ) ) ) ) ) & ! ( ( (v.y>>53)%2 ) & ( ( ( ( (v.y>>8)%2 ) ) ) ) ) )<<8;
        aux.y |=(unsigned long long) ( ( (v.y>>8)%2 ) & ( ( ( ! ( (v.y>>9)%2 ) ) ) & ( ( ( (v.x>>63)%2 ) ) ) ) ) | ( ( (v.y>>9)%2 ) & ( ( ( ! ( (v.y>>8)%2 ) ) ) ) ) | ( ( (v.x>>63)%2 ) & ( ( ( ! ( (v.y>>8)%2 ) ) ) ) )<<9;
        aux.y |=(unsigned long long) ( ( (v.y>>4)%2 ) & ( ( ( ( (v.x>>23)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) ) ) ) ) | ( ( (v.y>>5)%2 ) & ( ( ( ( (v.x>>12)%2 ) ) ) & ( ( ( (v.y>>4)%2 ) ) ) ) ) | ( ( (v.x>>12)%2 ) & ( ( ( ( (v.x>>10)%2 ) ) ) ) ) | ( ( (v.x>>23)%2 ) & ( ( ( ( (v.x>>10)%2 ) ) ) ) )<<10;
        aux.y |=(unsigned long long) ( ( (v.x>>30)%2 ) ) | ( ( ( (v.x>>33)%2 ) & ( ( ( ( (v.y>>11)%2 ) ) ) ) ) & ! ( ( (v.y>>7)%2 ) & ( ( ( ! ( (v.x>>30)%2 ) ) ) ) ) )<<11;
        aux.y |=(unsigned long long) ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>24)%2 ) & ( (v.y>>5)%2 ) ) ) ) ) | ( ( (v.x>>24)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) & ( ( ! ( (v.y>>5)%2 ) & ! ( (v.x>>0)%2 ) & ! ( (v.x>>22)%2 ) & ! ( (v.x>>60)%2 ) ) ) ) ) | ( ( ( (v.x>>22)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) ) & ! ( ( (v.x>>60)%2 ) & ( ( ( ! ( (v.x>>24)%2 ) & ! ( (v.y>>45)%2 ) ) ) & ( ( ( (v.x>>0)%2 ) ) ) ) ) )<<12;
        aux.y |=(unsigned long long) ( ( (v.y>>37)%2 ) & ( ( ( ! ( (v.x>>3)%2 ) ) ) & ( ( ( (v.x>>5)%2 ) ) & ( ( ( ( (v.y>>4)%2 ) ) ) | ( ( ( (v.y>>5)%2 ) ) ) ) ) ) ) | ( ( (v.y>>8)%2 ) & ( ( ( ! ( (v.x>>3)%2 ) ) ) & ( ( ( (v.x>>5)%2 ) ) & ( ( ( ( (v.y>>4)%2 ) ) ) | ( ( ( (v.y>>5)%2 ) ) ) ) ) ) ) | ( ( (v.x>>3)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) | ( ( ( (v.y>>4)%2 ) ) ) ) ) | ( ( (v.y>>26)%2 ) & ( ( ( ! ( (v.x>>3)%2 ) ) ) & ( ( ( (v.x>>5)%2 ) ) & ( ( ( ( (v.y>>5)%2 ) ) ) | ( ( ( (v.y>>4)%2 ) ) ) ) ) ) ) | ( ( (v.x>>16)%2 ) & ( ( ( ! ( (v.x>>3)%2 ) ) ) & ( ( ( (v.x>>5)%2 ) ) & ( ( ( ( (v.y>>5)%2 ) ) ) | ( ( ( (v.y>>4)%2 ) ) ) ) ) ) )<<13;
        aux.y |=(unsigned long long) ( ! ( ( ( (v.x>>22)%2 ) ) ) ) | ! ( ( (v.x>>22)%2 ) )<<14;
        aux.y |=(unsigned long long) ( ( ( (v.z>>7)%2 ) ) & ! ( ( (v.y>>45)%2 ) & ( ( ( ( (v.y>>15)%2 ) ) ) ) ) ) | ( ( ( (v.y>>23)%2 ) & ( ( ( ( (v.y>>0)%2 ) ) ) & ( ( ( (v.y>>37)%2 ) ) ) & ( ( ( (v.x>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>45)%2 ) & ( ( ( ( (v.y>>15)%2 ) ) ) ) ) )<<15;
        aux.y |=(unsigned long long) ( ! ( ( ( (v.z>>7)%2 ) ) | ( ( (v.x>>22)%2 ) & ( ( ( ( (v.z>>4)%2 ) ) ) ) ) ) ) | ! ( ( (v.x>>22)%2 ) | ( (v.z>>7)%2 ) | ( (v.z>>4)%2 ) )<<16;
        aux.y |=(unsigned long long) ( ( ( ( (v.x>>42)%2 ) & ( ( ( ( (v.z>>2)%2 ) ) ) ) ) & ! ( ( (v.y>>8)%2 ) ) ) & ! ( ( (v.y>>7)%2 ) ) )<<17;
        aux.y |=(unsigned long long) ( ( (v.y>>8)%2 ) )<<18;
        aux.y |=(unsigned long long) ( ( (v.y>>56)%2 ) & ( ( ( ( (v.x>>26)%2 ) ) ) ) )<<19;
        aux.y |=(unsigned long long) ( ( (v.y>>57)%2 ) & ( ( ( ( (v.x>>26)%2 ) ) ) ) )<<20;
        aux.y |=(unsigned long long) ( ( (v.y>>58)%2 ) & ( ( ( ( (v.x>>26)%2 ) ) ) ) )<<21;
        aux.y |=(unsigned long long) ( ( (v.y>>59)%2 ) & ( ( ( ( (v.x>>26)%2 ) ) ) ) )<<22;
        aux.y |=(unsigned long long) ( ( (v.y>>3)%2 ) & ( ( ( ( (v.x>>9)%2 ) ) ) ) ) | ( ( (v.y>>5)%2 ) & ( ( ( ( (v.x>>9)%2 ) ) ) ) )<<23;
        aux.y |=(unsigned long long) ( ( (v.x>>11)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) )<<24;
        aux.y |=(unsigned long long) ( ( (v.y>>8)%2 ) )<<25;
        aux.y |=(unsigned long long) ( ( ( ( ( (v.y>>36)%2 ) & ( ( ( ( (v.z>>2)%2 ) & ( (v.x>>42)%2 ) ) ) ) ) & ! ( ( (v.y>>32)%2 ) & ( ( ( ( (v.y>>26)%2 ) ) ) ) ) ) & ! ( ( (v.y>>63)%2 ) & ( ( ( ( (v.y>>26)%2 ) ) ) ) ) ) & ! ( ( (v.y>>38)%2 ) & ( ( ( ! ( (v.x>>61)%2 ) ) ) ) ) ) | ( ( ( (v.y>>23)%2 ) & ( ( ( ! ( (v.x>>61)%2 ) ) & ( ( ( ! ( (v.y>>38)%2 ) ) ) & ( ( ( (v.z>>2)%2 ) & ( (v.x>>42)%2 ) ) ) & ( ( ! ( (v.y>>26)%2 ) ) ) & ( ( ! ( (v.x>>21)%2 ) & ! ( (v.y>>36)%2 ) & ! ( (v.y>>50)%2 ) ) ) & ( ( ( (v.x>>16)%2 ) ) ) ) ) | ( ( ! ( (v.x>>33)%2 ) ) & ( ( ( ( (v.x>>16)%2 ) ) ) & ( ( ( (v.z>>2)%2 ) & ( (v.x>>42)%2 ) ) ) & ( ( ! ( (v.y>>26)%2 ) ) ) ) ) | ( ( ( (v.x>>33)%2 ) & ( (v.x>>61)%2 ) ) & ( ( ( ! ( (v.y>>26)%2 ) & ! ( (v.x>>16)%2 ) ) ) & ( ( ( (v.z>>2)%2 ) & ( (v.x>>42)%2 ) ) ) ) ) ) ) & ! ( ( (v.y>>38)%2 ) & ( ( ( ! ( (v.x>>61)%2 ) ) ) ) ) ) | ( ( ( ( ( (v.y>>50)%2 ) & ( ( ( ( (v.z>>2)%2 ) & ( (v.x>>42)%2 ) ) ) ) ) & ! ( ( (v.y>>32)%2 ) & ( ( ( ( (v.y>>26)%2 ) ) ) ) ) ) & ! ( ( (v.y>>63)%2 ) & ( ( ( ( (v.y>>26)%2 ) ) ) ) ) ) & ! ( ( (v.y>>38)%2 ) & ( ( ( ! ( (v.x>>61)%2 ) ) ) ) ) ) | ( ( ( ( ( (v.x>>21)%2 ) & ( ( ( ( (v.z>>2)%2 ) & ( (v.x>>42)%2 ) ) ) ) ) & ! ( ( (v.y>>32)%2 ) & ( ( ( ( (v.y>>26)%2 ) ) ) ) ) ) & ! ( ( (v.y>>63)%2 ) & ( ( ( ( (v.y>>26)%2 ) ) ) ) ) ) & ! ( ( (v.y>>38)%2 ) & ( ( ( ! ( (v.x>>61)%2 ) ) ) ) ) )<<26;
        aux.y |=(unsigned long long) ( ( (v.y>>45)%2 ) & ( ( ( ( (v.y>>25)%2 ) & ( (v.y>>29)%2 ) & ( (v.x>>61)%2 ) ) ) & ( ( ! ( (v.y>>27)%2 ) ) ) ) ) | ( ( (v.y>>35)%2 ) & ( ( ( ( (v.y>>27)%2 ) ) ) ) ) | ( ( (v.y>>27)%2 ) & ( ( ( ! ( (v.y>>7)%2 ) & ! ( (v.x>>6)%2 ) & ! ( (v.x>>23)%2 ) ) ) ) ) | ( ( (v.x>>61)%2 ) & ( ( ( ! ( (v.y>>35)%2 ) & ! ( (v.x>>6)%2 ) & ! ( (v.x>>23)%2 ) ) ) & ( ( ( (v.y>>27)%2 ) ) ) ) )<<27;
        aux.y |=(unsigned long long) ( ( (v.y>>14)%2 ) & ( ( ( ( (v.y>>30)%2 ) ) ) & ( ( ! ( (v.y>>28)%2 ) ) ) ) ) | ( ( (v.y>>28)%2 ) & ( ( ( ! ( (v.y>>29)%2 ) ) ) ) )<<28;
        aux.y |=(unsigned long long) ( ( (v.y>>29)%2 ) & ( ( ( ! ( (v.y>>27)%2 ) ) ) ) ) | ( ( (v.y>>35)%2 ) & ( ( ( ! ( (v.y>>29)%2 ) ) ) & ( ( ( (v.y>>28)%2 ) ) ) ) )<<29;
        aux.y |=(unsigned long long) ( ( ( (v.y>>30)%2 ) & ( ( ( ! ( (v.y>>28)%2 ) ) ) ) ) | ( ( (v.y>>28)%2 ) & ( ( ( ! ( (v.y>>27)%2 ) & ! ( (v.y>>30)%2 ) ) ) ) ) ) | ! ( ( (v.y>>27)%2 ) | ( (v.y>>28)%2 ) | ( (v.y>>30)%2 ) )<<30;
        aux.y |=(unsigned long long) ( ( (v.x>>11)%2 ) ) | ( ( (v.y>>33)%2 ) ) | ( ( (v.x>>2)%2 ) )<<31;
        aux.y |=(unsigned long long) ( ( (v.y>>31)%2 ) )<<32;
        aux.y |=(unsigned long long) ( ( ( ( (v.y>>59)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.y>>8)%2 ) ) ) & ! ( ( (v.y>>35)%2 ) & ( ( ( ( (v.x>>63)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) ) ) ) ) ) | ( ( ( ( (v.y>>57)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.y>>8)%2 ) ) ) & ! ( ( (v.y>>35)%2 ) & ( ( ( ( (v.x>>63)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) ) ) ) ) ) | ( ( ( ( (v.y>>58)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.y>>8)%2 ) ) ) & ! ( ( (v.y>>35)%2 ) & ( ( ( ( (v.x>>63)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) ) ) ) ) ) | ( ( ( ( (v.y>>56)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.y>>8)%2 ) ) ) & ! ( ( (v.y>>35)%2 ) & ( ( ( ( (v.x>>63)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) ) ) ) ) )<<33;
        aux.y |=(unsigned long long) ( ( (v.y>>7)%2 ) & ( ( ( ( (v.y>>45)%2 ) & ( (v.y>>60)%2 ) ) ) & ( ( ! ( (v.y>>34)%2 ) | ! ( (v.x>>29)%2 ) ) ) ) ) | ( ( (v.x>>12)%2 ) & ( ( ( ( (v.y>>45)%2 ) & ( (v.y>>60)%2 ) ) ) & ( ( ! ( (v.y>>34)%2 ) | ! ( (v.x>>29)%2 ) ) ) ) )<<34;
        aux.y |=(unsigned long long) ( ( (v.y>>36)%2 ) ) | ( ( (v.y>>41)%2 ) ) | ( ( (v.y>>44)%2 ) )<<35;
        aux.y |=(unsigned long long) ( ( (v.x>>11)%2 ) & ( ( ( ( (v.x>>16)%2 ) ) ) ) ) | ( ( (v.x>>19)%2 ) & ( ( ( ( (v.x>>16)%2 ) ) ) ) )<<36;
        aux.y |=(unsigned long long) ( ( (v.y>>37)%2 ) & ( ( ( ! ( (v.x>>36)%2 ) & ! ( (v.y>>63)%2 ) & ! ( (v.y>>7)%2 ) ) ) ) ) | ( ( (v.y>>61)%2 ) & ( ( ( ! ( (v.y>>38)%2 ) & ! ( (v.y>>37)%2 ) ) ) ) )<<37;
        aux.y |=(unsigned long long) ( ! ( ( ( (v.x>>0)%2 ) ) | ( ( (v.y>>8)%2 ) ) | ( ( (v.y>>4)%2 ) ) ) ) | ! ( ( (v.y>>4)%2 ) | ( (v.x>>0)%2 ) | ( (v.y>>8)%2 ) )<<38;
        aux.y |=(unsigned long long) ( ( (v.y>>37)%2 ) )<<39;
        aux.y |=(unsigned long long) ( ( ( ( (v.x>>45)%2 ) ) & ! ( ( (v.x>>46)%2 ) & ( ( ( ( (v.y>>40)%2 ) ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.y>>40)%2 ) ) ) ) ) ) | ( ( ( ( (v.y>>42)%2 ) ) & ! ( ( (v.x>>46)%2 ) & ( ( ( ( (v.y>>40)%2 ) ) ) ) ) ) & ! ( ( (v.y>>14)%2 ) & ( ( ( ( (v.y>>40)%2 ) ) ) ) ) )<<40;
        aux.y |=(unsigned long long) ( ( (v.x>>28)%2 ) )<<41;
        aux.y |=(unsigned long long) ( ( (v.x>>56)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>49)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>50)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>51)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>46)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>53)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.y>>51)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>54)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) ) | ( ( (v.x>>55)%2 ) & ( ( ( ( (v.x>>4)%2 ) ) ) ) )<<42;
        aux.y |=(unsigned long long) ( ( ( (v.x>>22)%2 ) & ( ( ( ( (v.x>>24)%2 ) & ( (v.y>>45)%2 ) ) ) ) ) & ! ( ( (v.y>>43)%2 ) & ( ( ( ( (v.x>>24)%2 ) & ( (v.x>>22)%2 ) & ( (v.y>>45)%2 ) & ( (v.y>>15)%2 ) ) ) ) ) )<<43;
        aux.y |=(unsigned long long) ( ( ( (v.x>>37)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) ) & ! ( ( (v.x>>23)%2 ) ) ) | ( ( (v.x>>59)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) & ( ( ( (v.x>>17)%2 ) ) ) ) )<<44;
        aux.y |=(unsigned long long) ( ( ( (v.x>>31)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) ) | ( ( ( (v.y>>18)%2 ) ) & ! ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) ) | ( ( ( (v.y>>59)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) ) | ( ( ( (v.x>>24)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) ) | ( ( ( (v.x>>14)%2 ) & ( ( ( ( (v.y>>16)%2 ) ) ) ) ) & ! ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) ) | ( ( ( (v.x>>22)%2 ) ) & ! ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) ) | ( ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.x>>18)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) )<<45;
        aux.y |=(unsigned long long) ( ( (v.y>>48)%2 ) )<<46;
        aux.y |=(unsigned long long) ( ( (v.z>>7)%2 ) )<<47;
        aux.y |=(unsigned long long) ( ( ( (v.y>>52)%2 ) ) & ! ( ( (v.z>>0)%2 ) ) )<<48;
        aux.y |=(unsigned long long) ( ( (v.y>>4)%2 ) & ( ( ( ! ( (v.y>>49)%2 ) ) ) ) ) | ( ( (v.y>>49)%2 ) & ( ( ( ! ( (v.y>>45)%2 ) ) ) ) )<<49;
        aux.y |=(unsigned long long) ( ( (v.y>>8)%2 ) & ( ( ( ( (v.y>>4)%2 ) | ( (v.y>>35)%2 ) | ( (v.y>>34)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) | ( (v.y>>3)%2 ) ) ) ) ) | ( ( (v.y>>45)%2 ) & ( ( ( ( (v.y>>4)%2 ) | ( (v.y>>35)%2 ) | ( (v.y>>34)%2 ) ) ) & ( ( ( (v.y>>5)%2 ) | ( (v.y>>3)%2 ) ) ) ) ) | ( ( (v.x>>12)%2 ) & ( ( ( ( (v.y>>5)%2 ) | ( (v.y>>3)%2 ) ) ) & ( ( ( (v.y>>4)%2 ) | ( (v.y>>35)%2 ) | ( (v.y>>34)%2 ) ) ) ) )<<50;
        aux.y |=(unsigned long long) ( ( (v.y>>52)%2 ) )<<51;
        aux.y |=(unsigned long long) ( ( (v.x>>38)%2 ) )<<52;
        aux.y |=(unsigned long long) ( ( (v.z>>7)%2 ) ) | ( ( (v.y>>52)%2 ) )<<53;
        aux.y |=(unsigned long long) ( ( (v.y>>49)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) | ( ( (v.x>>5)%2 ) & ( ( ( ( (v.y>>49)%2 ) & ( (v.y>>54)%2 ) ) ) & ( ( ! ( (v.y>>4)%2 ) ) ) ) )<<54;
        aux.y |=(unsigned long long) ( ( ( (v.x>>24)%2 ) & ( ( ( ( (v.y>>4)%2 ) | ( (v.x>>59)%2 ) | ( (v.x>>37)%2 ) ) ) & ( ( ( (v.x>>17)%2 ) & ( (v.x>>16)%2 ) ) ) ) ) & ! ( ( (v.y>>17)%2 ) ) ) | ( ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>17)%2 ) & ( (v.x>>16)%2 ) ) ) & ( ( ( (v.y>>4)%2 ) | ( (v.x>>59)%2 ) | ( (v.x>>37)%2 ) ) ) ) ) & ! ( ( (v.y>>17)%2 ) ) ) | ( ( ( (v.x>>16)%2 ) & ( ( ( ! ( (v.y>>17)%2 ) & ! ( (v.x>>17)%2 ) ) ) & ( ( ( (v.x>>24)%2 ) | ( (v.y>>45)%2 ) ) ) & ( ( ( (v.y>>4)%2 ) | ( (v.x>>59)%2 ) | ( (v.x>>37)%2 ) ) ) ) ) & ! ( ( (v.y>>17)%2 ) ) )<<55;
        aux.y |=(unsigned long long) ( ( ( (v.z>>8)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.y>>19)%2 ) & ! ( (v.z>>8)%2 ) & ! ( (v.y>>56)%2 ) ) ) | ( ( ( (v.y>>19)%2 ) ) ) ) ) ) | ( ( ( (v.y>>19)%2 ) & ( ( ( ! ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.y>>19)%2 ) & ! ( (v.z>>8)%2 ) & ! ( (v.y>>56)%2 ) ) ) | ( ( ( (v.y>>19)%2 ) ) ) ) ) ) | ( ( ( (v.y>>56)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.y>>19)%2 ) & ! ( (v.z>>8)%2 ) & ! ( (v.y>>56)%2 ) ) ) | ( ( ( (v.y>>19)%2 ) ) ) ) ) )<<56;
        aux.y |=(unsigned long long) ( ( ( (v.z>>9)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.z>>9)%2 ) & ! ( (v.y>>57)%2 ) & ! ( (v.y>>20)%2 ) ) ) | ( ( ( (v.y>>20)%2 ) ) ) ) ) ) | ( ( ( (v.y>>20)%2 ) & ( ( ( ! ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.z>>9)%2 ) & ! ( (v.y>>57)%2 ) & ! ( (v.y>>20)%2 ) ) ) | ( ( ( (v.y>>20)%2 ) ) ) ) ) ) | ( ( ( (v.y>>57)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.z>>9)%2 ) & ! ( (v.y>>57)%2 ) & ! ( (v.y>>20)%2 ) ) ) | ( ( ( (v.y>>20)%2 ) ) ) ) ) )<<57;
        aux.y |=(unsigned long long) ( ( ( (v.z>>10)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ( (v.y>>20)%2 ) ) ) | ( ( ! ( (v.z>>10)%2 ) & ! ( (v.y>>58)%2 ) & ! ( (v.y>>20)%2 ) ) ) ) ) ) | ( ( ( (v.y>>20)%2 ) & ( ( ( ! ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ( (v.y>>20)%2 ) ) ) | ( ( ! ( (v.z>>10)%2 ) & ! ( (v.y>>58)%2 ) & ! ( (v.y>>20)%2 ) ) ) ) ) ) | ( ( ( (v.y>>58)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ( (v.y>>20)%2 ) ) ) | ( ( ! ( (v.z>>10)%2 ) & ! ( (v.y>>58)%2 ) & ! ( (v.y>>20)%2 ) ) ) ) ) )<<58;
        aux.y |=(unsigned long long) ( ( ( (v.y>>59)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.z>>5)%2 ) & ! ( (v.y>>59)%2 ) & ! ( (v.y>>22)%2 ) ) ) | ( ( ( (v.y>>22)%2 ) ) ) ) ) ) | ( ( ( (v.z>>5)%2 ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.z>>5)%2 ) & ! ( (v.y>>59)%2 ) & ! ( (v.y>>22)%2 ) ) ) | ( ( ( (v.y>>22)%2 ) ) ) ) ) ) | ( ( ( (v.y>>22)%2 ) & ( ( ( ! ( (v.x>>8)%2 ) ) ) ) ) & ! ( ( (v.x>>8)%2 ) & ( ( ( ! ( (v.z>>5)%2 ) & ! ( (v.y>>59)%2 ) & ! ( (v.y>>22)%2 ) ) ) | ( ( ( (v.y>>22)%2 ) ) ) ) ) )<<59;
        aux.y |=(unsigned long long) ( ( ( (v.x>>1)%2 ) ) & ! ( ( (v.x>>62)%2 ) ) ) | ( ( ( (v.y>>60)%2 ) ) & ! ( ( (v.x>>62)%2 ) ) )<<60;
        aux.y |=(unsigned long long) ( ( (v.x>>27)%2 ) & ( ( ( ( (v.y>>5)%2 ) ) ) ) )<<61;
        aux.y |=(unsigned long long) ( ( ( ( (v.y>>5)%2 ) ) & ! ( ( (v.x>>24)%2 ) ) ) & ! ( ( (v.y>>45)%2 ) ) ) | ( ( ( ( (v.y>>3)%2 ) ) & ! ( ( (v.x>>24)%2 ) ) ) & ! ( ( (v.y>>45)%2 ) ) ) | ( ( ( ( (v.y>>4)%2 ) ) & ! ( ( (v.x>>24)%2 ) ) ) & ! ( ( (v.y>>45)%2 ) ) ) | ( ( ( ( (v.x>>10)%2 ) ) & ! ( ( (v.x>>24)%2 ) ) ) & ! ( ( (v.y>>45)%2 ) ) ) | ( ( ( ( ( (v.x>>22)%2 ) ) & ! ( ( (v.x>>24)%2 ) ) ) & ! ( ( (v.y>>41)%2 ) ) ) & ! ( ( (v.y>>45)%2 ) ) )<<62;
        aux.y |=(unsigned long long) ( ( (v.x>>24)%2 ) & ( ( ( ( (v.y>>45)%2 ) ) ) ) ) | ( ( (v.y>>45)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) | ( ( ! ( (v.y>>63)%2 ) ) ) | ( ( ! ( (v.y>>62)%2 ) ) ) ) )<<63;
        aux.z |=(unsigned long long) ( ( ( ( (v.x>>44)%2 ) ) & ! ( ( (v.y>>14)%2 ) ) ) & ! ( ( (v.x>>46)%2 ) ) ) | ( ( ( ( (v.x>>43)%2 ) ) & ! ( ( (v.y>>14)%2 ) ) ) & ! ( ( (v.x>>46)%2 ) ) ) | ( ( ( ( (v.y>>42)%2 ) ) & ! ( ( (v.y>>14)%2 ) ) ) & ! ( ( (v.x>>46)%2 ) ) )<<0;
        aux.z |=(unsigned long long) ( ( (v.x>>23)%2 ) & ( ( ( ! ( (v.z>>1)%2 ) ) ) & ( ( ( (v.x>>63)%2 ) ) ) ) )<<1;

        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_18_parte1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( ( (v.y>>10)%2 ) * 2) >= 2 ) <<0;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) * 2 + 0 * 2 + ( (v.x>>33)%2 ) * 2 + ( (v.x>>31)%2 ) * 2) >= 8 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<2;
        aux.x |=(unsigned long long) ( ( ( (v.y>>5)%2 ) * 2 + ( (v.y>>4)%2 ) * 2) >= 2 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.y>>53)%2 ) * 2) >= 2 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>7)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 4 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>13)%2 ) * 12 + ( (v.y>>5)%2 ) * 12 + ( (v.y>>3)%2 ) * 12 + ( (v.x>>39)%2 ) * 36 + ( (v.y>>45)%2 ) * 36 + ( (v.x>>6)%2 ) * 92 + ( (v.y>>14)%2 ) * -128 + ( (v.x>>63)%2 ) * 12) >= -32 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.y>>55)%2 ) * 2) >= 2 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.y>>20)%2 ) * 2 + ( (v.y>>21)%2 ) * 2 + ( (v.y>>19)%2 ) * 2 + ( (v.y>>22)%2 ) * 2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) * 2) >= 2 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2 + ( (v.z>>3)%2 ) * -2) >= 2 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>10)%2 ) * 2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>13)%2 ) * 2 + ( (v.x>>11)%2 ) * 2) >= 4 ) <<12;
        aux.x |=(unsigned long long) ( ( ( (v.x>>11)%2 ) * 2) >= 2 ) <<13;
        aux.x |=(unsigned long long) ( ( ( (v.y>>45)%2 ) * 6 + ( (v.x>>24)%2 ) * 6 + ( (v.y>>17)%2 ) * -2 + ( (v.x>>14)%2 ) * -2) >= 10 ) <<14;
        aux.x |=(unsigned long long) ( ( ( (v.y>>45)%2 ) * 2 + ( (v.y>>41)%2 ) * -2) >= 2 ) <<15;
        aux.x |=(unsigned long long) ( ( ( (v.x>>16)%2 ) * 26 + ( (v.y>>38)%2 ) * -34 + ( (v.y>>23)%2 ) * 38 + ( (v.y>>45)%2 ) * -2 + ( (v.y>>26)%2 ) * -6 + ( (v.x>>33)%2 ) * 6 + ( (v.x>>61)%2 ) * 6) >= 16 ) <<16;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 6 + ( (v.x>>24)%2 ) * 2 + ( (v.y>>45)%2 ) * 2 + ( (v.y>>17)%2 ) * -6) >= 8 ) <<17;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) * 248 + ( (v.x>>33)%2 ) * 8 + ( (v.y>>7)%2 ) * 8 + ( (v.x>>32)%2 ) * 8 + ( (v.x>>34)%2 ) * 8 + ( (v.y>>41)%2 ) * -8 + ( (v.x>>24)%2 ) * 0 + ( (v.y>>45)%2 ) * 0) >= 248 ) <<18;
        aux.x |=(unsigned long long) ( ( ( (v.y>>11)%2 ) * 4 + ( (v.y>>4)%2 ) * 12 + ( (v.x>>20)%2 ) * -16 + ( (v.x>>19)%2 ) * 4 + ( (v.y>>12)%2 ) * 4) >= 0 ) <<19;
        aux.x |=(unsigned long long) ( ( ( (v.y>>8)%2 ) * 14 + ( (v.x>>19)%2 ) * 14 + ( (v.y>>45)%2 ) * 6 + ( (v.x>>60)%2 ) * 6 + ( (v.x>>10)%2 ) * 6 + ( (v.x>>22)%2 ) * 42) >= 18 ) <<20;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2 + ( (v.x>>14)%2 ) * 2 + ( (v.y>>5)%2 ) * 2) >= 6 ) <<21;
        aux.x |=(unsigned long long) ( ( 0 * 32 + ( (v.y>>8)%2 ) * -4 + ( (v.y>>58)%2 ) * 4 + ( (v.x>>10)%2 ) * 28 + ( (v.y>>57)%2 ) * 4 + ( (v.y>>56)%2 ) * 4) >= 28 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>52)%2 ) * 14 + ( (v.x>>23)%2 ) * 2 + ( (v.y>>14)%2 ) * -2 + ( (v.x>>46)%2 ) * -2) >= 2 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.y>>45)%2 ) * 6 + ( (v.x>>24)%2 ) * 2 + ( (v.y>>15)%2 ) * -10 + ( (v.x>>42)%2 ) * 10 + ( (v.y>>49)%2 ) * 10) >= 8 ) <<24;
        aux.x |=(unsigned long long) ( ( ( (v.y>>52)%2 ) * 2) >= 2 ) <<25;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_18_parte2(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 6 + ( (v.y>>4)%2 ) * 90 + ( (v.y>>25)%2 ) * -154 + ( (v.x>>23)%2 ) * -154 + ( (v.x>>34)%2 ) * 6 + ( (v.x>>8)%2 ) * 34 + ( (v.y>>45)%2 ) * 34 + ( (v.x>>32)%2 ) * 6 + ( (v.x>>35)%2 ) * 6) >= 68 ) <<26;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 0 + ( (v.y>>61)%2 ) * -4 + ( (v.x>>32)%2 ) * 0 + ( (v.y>>56)%2 ) * 4) >= 0 ) <<27;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 0 + ( (v.y>>5)%2 ) * 4 + ( (v.x>>22)%2 ) * 8 + ( (v.y>>41)%2 ) * -8 + ( (v.x>>37)%2 ) * 4) >= 12 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * -4 + ( (v.y>>24)%2 ) * -32 + ( (v.x>>29)%2 ) * -4 + ( (v.y>>57)%2 ) * 28 + ( (v.y>>7)%2 ) * 4 + ( (v.y>>59)%2 ) * -4 + ( (v.z>>5)%2 ) * 4) >= -24 ) <<29;
        aux.x |=(unsigned long long) ( ( ( (v.y>>58)%2 ) * 8 + ( (v.x>>30)%2 ) * -4 + ( (v.x>>34)%2 ) * -4 + ( (v.y>>24)%2 ) * -4 + ( (v.y>>11)%2 ) * -4) >= -8 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.y>>59)%2 ) * 4 + ( (v.x>>35)%2 ) * 4 + ( (v.y>>7)%2 ) * -4 + ( (v.x>>31)%2 ) * 4 + ( (v.y>>24)%2 ) * -8) >= -4 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 6 + ( (v.y>>56)%2 ) * 2 + ( (v.x>>32)%2 ) * -2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.y>>57)%2 ) * 2 + ( (v.x>>29)%2 ) * 6 + ( (v.x>>33)%2 ) * -2) >= 2 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.y>>58)%2 ) * 2 + ( (v.x>>30)%2 ) * 6 + ( (v.x>>34)%2 ) * -2) >= 2 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 6 + ( (v.y>>59)%2 ) * 2 + ( (v.x>>35)%2 ) * -2) >= 2 ) <<35;
        aux.x |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 2 + ( (v.y>>45)%2 ) * 2) >= 4 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.y>>45)%2 ) * 2 + ( (v.x>>24)%2 ) * 2 + ( (v.x>>22)%2 ) * 6 + ( (v.y>>43)%2 ) * 6) >= 4 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.z>>6)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.y>>5)%2 ) * 2) >= 2 ) <<39;
        aux.x |=(unsigned long long) ( ( ( (v.y>>11)%2 ) * 2 + ( (v.y>>4)%2 ) * 6 + ( (v.y>>12)%2 ) * 2) >= 8 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 46 + ( (v.x>>10)%2 ) * -14 + ( (v.x>>41)%2 ) * -50 + ( (v.x>>40)%2 ) * 26 + ( (v.x>>11)%2 ) * -18 + ( (v.y>>14)%2 ) * -6 + ( (v.y>>7)%2 ) * 34) >= -44 ) <<41;
        aux.x |=(unsigned long long) ( ( ( (v.y>>49)%2 ) * 10 + 0 * 10 + ( (v.x>>39)%2 ) * -22 + ( (v.x>>42)%2 ) * 2 + ( (v.y>>45)%2 ) * -14 + ( (v.y>>14)%2 ) * 2) >= -14 ) <<42;
        aux.x |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>4)%2 ) * 2046 + ( (v.x>>49)%2 ) * 2 + ( (v.x>>50)%2 ) * 2 + ( (v.x>>51)%2 ) * 2 + ( (v.y>>46)%2 ) * 2 + ( (v.y>>51)%2 ) * 2 + ( (v.x>>54)%2 ) * 2 + ( (v.x>>55)%2 ) * 2 + ( (v.x>>61)%2 ) * 2 + ( (v.y>>47)%2 ) * 2) >= 2048 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>4)%2 ) * 126 + ( (v.x>>61)%2 ) * 2 + ( (v.x>>51)%2 ) * 2 + ( (v.y>>46)%2 ) * 2 + ( (v.y>>51)%2 ) * 2 + ( (v.y>>47)%2 ) * 2) >= 128 ) <<44;
        aux.x |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>4)%2 ) * 254 + ( (v.x>>49)%2 ) * 2 + ( (v.x>>50)%2 ) * 2 + ( (v.x>>51)%2 ) * 2 + ( (v.x>>53)%2 ) * 2 + ( (v.x>>54)%2 ) * 2 + ( (v.x>>55)%2 ) * 2) >= 256 ) <<45;
        aux.x |=(unsigned long long) ( ( ( (v.z>>0)%2 ) * 2 + ( (v.y>>60)%2 ) * 14 + ( (v.x>>23)%2 ) * 2 + ( (v.y>>40)%2 ) * 2) >= 16 ) <<46;
        aux.x |=(unsigned long long) ( ( ( (v.x>>11)%2 ) * 2 + ( (v.x>>61)%2 ) * -6 + ( (v.y>>7)%2 ) * -6 + ( (v.x>>23)%2 ) * 2) >= 2 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.y>>7)%2 ) * 0 + ( (v.y>>39)%2 ) * 0 + ( (v.x>>39)%2 ) * -4 + ( (v.y>>8)%2 ) * -4 + ( (v.x>>61)%2 ) * -4 + ( (v.y>>27)%2 ) * -4) >= 0 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.y>>26)%2 ) * 2 + ( (v.x>>16)%2 ) * 2) >= 2 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>16)%2 ) * 2 + ( (v.y>>40)%2 ) * 6 + ( (v.y>>26)%2 ) * 2) >= 8 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2 + ( (v.y>>26)%2 ) * 2 + ( (v.x>>16)%2 ) * 2) >= 2 ) <<51;

        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_18_parte3(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 0 + ( (v.y>>51)%2 ) * 108 + ( (v.y>>14)%2 ) * -92 + ( (v.x>>52)%2 ) * -92 + ( (v.x>>53)%2 ) * 12 + ( (v.y>>27)%2 ) * 84 + ( (v.x>>54)%2 ) * 12 + ( (v.x>>55)%2 ) * 12) >= 4 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.y>>37)%2 ) * 4 + ( (v.y>>43)%2 ) * 8 + ( (v.x>>37)%2 ) * 8 + ( (v.x>>58)%2 ) * 4 + ( (v.y>>52)%2 ) * 12 + ( (v.y>>26)%2 ) * 12 + ( (v.y>>35)%2 ) * 12 + ( (v.x>>25)%2 ) * 12 + ( (v.x>>16)%2 ) * 12) >= 12 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2 + ( (v.x>>54)%2 ) * -30 + ( (v.x>>22)%2 ) * 30 + ( (v.y>>45)%2 ) * 2 + ( (v.y>>12)%2 ) * 2 + ( (v.x>>37)%2 ) * 2) >= 32 ) <<54;
        aux.x |=(unsigned long long) ( ( ( (v.y>>52)%2 ) * 2 + ( (v.x>>28)%2 ) * -14 + ( (v.y>>26)%2 ) * 2 + ( (v.x>>38)%2 ) * 2) >= 2 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>16)%2 ) * 2 + ( (v.y>>26)%2 ) * 2) >= 2 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) * 12 + ( (v.x>>57)%2 ) * -52 + ( (v.x>>48)%2 ) * -64 + ( (v.x>>47)%2 ) * 4 + ( (v.x>>11)%2 ) * 4 + ( (v.x>>61)%2 ) * 12 + ( (v.y>>39)%2 ) * 12) >= -56 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.y>>46)%2 ) * 2 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<58;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.x>>22)%2 ) * 2) >= 2 ) <<59;
        aux.x |=(unsigned long long) ( ( ( (v.y>>13)%2 ) * 2) >= 2 ) <<60;
        aux.x |=(unsigned long long) ( ( ( (v.y>>26)%2 ) * 86 + ( (v.x>>59)%2 ) * 42 + ( (v.x>>6)%2 ) * -42 + ( (v.x>>37)%2 ) * 126 + ( (v.y>>7)%2 ) * -258 + ( (v.y>>45)%2 ) * 18 + ( (v.x>>61)%2 ) * 18 + ( (v.x>>16)%2 ) * 86 + ( (v.y>>16)%2 ) * -18) >= 80 ) <<61;
        aux.x |=(unsigned long long) ( ( ( (v.x>>8)%2 ) * 6 + ( (v.x>>23)%2 ) * -2 + ( (v.y>>7)%2 ) * 2) >= 6 ) <<62;
        aux.x |=(unsigned long long) ( ( ( (v.z>>1)%2 ) * 2 + ( (v.y>>45)%2 ) * 2) >= 2 ) <<63;
        aux.y |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 6 + ( (v.x>>28)%2 ) * 6 + ( (v.x>>24)%2 ) * 6 + ( (v.x>>17)%2 ) * 6 + ( (v.y>>35)%2 ) * 6 + ( (v.x>>22)%2 ) * 2 + ( (v.y>>45)%2 ) * 2) >= 4 ) <<0;
        aux.y |=(unsigned long long) ( ( ( (v.y>>37)%2 ) * 2 + ( (v.y>>8)%2 ) * 2 + ( (v.x>>3)%2 ) * 2 + ( (v.x>>29)%2 ) * 2 + ( (v.x>>30)%2 ) * 2) >= 2 ) <<1;
        aux.y |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 22 + ( (v.y>>2)%2 ) * 6 + ( (v.y>>49)%2 ) * 6 + ( (v.y>>39)%2 ) * 22 + ( (v.y>>45)%2 ) * 2 + ( (v.x>>24)%2 ) * 2 + ( (v.x>>3)%2 ) * 22) >= 4 ) <<2;
        aux.y |=(unsigned long long) ( ( ( (v.y>>3)%2 ) * 0 + ( (v.y>>15)%2 ) * -8 + ( (v.y>>2)%2 ) * -8 + ( (v.y>>1)%2 ) * 8 + ( (v.y>>0)%2 ) * 8) >= 0 ) <<3;
        aux.y |=(unsigned long long) ( ( ( (v.y>>15)%2 ) * 6 + ( (v.y>>5)%2 ) * 6 + ( (v.y>>1)%2 ) * 6 + ( (v.y>>2)%2 ) * 6 + ( (v.y>>4)%2 ) * 18) >= 12 ) <<4;
        aux.y |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 18 + ( (v.y>>4)%2 ) * 18 + ( (v.y>>15)%2 ) * -14 + ( (v.y>>5)%2 ) * -14 + ( (v.y>>2)%2 ) * 18 + ( (v.y>>3)%2 ) * 18) >= 22 ) <<5;
        aux.y |=(unsigned long long) ( ( ( (v.y>>15)%2 ) * 8 + ( (v.y>>3)%2 ) * 8 + ( (v.y>>6)%2 ) * -24 + ( (v.y>>0)%2 ) * -16 + ( (v.y>>2)%2 ) * -16 + ( (v.y>>1)%2 ) * 24) >= -24 ) <<6;
        aux.y |=(unsigned long long) ( ( ( (v.y>>7)%2 ) * 0 + ( (v.y>>60)%2 ) * 8 + ( (v.y>>14)%2 ) * -4 + ( (v.x>>63)%2 ) * 4) >= 8 ) <<7;
        aux.y |=(unsigned long long) ( ( ( (v.x>>0)%2 ) * 10 + ( (v.x>>10)%2 ) * 30 + ( (v.y>>9)%2 ) * 30 + ( (v.y>>53)%2 ) * -38 + ( (v.y>>8)%2 ) * 14 + ( (v.y>>14)%2 ) * -26 + ( (v.x>>19)%2 ) * 10) >= 6 ) <<8;
        aux.y |=(unsigned long long) ( ( ( (v.y>>8)%2 ) * -4 + ( (v.y>>9)%2 ) * 0 + ( (v.x>>63)%2 ) * 4) >= 0 ) <<9;
        aux.y |=(unsigned long long) ( ( ( (v.y>>4)%2 ) * 6 + ( (v.x>>23)%2 ) * 10 + ( (v.y>>5)%2 ) * 6 + ( (v.x>>12)%2 ) * 10 + ( (v.x>>10)%2 ) * 18) >= 22 ) <<10;
        aux.y |=(unsigned long long) ( ( ( (v.x>>30)%2 ) * 14 + ( (v.x>>33)%2 ) * 2 + ( (v.y>>11)%2 ) * 2 + ( (v.y>>7)%2 ) * -2) >= 4 ) <<11;
        aux.y |=(unsigned long long) ( ( ( (v.y>>45)%2 ) * 12 + ( (v.x>>24)%2 ) * 12 + ( (v.y>>5)%2 ) * 36 + ( (v.x>>0)%2 ) * -4 + ( (v.x>>22)%2 ) * 20 + ( (v.x>>60)%2 ) * -4) >= 24 ) <<12;
        aux.y |=(unsigned long long) ( ( ( (v.y>>37)%2 ) * 6 + ( (v.x>>3)%2 ) * 102 + ( (v.x>>5)%2 ) * 90 + ( (v.y>>4)%2 ) * 94 + ( (v.y>>5)%2 ) * 94 + ( (v.y>>8)%2 ) * 6 + ( (v.y>>26)%2 ) * 6 + ( (v.x>>16)%2 ) * 6) >= 190 ) <<13;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_18_parte4(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.y |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * -2) >= 0 ) <<14;
        aux.y |=(unsigned long long) ( ( 0 * 90 + ( (v.y>>45)%2 ) * -34 + ( (v.y>>15)%2 ) * -34 + ( (v.y>>23)%2 ) * 6 + ( (v.y>>0)%2 ) * 6 + ( (v.y>>37)%2 ) * 6 + ( (v.x>>16)%2 ) * 6) >= -10 ) <<15;
        aux.y |=(unsigned long long) ( ( 0 * -6 + ( (v.x>>22)%2 ) * -2 + ( (v.z>>4)%2 ) * -2) >= -2 ) <<16;
        aux.y |=(unsigned long long) ( ( ( (v.x>>42)%2 ) * 2 + 0 * 2 + ( (v.y>>8)%2 ) * -2 + ( (v.y>>7)%2 ) * -2) >= 4 ) <<17;
        aux.y |=(unsigned long long) ( ( ( (v.y>>8)%2 ) * 2) >= 2 ) <<18;
        aux.y |=(unsigned long long) ( ( ( (v.y>>56)%2 ) * 2 + ( (v.x>>26)%2 ) * 2) >= 4 ) <<19;
        aux.y |=(unsigned long long) ( ( ( (v.y>>57)%2 ) * 2 + ( (v.x>>26)%2 ) * 2) >= 4 ) <<20;
        aux.y |=(unsigned long long) ( ( ( (v.y>>58)%2 ) * 2 + ( (v.x>>26)%2 ) * 2) >= 4 ) <<21;
        aux.y |=(unsigned long long) ( ( ( (v.y>>59)%2 ) * 2 + ( (v.x>>26)%2 ) * 2) >= 4 ) <<22;
        aux.y |=(unsigned long long) ( ( ( (v.y>>3)%2 ) * 2 + ( (v.x>>9)%2 ) * 6 + ( (v.y>>5)%2 ) * 2) >= 8 ) <<23;
        aux.y |=(unsigned long long) ( ( ( (v.x>>11)%2 ) * 2 + ( (v.y>>5)%2 ) * 2) >= 4 ) <<24;
        aux.y |=(unsigned long long) ( ( ( (v.y>>8)%2 ) * 2) >= 2 ) <<25;
        aux.y |=(unsigned long long) ( ( ( (v.y>>36)%2 ) * 192 + 0 * 1728 + ( (v.x>>42)%2 ) * 1728 + ( (v.y>>32)%2 ) * -336 + ( (v.y>>26)%2 ) * -1056 + ( (v.y>>63)%2 ) * -336 + ( (v.y>>38)%2 ) * -576 + ( (v.x>>61)%2 ) * 576 + ( (v.y>>23)%2 ) * 48 + ( (v.x>>21)%2 ) * 192 + ( (v.y>>50)%2 ) * 192 + ( (v.x>>16)%2 ) * 16 + ( (v.x>>33)%2 ) * 0) >= 2592 ) <<26;
        aux.y |=(unsigned long long) ( ( ( (v.y>>45)%2 ) * 32 + ( (v.y>>25)%2 ) * 32 + ( (v.y>>29)%2 ) * 32 + ( (v.x>>61)%2 ) * 48 + ( (v.y>>27)%2 ) * 272 + ( (v.y>>35)%2 ) * 208 + ( (v.y>>7)%2 ) * -16 + ( (v.x>>6)%2 ) * -48 + ( (v.x>>23)%2 ) * -48) >= 32 ) <<27;
        aux.y |=(unsigned long long) ( ( ( (v.y>>14)%2 ) * 4 + ( (v.y>>30)%2 ) * 4 + ( (v.y>>28)%2 ) * 4 + ( (v.y>>29)%2 ) * -8) >= 0 ) <<28;
        aux.y |=(unsigned long long) ( ( ( (v.y>>29)%2 ) * 4 + ( (v.y>>27)%2 ) * -8 + ( (v.y>>35)%2 ) * 4 + ( (v.y>>28)%2 ) * 4) >= 0 ) <<29;
        aux.y |=(unsigned long long) ( ( ( (v.y>>30)%2 ) * 0 + ( (v.y>>28)%2 ) * -4 + ( (v.y>>27)%2 ) * -4) >= -4 ) <<30;
        aux.y |=(unsigned long long) ( ( ( (v.x>>11)%2 ) * 2 + ( (v.y>>33)%2 ) * 2 + ( (v.x>>2)%2 ) * 2) >= 2 ) <<31;
        aux.y |=(unsigned long long) ( ( ( (v.y>>31)%2 ) * 2) >= 2 ) <<32;
        aux.y |=(unsigned long long) ( ( ( (v.y>>59)%2 ) * 14 + ( (v.x>>8)%2 ) * 210 + ( (v.y>>8)%2 ) * -210 + ( (v.y>>35)%2 ) * -30 + ( (v.x>>63)%2 ) * -30 + ( (v.y>>5)%2 ) * -30 + ( (v.y>>57)%2 ) * 14 + ( (v.y>>58)%2 ) * 14 + ( (v.y>>56)%2 ) * 14) >= 164 ) <<33;
        aux.y |=(unsigned long long) ( ( ( (v.y>>7)%2 ) * 6 + ( (v.y>>45)%2 ) * 18 + ( (v.y>>60)%2 ) * 18 + ( (v.y>>34)%2 ) * -6 + ( (v.x>>29)%2 ) * -6 + ( (v.x>>12)%2 ) * 6) >= 36 ) <<34;
        aux.y |=(unsigned long long) ( ( ( (v.y>>36)%2 ) * 2 + ( (v.y>>41)%2 ) * 2 + ( (v.y>>44)%2 ) * 2) >= 2 ) <<35;
        aux.y |=(unsigned long long) ( ( ( (v.x>>11)%2 ) * 2 + ( (v.x>>16)%2 ) * 6 + ( (v.x>>19)%2 ) * 2) >= 8 ) <<36;
        aux.y |=(unsigned long long) ( ( ( (v.y>>37)%2 ) * -8 + ( (v.x>>36)%2 ) * -8 + ( (v.y>>63)%2 ) * -8 + ( (v.y>>7)%2 ) * -8 + ( (v.y>>61)%2 ) * 16 + ( (v.y>>38)%2 ) * -16) >= -24 ) <<37;
        aux.y |=(unsigned long long) ( ( ( (v.x>>0)%2 ) * -2 + ( (v.y>>8)%2 ) * -2 + ( (v.y>>4)%2 ) * -2) >= 0 ) <<38;
        aux.y |=(unsigned long long) ( ( ( (v.y>>37)%2 ) * 2) >= 2 ) <<39;
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

__global__ void passo_tlf_18_parte5(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = v.x = init_rand[tid].x;
        aux.y = v.y = init_rand[tid].y;
        aux.z = v.z = init_rand[tid].z;

        aux.y |=(unsigned long long) ( ( ( (v.x>>45)%2 ) * 10 + ( (v.x>>46)%2 ) * -6 + ( (v.y>>40)%2 ) * -18 + ( (v.y>>14)%2 ) * -6 + ( (v.y>>42)%2 ) * 10) >= -8 ) <<40;
        aux.y |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2) >= 2 ) <<41;
        aux.y |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>4)%2 ) * 1022 + ( (v.x>>49)%2 ) * 2 + ( (v.x>>50)%2 ) * 2 + ( (v.x>>51)%2 ) * 2 + ( (v.y>>46)%2 ) * 2 + ( (v.x>>53)%2 ) * 2 + ( (v.y>>51)%2 ) * 2 + ( (v.x>>54)%2 ) * 2 + ( (v.x>>55)%2 ) * 2) >= 1024 ) <<42;
        aux.y |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 6 + ( (v.x>>24)%2 ) * 6 + ( (v.y>>45)%2 ) * 6 + ( (v.y>>43)%2 ) * -2 + ( (v.y>>15)%2 ) * -2) >= 16 ) <<43;
        aux.y |=(unsigned long long) ( ( ( (v.x>>37)%2 ) * 6 + ( (v.y>>5)%2 ) * 14 + ( (v.x>>23)%2 ) * -6 + ( (v.x>>59)%2 ) * 6 + ( (v.x>>17)%2 ) * 6) >= 20 ) <<44;
        aux.y |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 30 + ( (v.x>>8)%2 ) * 210 + ( (v.x>>18)%2 ) * -934 + ( (v.y>>45)%2 ) * -934 + ( (v.y>>18)%2 ) * 270 + ( (v.y>>59)%2 ) * 30 + ( (v.x>>24)%2 ) * 54 + ( (v.y>>16)%2 ) * 162 + ( (v.x>>14)%2 ) * 54 + ( (v.x>>22)%2 ) * 270 + ( (v.x>>29)%2 ) * 30) >= -718 ) <<45;
        aux.y |=(unsigned long long) ( ( ( (v.y>>48)%2 ) * 2) >= 2 ) <<46;
        aux.y |=(unsigned long long) ( ( ( (v.z>>7)%2 ) * 2) >= 2 ) <<47;
        aux.y |=(unsigned long long) ( ( ( (v.y>>52)%2 ) * 2 + ( (v.z>>0)%2 ) * -2) >= 2 ) <<48;
        aux.y |=(unsigned long long) ( ( ( (v.y>>4)%2 ) * 4 + ( (v.y>>49)%2 ) * 0 + ( (v.y>>45)%2 ) * -4) >= 0 ) <<49;
        aux.y |=(unsigned long long) ( ( ( (v.y>>8)%2 ) * 42 + ( (v.y>>4)%2 ) * 42 + ( (v.y>>35)%2 ) * 42 + ( (v.y>>34)%2 ) * 42 + ( (v.y>>5)%2 ) * 98 + ( (v.y>>3)%2 ) * 98 + ( (v.y>>45)%2 ) * 42 + ( (v.x>>12)%2 ) * 42) >= 182 ) <<50;
        aux.y |=(unsigned long long) ( ( ( (v.y>>52)%2 ) * 2) >= 2 ) <<51;
        aux.y |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2) >= 2 ) <<52;
        aux.y |=(unsigned long long) ( ( 0 * 2 + ( (v.y>>52)%2 ) * 2) >= 2 ) <<53;
        aux.y |=(unsigned long long) ( ( ( (v.y>>49)%2 ) * 18 + ( (v.y>>45)%2 ) * 14 + ( (v.x>>5)%2 ) * 2 + ( (v.y>>54)%2 ) * 2 + ( (v.y>>4)%2 ) * -2) >= 22 ) <<54;
        aux.y |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 28 + ( (v.y>>4)%2 ) * 12 + ( (v.x>>59)%2 ) * 12 + ( (v.x>>37)%2 ) * 12 + ( (v.x>>17)%2 ) * 0 + ( (v.x>>16)%2 ) * 84 + ( (v.y>>17)%2 ) * -84 + ( (v.y>>45)%2 ) * 28) >= 124 ) <<55;
        aux.y |=(unsigned long long) ( ( 0 * 4 + ( (v.x>>8)%2 ) * -8 + ( (v.y>>19)%2 ) * -4 + ( (v.y>>56)%2 ) * 4) >= -4 ) <<56;
        aux.y |=(unsigned long long) ( ( 0 * 4 + ( (v.x>>8)%2 ) * -8 + ( (v.y>>57)%2 ) * 4 + ( (v.y>>20)%2 ) * -4) >= -4 ) <<57;
        aux.y |=(unsigned long long) ( ( 0 * 4 + ( (v.x>>8)%2 ) * -8 + ( (v.y>>20)%2 ) * -4 + ( (v.y>>58)%2 ) * 4) >= -4 ) <<58;
        aux.y |=(unsigned long long) ( ( ( (v.y>>59)%2 ) * 4 + ( (v.x>>8)%2 ) * -8 + 0 * 4 + ( (v.y>>22)%2 ) * -4) >= -4 ) <<59;
        aux.y |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * 2 + ( (v.x>>62)%2 ) * -6 + ( (v.y>>60)%2 ) * 2) >= 2 ) <<60;
        aux.y |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 2 + ( (v.y>>5)%2 ) * 2) >= 4 ) <<61;
        aux.y |=(unsigned long long) ( ( ( (v.y>>5)%2 ) * 6 + ( (v.x>>24)%2 ) * -122 + ( (v.y>>45)%2 ) * -122 + ( (v.y>>3)%2 ) * 6 + ( (v.y>>4)%2 ) * 6 + ( (v.x>>10)%2 ) * 6 + ( (v.x>>22)%2 ) * 2 + ( (v.y>>41)%2 ) * -2) >= 2 ) <<62;
        aux.y |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 2 + ( (v.y>>45)%2 ) * 14 + ( (v.y>>63)%2 ) * -2 + ( (v.y>>62)%2 ) * -2) >= 12 ) <<63;
        aux.z |=(unsigned long long) ( ( ( (v.x>>44)%2 ) * 2 + ( (v.y>>14)%2 ) * -14 + ( (v.x>>46)%2 ) * -14 + ( (v.x>>43)%2 ) * 2 + ( (v.y>>42)%2 ) * 2) >= 2 ) <<0;
        aux.z |=(unsigned long long) ( ( ( (v.x>>23)%2 ) * 2 + ( (v.z>>1)%2 ) * -2 + ( (v.x>>63)%2 ) * 2) >= 4 ) <<1;
    
        
        estado[tid].x |= aux.x;
        estado[tid].y |= aux.y;
        estado[tid].z |= aux.z;
    }
}

unsigned long long confere_tlf_18(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    ulonglong3 v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux.x = v.x = init_rand[i].x;
        aux.y = v.y = init_rand[i].y;
        aux.z = v.z = init_rand[i].z;

        aux.x |=(unsigned long long) ( ( ( (v.y>>10)%2 ) * 2) >= 2 ) <<0;
        aux.x |=(unsigned long long) ( ( ( (v.x>>42)%2 ) * 2 + 0 * 2 + ( (v.x>>33)%2 ) * 2 + ( (v.x>>31)%2 ) * 2) >= 8 ) <<1;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<2;
        aux.x |=(unsigned long long) ( ( ( (v.y>>5)%2 ) * 2 + ( (v.y>>4)%2 ) * 2) >= 2 ) <<3;
        aux.x |=(unsigned long long) ( ( ( (v.y>>53)%2 ) * 2) >= 2 ) <<4;
        aux.x |=(unsigned long long) ( ( ( (v.x>>7)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 4 ) <<5;
        aux.x |=(unsigned long long) ( ( ( (v.x>>13)%2 ) * 12 + ( (v.y>>5)%2 ) * 12 + ( (v.y>>3)%2 ) * 12 + ( (v.x>>39)%2 ) * 36 + ( (v.y>>45)%2 ) * 36 + ( (v.x>>6)%2 ) * 92 + ( (v.y>>14)%2 ) * -128 + ( (v.x>>63)%2 ) * 12) >= -32 ) <<6;
        aux.x |=(unsigned long long) ( ( ( (v.y>>55)%2 ) * 2) >= 2 ) <<7;
        aux.x |=(unsigned long long) ( ( ( (v.y>>20)%2 ) * 2 + ( (v.y>>21)%2 ) * 2 + ( (v.y>>19)%2 ) * 2 + ( (v.y>>22)%2 ) * 2) >= 2 ) <<8;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) * 2) >= 2 ) <<9;
        aux.x |=(unsigned long long) ( ( ( (v.x>>41)%2 ) * 2 + ( (v.z>>3)%2 ) * -2) >= 2 ) <<10;
        aux.x |=(unsigned long long) ( ( ( (v.x>>10)%2 ) * 2) >= 2 ) <<11;
        aux.x |=(unsigned long long) ( ( ( (v.x>>13)%2 ) * 2 + ( (v.x>>11)%2 ) * 2) >= 4 ) <<12;
        aux.x |=(unsigned long long) ( ( ( (v.x>>11)%2 ) * 2) >= 2 ) <<13;
        aux.x |=(unsigned long long) ( ( ( (v.y>>45)%2 ) * 6 + ( (v.x>>24)%2 ) * 6 + ( (v.y>>17)%2 ) * -2 + ( (v.x>>14)%2 ) * -2) >= 10 ) <<14;
        aux.x |=(unsigned long long) ( ( ( (v.y>>45)%2 ) * 2 + ( (v.y>>41)%2 ) * -2) >= 2 ) <<15;
        aux.x |=(unsigned long long) ( ( ( (v.x>>16)%2 ) * 26 + ( (v.y>>38)%2 ) * -34 + ( (v.y>>23)%2 ) * 38 + ( (v.y>>45)%2 ) * -2 + ( (v.y>>26)%2 ) * -6 + ( (v.x>>33)%2 ) * 6 + ( (v.x>>61)%2 ) * 6) >= 16 ) <<16;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 6 + ( (v.x>>24)%2 ) * 2 + ( (v.y>>45)%2 ) * 2 + ( (v.y>>17)%2 ) * -6) >= 8 ) <<17;
        aux.x |=(unsigned long long) ( ( ( (v.x>>15)%2 ) * 248 + ( (v.x>>33)%2 ) * 8 + ( (v.y>>7)%2 ) * 8 + ( (v.x>>32)%2 ) * 8 + ( (v.x>>34)%2 ) * 8 + ( (v.y>>41)%2 ) * -8 + ( (v.x>>24)%2 ) * 0 + ( (v.y>>45)%2 ) * 0) >= 248 ) <<18;
        aux.x |=(unsigned long long) ( ( ( (v.y>>11)%2 ) * 4 + ( (v.y>>4)%2 ) * 12 + ( (v.x>>20)%2 ) * -16 + ( (v.x>>19)%2 ) * 4 + ( (v.y>>12)%2 ) * 4) >= 0 ) <<19;
        aux.x |=(unsigned long long) ( ( ( (v.y>>8)%2 ) * 14 + ( (v.x>>19)%2 ) * 14 + ( (v.y>>45)%2 ) * 6 + ( (v.x>>60)%2 ) * 6 + ( (v.x>>10)%2 ) * 6 + ( (v.x>>22)%2 ) * 42) >= 18 ) <<20;
        aux.x |=(unsigned long long) ( ( ( (v.x>>17)%2 ) * 2 + ( (v.x>>14)%2 ) * 2 + ( (v.y>>5)%2 ) * 2) >= 6 ) <<21;
        aux.x |=(unsigned long long) ( ( 0 * 32 + ( (v.y>>8)%2 ) * -4 + ( (v.y>>58)%2 ) * 4 + ( (v.x>>10)%2 ) * 28 + ( (v.y>>57)%2 ) * 4 + ( (v.y>>56)%2 ) * 4) >= 28 ) <<22;
        aux.x |=(unsigned long long) ( ( ( (v.x>>52)%2 ) * 14 + ( (v.x>>23)%2 ) * 2 + ( (v.y>>14)%2 ) * -2 + ( (v.x>>46)%2 ) * -2) >= 2 ) <<23;
        aux.x |=(unsigned long long) ( ( ( (v.y>>45)%2 ) * 6 + ( (v.x>>24)%2 ) * 2 + ( (v.y>>15)%2 ) * -10 + ( (v.x>>42)%2 ) * 10 + ( (v.y>>49)%2 ) * 10) >= 8 ) <<24;
        aux.x |=(unsigned long long) ( ( ( (v.y>>52)%2 ) * 2) >= 2 ) <<25;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 6 + ( (v.y>>4)%2 ) * 90 + ( (v.y>>25)%2 ) * -154 + ( (v.x>>23)%2 ) * -154 + ( (v.x>>34)%2 ) * 6 + ( (v.x>>8)%2 ) * 34 + ( (v.y>>45)%2 ) * 34 + ( (v.x>>32)%2 ) * 6 + ( (v.x>>35)%2 ) * 6) >= 68 ) <<26;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 0 + ( (v.y>>61)%2 ) * -4 + ( (v.x>>32)%2 ) * 0 + ( (v.y>>56)%2 ) * 4) >= 0 ) <<27;
        aux.x |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 0 + ( (v.y>>5)%2 ) * 4 + ( (v.x>>22)%2 ) * 8 + ( (v.y>>41)%2 ) * -8 + ( (v.x>>37)%2 ) * 4) >= 12 ) <<28;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * -4 + ( (v.y>>24)%2 ) * -32 + ( (v.x>>29)%2 ) * -4 + ( (v.y>>57)%2 ) * 28 + ( (v.y>>7)%2 ) * 4 + ( (v.y>>59)%2 ) * -4 + ( (v.z>>5)%2 ) * 4) >= -24 ) <<29;
        aux.x |=(unsigned long long) ( ( ( (v.y>>58)%2 ) * 8 + ( (v.x>>30)%2 ) * -4 + ( (v.x>>34)%2 ) * -4 + ( (v.y>>24)%2 ) * -4 + ( (v.y>>11)%2 ) * -4) >= -8 ) <<30;
        aux.x |=(unsigned long long) ( ( ( (v.y>>59)%2 ) * 4 + ( (v.x>>35)%2 ) * 4 + ( (v.y>>7)%2 ) * -4 + ( (v.x>>31)%2 ) * 4 + ( (v.y>>24)%2 ) * -8) >= -4 ) <<31;
        aux.x |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 6 + ( (v.y>>56)%2 ) * 2 + ( (v.x>>32)%2 ) * -2) >= 2 ) <<32;
        aux.x |=(unsigned long long) ( ( ( (v.y>>57)%2 ) * 2 + ( (v.x>>29)%2 ) * 6 + ( (v.x>>33)%2 ) * -2) >= 2 ) <<33;
        aux.x |=(unsigned long long) ( ( ( (v.y>>58)%2 ) * 2 + ( (v.x>>30)%2 ) * 6 + ( (v.x>>34)%2 ) * -2) >= 2 ) <<34;
        aux.x |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 6 + ( (v.y>>59)%2 ) * 2 + ( (v.x>>35)%2 ) * -2) >= 2 ) <<35;
        aux.x |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 2 + ( (v.y>>45)%2 ) * 2) >= 4 ) <<36;
        aux.x |=(unsigned long long) ( ( ( (v.y>>45)%2 ) * 2 + ( (v.x>>24)%2 ) * 2 + ( (v.x>>22)%2 ) * 6 + ( (v.y>>43)%2 ) * 6) >= 4 ) <<37;
        aux.x |=(unsigned long long) ( ( ( (v.z>>6)%2 ) * 2) >= 2 ) <<38;
        aux.x |=(unsigned long long) ( ( ( (v.y>>5)%2 ) * 2) >= 2 ) <<39;
        aux.x |=(unsigned long long) ( ( ( (v.y>>11)%2 ) * 2 + ( (v.y>>4)%2 ) * 6 + ( (v.y>>12)%2 ) * 2) >= 8 ) <<40;
        aux.x |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 46 + ( (v.x>>10)%2 ) * -14 + ( (v.x>>41)%2 ) * -50 + ( (v.x>>40)%2 ) * 26 + ( (v.x>>11)%2 ) * -18 + ( (v.y>>14)%2 ) * -6 + ( (v.y>>7)%2 ) * 34) >= -44 ) <<41;
        aux.x |=(unsigned long long) ( ( ( (v.y>>49)%2 ) * 10 + 0 * 10 + ( (v.x>>39)%2 ) * -22 + ( (v.x>>42)%2 ) * 2 + ( (v.y>>45)%2 ) * -14 + ( (v.y>>14)%2 ) * 2) >= -14 ) <<42;
        aux.x |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>4)%2 ) * 2046 + ( (v.x>>49)%2 ) * 2 + ( (v.x>>50)%2 ) * 2 + ( (v.x>>51)%2 ) * 2 + ( (v.y>>46)%2 ) * 2 + ( (v.y>>51)%2 ) * 2 + ( (v.x>>54)%2 ) * 2 + ( (v.x>>55)%2 ) * 2 + ( (v.x>>61)%2 ) * 2 + ( (v.y>>47)%2 ) * 2) >= 2048 ) <<43;
        aux.x |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>4)%2 ) * 126 + ( (v.x>>61)%2 ) * 2 + ( (v.x>>51)%2 ) * 2 + ( (v.y>>46)%2 ) * 2 + ( (v.y>>51)%2 ) * 2 + ( (v.y>>47)%2 ) * 2) >= 128 ) <<44;
        aux.x |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>4)%2 ) * 254 + ( (v.x>>49)%2 ) * 2 + ( (v.x>>50)%2 ) * 2 + ( (v.x>>51)%2 ) * 2 + ( (v.x>>53)%2 ) * 2 + ( (v.x>>54)%2 ) * 2 + ( (v.x>>55)%2 ) * 2) >= 256 ) <<45;
        aux.x |=(unsigned long long) ( ( ( (v.z>>0)%2 ) * 2 + ( (v.y>>60)%2 ) * 14 + ( (v.x>>23)%2 ) * 2 + ( (v.y>>40)%2 ) * 2) >= 16 ) <<46;
        aux.x |=(unsigned long long) ( ( ( (v.x>>11)%2 ) * 2 + ( (v.x>>61)%2 ) * -6 + ( (v.y>>7)%2 ) * -6 + ( (v.x>>23)%2 ) * 2) >= 2 ) <<47;
        aux.x |=(unsigned long long) ( ( ( (v.y>>7)%2 ) * 0 + ( (v.y>>39)%2 ) * 0 + ( (v.x>>39)%2 ) * -4 + ( (v.y>>8)%2 ) * -4 + ( (v.x>>61)%2 ) * -4 + ( (v.y>>27)%2 ) * -4) >= 0 ) <<48;
        aux.x |=(unsigned long long) ( ( ( (v.y>>26)%2 ) * 2 + ( (v.x>>16)%2 ) * 2) >= 2 ) <<49;
        aux.x |=(unsigned long long) ( ( ( (v.x>>16)%2 ) * 2 + ( (v.y>>40)%2 ) * 6 + ( (v.y>>26)%2 ) * 2) >= 8 ) <<50;
        aux.x |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2 + ( (v.y>>26)%2 ) * 2 + ( (v.x>>16)%2 ) * 2) >= 2 ) <<51;
        aux.x |=(unsigned long long) ( ( ( (v.x>>61)%2 ) * 0 + ( (v.y>>51)%2 ) * 108 + ( (v.y>>14)%2 ) * -92 + ( (v.x>>52)%2 ) * -92 + ( (v.x>>53)%2 ) * 12 + ( (v.y>>27)%2 ) * 84 + ( (v.x>>54)%2 ) * 12 + ( (v.x>>55)%2 ) * 12) >= 4 ) <<52;
        aux.x |=(unsigned long long) ( ( ( (v.y>>37)%2 ) * 4 + ( (v.y>>43)%2 ) * 8 + ( (v.x>>37)%2 ) * 8 + ( (v.x>>58)%2 ) * 4 + ( (v.y>>52)%2 ) * 12 + ( (v.y>>26)%2 ) * 12 + ( (v.y>>35)%2 ) * 12 + ( (v.x>>25)%2 ) * 12 + ( (v.x>>16)%2 ) * 12) >= 12 ) <<53;
        aux.x |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 2 + ( (v.x>>54)%2 ) * -30 + ( (v.x>>22)%2 ) * 30 + ( (v.y>>45)%2 ) * 2 + ( (v.y>>12)%2 ) * 2 + ( (v.x>>37)%2 ) * 2) >= 32 ) <<54;
        aux.x |=(unsigned long long) ( ( ( (v.y>>52)%2 ) * 2 + ( (v.x>>28)%2 ) * -14 + ( (v.y>>26)%2 ) * 2 + ( (v.x>>38)%2 ) * 2) >= 2 ) <<55;
        aux.x |=(unsigned long long) ( ( ( (v.x>>16)%2 ) * 2 + ( (v.y>>26)%2 ) * 2) >= 2 ) <<56;
        aux.x |=(unsigned long long) ( ( ( (v.x>>39)%2 ) * 12 + ( (v.x>>57)%2 ) * -52 + ( (v.x>>48)%2 ) * -64 + ( (v.x>>47)%2 ) * 4 + ( (v.x>>11)%2 ) * 4 + ( (v.x>>61)%2 ) * 12 + ( (v.y>>39)%2 ) * 12) >= -56 ) <<57;
        aux.x |=(unsigned long long) ( ( ( (v.y>>46)%2 ) * 2 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<58;
        aux.x |=(unsigned long long) ( ( ( (v.x>>14)%2 ) * 2 + ( (v.x>>22)%2 ) * 2) >= 2 ) <<59;
        aux.x |=(unsigned long long) ( ( ( (v.y>>13)%2 ) * 2) >= 2 ) <<60;
        aux.x |=(unsigned long long) ( ( ( (v.y>>26)%2 ) * 86 + ( (v.x>>59)%2 ) * 42 + ( (v.x>>6)%2 ) * -42 + ( (v.x>>37)%2 ) * 126 + ( (v.y>>7)%2 ) * -258 + ( (v.y>>45)%2 ) * 18 + ( (v.x>>61)%2 ) * 18 + ( (v.x>>16)%2 ) * 86 + ( (v.y>>16)%2 ) * -18) >= 80 ) <<61;
        aux.x |=(unsigned long long) ( ( ( (v.x>>8)%2 ) * 6 + ( (v.x>>23)%2 ) * -2 + ( (v.y>>7)%2 ) * 2) >= 6 ) <<62;
        aux.x |=(unsigned long long) ( ( ( (v.z>>1)%2 ) * 2 + ( (v.y>>45)%2 ) * 2) >= 2 ) <<63;
        aux.y |=(unsigned long long) ( ( ( (v.x>>33)%2 ) * 6 + ( (v.x>>28)%2 ) * 6 + ( (v.x>>24)%2 ) * 6 + ( (v.x>>17)%2 ) * 6 + ( (v.y>>35)%2 ) * 6 + ( (v.x>>22)%2 ) * 2 + ( (v.y>>45)%2 ) * 2) >= 4 ) <<0;
        aux.y |=(unsigned long long) ( ( ( (v.y>>37)%2 ) * 2 + ( (v.y>>8)%2 ) * 2 + ( (v.x>>3)%2 ) * 2 + ( (v.x>>29)%2 ) * 2 + ( (v.x>>30)%2 ) * 2) >= 2 ) <<1;
        aux.y |=(unsigned long long) ( ( ( (v.x>>60)%2 ) * 22 + ( (v.y>>2)%2 ) * 6 + ( (v.y>>49)%2 ) * 6 + ( (v.y>>39)%2 ) * 22 + ( (v.y>>45)%2 ) * 2 + ( (v.x>>24)%2 ) * 2 + ( (v.x>>3)%2 ) * 22) >= 4 ) <<2;
        aux.y |=(unsigned long long) ( ( ( (v.y>>3)%2 ) * 0 + ( (v.y>>15)%2 ) * -8 + ( (v.y>>2)%2 ) * -8 + ( (v.y>>1)%2 ) * 8 + ( (v.y>>0)%2 ) * 8) >= 0 ) <<3;
        aux.y |=(unsigned long long) ( ( ( (v.y>>15)%2 ) * 6 + ( (v.y>>5)%2 ) * 6 + ( (v.y>>1)%2 ) * 6 + ( (v.y>>2)%2 ) * 6 + ( (v.y>>4)%2 ) * 18) >= 12 ) <<4;
        aux.y |=(unsigned long long) ( ( ( (v.y>>0)%2 ) * 18 + ( (v.y>>4)%2 ) * 18 + ( (v.y>>15)%2 ) * -14 + ( (v.y>>5)%2 ) * -14 + ( (v.y>>2)%2 ) * 18 + ( (v.y>>3)%2 ) * 18) >= 22 ) <<5;
        aux.y |=(unsigned long long) ( ( ( (v.y>>15)%2 ) * 8 + ( (v.y>>3)%2 ) * 8 + ( (v.y>>6)%2 ) * -24 + ( (v.y>>0)%2 ) * -16 + ( (v.y>>2)%2 ) * -16 + ( (v.y>>1)%2 ) * 24) >= -24 ) <<6;
        aux.y |=(unsigned long long) ( ( ( (v.y>>7)%2 ) * 0 + ( (v.y>>60)%2 ) * 8 + ( (v.y>>14)%2 ) * -4 + ( (v.x>>63)%2 ) * 4) >= 8 ) <<7;
        aux.y |=(unsigned long long) ( ( ( (v.x>>0)%2 ) * 10 + ( (v.x>>10)%2 ) * 30 + ( (v.y>>9)%2 ) * 30 + ( (v.y>>53)%2 ) * -38 + ( (v.y>>8)%2 ) * 14 + ( (v.y>>14)%2 ) * -26 + ( (v.x>>19)%2 ) * 10) >= 6 ) <<8;
        aux.y |=(unsigned long long) ( ( ( (v.y>>8)%2 ) * -4 + ( (v.y>>9)%2 ) * 0 + ( (v.x>>63)%2 ) * 4) >= 0 ) <<9;
        aux.y |=(unsigned long long) ( ( ( (v.y>>4)%2 ) * 6 + ( (v.x>>23)%2 ) * 10 + ( (v.y>>5)%2 ) * 6 + ( (v.x>>12)%2 ) * 10 + ( (v.x>>10)%2 ) * 18) >= 22 ) <<10;
        aux.y |=(unsigned long long) ( ( ( (v.x>>30)%2 ) * 14 + ( (v.x>>33)%2 ) * 2 + ( (v.y>>11)%2 ) * 2 + ( (v.y>>7)%2 ) * -2) >= 4 ) <<11;
        aux.y |=(unsigned long long) ( ( ( (v.y>>45)%2 ) * 12 + ( (v.x>>24)%2 ) * 12 + ( (v.y>>5)%2 ) * 36 + ( (v.x>>0)%2 ) * -4 + ( (v.x>>22)%2 ) * 20 + ( (v.x>>60)%2 ) * -4) >= 24 ) <<12;
        aux.y |=(unsigned long long) ( ( ( (v.y>>37)%2 ) * 6 + ( (v.x>>3)%2 ) * 102 + ( (v.x>>5)%2 ) * 90 + ( (v.y>>4)%2 ) * 94 + ( (v.y>>5)%2 ) * 94 + ( (v.y>>8)%2 ) * 6 + ( (v.y>>26)%2 ) * 6 + ( (v.x>>16)%2 ) * 6) >= 190 ) <<13;
        aux.y |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * -2) >= 0 ) <<14;
        aux.y |=(unsigned long long) ( ( 0 * 90 + ( (v.y>>45)%2 ) * -34 + ( (v.y>>15)%2 ) * -34 + ( (v.y>>23)%2 ) * 6 + ( (v.y>>0)%2 ) * 6 + ( (v.y>>37)%2 ) * 6 + ( (v.x>>16)%2 ) * 6) >= -10 ) <<15;
        aux.y |=(unsigned long long) ( ( 0 * -6 + ( (v.x>>22)%2 ) * -2 + ( (v.z>>4)%2 ) * -2) >= -2 ) <<16;
        aux.y |=(unsigned long long) ( ( ( (v.x>>42)%2 ) * 2 + 0 * 2 + ( (v.y>>8)%2 ) * -2 + ( (v.y>>7)%2 ) * -2) >= 4 ) <<17;
        aux.y |=(unsigned long long) ( ( ( (v.y>>8)%2 ) * 2) >= 2 ) <<18;
        aux.y |=(unsigned long long) ( ( ( (v.y>>56)%2 ) * 2 + ( (v.x>>26)%2 ) * 2) >= 4 ) <<19;
        aux.y |=(unsigned long long) ( ( ( (v.y>>57)%2 ) * 2 + ( (v.x>>26)%2 ) * 2) >= 4 ) <<20;
        aux.y |=(unsigned long long) ( ( ( (v.y>>58)%2 ) * 2 + ( (v.x>>26)%2 ) * 2) >= 4 ) <<21;
        aux.y |=(unsigned long long) ( ( ( (v.y>>59)%2 ) * 2 + ( (v.x>>26)%2 ) * 2) >= 4 ) <<22;
        aux.y |=(unsigned long long) ( ( ( (v.y>>3)%2 ) * 2 + ( (v.x>>9)%2 ) * 6 + ( (v.y>>5)%2 ) * 2) >= 8 ) <<23;
        aux.y |=(unsigned long long) ( ( ( (v.x>>11)%2 ) * 2 + ( (v.y>>5)%2 ) * 2) >= 4 ) <<24;
        aux.y |=(unsigned long long) ( ( ( (v.y>>8)%2 ) * 2) >= 2 ) <<25;
        aux.y |=(unsigned long long) ( ( ( (v.y>>36)%2 ) * 192 + 0 * 1728 + ( (v.x>>42)%2 ) * 1728 + ( (v.y>>32)%2 ) * -336 + ( (v.y>>26)%2 ) * -1056 + ( (v.y>>63)%2 ) * -336 + ( (v.y>>38)%2 ) * -576 + ( (v.x>>61)%2 ) * 576 + ( (v.y>>23)%2 ) * 48 + ( (v.x>>21)%2 ) * 192 + ( (v.y>>50)%2 ) * 192 + ( (v.x>>16)%2 ) * 16 + ( (v.x>>33)%2 ) * 0) >= 2592 ) <<26;
        aux.y |=(unsigned long long) ( ( ( (v.y>>45)%2 ) * 32 + ( (v.y>>25)%2 ) * 32 + ( (v.y>>29)%2 ) * 32 + ( (v.x>>61)%2 ) * 48 + ( (v.y>>27)%2 ) * 272 + ( (v.y>>35)%2 ) * 208 + ( (v.y>>7)%2 ) * -16 + ( (v.x>>6)%2 ) * -48 + ( (v.x>>23)%2 ) * -48) >= 32 ) <<27;
        aux.y |=(unsigned long long) ( ( ( (v.y>>14)%2 ) * 4 + ( (v.y>>30)%2 ) * 4 + ( (v.y>>28)%2 ) * 4 + ( (v.y>>29)%2 ) * -8) >= 0 ) <<28;
        aux.y |=(unsigned long long) ( ( ( (v.y>>29)%2 ) * 4 + ( (v.y>>27)%2 ) * -8 + ( (v.y>>35)%2 ) * 4 + ( (v.y>>28)%2 ) * 4) >= 0 ) <<29;
        aux.y |=(unsigned long long) ( ( ( (v.y>>30)%2 ) * 0 + ( (v.y>>28)%2 ) * -4 + ( (v.y>>27)%2 ) * -4) >= -4 ) <<30;
        aux.y |=(unsigned long long) ( ( ( (v.x>>11)%2 ) * 2 + ( (v.y>>33)%2 ) * 2 + ( (v.x>>2)%2 ) * 2) >= 2 ) <<31;
        aux.y |=(unsigned long long) ( ( ( (v.y>>31)%2 ) * 2) >= 2 ) <<32;
        aux.y |=(unsigned long long) ( ( ( (v.y>>59)%2 ) * 14 + ( (v.x>>8)%2 ) * 210 + ( (v.y>>8)%2 ) * -210 + ( (v.y>>35)%2 ) * -30 + ( (v.x>>63)%2 ) * -30 + ( (v.y>>5)%2 ) * -30 + ( (v.y>>57)%2 ) * 14 + ( (v.y>>58)%2 ) * 14 + ( (v.y>>56)%2 ) * 14) >= 164 ) <<33;
        aux.y |=(unsigned long long) ( ( ( (v.y>>7)%2 ) * 6 + ( (v.y>>45)%2 ) * 18 + ( (v.y>>60)%2 ) * 18 + ( (v.y>>34)%2 ) * -6 + ( (v.x>>29)%2 ) * -6 + ( (v.x>>12)%2 ) * 6) >= 36 ) <<34;
        aux.y |=(unsigned long long) ( ( ( (v.y>>36)%2 ) * 2 + ( (v.y>>41)%2 ) * 2 + ( (v.y>>44)%2 ) * 2) >= 2 ) <<35;
        aux.y |=(unsigned long long) ( ( ( (v.x>>11)%2 ) * 2 + ( (v.x>>16)%2 ) * 6 + ( (v.x>>19)%2 ) * 2) >= 8 ) <<36;
        aux.y |=(unsigned long long) ( ( ( (v.y>>37)%2 ) * -8 + ( (v.x>>36)%2 ) * -8 + ( (v.y>>63)%2 ) * -8 + ( (v.y>>7)%2 ) * -8 + ( (v.y>>61)%2 ) * 16 + ( (v.y>>38)%2 ) * -16) >= -24 ) <<37;
        aux.y |=(unsigned long long) ( ( ( (v.x>>0)%2 ) * -2 + ( (v.y>>8)%2 ) * -2 + ( (v.y>>4)%2 ) * -2) >= 0 ) <<38;
        aux.y |=(unsigned long long) ( ( ( (v.y>>37)%2 ) * 2) >= 2 ) <<39;
        aux.y |=(unsigned long long) ( ( ( (v.x>>45)%2 ) * 10 + ( (v.x>>46)%2 ) * -6 + ( (v.y>>40)%2 ) * -18 + ( (v.y>>14)%2 ) * -6 + ( (v.y>>42)%2 ) * 10) >= -8 ) <<40;
        aux.y |=(unsigned long long) ( ( ( (v.x>>28)%2 ) * 2) >= 2 ) <<41;
        aux.y |=(unsigned long long) ( ( ( (v.x>>56)%2 ) * 2 + ( (v.x>>4)%2 ) * 1022 + ( (v.x>>49)%2 ) * 2 + ( (v.x>>50)%2 ) * 2 + ( (v.x>>51)%2 ) * 2 + ( (v.y>>46)%2 ) * 2 + ( (v.x>>53)%2 ) * 2 + ( (v.y>>51)%2 ) * 2 + ( (v.x>>54)%2 ) * 2 + ( (v.x>>55)%2 ) * 2) >= 1024 ) <<42;
        aux.y |=(unsigned long long) ( ( ( (v.x>>22)%2 ) * 6 + ( (v.x>>24)%2 ) * 6 + ( (v.y>>45)%2 ) * 6 + ( (v.y>>43)%2 ) * -2 + ( (v.y>>15)%2 ) * -2) >= 16 ) <<43;
        aux.y |=(unsigned long long) ( ( ( (v.x>>37)%2 ) * 6 + ( (v.y>>5)%2 ) * 14 + ( (v.x>>23)%2 ) * -6 + ( (v.x>>59)%2 ) * 6 + ( (v.x>>17)%2 ) * 6) >= 20 ) <<44;
        aux.y |=(unsigned long long) ( ( ( (v.x>>31)%2 ) * 30 + ( (v.x>>8)%2 ) * 210 + ( (v.x>>18)%2 ) * -934 + ( (v.y>>45)%2 ) * -934 + ( (v.y>>18)%2 ) * 270 + ( (v.y>>59)%2 ) * 30 + ( (v.x>>24)%2 ) * 54 + ( (v.y>>16)%2 ) * 162 + ( (v.x>>14)%2 ) * 54 + ( (v.x>>22)%2 ) * 270 + ( (v.x>>29)%2 ) * 30) >= -718 ) <<45;
        aux.y |=(unsigned long long) ( ( ( (v.y>>48)%2 ) * 2) >= 2 ) <<46;
        aux.y |=(unsigned long long) ( ( ( (v.z>>7)%2 ) * 2) >= 2 ) <<47;
        aux.y |=(unsigned long long) ( ( ( (v.y>>52)%2 ) * 2 + ( (v.z>>0)%2 ) * -2) >= 2 ) <<48;
        aux.y |=(unsigned long long) ( ( ( (v.y>>4)%2 ) * 4 + ( (v.y>>49)%2 ) * 0 + ( (v.y>>45)%2 ) * -4) >= 0 ) <<49;
        aux.y |=(unsigned long long) ( ( ( (v.y>>8)%2 ) * 42 + ( (v.y>>4)%2 ) * 42 + ( (v.y>>35)%2 ) * 42 + ( (v.y>>34)%2 ) * 42 + ( (v.y>>5)%2 ) * 98 + ( (v.y>>3)%2 ) * 98 + ( (v.y>>45)%2 ) * 42 + ( (v.x>>12)%2 ) * 42) >= 182 ) <<50;
        aux.y |=(unsigned long long) ( ( ( (v.y>>52)%2 ) * 2) >= 2 ) <<51;
        aux.y |=(unsigned long long) ( ( ( (v.x>>38)%2 ) * 2) >= 2 ) <<52;
        aux.y |=(unsigned long long) ( ( 0 * 2 + ( (v.y>>52)%2 ) * 2) >= 2 ) <<53;
        aux.y |=(unsigned long long) ( ( ( (v.y>>49)%2 ) * 18 + ( (v.y>>45)%2 ) * 14 + ( (v.x>>5)%2 ) * 2 + ( (v.y>>54)%2 ) * 2 + ( (v.y>>4)%2 ) * -2) >= 22 ) <<54;
        aux.y |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 28 + ( (v.y>>4)%2 ) * 12 + ( (v.x>>59)%2 ) * 12 + ( (v.x>>37)%2 ) * 12 + ( (v.x>>17)%2 ) * 0 + ( (v.x>>16)%2 ) * 84 + ( (v.y>>17)%2 ) * -84 + ( (v.y>>45)%2 ) * 28) >= 124 ) <<55;
        aux.y |=(unsigned long long) ( ( 0 * 4 + ( (v.x>>8)%2 ) * -8 + ( (v.y>>19)%2 ) * -4 + ( (v.y>>56)%2 ) * 4) >= -4 ) <<56;
        aux.y |=(unsigned long long) ( ( 0 * 4 + ( (v.x>>8)%2 ) * -8 + ( (v.y>>57)%2 ) * 4 + ( (v.y>>20)%2 ) * -4) >= -4 ) <<57;
        aux.y |=(unsigned long long) ( ( 0 * 4 + ( (v.x>>8)%2 ) * -8 + ( (v.y>>20)%2 ) * -4 + ( (v.y>>58)%2 ) * 4) >= -4 ) <<58;
        aux.y |=(unsigned long long) ( ( ( (v.y>>59)%2 ) * 4 + ( (v.x>>8)%2 ) * -8 + 0 * 4 + ( (v.y>>22)%2 ) * -4) >= -4 ) <<59;
        aux.y |=(unsigned long long) ( ( ( (v.x>>1)%2 ) * 2 + ( (v.x>>62)%2 ) * -6 + ( (v.y>>60)%2 ) * 2) >= 2 ) <<60;
        aux.y |=(unsigned long long) ( ( ( (v.x>>27)%2 ) * 2 + ( (v.y>>5)%2 ) * 2) >= 4 ) <<61;
        aux.y |=(unsigned long long) ( ( ( (v.y>>5)%2 ) * 6 + ( (v.x>>24)%2 ) * -122 + ( (v.y>>45)%2 ) * -122 + ( (v.y>>3)%2 ) * 6 + ( (v.y>>4)%2 ) * 6 + ( (v.x>>10)%2 ) * 6 + ( (v.x>>22)%2 ) * 2 + ( (v.y>>41)%2 ) * -2) >= 2 ) <<62;
        aux.y |=(unsigned long long) ( ( ( (v.x>>24)%2 ) * 2 + ( (v.y>>45)%2 ) * 14 + ( (v.y>>63)%2 ) * -2 + ( (v.y>>62)%2 ) * -2) >= 12 ) <<63;
        aux.z |=(unsigned long long) ( ( ( (v.x>>44)%2 ) * 2 + ( (v.y>>14)%2 ) * -14 + ( (v.x>>46)%2 ) * -14 + ( (v.x>>43)%2 ) * 2 + ( (v.y>>42)%2 ) * 2) >= 2 ) <<0;
        aux.z |=(unsigned long long) ( ( ( (v.x>>23)%2 ) * 2 + ( (v.z>>1)%2 ) * -2 + ( (v.x>>63)%2 ) * 2) >= 4 ) <<1;

        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}


void preenche_init_rand(ulonglong3 * init_rand, unsigned long long nSim, unsigned int nEq)
{
    
    for(unsigned long long i = 0; i < nSim; i++)
    {
        
        init_rand[i].x = 0;
        init_rand[i].y = 0;
        init_rand[i].z = 0;
        unsigned long rand1 = rand()%((unsigned long)(1<<31)-1);
        unsigned long rand2 = rand()%((unsigned long)(1<<31)-1);
        unsigned long rand3 = rand()%((unsigned long)(1<<31)-1);
        unsigned long rand4 = rand()%((unsigned long)(1<<31)-1);
        unsigned long rand5 = rand()%((unsigned long)(1<<31)-1);
        unsigned long rand6 = rand()%((unsigned long)(1<<31)-1);
        for(int j = 0; j < nEq && j < 32; j++)
            init_rand[i].x |=(unsigned long long) ((rand1>>j)%2)<<j;
        for(int j = 32; j < nEq && j < 64; j++)
            init_rand[i].x |=(unsigned long long) ((rand2>>(j-32))%2)<<j;
        for(int j = 64; j < nEq && j < 96; j++)
            init_rand[i].y |=(unsigned long long) ((rand3>>(j-64))%2)<<(j-64);
        for(int j = 96; j < nEq && j < 128; j++)
            init_rand[i].y |=(unsigned long long) ((rand4>>(j-96))%2)<<(j-64);
        for(int j = 128; j < nEq && j < 160; j++)
            init_rand[i].z |=(unsigned long long) ((rand5>>(j-128))%2)<<(j-128);
        for(int j = 160; j < nEq && j < 192; j++)
            init_rand[i].z |=(unsigned long long) ((rand6>>(j-160))%2)<<(j-128);
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
    ulonglong3 *h_init_rand, *h_estado;
    h_init_rand = new ulonglong3[MAX_ESTADO];
    h_estado = new ulonglong3[MAX_ESTADO];

    ulonglong3 *d_init_rand, *d_estado;
    cudaMalloc(&d_init_rand,sizeof(ulonglong3)*MAX_ESTADO);
    cudaMalloc(&d_estado,sizeof(ulonglong3)*MAX_ESTADO);
    
    unsigned int nEq = 192;
    srand(MAX_ESTADO);
    preenche_init_rand(h_init_rand,MAX_ESTADO,nEq);

    for(unsigned long long i = 0; i < MAX_ESTADO; i++)
    {
        h_estado[i].x = 0;
        h_estado[i].y = 0;
        h_estado[i].z = 0;
    }
        

    cudaMemcpy(d_init_rand, h_init_rand, sizeof(ulonglong3)*MAX_ESTADO, cudaMemcpyHostToDevice);
    cudaMemcpy(d_estado, h_estado, sizeof(ulonglong3)*MAX_ESTADO, cudaMemcpyHostToDevice);

    switch (n) {
        case 0: passo_bool_10_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_10_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_10_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 1: passo_tlf_10_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_10_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_10_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 2: passo_bool_11_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_11_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_11_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 3: passo_tlf_11_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_11_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_11_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 4: passo_bool_12_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_12_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_12_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 5: passo_tlf_12_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_12_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_12_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        //case 7: passo_bool_4<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); break;
        //case 8: passo_tlf_4<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); break;
        case 6: passo_bool_13_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_13_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_13_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 7: passo_tlf_13_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_13_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_13_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 8: passo_bool_14_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_14_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_14_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 9: passo_tlf_14_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_14_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_14_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 10: passo_bool_15_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_15_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_15_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 11:passo_tlf_15_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_15_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_15_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 12:passo_bool_17_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_17_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_17_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 13: passo_tlf_17_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_17_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_17_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_17_parte4<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        case 14:passo_bool_18_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_18_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_18_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_18_parte4<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_bool_18_parte5<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); 
                break;
        case 15: passo_tlf_18_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_18_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                cudaDeviceSynchronize();
                passo_tlf_18_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
                break;
        default: 
                break;
    }
    cudaDeviceSynchronize();
    
    cudaMemcpy(h_estado, d_estado, sizeof(ulonglong3)*MAX_ESTADO, cudaMemcpyDeviceToHost);


    unsigned long long i = 0;
    switch (n) {
        case 0:i= confere_bool_10(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 1:i= confere_tlf_10(h_init_rand,h_estado,MAX_ESTADO);
                break;
        case 2: i= confere_bool_11(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 3: i= confere_tlf_11(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 4: i= confere_bool_12(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 5: i= confere_tlf_12(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        //case 7: passo_bool_4<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); 
                break;
        //case 8: passo_tlf_4<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO); 
                break;
        case 6: i= confere_bool_13(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 7: i= confere_tlf_13(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 8: i= confere_bool_14(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 9: i= confere_tlf_14(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 10: i= confere_bool_15(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 11: i= confere_tlf_15(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 12: i= confere_bool_17(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 13: i= confere_tlf_17(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 14: i= confere_bool_18(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        case 15: i= confere_tlf_18(h_init_rand,h_estado,MAX_ESTADO); 
                break;
        default: 
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