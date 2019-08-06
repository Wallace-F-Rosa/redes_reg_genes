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
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;

        aux.x |= ( ( (v.x>>41)%2 ) )<< 0 ;
        aux.x |= ( ( (v.x>>20)%2 ) ) | ( ( (v.x>>14)%2 ) )<< 1 ;
        aux.x |= ( ( (v.x>>17)%2 ) )<< 2 ;
        aux.x |= ! ( ( ( (v.x>>0)%2 ) ) )<< 3 ;
        aux.x |= ( ( ( ( (v.x>>6)%2 ) ) & ! ( ( (v.x>>7)%2 ) ) ) & ! ( ( (v.x>>5)%2 ) ) ) | ( ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>7)%2 ) ) ) & ! ( ( (v.x>>5)%2 ) ) )<< 4 ;
        aux.x |= ( ( ( ( (v.x>>61)%2 ) ) & ! ( ( (v.x>>57)%2 ) ) ) & ! ( ( (v.x>>3)%2 ) ) ) | ( ( ( ( (v.x>>59)%2 ) ) & ! ( ( (v.x>>57)%2 ) ) ) & ! ( ( (v.x>>3)%2 ) ) )<< 5 ;
        aux.x |= ( ( ( ( (v.x>>49)%2 ) ) & ! ( ( (v.x>>5)%2 ) ) ) & ! ( ( (v.x>>7)%2 ) ) ) | ( ( ( ( (v.x>>15)%2 ) ) & ! ( ( (v.x>>5)%2 ) ) ) & ! ( ( (v.x>>7)%2 ) ) ) | ( ( ( ( (v.x>>23)%2 ) ) & ! ( ( (v.x>>5)%2 ) ) ) & ! ( ( (v.x>>7)%2 ) ) )<< 6 ;
        aux.x |= ( ( ( ( ( (v.x>>61)%2 ) ) & ! ( ( (v.x>>3)%2 ) ) ) & ! ( ( (v.x>>4)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) ) | ( ( ( ( ( (v.x>>59)%2 ) ) & ! ( ( (v.x>>3)%2 ) ) ) & ! ( ( (v.x>>4)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) )<< 7 ;
        aux.x |= ( ( ( (v.x>>13)%2 ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 8 ;
        aux.x |= ( ( ( ( (v.x>>12)%2 ) ) & ! ( ( (v.x>>56)%2 ) ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 9 ;
        aux.x |= ( ( (v.x>>12)%2 ) )<< 10 ;
        aux.x |= ( ( (v.x>>62)%2 ) )<< 11 ;
        aux.x |= ( ( (v.x>>0)%2 ) ) | ( ( (v.x>>38)%2 ) ) | ( ( (v.x>>21)%2 ) )<< 12 ;
        aux.x |= ( ( (v.x>>38)%2 ) )<< 13 ;
        aux.x |= ( ( ( (v.x>>15)%2 ) ) & ! ( ( (v.x>>52)%2 ) ) ) | ( ( ( (v.x>>16)%2 ) ) & ! ( ( (v.x>>52)%2 ) ) )<< 14 ;
        aux.x |= ( ( ( (v.x>>23)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) & ! ( ( (v.x>>22)%2 ) ) )<< 15 ;
        aux.x |= ( ( ( ( (v.x>>18)%2 ) ) & ! ( ( (v.x>>52)%2 ) ) ) & ! ( ( (v.x>>0)%2 ) ) )<< 16 ;
        aux.x |= ( ( (v.x>>14)%2 ) )<< 17 ;
        aux.x |= ( ( (v.x>>36)%2 ) )<< 18 ;
        aux.x |= ( ( (v.x>>1)%2 ) )<< 19 ;
        aux.x |= ( ( (v.x>>49)%2 ) ) | ( ( (v.x>>14)%2 ) )<< 20 ;
        
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
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;

        aux.x |= ( ( (v.x>>31)%2 ) )<< 21 ;
        aux.x |= ( ( (v.x>>59)%2 ) )<< 22 ;
        aux.x |= ( ( (v.x>>24)%2 ) ) | ( ( (v.x>>57)%2 ) )<< 23 ;
        aux.x |= ( ( (v.x>>53)%2 ) ) | ( ( (v.x>>23)%2 ) )<< 24 ;
        aux.x |= ( ( (v.x>>60)%2 ) )<< 25 ;
        aux.x |= ( ( (v.x>>47)%2 ) & ( ( ( ( (v.x>>39)%2 ) ) ) ) ) | ( ( (v.x>>0)%2 ) )<< 26 ;
        aux.x |= ( ( (v.x>>59)%2 ) )<< 27 ;
        aux.x |= ( ( (v.x>>54)%2 ) & ( ( ( ( (v.x>>27)%2 ) ) ) ) )<< 28 ;
        aux.x |= ( ( ( (v.x>>27)%2 ) & ( ( ( ( (v.x>>54)%2 ) ) ) ) ) & ! ( ( (v.x>>63)%2 ) ) )<< 29 ;
        aux.x |= ( ( ( (v.x>>37)%2 ) ) & ! ( ( (v.x>>43)%2 ) ) )<< 30 ;
        aux.x |= ( ( (v.x>>33)%2 ) )<< 31 ;
        aux.x |= ( ( ( (v.x>>0)%2 ) ) & ! ( ( (v.x>>1)%2 ) ) ) | ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>1)%2 ) ) )<< 32 ;
        aux.x |= ( ( (v.x>>45)%2 ) )<< 33 ;
        aux.x |= ( ( (v.x>>33)%2 ) )<< 34 ;
        aux.x |= ( ( (v.x>>44)%2 ) )<< 35 ;
        aux.x |= ( ( (v.x>>4)%2 ) )<< 36 ;
        aux.x |= ( ( (v.x>>35)%2 ) )<< 37 ;
        aux.x |= ( ( (v.x>>61)%2 ) ) | ( ( (v.x>>34)%2 ) ) | ( ( (v.x>>21)%2 ) )<< 38 ;
        aux.x |= ! ( ( ( (v.x>>51)%2 ) ) )<< 39 ;
        aux.x |= ( ( (v.x>>27)%2 ) & ( ( ( ( (v.x>>54)%2 ) ) ) ) )<< 40 ;
        aux.x |= ( ( ( (v.x>>41)%2 ) ) & ! ( ( (v.x>>42)%2 ) ) )<< 41 ;
        
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
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;

        aux.x |= ( ( (v.x>>57)%2 ) )<< 42 ;
        aux.x |= ! ( ( ( (v.y>>0)%2 ) ) )<< 43 ;
        aux.x |= ( ( (v.x>>49)%2 ) )<< 44 ;
        aux.x |= ( ( (v.x>>46)%2 ) )<< 45 ;
        aux.x |= ( ( (v.x>>27)%2 ) & ( ( ( ( (v.x>>54)%2 ) ) ) ) ) | ( ( (v.x>>63)%2 ) )<< 46 ;
        aux.x |= ( ( (v.y>>0)%2 ) ) | ( ( (v.x>>62)%2 ) & ( ( ( ( (v.y>>1)%2 ) ) ) ) )<< 47 ;
        aux.x |= ! ( ( ( (v.x>>14)%2 ) ) )<< 48 ;
        aux.x |= ( ( ( (v.x>>20)%2 ) ) ) | ! ( ( (v.x>>20)%2 ) | ( (v.x>>43)%2 ) )<< 49 ;
        aux.x |= ( ( (v.x>>36)%2 ) )<< 50 ;
        aux.x |= ! ( ( ( (v.x>>11)%2 ) ) )<< 51 ;
        aux.x |= ( ( ( ( (v.x>>61)%2 ) ) & ! ( ( (v.x>>50)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) ) | ( ( ( ( (v.x>>59)%2 ) ) & ! ( ( (v.x>>50)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) )<< 52 ;
        aux.x |= ( ( (v.x>>30)%2 ) )<< 53 ;
        aux.x |= ! ( ( ( (v.x>>14)%2 ) ) )<< 54 ;
        aux.x |= ( ( ( ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>38)%2 ) ) ) & ! ( ( (v.x>>0)%2 ) ) ) & ! ( ( (v.x>>32)%2 ) ) ) & ! ( ( (v.x>>9)%2 ) ) )<< 55 ;
        aux.x |= ( ( ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>9)%2 ) ) ) & ! ( ( (v.x>>0)%2 ) ) ) & ! ( ( (v.x>>38)%2 ) ) )<< 56 ;
        aux.x |= ( ( ( (v.x>>19)%2 ) ) & ! ( ( (v.x>>32)%2 ) & ( ( ( ( (v.x>>43)%2 ) ) ) ) ) ) | ( ( ( (v.x>>30)%2 ) ) & ! ( ( (v.x>>32)%2 ) & ( ( ( ( (v.x>>43)%2 ) ) ) ) ) )<< 57 ;
        aux.x |= ( ( (v.x>>26)%2 ) )<< 58 ;
        aux.x |= ( ( (v.x>>61)%2 ) ) | ( ( (v.x>>58)%2 ) ) | ( ( (v.y>>2)%2 ) ) | ( ( (v.x>>43)%2 ) & ( ( ( ( (v.x>>58)%2 ) ) ) ) )<< 59 ;
        aux.x |= ( ( (v.x>>9)%2 ) & ( ( ( ( (v.x>>10)%2 ) ) ) ) ) | ( ( (v.x>>8)%2 ) & ( ( ( ( (v.x>>10)%2 ) & ( (v.x>>9)%2 ) ) ) ) )<< 60 ;
        aux.x |= ( ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>48)%2 ) & ( (v.x>>28)%2 ) ) & ( ( ( ! ( (v.x>>26)%2 ) ) ) ) ) ) ) & ! ( ( (v.x>>30)%2 ) ) ) | ( ( (v.x>>28)%2 ) & ( ( ( ( (v.x>>48)%2 ) & ( (v.x>>29)%2 ) ) ) ) )<< 61 ;
        aux.x |= ( ( (v.x>>62)%2 ) )<< 62 ;

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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;

        aux.x |= ( ( (v.x>>41)%2 ) )<< 0 ;
        aux.x |= ( ( (v.x>>20)%2 ) ) | ( ( (v.x>>14)%2 ) )<< 1 ;
        aux.x |= ( ( (v.x>>17)%2 ) )<< 2 ;
        aux.x |= ! ( ( ( (v.x>>0)%2 ) ) )<< 3 ;
        aux.x |= ( ( ( ( (v.x>>6)%2 ) ) & ! ( ( (v.x>>7)%2 ) ) ) & ! ( ( (v.x>>5)%2 ) ) ) | ( ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>7)%2 ) ) ) & ! ( ( (v.x>>5)%2 ) ) )<< 4 ;
        aux.x |= ( ( ( ( (v.x>>61)%2 ) ) & ! ( ( (v.x>>57)%2 ) ) ) & ! ( ( (v.x>>3)%2 ) ) ) | ( ( ( ( (v.x>>59)%2 ) ) & ! ( ( (v.x>>57)%2 ) ) ) & ! ( ( (v.x>>3)%2 ) ) )<< 5 ;
        aux.x |= ( ( ( ( (v.x>>49)%2 ) ) & ! ( ( (v.x>>5)%2 ) ) ) & ! ( ( (v.x>>7)%2 ) ) ) | ( ( ( ( (v.x>>15)%2 ) ) & ! ( ( (v.x>>5)%2 ) ) ) & ! ( ( (v.x>>7)%2 ) ) ) | ( ( ( ( (v.x>>23)%2 ) ) & ! ( ( (v.x>>5)%2 ) ) ) & ! ( ( (v.x>>7)%2 ) ) )<< 6 ;
        aux.x |= ( ( ( ( ( (v.x>>61)%2 ) ) & ! ( ( (v.x>>3)%2 ) ) ) & ! ( ( (v.x>>4)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) ) | ( ( ( ( ( (v.x>>59)%2 ) ) & ! ( ( (v.x>>3)%2 ) ) ) & ! ( ( (v.x>>4)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) )<< 7 ;
        aux.x |= ( ( ( (v.x>>13)%2 ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 8 ;
        aux.x |= ( ( ( ( (v.x>>12)%2 ) ) & ! ( ( (v.x>>56)%2 ) ) ) & ! ( ( (v.x>>55)%2 ) ) )<< 9 ;
        aux.x |= ( ( (v.x>>12)%2 ) )<< 10 ;
        aux.x |= ( ( (v.x>>62)%2 ) )<< 11 ;
        aux.x |= ( ( (v.x>>0)%2 ) ) | ( ( (v.x>>38)%2 ) ) | ( ( (v.x>>21)%2 ) )<< 12 ;
        aux.x |= ( ( (v.x>>38)%2 ) )<< 13 ;
        aux.x |= ( ( ( (v.x>>15)%2 ) ) & ! ( ( (v.x>>52)%2 ) ) ) | ( ( ( (v.x>>16)%2 ) ) & ! ( ( (v.x>>52)%2 ) ) )<< 14 ;
        aux.x |= ( ( ( (v.x>>23)%2 ) & ( ( ( ( (v.x>>24)%2 ) ) ) ) ) & ! ( ( (v.x>>22)%2 ) ) )<< 15 ;
        aux.x |= ( ( ( ( (v.x>>18)%2 ) ) & ! ( ( (v.x>>52)%2 ) ) ) & ! ( ( (v.x>>0)%2 ) ) )<< 16 ;
        aux.x |= ( ( (v.x>>14)%2 ) )<< 17 ;
        aux.x |= ( ( (v.x>>36)%2 ) )<< 18 ;
        aux.x |= ( ( (v.x>>1)%2 ) )<< 19 ;
        aux.x |= ( ( (v.x>>49)%2 ) ) | ( ( (v.x>>14)%2 ) )<< 20 ;
        aux.x |= ( ( (v.x>>31)%2 ) )<< 21 ;
        aux.x |= ( ( (v.x>>59)%2 ) )<< 22 ;
        aux.x |= ( ( (v.x>>24)%2 ) ) | ( ( (v.x>>57)%2 ) )<< 23 ;
        aux.x |= ( ( (v.x>>53)%2 ) ) | ( ( (v.x>>23)%2 ) )<< 24 ;
        aux.x |= ( ( (v.x>>60)%2 ) )<< 25 ;
        aux.x |= ( ( (v.x>>47)%2 ) & ( ( ( ( (v.x>>39)%2 ) ) ) ) ) | ( ( (v.x>>0)%2 ) )<< 26 ;
        aux.x |= ( ( (v.x>>59)%2 ) )<< 27 ;
        aux.x |= ( ( (v.x>>54)%2 ) & ( ( ( ( (v.x>>27)%2 ) ) ) ) )<< 28 ;
        aux.x |= ( ( ( (v.x>>27)%2 ) & ( ( ( ( (v.x>>54)%2 ) ) ) ) ) & ! ( ( (v.x>>63)%2 ) ) )<< 29 ;
        aux.x |= ( ( ( (v.x>>37)%2 ) ) & ! ( ( (v.x>>43)%2 ) ) )<< 30 ;
        aux.x |= ( ( (v.x>>33)%2 ) )<< 31 ;
        aux.x |= ( ( ( (v.x>>0)%2 ) ) & ! ( ( (v.x>>1)%2 ) ) ) | ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>1)%2 ) ) )<< 32 ;
        aux.x |= ( ( (v.x>>45)%2 ) )<< 33 ;
        aux.x |= ( ( (v.x>>33)%2 ) )<< 34 ;
        aux.x |= ( ( (v.x>>44)%2 ) )<< 35 ;
        aux.x |= ( ( (v.x>>4)%2 ) )<< 36 ;
        aux.x |= ( ( (v.x>>35)%2 ) )<< 37 ;
        aux.x |= ( ( (v.x>>61)%2 ) ) | ( ( (v.x>>34)%2 ) ) | ( ( (v.x>>21)%2 ) )<< 38 ;
        aux.x |= ! ( ( ( (v.x>>51)%2 ) ) )<< 39 ;
        aux.x |= ( ( (v.x>>27)%2 ) & ( ( ( ( (v.x>>54)%2 ) ) ) ) )<< 40 ;
        aux.x |= ( ( ( (v.x>>41)%2 ) ) & ! ( ( (v.x>>42)%2 ) ) )<< 41 ;
        aux.x |= ( ( (v.x>>57)%2 ) )<< 42 ;
        aux.x |= ! ( ( ( (v.y>>0)%2 ) ) )<< 43 ;
        aux.x |= ( ( (v.x>>49)%2 ) )<< 44 ;
        aux.x |= ( ( (v.x>>46)%2 ) )<< 45 ;
        aux.x |= ( ( (v.x>>27)%2 ) & ( ( ( ( (v.x>>54)%2 ) ) ) ) ) | ( ( (v.x>>63)%2 ) )<< 46 ;
        aux.x |= ( ( (v.y>>0)%2 ) ) | ( ( (v.x>>62)%2 ) & ( ( ( ( (v.y>>1)%2 ) ) ) ) )<< 47 ;
        aux.x |= ! ( ( ( (v.x>>14)%2 ) ) )<< 48 ;
        aux.x |= ( ( ( (v.x>>20)%2 ) ) ) | ! ( ( (v.x>>20)%2 ) | ( (v.x>>43)%2 ) )<< 49 ;
        aux.x |= ( ( (v.x>>36)%2 ) )<< 50 ;
        aux.x |= ! ( ( ( (v.x>>11)%2 ) ) )<< 51 ;
        aux.x |= ( ( ( ( (v.x>>61)%2 ) ) & ! ( ( (v.x>>50)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) ) | ( ( ( ( (v.x>>59)%2 ) ) & ! ( ( (v.x>>50)%2 ) ) ) & ! ( ( (v.x>>57)%2 ) ) )<< 52 ;
        aux.x |= ( ( (v.x>>30)%2 ) )<< 53 ;
        aux.x |= ! ( ( ( (v.x>>14)%2 ) ) )<< 54 ;
        aux.x |= ( ( ( ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>38)%2 ) ) ) & ! ( ( (v.x>>0)%2 ) ) ) & ! ( ( (v.x>>32)%2 ) ) ) & ! ( ( (v.x>>9)%2 ) ) )<< 55 ;
        aux.x |= ( ( ( ( ( (v.x>>57)%2 ) ) & ! ( ( (v.x>>9)%2 ) ) ) & ! ( ( (v.x>>0)%2 ) ) ) & ! ( ( (v.x>>38)%2 ) ) )<< 56 ;
        aux.x |= ( ( ( (v.x>>19)%2 ) ) & ! ( ( (v.x>>32)%2 ) & ( ( ( ( (v.x>>43)%2 ) ) ) ) ) ) | ( ( ( (v.x>>30)%2 ) ) & ! ( ( (v.x>>32)%2 ) & ( ( ( ( (v.x>>43)%2 ) ) ) ) ) )<< 57 ;
        aux.x |= ( ( (v.x>>26)%2 ) )<< 58 ;
        aux.x |= ( ( (v.x>>61)%2 ) ) | ( ( (v.x>>58)%2 ) ) | ( ( (v.y>>2)%2 ) ) | ( ( (v.x>>43)%2 ) & ( ( ( ( (v.x>>58)%2 ) ) ) ) )<< 59 ;
        aux.x |= ( ( (v.x>>9)%2 ) & ( ( ( ( (v.x>>10)%2 ) ) ) ) ) | ( ( (v.x>>8)%2 ) & ( ( ( ( (v.x>>10)%2 ) & ( (v.x>>9)%2 ) ) ) ) )<< 60 ;
        aux.x |= ( ( ( (v.x>>29)%2 ) & ( ( ( ( (v.x>>48)%2 ) & ( (v.x>>28)%2 ) ) & ( ( ( ! ( (v.x>>26)%2 ) ) ) ) ) ) ) & ! ( ( (v.x>>30)%2 ) ) ) | ( ( (v.x>>28)%2 ) & ( ( ( ( (v.x>>48)%2 ) & ( (v.x>>29)%2 ) ) ) ) )<< 61 ;

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
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;

        aux.x |= ( ( ( (v.x>>41)%2 ) * 2) >= 2 ) <<0;
        aux.x |= ( ( ( (v.x>>20)%2 ) * 2 + ( (v.x>>14)%2 ) * 2) >= 2 ) <<1;
        aux.x |= ( ( ( (v.x>>17)%2 ) * 2) >= 2 ) <<2;
        aux.x |= ( ( ( (v.x>>0)%2 ) * -2) >= 0 ) <<3;
        aux.x |= ( ( ( (v.x>>6)%2 ) * 2 + ( (v.x>>7)%2 ) * -6 + ( (v.x>>5)%2 ) * -6 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<4;
        aux.x |= ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>57)%2 ) * -6 + ( (v.x>>3)%2 ) * -6 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<5;
        aux.x |= ( ( ( (v.x>>49)%2 ) * 2 + ( (v.x>>5)%2 ) * -14 + ( (v.x>>7)%2 ) * -14 + ( (v.x>>15)%2 ) * 2 + ( (v.x>>23)%2 ) * 2) >= 2 ) <<6;
        aux.x |= ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>3)%2 ) * -6 + ( (v.x>>4)%2 ) * -6 + ( (v.x>>57)%2 ) * -6 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<7;
        aux.x |= ( ( ( (v.x>>13)%2 ) * 2 + ( (v.x>>55)%2 ) * -2) >= 2 ) <<8;
        aux.x |= ( ( ( (v.x>>12)%2 ) * 2 + ( (v.x>>56)%2 ) * -2 + ( (v.x>>55)%2 ) * -2) >= 2 ) <<9;
        aux.x |= ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<10;
        aux.x |= ( ( ( (v.x>>62)%2 ) * 2) >= 2 ) <<11;
        aux.x |= ( ( ( (v.x>>0)%2 ) * 2 + ( (v.x>>38)%2 ) * 2 + ( (v.x>>21)%2 ) * 2) >= 2 ) <<12;
        aux.x |= ( ( ( (v.x>>38)%2 ) * 2) >= 2 ) <<13;
        aux.x |= ( ( ( (v.x>>15)%2 ) * 2 + ( (v.x>>52)%2 ) * -6 + ( (v.x>>16)%2 ) * 2) >= 2 ) <<14;
        aux.x |= ( ( ( (v.x>>23)%2 ) * 2 + ( (v.x>>24)%2 ) * 2 + ( (v.x>>22)%2 ) * -2) >= 4 ) <<15;
        aux.x |= ( ( ( (v.x>>18)%2 ) * 2 + ( (v.x>>52)%2 ) * -2 + ( (v.x>>0)%2 ) * -2) >= 2 ) <<16;
        aux.x |= ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<17;
        aux.x |= ( ( ( (v.x>>36)%2 ) * 2) >= 2 ) <<18;
        aux.x |= ( ( ( (v.x>>1)%2 ) * 2) >= 2 ) <<19;
        aux.x |= ( ( ( (v.x>>49)%2 ) * 2 + ( (v.x>>14)%2 ) * 2) >= 2 ) <<20;
        
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
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;

        aux.x |= ( ( ( (v.x>>31)%2 ) * 2) >= 2 ) <<21;
        aux.x |= ( ( ( (v.x>>59)%2 ) * 2) >= 2 ) <<22;
        aux.x |= ( ( ( (v.x>>24)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<23;
        aux.x |= ( ( ( (v.x>>53)%2 ) * 2 + ( (v.x>>23)%2 ) * 2) >= 2 ) <<24;
        aux.x |= ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<25;
        aux.x |= ( ( ( (v.x>>47)%2 ) * 2 + ( (v.x>>39)%2 ) * 2 + ( (v.x>>0)%2 ) * 6) >= 4 ) <<26;
        aux.x |= ( ( ( (v.x>>59)%2 ) * 2) >= 2 ) <<27;
        aux.x |= ( ( ( (v.x>>54)%2 ) * 2 + ( (v.x>>27)%2 ) * 2) >= 4 ) <<28;
        aux.x |= ( ( ( (v.x>>27)%2 ) * 2 + ( (v.x>>54)%2 ) * 2 + ( (v.x>>63)%2 ) * -2) >= 4 ) <<29;
        aux.x |= ( ( ( (v.x>>37)%2 ) * 2 + ( (v.x>>43)%2 ) * -2) >= 2 ) <<30;
        aux.x |= ( ( ( (v.x>>33)%2 ) * 2) >= 2 ) <<31;
        aux.x |= ( ( ( (v.x>>0)%2 ) * 2 + ( (v.x>>1)%2 ) * -6 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<32;
        aux.x |= ( ( ( (v.x>>45)%2 ) * 2) >= 2 ) <<33;
        aux.x |= ( ( ( (v.x>>33)%2 ) * 2) >= 2 ) <<34;
        aux.x |= ( ( ( (v.x>>44)%2 ) * 2) >= 2 ) <<35;
        aux.x |= ( ( ( (v.x>>4)%2 ) * 2) >= 2 ) <<36;
        aux.x |= ( ( ( (v.x>>35)%2 ) * 2) >= 2 ) <<37;
        aux.x |= ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + ( (v.x>>21)%2 ) * 2) >= 2 ) <<38;
        aux.x |= ( ( ( (v.x>>51)%2 ) * -2) >= 0 ) <<39;
        aux.x |= ( ( ( (v.x>>27)%2 ) * 2 + ( (v.x>>54)%2 ) * 2) >= 4 ) <<40;
        aux.x |= ( ( ( (v.x>>41)%2 ) * 2 + ( (v.x>>42)%2 ) * -2) >= 2 ) <<41;

    
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
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;

        aux.x |= ( ( ( (v.x>>57)%2 ) * 2) >= 2 ) <<42;
        aux.x |= ( ( ( (v.y>>0)%2 ) * -2) >= 0 ) <<43;
        aux.x |= ( ( ( (v.x>>49)%2 ) * 2) >= 2 ) <<44;
        aux.x |= ( ( ( (v.x>>46)%2 ) * 2) >= 2 ) <<45;
        aux.x |= ( ( ( (v.x>>27)%2 ) * 2 + ( (v.x>>54)%2 ) * 2 + ( (v.x>>63)%2 ) * 6) >= 4 ) <<46;
        aux.x |= ( ( 0 * 6 + 0 * 2 + ( (v.y>>1)%2 ) * 2) >= 4 ) <<47;
        aux.x |= ( ( ( (v.x>>14)%2 ) * -2) >= 0 ) <<48;
        aux.x |= ( ( ( (v.x>>20)%2 ) * 2 + ( (v.x>>43)%2 ) * -2) >= 0 ) <<49;
        aux.x |= ( ( ( (v.x>>36)%2 ) * 2) >= 2 ) <<50;
        aux.x |= ( ( ( (v.x>>11)%2 ) * -2) >= 0 ) <<51;
        aux.x |= ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>50)%2 ) * -6 + ( (v.x>>57)%2 ) * -6 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<52;
        aux.x |= ( ( ( (v.x>>30)%2 ) * 2) >= 2 ) <<53;
        aux.x |= ( ( ( (v.x>>14)%2 ) * -2) >= 0 ) <<54;
        aux.x |= ( ( ( (v.x>>57)%2 ) * 2 + ( (v.x>>38)%2 ) * -2 + ( (v.x>>0)%2 ) * -2 + ( (v.x>>32)%2 ) * -2 + ( (v.x>>9)%2 ) * -2) >= 2 ) <<55;
        aux.x |= ( ( ( (v.x>>57)%2 ) * 2 + ( (v.x>>9)%2 ) * -2 + ( (v.x>>0)%2 ) * -2 + ( (v.x>>38)%2 ) * -2) >= 2 ) <<56;
        aux.x |= ( ( ( (v.x>>19)%2 ) * 6 + ( (v.x>>32)%2 ) * -6 + ( (v.x>>43)%2 ) * -6 + ( (v.x>>30)%2 ) * 6) >= 0 ) <<57;
        aux.x |= ( ( ( (v.x>>26)%2 ) * 2) >= 2 ) <<58;
        aux.x |= ( ( ( (v.x>>61)%2 ) * 4 + ( (v.x>>58)%2 ) * 4 + 0 * 4 + ( (v.x>>43)%2 ) * 0) >= 4 ) <<59;
        aux.x |= ( ( ( (v.x>>9)%2 ) * 4 + ( (v.x>>10)%2 ) * 4 + ( (v.x>>8)%2 ) * 0) >= 8 ) <<60;
        aux.x |= ( ( ( (v.x>>29)%2 ) * 8 + ( (v.x>>48)%2 ) * 8 + ( (v.x>>28)%2 ) * 8 + ( (v.x>>26)%2 ) * 0 + ( (v.x>>30)%2 ) * 0) >= 24 ) <<61;

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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;

        aux.x |= ( ( ( (v.x>>41)%2 ) * 2) >= 2 ) <<0;
        aux.x |= ( ( ( (v.x>>20)%2 ) * 2 + ( (v.x>>14)%2 ) * 2) >= 2 ) <<1;
        aux.x |= ( ( ( (v.x>>17)%2 ) * 2) >= 2 ) <<2;
        aux.x |= ( ( ( (v.x>>0)%2 ) * -2) >= 0 ) <<3;
        aux.x |= ( ( ( (v.x>>6)%2 ) * 2 + ( (v.x>>7)%2 ) * -6 + ( (v.x>>5)%2 ) * -6 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<4;
        aux.x |= ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>57)%2 ) * -6 + ( (v.x>>3)%2 ) * -6 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<5;
        aux.x |= ( ( ( (v.x>>49)%2 ) * 2 + ( (v.x>>5)%2 ) * -14 + ( (v.x>>7)%2 ) * -14 + ( (v.x>>15)%2 ) * 2 + ( (v.x>>23)%2 ) * 2) >= 2 ) <<6;
        aux.x |= ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>3)%2 ) * -6 + ( (v.x>>4)%2 ) * -6 + ( (v.x>>57)%2 ) * -6 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<7;
        aux.x |= ( ( ( (v.x>>13)%2 ) * 2 + ( (v.x>>55)%2 ) * -2) >= 2 ) <<8;
        aux.x |= ( ( ( (v.x>>12)%2 ) * 2 + ( (v.x>>56)%2 ) * -2 + ( (v.x>>55)%2 ) * -2) >= 2 ) <<9;
        aux.x |= ( ( ( (v.x>>12)%2 ) * 2) >= 2 ) <<10;
        aux.x |= ( ( ( (v.x>>62)%2 ) * 2) >= 2 ) <<11;
        aux.x |= ( ( ( (v.x>>0)%2 ) * 2 + ( (v.x>>38)%2 ) * 2 + ( (v.x>>21)%2 ) * 2) >= 2 ) <<12;
        aux.x |= ( ( ( (v.x>>38)%2 ) * 2) >= 2 ) <<13;
        aux.x |= ( ( ( (v.x>>15)%2 ) * 2 + ( (v.x>>52)%2 ) * -6 + ( (v.x>>16)%2 ) * 2) >= 2 ) <<14;
        aux.x |= ( ( ( (v.x>>23)%2 ) * 2 + ( (v.x>>24)%2 ) * 2 + ( (v.x>>22)%2 ) * -2) >= 4 ) <<15;
        aux.x |= ( ( ( (v.x>>18)%2 ) * 2 + ( (v.x>>52)%2 ) * -2 + ( (v.x>>0)%2 ) * -2) >= 2 ) <<16;
        aux.x |= ( ( ( (v.x>>14)%2 ) * 2) >= 2 ) <<17;
        aux.x |= ( ( ( (v.x>>36)%2 ) * 2) >= 2 ) <<18;
        aux.x |= ( ( ( (v.x>>1)%2 ) * 2) >= 2 ) <<19;
        aux.x |= ( ( ( (v.x>>49)%2 ) * 2 + ( (v.x>>14)%2 ) * 2) >= 2 ) <<20;
        aux.x |= ( ( ( (v.x>>31)%2 ) * 2) >= 2 ) <<21;
        aux.x |= ( ( ( (v.x>>59)%2 ) * 2) >= 2 ) <<22;
        aux.x |= ( ( ( (v.x>>24)%2 ) * 2 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<23;
        aux.x |= ( ( ( (v.x>>53)%2 ) * 2 + ( (v.x>>23)%2 ) * 2) >= 2 ) <<24;
        aux.x |= ( ( ( (v.x>>60)%2 ) * 2) >= 2 ) <<25;
        aux.x |= ( ( ( (v.x>>47)%2 ) * 2 + ( (v.x>>39)%2 ) * 2 + ( (v.x>>0)%2 ) * 6) >= 4 ) <<26;
        aux.x |= ( ( ( (v.x>>59)%2 ) * 2) >= 2 ) <<27;
        aux.x |= ( ( ( (v.x>>54)%2 ) * 2 + ( (v.x>>27)%2 ) * 2) >= 4 ) <<28;
        aux.x |= ( ( ( (v.x>>27)%2 ) * 2 + ( (v.x>>54)%2 ) * 2 + ( (v.x>>63)%2 ) * -2) >= 4 ) <<29;
        aux.x |= ( ( ( (v.x>>37)%2 ) * 2 + ( (v.x>>43)%2 ) * -2) >= 2 ) <<30;
        aux.x |= ( ( ( (v.x>>33)%2 ) * 2) >= 2 ) <<31;
        aux.x |= ( ( ( (v.x>>0)%2 ) * 2 + ( (v.x>>1)%2 ) * -6 + ( (v.x>>57)%2 ) * 2) >= 2 ) <<32;
        aux.x |= ( ( ( (v.x>>45)%2 ) * 2) >= 2 ) <<33;
        aux.x |= ( ( ( (v.x>>33)%2 ) * 2) >= 2 ) <<34;
        aux.x |= ( ( ( (v.x>>44)%2 ) * 2) >= 2 ) <<35;
        aux.x |= ( ( ( (v.x>>4)%2 ) * 2) >= 2 ) <<36;
        aux.x |= ( ( ( (v.x>>35)%2 ) * 2) >= 2 ) <<37;
        aux.x |= ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>34)%2 ) * 2 + ( (v.x>>21)%2 ) * 2) >= 2 ) <<38;
        aux.x |= ( ( ( (v.x>>51)%2 ) * -2) >= 0 ) <<39;
        aux.x |= ( ( ( (v.x>>27)%2 ) * 2 + ( (v.x>>54)%2 ) * 2) >= 4 ) <<40;
        aux.x |= ( ( ( (v.x>>41)%2 ) * 2 + ( (v.x>>42)%2 ) * -2) >= 2 ) <<41;
        aux.x |= ( ( ( (v.x>>57)%2 ) * 2) >= 2 ) <<42;
        aux.x |= ( ( ( (v.y>>0)%2 ) * -2) >= 0 ) <<43;
        aux.x |= ( ( ( (v.x>>49)%2 ) * 2) >= 2 ) <<44;
        aux.x |= ( ( ( (v.x>>46)%2 ) * 2) >= 2 ) <<45;
        aux.x |= ( ( ( (v.x>>27)%2 ) * 2 + ( (v.x>>54)%2 ) * 2 + ( (v.x>>63)%2 ) * 6) >= 4 ) <<46;
        aux.x |= ( ( 0 * 6 + 0 * 2 + ( (v.y>>1)%2 ) * 2) >= 4 ) <<47;
        aux.x |= ( ( ( (v.x>>14)%2 ) * -2) >= 0 ) <<48;
        aux.x |= ( ( ( (v.x>>20)%2 ) * 2 + ( (v.x>>43)%2 ) * -2) >= 0 ) <<49;
        aux.x |= ( ( ( (v.x>>36)%2 ) * 2) >= 2 ) <<50;
        aux.x |= ( ( ( (v.x>>11)%2 ) * -2) >= 0 ) <<51;
        aux.x |= ( ( ( (v.x>>61)%2 ) * 2 + ( (v.x>>50)%2 ) * -6 + ( (v.x>>57)%2 ) * -6 + ( (v.x>>59)%2 ) * 2) >= 2 ) <<52;
        aux.x |= ( ( ( (v.x>>30)%2 ) * 2) >= 2 ) <<53;
        aux.x |= ( ( ( (v.x>>14)%2 ) * -2) >= 0 ) <<54;
        aux.x |= ( ( ( (v.x>>57)%2 ) * 2 + ( (v.x>>38)%2 ) * -2 + ( (v.x>>0)%2 ) * -2 + ( (v.x>>32)%2 ) * -2 + ( (v.x>>9)%2 ) * -2) >= 2 ) <<55;
        aux.x |= ( ( ( (v.x>>57)%2 ) * 2 + ( (v.x>>9)%2 ) * -2 + ( (v.x>>0)%2 ) * -2 + ( (v.x>>38)%2 ) * -2) >= 2 ) <<56;
        aux.x |= ( ( ( (v.x>>19)%2 ) * 6 + ( (v.x>>32)%2 ) * -6 + ( (v.x>>43)%2 ) * -6 + ( (v.x>>30)%2 ) * 6) >= 0 ) <<57;
        aux.x |= ( ( ( (v.x>>26)%2 ) * 2) >= 2 ) <<58;
        aux.x |= ( ( ( (v.x>>61)%2 ) * 4 + ( (v.x>>58)%2 ) * 4 + 0 * 4 + ( (v.x>>43)%2 ) * 0) >= 4 ) <<59;
        aux.x |= ( ( ( (v.x>>9)%2 ) * 4 + ( (v.x>>10)%2 ) * 4 + ( (v.x>>8)%2 ) * 0) >= 8 ) <<60;
        aux.x |= ( ( ( (v.x>>29)%2 ) * 8 + ( (v.x>>48)%2 ) * 8 + ( (v.x>>28)%2 ) * 8 + ( (v.x>>26)%2 ) * 0 + ( (v.x>>30)%2 ) * 0) >= 24 ) <<61;

        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 11
__global__ void passo_bool_11(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;
    
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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_11(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;
    
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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 12
__global__ void passo_bool_12(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;
    
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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_12(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;
    
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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 13
__global__ void passo_bool_13(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;
    
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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_13(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;
    
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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 14
__global__ void passo_bool_14(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;
    
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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_14(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;
    
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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 15
__global__ void passo_bool_15(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;
    
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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_15(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;
    
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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 17
__global__ void passo_bool_17(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;
    
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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_17(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;
    
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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

//REDE 18
__global__ void passo_bool_18(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long  tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;
    
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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;


        if(aux.x != estado_gpu[i].x || aux.y != estado_gpu[i].y || aux.z != estado_gpu[i].z ){
            cerr << "Estado : " << init_rand[i].x << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i].x << "\n" << "CPU : " << aux.x << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_18(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    ulonglong3 v,aux;
    if(tid < MAX_ESTADO)
    {
        aux.x = 0;
        aux.y = 0;
        aux.z = 0;
        v.x = init_rand[tid].x;
        v.y = init_rand[tid].y;
        v.z = init_rand[tid].z;
    
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
        aux.x = v.x = 0;
        aux.y = v.y = 0;
        aux.z = v.z = 0;
        
        v.x = init_rand[i].x;
        v.y = init_rand[i].y;
        v.z = init_rand[i].z;


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
            init_rand[i].x |= ((rand1>>j)%2)<<j;
        for(int j = 32; j < nEq && j < 64; j++)
            init_rand[i].x |= ((rand2>>(j-32))%2)<<j;
        for(int j = 64; j < nEq && j < 96; j++)
            init_rand[i].y |= ((rand3>>(j-64))%2)<<(j-64);
        for(int j = 96; j < nEq && j < 128; j++)
            init_rand[i].y |= ((rand4>>(j-96))%2)<<(j-64);
        for(int j = 128; j < nEq && j < 160; j++)
            init_rand[i].z |= ((rand5>>(j-128))%2)<<(j-128);
        for(int j = 160; j < nEq && j < 192; j++)
            init_rand[i].z |= ((rand6>>(j-160))%2)<<(j-128);
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
    ulonglong3 *h_init_rand, *h_estado;
    h_init_rand = new ulonglong3[MAX_ESTADO];
    h_estado = new ulonglong3[MAX_ESTADO];

    ulonglong3 *d_init_rand, *d_estado;
    cudaMalloc(&d_init_rand,sizeof(ulonglong3)*MAX_ESTADO);
    cudaMalloc(&d_estado,sizeof(ulonglong3)*MAX_ESTADO);
    
    unsigned int nEq = 41;
    srand(MAX_ESTADO);
    preenche_init_rand(h_init_rand,MAX_ESTADO,nEq);

    for(unsigned long long i = 0; i < MAX_ESTADO; i++)
        h_estado[i].x = 0;
    for(unsigned long long i = 0; i < MAX_ESTADO; i++)
        h_estado[i].y = 0;
    for(unsigned long long i = 0; i < MAX_ESTADO; i++)
        h_estado[i].z = 0;

    cudaMemcpy(d_init_rand, h_init_rand, sizeof(ulonglong3)*MAX_ESTADO, cudaMemcpyHostToDevice);
    cudaMemcpy(d_estado, h_estado, sizeof(ulonglong3)*MAX_ESTADO, cudaMemcpyHostToDevice);

    /* passo_tlf_6_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
    cudaDeviceSynchronize();
    passo_tlf_6_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
    cudaDeviceSynchronize();
    passo_tlf_6_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
    cudaDeviceSynchronize();
    cudaMemcpy(h_estado, d_estado, sizeof(ulonglong3)*MAX_ESTADO, cudaMemcpyDeviceToHost); */

    /* passo_bool_6<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
    cudaDeviceSynchronize(); */

    /* unsigned long long i = confere_tlf_6(h_init_rand,h_estado,MAX_ESTADO);
    if(i == MAX_ESTADO)
        cerr << "Resultados da GPU batem com os da CPU\n";
    else
        cerr << "Resultados não batem!\n"; */
    
    delete [] h_estado;
    delete [] h_init_rand;
    cudaFree(d_init_rand);
    cudaFree(d_estado);
    cudaDeviceReset();
    return 0;
}