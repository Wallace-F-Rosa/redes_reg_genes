#pragma GCC optimize("O3","unroll-loops","omit-frame-pointer","inline") //Optimization flags
#pragma GCC option("arch=native","tune=native","no-zero-upper") //Enable AVX
#pragma GCC target("avx")  //Enable AVX
#include <iostream>
#include <chrono>
#include <cmath>
#include <string>
#include <limits>
#include <stdio.h>

#define CLOCKS_PER_SEC_CPU 1100000000
using namespace std;
typedef unsigned long long numero_longo;

const string NAME[] = {"passo_bool_1", "passo_tlf_1", "passo_bool_2", "passo_tlf_2", "passo_bool_3", "passo_tlf_3",
                       "passo_bool_5", "passo_tlf_5", "passo_bool_6", "passo_tlf_6", "passo_bool_7", "passo_tlf_7",
                       "passo_bool_8", "passo_tlf_8", "passo_bool_9", "passo_tlf_9"};

void passo_bool_1(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( (v>>1)%2 & ( ( ( (v>>2)%2 ) ) ) )<< 0 ;
        aux |=(numero_longo) ( (v>>1)%2 )<< 1 ;
        aux |=(numero_longo) ( (v>>3)%2 )<< 2 ;
        aux |=(numero_longo) ( (v>>4)%2 )<< 3 ;
        aux |=(numero_longo) ( (v>>32)%2 )<< 4 ;
        aux |=(numero_longo) ( (v>>9)%2 ) | ( (v>>29)%2 )<< 5 ;
        aux |=(numero_longo) ( (v>>7)%2 )<< 6 ;
        aux |=(numero_longo) ( (v>>8)%2 )<< 7 ;
        aux |=(numero_longo) ( (v>>32)%2 )<< 8 ;
        aux |=(numero_longo) ( (v>>25)%2 )<< 9 ;
        aux |=(numero_longo) ( (v>>24)%2 )<< 10 ;
        aux |=(numero_longo) ( (v>>12)%2 )<< 11 ;
        aux |=(numero_longo) ( (v>>13)%2 )<< 12 ;
        aux |=(numero_longo) ( (v>>32)%2 )<< 13 ;
        aux |=(numero_longo) ( ( (v>>15)%2 ) & ! ( (v>>11)%2 ) )<< 14 ;
        aux |=(numero_longo) ( (v>>10)%2 ) | ( (v>>24)%2 )<< 15 ;
        aux |=(numero_longo) ( (v>>0)%2 & ( ( ( (v>>1)%2 & (v>>20)%2 ) ) ) )<< 16 ;
        aux |=(numero_longo) ( ( (v>>18)%2 ) & ! ( (v>>31)%2 ) )<< 17 ;
        aux |=(numero_longo) ( (v>>19)%2 )<< 18 ;
        aux |=(numero_longo) ( (v>>32)%2 )<< 19 ;
        aux |=(numero_longo) ( (v>>21)%2 )<< 20 ;
        aux |=(numero_longo) ( (v>>22)%2 )<< 21 ;
        aux |=(numero_longo) ( (v>>32)%2 )<< 22 ;
        aux |=(numero_longo) ! ( ( (v>>5)%2 ) )<< 23 ;
        aux |=(numero_longo) ( (v>>27)%2 )<< 24 ;
        aux |=(numero_longo) ( (v>>30)%2 )<< 25 ;
        aux |=(numero_longo) ( (v>>16)%2 & ( ( ( (v>>17)%2 ) ) ) )<< 26 ;
        aux |=(numero_longo) ( (v>>26)%2 )<< 27 ;
        aux |=(numero_longo) ( ( (v>>23)%2 ) & ! ( (v>>31)%2 ) )<< 28 ;
        aux |=(numero_longo) ( (v>>25)%2 )<< 29 ;
        aux |=(numero_longo) ( (v>>14)%2 )<< 30 ;
        aux |=(numero_longo) ( (v>>31)%2 )<< 31 ;
        aux |=(numero_longo) ( (v>>33)%2 )<< 32 ;
        aux |=(numero_longo) ( (v>>28)%2 )<< 33 ;

        estado[i] = aux;
    }
}


void passo_tlf_1(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( ( ( (v>>1)%2 ) * 2 + ( (v>>2)%2 ) * 2) >= 4 ) << 0 ;
        aux |=(numero_longo) ( ( ( (v>>1)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(numero_longo) ( ( ( (v>>3)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(numero_longo) ( ( ( (v>>4)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(numero_longo) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 4 ;
        aux |=(numero_longo) ( ( ( (v>>9)%2 ) * 2 + ( (v>>29)%2 ) * 2) >= 2 ) << 5 ;
        aux |=(numero_longo) ( ( ( (v>>7)%2 ) * 2) >= 2 ) << 6 ;
        aux |=(numero_longo) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(numero_longo) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(numero_longo) ( ( ( (v>>25)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(numero_longo) ( ( ( (v>>24)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(numero_longo) ( ( ( (v>>12)%2 ) * 2) >= 2 ) << 11 ;
        aux |=(numero_longo) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(numero_longo) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 13 ;
        aux |=(numero_longo) ( ( ( (v>>15)%2 ) * 2 + ( (v>>11)%2 ) * -2) >= 2 ) << 14 ;
        aux |=(numero_longo) ( ( ( (v>>10)%2 ) * 2 + ( (v>>24)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(numero_longo) ( ( ( (v>>0)%2 ) * 2 + ( (v>>1)%2 ) * 2 + ( (v>>20)%2 ) * 2) >= 6 ) << 16 ;
        aux |=(numero_longo) ( ( ( (v>>18)%2 ) * 2 + ( (v>>31)%2 ) * -2) >= 2 ) << 17 ;
        aux |=(numero_longo) ( ( ( (v>>19)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(numero_longo) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(numero_longo) ( ( ( (v>>21)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(numero_longo) ( ( ( (v>>22)%2 ) * 2) >= 2 ) << 21 ;
        aux |=(numero_longo) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(numero_longo) ( ( ( (v>>5)%2 ) * -2) >= 0 ) << 23 ;
        aux |=(numero_longo) ( ( ( (v>>27)%2 ) * 2) >= 2 ) << 24 ;
        aux |=(numero_longo) ( ( ( (v>>30)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(numero_longo) ( ( ( (v>>16)%2 ) * 2 + ( (v>>17)%2 ) * 2) >= 4 ) << 26 ;
        aux |=(numero_longo) ( ( ( (v>>26)%2 ) * 2) >= 2 ) << 27 ;
        aux |=(numero_longo) ( ( ( (v>>23)%2 ) * 2 + ( (v>>31)%2 ) * -2) >= 2 ) << 28 ;
        aux |=(numero_longo) ( ( ( (v>>25)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(numero_longo) ( ( ( (v>>14)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(numero_longo) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(numero_longo) ( ( ( (v>>33)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(numero_longo) ( ( ( (v>>28)%2 ) * 2) >= 2 ) << 33 ;

        estado[i] = aux;

    }
}

void passo_bool_2(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( (v>>25)%2 )<< 0 ;
        aux |=(numero_longo) ( (v>>29)%2 )<< 1 ;
        aux |=(numero_longo) ( ( (v>>13)%2 & ( ( ( (v>>3)%2 & (v>>24)%2 ) ) ) ) & ! ( (v>>17)%2 ) )<< 2 ;
        aux |=(numero_longo) ( (v>>38)%2 )<< 3 ;
        aux |=(numero_longo) ( ( (v>>38)%2 ) & ! ( (v>>1)%2 ) )<< 4 ;
        aux |=(numero_longo) ( ( (v>>20)%2 & ( ( ( (v>>38)%2 ) ) ) ) & ! ( (v>>6)%2 ) ) | ( ( (v>>12)%2 & ( ( ( (v>>38)%2 ) ) ) ) & ! ( (v>>6)%2 ) )<< 5 ;
        aux |=(numero_longo) ( ( ( (v>>25)%2 ) & ! ( (v>>4)%2 ) ) & ! ( (v>>38)%2 ) )<< 6 ;
        aux |=(numero_longo) ( (v>>11)%2 )<< 7 ;
        aux |=(numero_longo) ( ( (v>>2)%2 ) & ! ( (v>>17)%2 ) ) | ( ( (v>>12)%2 ) & ! ( (v>>17)%2 ) ) | ( (v>>10)%2 )<< 8 ;
        aux |=(numero_longo) ( (v>>8)%2 )<< 9 ;
        aux |=(numero_longo) ( ( (v>>8)%2 ) & ! ( (v>>17)%2 ) )<< 10 ;
        aux |=(numero_longo) ( ( (v>>2)%2 ) & ! ( (v>>17)%2 ) ) | ( ( (v>>12)%2 ) & ! ( (v>>17)%2 ) )<< 11 ;
        aux |=(numero_longo) ( ( (v>>10)%2 ) & ! ( (v>>37)%2 ) ) | ( ( (v>>15)%2 ) & ! ( (v>>37)%2 ) )<< 12 ;
        aux |=(numero_longo) ( ( ( (v>>8)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>17)%2 ) ) | ( ( ( (v>>7)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>17)%2 ) )<< 13 ;
        aux |=(numero_longo) ( (v>>9)%2 & ( ( ( (v>>8)%2 ) ) ) )<< 14 ;
        aux |=(numero_longo) ( (v>>34)%2 )<< 15 ;
        aux |=(numero_longo) ( (v>>39)%2 )<< 16 ;
        aux |=(numero_longo) ( ( ( (v>>25)%2 ) & ! ( (v>>24)%2 ) ) & ! ( (v>>8)%2 & ( ( ( (v>>10)%2 ) ) ) ) )<< 17 ;
        aux |=(numero_longo) ( ( (v>>1)%2 ) & ! ( (v>>0)%2 ) ) | ( ( (v>>26)%2 ) & ! ( (v>>0)%2 ) )<< 18 ;
        aux |=(numero_longo) ( ( (v>>25)%2 ) & ! ( (v>>18)%2 ) )<< 19 ;
        aux |=(numero_longo) ( (v>>21)%2 )<< 20 ;
        aux |=(numero_longo) ( ( (v>>22)%2 ) & ! ( (v>>1)%2 ) )<< 21 ;
        aux |=(numero_longo) ( (v>>35)%2 )<< 22 ;
        aux |=(numero_longo) ( (v>>1)%2 ) | ( (v>>38)%2 )<< 23 ;
        aux |=(numero_longo) ( ( (v>>5)%2 ) & ! ( (v>>6)%2 ) )<< 24 ;
        aux |=(numero_longo) ! ( ( (v>>19)%2 ) )<< 25 ;
        aux |=(numero_longo) ( (v>>36)%2 )<< 26 ;
        aux |=(numero_longo) ( (v>>16)%2 )<< 27 ;
        aux |=(numero_longo) ( (v>>16)%2 )<< 28 ;
        aux |=(numero_longo) ( ( (v>>27)%2 & ( ( ( (v>>28)%2 ) ) ) ) & ! ( (v>>30)%2 ) )<< 29 ;
        aux |=(numero_longo) ( (v>>38)%2 )<< 30 ;
        aux |=(numero_longo) ( (v>>34)%2 )<< 31 ;
        aux |=(numero_longo) ( (v>>40)%2 )<< 32 ;
        aux |=(numero_longo) ( (v>>40)%2 )<< 33 ;
        aux |=(numero_longo) ( (v>>32)%2 )<< 34 ;
        aux |=(numero_longo) ( (v>>34)%2 )<< 35 ;
        aux |=(numero_longo) ( (v>>31)%2 )<< 36 ;
        aux |=(numero_longo) ( (v>>35)%2 )<< 37 ;
        aux |=(numero_longo) ( ( (v>>20)%2 ) & ! ( (v>>23)%2 ) ) | ( ( (v>>14)%2 ) & ! ( (v>>23)%2 ) )<< 38 ;
        aux |=(numero_longo)(v>>39%2) << 39;
        aux |=(numero_longo)(v>>40%2) << 40;
        aux |=(numero_longo)(v>>41%2) << 41;

        estado[i] = aux;
    }

    return;
}

void passo_tlf_2(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( ( ( (v>>25)%2 ) * 2) >= 2 ) << 0 ;
        aux |=(numero_longo) ( ( ( (v>>29)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(numero_longo) ( ( ( (v>>13)%2 ) * 2 + ( (v>>3)%2 ) * 2 + ( (v>>24)%2 ) * 2 + ( (v>>17)%2 ) * -2) >= 6 ) << 2 ;
        aux |=(numero_longo) ( ( ( (v>>38)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(numero_longo) ( ( ( (v>>38)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 4 ;
        aux |=(numero_longo) ( ( ( (v>>20)%2 ) * 2 + ( (v>>38)%2 ) * 6 + ( (v>>6)%2 ) * -6 + ( (v>>12)%2 ) * 2) >= 8 ) << 5 ;
        aux |=(numero_longo) ( ( ( (v>>25)%2 ) * 2 + ( (v>>4)%2 ) * -2 + ( (v>>38)%2 ) * -2) >= 2 ) << 6 ;
        aux |=(numero_longo) ( ( ( (v>>11)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(numero_longo) ( ( ( (v>>2)%2 ) * 2 + ( (v>>17)%2 ) * -6 + ( (v>>12)%2 ) * 2 + ( (v>>10)%2 ) * 10) >= 2 ) << 8 ;
        aux |=(numero_longo) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(numero_longo) ( ( ( (v>>8)%2 ) * 2 + ( (v>>17)%2 ) * -2) >= 2 ) << 10 ;
        aux |=(numero_longo) ( ( ( (v>>2)%2 ) * 2 + ( (v>>17)%2 ) * -6 + ( (v>>12)%2 ) * 2) >= 2 ) << 11 ;
        aux |=(numero_longo) ( ( ( (v>>10)%2 ) * 2 + ( (v>>37)%2 ) * -6 + ( (v>>15)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(numero_longo) ( ( ( (v>>8)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>17)%2 ) * -6 + ( (v>>7)%2 ) * 2) >= 2 ) << 13 ;
        aux |=(numero_longo) ( ( ( (v>>9)%2 ) * 2 + ( (v>>8)%2 ) * 2) >= 4 ) << 14 ;
        aux |=(numero_longo) ( ( ( (v>>34)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(numero_longo) ( ( ( (v>>39)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(numero_longo) ( ( ( (v>>25)%2 ) * 6 + ( (v>>24)%2 ) * -6 + ( (v>>8)%2 ) * -2 + ( (v>>10)%2 ) * -2) >= 4 ) << 17 ;
        aux |=(numero_longo) ( ( ( (v>>1)%2 ) * 2 + ( (v>>0)%2 ) * -6 + ( (v>>26)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(numero_longo) ( ( ( (v>>25)%2 ) * 2 + ( (v>>18)%2 ) * -2) >= 2 ) << 19 ;
        aux |=(numero_longo) ( ( ( (v>>21)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(numero_longo) ( ( ( (v>>22)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 21 ;
        aux |=(numero_longo) ( ( ( (v>>35)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(numero_longo) ( ( ( (v>>1)%2 ) * 2 + ( (v>>38)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(numero_longo) ( ( ( (v>>5)%2 ) * 2 + ( (v>>6)%2 ) * -2) >= 2 ) << 24 ;
        aux |=(numero_longo) ( ( ( (v>>19)%2 ) * -2) >= 0 ) << 25 ;
        aux |=(numero_longo) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(numero_longo) ( ( ( (v>>16)%2 ) * 2) >= 2 ) << 27 ;
        aux |=(numero_longo) ( ( ( (v>>16)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(numero_longo) ( ( ( (v>>27)%2 ) * 2 + ( (v>>28)%2 ) * 2 + ( (v>>30)%2 ) * -2) >= 4 ) << 29 ;
        aux |=(numero_longo) ( ( ( (v>>38)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(numero_longo) ( ( ( (v>>34)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(numero_longo) ( ( ( (v>>40)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(numero_longo) ( ( ( (v>>40)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(numero_longo) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(numero_longo) ( ( ( (v>>34)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(numero_longo) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(numero_longo) ( ( ( (v>>35)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(numero_longo) ( ( ( (v>>20)%2 ) * 2 + ( (v>>23)%2 ) * -6 + ( (v>>14)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(numero_longo)(v>>39%2) << 39;
        aux |=(numero_longo)(v>>40%2) << 40;
        aux |=(numero_longo)(v>>41%2) << 41;

        estado[i] = aux;
    }
    return;
}

void passo_bool_3(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( ( ( (v>>39)%2 ) & ! ( (v>>34)%2 ) ) & ! ( (v>>26)%2 ) )<< 0 ;
        aux |=(numero_longo) ( (v>>23)%2 )<< 1 ;
        aux |=(numero_longo) ( (v>>13)%2 )<< 2 ;
        aux |=(numero_longo) ( ( (v>>8)%2 ) ) | ! ( (v>>8)%2 | (v>>30)%2 )<< 3 ;
        aux |=(numero_longo) ( (v>>39)%2 & ( ( ( ! (v>>0)%2 ) ) | ( ( (v>>8)%2 ) ) ) ) | ( (v>>8)%2 & ( ( ( (v>>39)%2 ) ) | ( ( ! (v>>0)%2 ) ) ) )<< 4 ;
        aux |=(numero_longo) ( ( (v>>25)%2 & ( ( ( (v>>39)%2 & (v>>33)%2 ) ) ) ) & ! ( (v>>0)%2 ) )<< 5 ;
        aux |=(numero_longo) ( (v>>15)%2 & ( ( ( (v>>16)%2 ) ) ) ) | ( (v>>38)%2 & ( ( ( (v>>37)%2 ) ) ) )<< 6 ;
        aux |=(numero_longo) ( (v>>8)%2 )<< 7 ;
        aux |=(numero_longo) ( ( (v>>6)%2 ) & ! ( (v>>7)%2 ) ) | ( ( (v>>9)%2 ) & ! ( (v>>7)%2 ) )<< 8 ;
        aux |=(numero_longo) ( ( ( (v>>40)%2 & ( ( ( ! (v>>41)%2 ) ) ) ) & ! ( (v>>11)%2 ) ) | ( ( (v>>41)%2 & ( ( ( ! (v>>40)%2 ) ) ) ) & ! ( (v>>11)%2 ) ) | ( ( (v>>34)%2 ) & ! ( (v>>11)%2 ) ) ) | ! ( (v>>41)%2 | (v>>34)%2 | (v>>11)%2 | (v>>40)%2 )<< 9 ;
        aux |=(numero_longo) ( ( (v>>20)%2 & ( ( ( (v>>3)%2 ) ) & ( ( (v>>4)%2 ) ) ) ) & ! ( (v>>21)%2 ) ) | ( ( (v>>18)%2 & ( ( ( (v>>3)%2 ) ) & ( ( (v>>4)%2 ) ) ) ) & ! ( (v>>21)%2 ) )<< 10 ;
        aux |=(numero_longo) ( ( (v>>20)%2 & ( ( ( ! (v>>4)%2 & ! (v>>8)%2 & ! (v>>19)%2 & ! (v>>14)%2 ) ) ) ) | ( (v>>8)%2 ) | ( (v>>14)%2 & ( ( ( ! (v>>4)%2 & ! (v>>8)%2 & ! (v>>20)%2 & ! (v>>19)%2 ) ) ) ) | ( (v>>19)%2 ) | ( (v>>4)%2 ) ) | ! ( (v>>4)%2 | (v>>8)%2 | (v>>20)%2 | (v>>19)%2 | (v>>14)%2 )<< 11 ;
        aux |=(numero_longo) ( (v>>23)%2 )<< 12 ;
        aux |=(numero_longo) ( ( (v>>2)%2 ) & ! ( (v>>42)%2 ) ) | ( (v>>35)%2 & ( ( ( (v>>2)%2 ) ) ) )<< 13 ;
        aux |=(numero_longo) ! ( ( (v>>39)%2 ) | ( (v>>8)%2 ) | ( (v>>34)%2 ) )<< 14 ;
        aux |=(numero_longo) ( (v>>28)%2 )<< 15 ;
        aux |=(numero_longo) ( (v>>17)%2 )<< 16 ;
        aux |=(numero_longo) ( (v>>43)%2 )<< 17 ;
        aux |=(numero_longo) ( ( (v>>11)%2 ) & ! ( (v>>8)%2 & ( ( ( (v>>39)%2 ) ) ) ) )<< 18 ;
        aux |=(numero_longo) ( (v>>8)%2 )<< 19 ;
        aux |=(numero_longo) ( (v>>39)%2 & ( ( ( (v>>11)%2 ) ) ) ) | ( ( (v>>11)%2 ) & ! ( (v>>34)%2 & ( ( ( (v>>23)%2 ) ) ) ) )<< 20 ;
        aux |=(numero_longo) ( ( ( (v>>27)%2 ) & ! ( (v>>43)%2 ) ) & ! ( (v>>4)%2 ) )<< 21 ;
        aux |=(numero_longo) ( (v>>31)%2 )<< 22 ;
        aux |=(numero_longo) ( (v>>24)%2 & ( ( ( (v>>22)%2 ) ) ) )<< 23 ;
        aux |=(numero_longo) ( (v>>8)%2 )<< 24 ;
        aux |=(numero_longo) ( (v>>43)%2 )<< 25 ;
        aux |=(numero_longo) ( (v>>29)%2 )<< 26 ;
        aux |=(numero_longo) ! ( ( (v>>43)%2 ) )<< 27 ;
        aux |=(numero_longo) ( (v>>43)%2 & ( ( ( (v>>8)%2 ) ) ) )<< 28 ;
        aux |=(numero_longo) ( (v>>13)%2 )<< 29 ;
        aux |=(numero_longo) ! ( ( (v>>43)%2 ) | ( (v>>0)%2 ) )<< 30 ;
        aux |=(numero_longo) ( (v>>43)%2 )<< 31 ;
        aux |=(numero_longo) ( (v>>41)%2 )<< 32 ;
        aux |=(numero_longo) ( (v>>26)%2 )<< 33 ;
        aux |=(numero_longo) ( (v>>5)%2 )<< 34 ;
        aux |=(numero_longo) ( (v>>36)%2 )<< 35 ;
        aux |=(numero_longo) ( (v>>43)%2 )<< 36 ;
        aux |=(numero_longo) ( (v>>1)%2 )<< 37 ;
        aux |=(numero_longo) ( (v>>12)%2 )<< 38 ;
        aux |=(numero_longo) ( (v>>43)%2 )<< 39 ;
        aux |=(numero_longo) ( (v>>40)%2 )<< 40 ;
        aux |=(numero_longo) ( (v>>41)%2 )<< 41 ;
        aux |=(numero_longo) ( (v>>42)%2 )<< 42 ;
        aux |=(numero_longo) ( (v>>43)%2 )<< 43 ;

        estado[i] = aux;
    }

    return;
}

void passo_tlf_3(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( ( ( (v>>39)%2 ) * 2 + ( (v>>34)%2 ) * -2 + ( (v>>26)%2 ) * -2) >= 2 ) << 0 ;
        aux |=(numero_longo) ( ( ( (v>>23)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(numero_longo) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(numero_longo) ( ( ( (v>>8)%2 ) * 2 + ( (v>>30)%2 ) * -2) >= 0 ) << 3 ;
        aux |=(numero_longo) ( ( ( (v>>39)%2 ) * 4 + ( (v>>0)%2 ) * -4 + ( (v>>8)%2 ) * 4) >= 4 ) << 4 ;
        aux |=(numero_longo) ( ( ( (v>>25)%2 ) * 2 + ( (v>>39)%2 ) * 2 + ( (v>>33)%2 ) * 2 + ( (v>>0)%2 ) * -2) >= 6 ) << 5 ;
        aux |=(numero_longo) ( ( ( (v>>15)%2 ) * 6 + ( (v>>16)%2 ) * 6 + ( (v>>38)%2 ) * 6 + ( (v>>37)%2 ) * 6) >= 12 ) << 6 ;
        aux |=(numero_longo) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(numero_longo) ( ( ( (v>>6)%2 ) * 2 + ( (v>>7)%2 ) * -6 + ( (v>>9)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(numero_longo) ( ( 0 * -2 + 0 * -2 + ( (v>>11)%2 ) * -14 + ( (v>>34)%2 ) * 2) >= -2 ) << 9 ;
        aux |=(numero_longo) ( ( ( (v>>20)%2 ) * 2 + ( (v>>3)%2 ) * 6 + ( (v>>4)%2 ) * 6 + ( (v>>21)%2 ) * -6 + ( (v>>18)%2 ) * 2) >= 14 ) << 10 ;
        aux |=(numero_longo) ( ( ( (v>>20)%2 ) * -2 + ( (v>>4)%2 ) * 2 + ( (v>>8)%2 ) * 2 + ( (v>>19)%2 ) * 2 + ( (v>>14)%2 ) * -2) >= -2 ) << 11 ;
        aux |=(numero_longo) ( ( ( (v>>23)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(numero_longo) ( ( ( (v>>2)%2 ) * 6 + 0 * -2 + ( (v>>35)%2 ) * 2) >= 6 ) << 13 ;
        aux |=(numero_longo) ( ( ( (v>>39)%2 ) * -2 + ( (v>>8)%2 ) * -2 + ( (v>>34)%2 ) * -2) >= 0 ) << 14 ;
        aux |=(numero_longo) ( ( ( (v>>28)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(numero_longo) ( ( ( (v>>17)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(numero_longo) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 17 ;
        aux |=(numero_longo) ( ( ( (v>>11)%2 ) * 6 + ( (v>>8)%2 ) * -2 + ( (v>>39)%2 ) * -2) >= 4 ) << 18 ;
        aux |=(numero_longo) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(numero_longo) ( ( ( (v>>39)%2 ) * 2 + ( (v>>11)%2 ) * 14 + ( (v>>34)%2 ) * -2 + ( (v>>23)%2 ) * -2) >= 12 ) << 20 ;
        aux |=(numero_longo) ( ( ( (v>>27)%2 ) * 2 + 0 * -2 + ( (v>>4)%2 ) * -2) >= 2 ) << 21 ;
        aux |=(numero_longo) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(numero_longo) ( ( ( (v>>24)%2 ) * 2 + ( (v>>22)%2 ) * 2) >= 4 ) << 23 ;
        aux |=(numero_longo) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 24 ;
        aux |=(numero_longo) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(numero_longo) ( ( ( (v>>29)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(numero_longo) ( ( ( (v>>43)%2 ) * -2) >= 0 ) << 27 ;
        aux |=(numero_longo) ( ( 0 * 2 + ( (v>>8)%2 ) * 2) >= 4 ) << 28 ;
        aux |=(numero_longo) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(numero_longo) ( ( 0 * -2 + ( (v>>0)%2 ) * -2) >= 0 ) << 30 ;
        aux |=(numero_longo) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(numero_longo) ( ( ( (v>>41)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(numero_longo) ( ( ( (v>>26)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(numero_longo) ( ( ( (v>>5)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(numero_longo) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(numero_longo) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(numero_longo) ( ( ( (v>>1)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(numero_longo) ( ( ( (v>>12)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(numero_longo) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 39 ;
        aux |=(numero_longo) ( (v>>40)%2 )<< 40 ;
        aux |=(numero_longo) ( (v>>41)%2 )<< 41 ;
        aux |=(numero_longo) ( (v>>42)%2 )<< 42 ;
        aux |=(numero_longo) ( (v>>43)%2 )<< 43 ;

        estado[i] = aux;
    }
    return;
}


void passo_bool_5(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( ( (v>>40)%2 ) & ! ( (v>>29)%2 ) ) | ( ( (v>>26)%2 ) & ! ( (v>>29)%2 ) ) | ( ( (v>>0)%2 ) & ! ( (v>>29)%2 ) )<< 0 ;
        aux |=(numero_longo) ( ( ( (v>>29)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>41)%2 ) ) | ( ( ( (v>>26)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>41)%2 ) ) | ( ( ( (v>>1)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>41)%2 ) )<< 1 ;
        aux |=(numero_longo) ( (v>>29)%2 ) | ( (v>>39)%2 ) | ( (v>>15)%2 )<< 2 ;
        aux |=(numero_longo) ( ( ( ( ( (v>>30)%2 ) & ! ( (v>>33)%2 ) ) & ! ( (v>>39)%2 ) ) & ! ( (v>>4)%2 ) ) & ! ( (v>>28)%2 ) ) | ( ( ( ( ( (v>>3)%2 ) & ! ( (v>>33)%2 ) ) & ! ( (v>>39)%2 ) ) & ! ( (v>>4)%2 ) ) & ! ( (v>>28)%2 ) )<< 3 ;
        aux |=(numero_longo) ( ( ( ( (v>>36)%2 ) & ! ( (v>>28)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>39)%2 ) ) | ( ( ( ( (v>>4)%2 ) & ! ( (v>>28)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>39)%2 ) )<< 4 ;
        aux |=(numero_longo) ( (v>>2)%2 )<< 5 ;
        aux |=(numero_longo) ( (v>>42)%2 )<< 6 ;
        aux |=(numero_longo) ( ( (v>>34)%2 ) & ! ( (v>>33)%2 ) ) | ( ( (v>>22)%2 ) & ! ( (v>>33)%2 ) ) | ( ( (v>>2)%2 ) & ! ( (v>>33)%2 ) ) | ( ( (v>>39)%2 ) & ! ( (v>>33)%2 ) )<< 7 ;
        aux |=(numero_longo) ( (v>>7)%2 )<< 8 ;
        aux |=(numero_longo) ( (v>>4)%2 )<< 9 ;
        aux |=(numero_longo) ( (v>>9)%2 )<< 10 ;
        aux |=(numero_longo) ( ( (v>>43)%2 ) & ! ( (v>>36)%2 ) )<< 11 ;
        aux |=(numero_longo) ( (v>>28)%2 )<< 12 ;
        aux |=(numero_longo) ( ( (v>>44)%2 ) & ! ( (v>>36)%2 ) )<< 13 ;
        aux |=(numero_longo) ( (v>>45)%2 )<< 14 ;
        aux |=(numero_longo) ( (v>>46)%2 )<< 15 ;
        aux |=(numero_longo) ( (v>>47)%2 )<< 16 ;
        aux |=(numero_longo) ( ( (v>>4)%2 ) & ! ( (v>>32)%2 ) )<< 17 ;
        aux |=(numero_longo) ( ( (v>>17)%2 ) & ! ( (v>>31)%2 ) )<< 18 ;
        aux |=(numero_longo) ( (v>>28)%2 )<< 19 ;
        aux |=(numero_longo) ( (v>>19)%2 )<< 20 ;
        aux |=(numero_longo) ( ( (v>>48)%2 ) & ! ( (v>>41)%2 ) )<< 21 ;
        aux |=(numero_longo) ( (v>>13)%2 )<< 22 ;
        aux |=(numero_longo) ( (v>>8)%2 )<< 23 ;
        aux |=(numero_longo) ( (v>>20)%2 )<< 24 ;
        aux |=(numero_longo) ( (v>>41)%2 )<< 25 ;
        aux |=(numero_longo) ( (v>>49)%2 )<< 26 ;
        aux |=(numero_longo) ( (v>>2)%2 )<< 27 ;
        aux |=(numero_longo) ( ( ( ( (v>>30)%2 ) & ! ( (v>>39)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>4)%2 ) ) | ( ( ( ( (v>>28)%2 ) & ! ( (v>>39)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>4)%2 ) ) | ( ( ( ( (v>>33)%2 ) & ! ( (v>>39)%2 ) ) & ! ( (v>>3)%2 ) ) & ! ( (v>>4)%2 ) )<< 28 ;
        aux |=(numero_longo) ( ( ( (v>>29)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>0)%2 ) ) | ( ( ( (v>>35)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>0)%2 ) ) | ( ( ( (v>>1)%2 ) & ! ( (v>>40)%2 ) ) & ! ( (v>>0)%2 ) )<< 29 ;
        aux |=(numero_longo) ( (v>>38)%2 )<< 30 ;
        aux |=(numero_longo) ( (v>>39)%2 ) | ( (v>>32)%2 )<< 31 ;
        aux |=(numero_longo) ( (v>>6)%2 ) | ( (v>>15)%2 ) | ( (v>>23)%2 )<< 32 ;
        aux |=(numero_longo) ( (v>>24)%2 ) | ( (v>>14)%2 ) | ( (v>>10)%2 )<< 33 ;
        aux |=(numero_longo) ( ( (v>>11)%2 ) & ! ( (v>>4)%2 ) )<< 34 ;
        aux |=(numero_longo) ( ( (v>>21)%2 ) & ! ( (v>>31)%2 ) ) | ( ( (v>>16)%2 ) & ! ( (v>>31)%2 ) )<< 35 ;
        aux |=(numero_longo) ( (v>>18)%2 )<< 36 ;
        aux |=(numero_longo) ( (v>>3)%2 )<< 37 ;
        aux |=(numero_longo) ( (v>>37)%2 )<< 38 ;
        aux |=(numero_longo) ( ( ( ( (v>>39)%2 ) & ! ( (v>>4)%2 ) ) & ! ( (v>>28)%2 ) ) & ! ( (v>>3)%2 ) ) | ( ( ( ( (v>>32)%2 ) & ! ( (v>>4)%2 ) ) & ! ( (v>>28)%2 ) ) & ! ( (v>>3)%2 ) )<< 39 ;
        aux |=(numero_longo) ( ( ( (v>>40)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>0)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>41)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>28)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>39)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>4)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) ) | ( ( ( (v>>3)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>29)%2 ) )<< 40 ;
        aux |=(numero_longo) ( (v>>41)%2 )<< 41 ;
        aux |=(numero_longo) ( (v>>42)%2 )<< 42 ;
        aux |=(numero_longo) ( (v>>43)%2 )<< 43 ;
        aux |=(numero_longo) ( (v>>44)%2 )<< 44 ;
        aux |=(numero_longo) ( (v>>45)%2 )<< 45 ;
        aux |=(numero_longo) ( (v>>46)%2 )<< 46 ;
        aux |=(numero_longo) ( (v>>47)%2 )<< 47 ;
        aux |=(numero_longo) ( (v>>48)%2 )<< 48 ;
        aux |=(numero_longo) ( (v>>49)%2 )<< 49 ;

        estado[i] = aux;
    }
    return;
}


void passo_tlf_5(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( ( ( (v>>40)%2 ) * 2 + ( (v>>29)%2 ) * -14 + ( (v>>26)%2 ) * 2 + ( (v>>0)%2 ) * 2) >= 2 ) << 0 ;
        aux |=(numero_longo) ( ( ( (v>>29)%2 ) * 2 + ( (v>>40)%2 ) * -14 + 0 * -14 + ( (v>>26)%2 ) * 2 + ( (v>>1)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(numero_longo) ( ( ( (v>>29)%2 ) * 2 + ( (v>>39)%2 ) * 2 + ( (v>>15)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(numero_longo) ( ( ( (v>>30)%2 ) * 2 + ( (v>>33)%2 ) * -6 + ( (v>>39)%2 ) * -6 + ( (v>>4)%2 ) * -6 + ( (v>>28)%2 ) * -6 + ( (v>>3)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(numero_longo) ( ( ( (v>>36)%2 ) * 2 + ( (v>>28)%2 ) * -6 + ( (v>>3)%2 ) * -6 + ( (v>>39)%2 ) * -6 + ( (v>>4)%2 ) * 2) >= 2 ) << 4 ;
        aux |=(numero_longo) ( ( ( (v>>2)%2 ) * 2) >= 2 ) << 5 ;
        aux |=(numero_longo) ( ( ( (v>>42)%2 ) * 2) >= 2 ) << 6 ;
        aux |=(numero_longo) ( ( ( (v>>34)%2 ) * 2 + ( (v>>33)%2 ) * -30 + ( (v>>22)%2 ) * 2 + ( (v>>2)%2 ) * 2 + ( (v>>39)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(numero_longo) ( ( ( (v>>7)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(numero_longo) ( ( ( (v>>4)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(numero_longo) ( ( ( (v>>9)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(numero_longo) ( ( 0 * 2 + ( (v>>36)%2 ) * -2) >= 2 ) << 11 ;
        aux |=(numero_longo) ( ( ( (v>>28)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(numero_longo) ( ( 0 * 2 + ( (v>>36)%2 ) * -2) >= 2 ) << 13 ;
        aux |=(numero_longo) ( ( ( (v>>45)%2 ) * 2) >= 2 ) << 14 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(numero_longo) ( ( ( (v>>47)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(numero_longo) ( ( ( (v>>4)%2 ) * 2 + ( (v>>32)%2 ) * -2) >= 2 ) << 17 ;
        aux |=(numero_longo) ( ( ( (v>>17)%2 ) * 2 + ( (v>>31)%2 ) * -2) >= 2 ) << 18 ;
        aux |=(numero_longo) ( ( ( (v>>28)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(numero_longo) ( ( ( (v>>19)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(numero_longo) ( ( 0 * 2 + ( (v>>41)%2 ) * -2) >= 2 ) << 21 ;
        aux |=(numero_longo) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(numero_longo) ( ( ( (v>>8)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(numero_longo) ( ( ( (v>>20)%2 ) * 2) >= 2 ) << 24 ;
        aux |=(numero_longo) ( ( ( (v>>41)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(numero_longo) ( ( ( (v>>49)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(numero_longo) ( ( ( (v>>2)%2 ) * 2) >= 2 ) << 27 ;
        aux |=(numero_longo) ( ( ( (v>>30)%2 ) * 2 + ( (v>>39)%2 ) * -14 + ( (v>>3)%2 ) * -14 + ( (v>>4)%2 ) * -14 + ( (v>>28)%2 ) * 2 + ( (v>>33)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(numero_longo) ( ( ( (v>>29)%2 ) * 2 + ( (v>>40)%2 ) * -14 + ( (v>>0)%2 ) * -14 + ( (v>>35)%2 ) * 2 + ( (v>>1)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(numero_longo) ( ( ( (v>>38)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(numero_longo) ( ( ( (v>>39)%2 ) * 2 + ( (v>>32)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(numero_longo) ( ( ( (v>>6)%2 ) * 2 + ( (v>>15)%2 ) * 2 + ( (v>>23)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(numero_longo) ( ( ( (v>>24)%2 ) * 2 + ( (v>>14)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(numero_longo) ( ( ( (v>>11)%2 ) * 2 + ( (v>>4)%2 ) * -2) >= 2 ) << 34 ;
        aux |=(numero_longo) ( ( ( (v>>21)%2 ) * 2 + ( (v>>31)%2 ) * -6 + ( (v>>16)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(numero_longo) ( ( ( (v>>18)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(numero_longo) ( ( ( (v>>3)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(numero_longo) ( ( ( (v>>37)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(numero_longo) ( ( ( (v>>39)%2 ) * 2 + ( (v>>4)%2 ) * -6 + ( (v>>28)%2 ) * -6 + ( (v>>3)%2 ) * -6 + ( (v>>32)%2 ) * 2) >= 2 ) << 39 ;
        aux |=(numero_longo) ( ( ( (v>>40)%2 ) * 2 + ( (v>>1)%2 ) * -254 + ( (v>>29)%2 ) * -254 + ( (v>>0)%2 ) * 2 + 0 * 2 + ( (v>>28)%2 ) * 2 + ( (v>>39)%2 ) * 2 + ( (v>>4)%2 ) * 2 + ( (v>>3)%2 ) * 2) >= 2 ) << 40 ;
        aux |=(numero_longo) ( (v>>41)%2 )<< 41 ;
        aux |=(numero_longo) ( (v>>42)%2 )<< 42 ;
        aux |=(numero_longo) ( (v>>43)%2 )<< 43 ;
        aux |=(numero_longo) ( (v>>44)%2 )<< 44 ;
        aux |=(numero_longo) ( (v>>45)%2 )<< 45 ;
        aux |=(numero_longo) ( (v>>46)%2 )<< 46 ;
        aux |=(numero_longo) ( (v>>47)%2 )<< 47 ;
        aux |=(numero_longo) ( (v>>48)%2 )<< 48 ;
        aux |=(numero_longo) ( (v>>49)%2 )<< 49 ;

        estado[i] = aux;
    }
    return;
}

void passo_bool_6(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( ( ( (v>>29)%2 & ( ( ( (v>>0)%2 | (v>>52)%2 ) ) ) ) & ! ( (v>>31)%2 ) ) & ! ( (v>>33)%2 ) )<< 0 ;
        aux |=(numero_longo) ( (v>>2)%2 & ( ( ( (v>>44)%2 & (v>>31)%2 ) ) & ( ( (v>>5)%2 ) ) ) ) | ( (v>>30)%2 & ( ( ( (v>>5)%2 ) ) & ( ( (v>>6)%2 ) ) & ( ( (v>>44)%2 & (v>>31)%2 ) ) ) )<< 1 ;
        aux |=(numero_longo) ( (v>>26)%2 & ( ( ( (v>>5)%2 ) ) ) ) | ( (v>>30)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 2 ;
        aux |=(numero_longo) ( (v>>37)%2 ) | ( (v>>3)%2 )<< 3 ;
        aux |=(numero_longo) ( (v>>4)%2 ) | ( (v>>37)%2 )<< 4 ;
        aux |=(numero_longo) ( ( (v>>5)%2 ) & ! ( (v>>35)%2 ) )<< 5 ;
        aux |=(numero_longo) ( (v>>2)%2 & ( ( ( (v>>30)%2 ) ) ) ) | ( ( (v>>5)%2 ) & ! ( (v>>34)%2 ) )<< 6 ;
        aux |=(numero_longo) ( (v>>9)%2 )<< 7 ;
        aux |=(numero_longo) ( (v>>10)%2 )<< 8 ;
        aux |=(numero_longo) ( (v>>18)%2 & ( ( ( (v>>5)%2 ) ) ) ) | ( (v>>36)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 9 ;
        aux |=(numero_longo) ( (v>>36)%2 )<< 10 ;
        aux |=(numero_longo) ( (v>>32)%2 & ( ( ( (v>>40)%2 ) ) ) )<< 11 ;
        aux |=(numero_longo) ( (v>>5)%2 )<< 12 ;
        aux |=(numero_longo) ( (v>>52)%2 ) | ( (v>>0)%2 )<< 13 ;
        aux |=(numero_longo) ( ( (v>>52)%2 ) & ! ( (v>>15)%2 ) )<< 14 ;
        aux |=(numero_longo) ( (v>>28)%2 & ( ( ( (v>>25)%2 ) ) ) ) | ( (v>>22)%2 & ( ( ( (v>>25)%2 ) ) ) )<< 15 ;
        aux |=(numero_longo) ( (v>>18)%2 ) | ( (v>>45)%2 ) | ( (v>>10)%2 )<< 16 ;
        aux |=(numero_longo) ( (v>>18)%2 ) | ( (v>>16)%2 )<< 17 ;
        aux |=(numero_longo) ( (v>>9)%2 ) | ( (v>>31)%2 ) | ( ( ( (v>>44)%2 ) & ! ( (v>>20)%2 ) ) & ! ( (v>>23)%2 ) )<< 18 ;
        aux |=(numero_longo) ( (v>>20)%2 ) | ( (v>>49)%2 )<< 19 ;
        aux |=(numero_longo) ( (v>>51)%2 ) | ( (v>>31)%2 ) | ( (v>>48)%2 & ( ( ( (v>>40)%2 ) ) ) )<< 20 ;
        aux |=(numero_longo) ( ( (v>>7)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>24)%2 ) ) | ( ( (v>>8)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>24)%2 ) )<< 21 ;
        aux |=(numero_longo) ( (v>>48)%2 ) | ( (v>>49)%2 ) | ( (v>>15)%2 ) | ( (v>>14)%2 & ( ( ( (v>>52)%2 ) ) ) )<< 22 ;
        aux |=(numero_longo) ( (v>>24)%2 )<< 23 ;
        aux |=(numero_longo) ( (v>>15)%2 ) | ( ( ( (v>>46)%2 ) & ! ( (v>>16)%2 ) ) & ! ( (v>>21)%2 ) ) | ( ( ( (v>>47)%2 ) & ! ( (v>>16)%2 ) ) & ! ( (v>>21)%2 ) ) | ( ( ( (v>>7)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>16)%2 ) ) & ! ( (v>>21)%2 ) ) | ( ( ( (v>>8)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>16)%2 ) ) & ! ( (v>>21)%2 ) )<< 24 ;
        aux |=(numero_longo) ( (v>>15)%2 ) | ( (v>>47)%2 )<< 25 ;
        aux |=(numero_longo) ( (v>>3)%2 & ( ( ( (v>>5)%2 ) ) ) ) | ( (v>>26)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 26 ;
        aux |=(numero_longo) ( (v>>52)%2 & ( ( ( (v>>4)%2 ) ) ) )<< 27 ;
        aux |=(numero_longo) ( (v>>22)%2 & ( ( ( (v>>4)%2 ) ) ) ) | ( (v>>24)%2 & ( ( ( (v>>4)%2 ) ) ) )<< 28 ;
        aux |=(numero_longo) ( (v>>4)%2 )<< 29 ;
        aux |=(numero_longo) ( (v>>3)%2 ) | ( (v>>30)%2 )<< 30 ;
        aux |=(numero_longo) ( (v>>18)%2 & ( ( ( (v>>5)%2 ) ) ) ) | ( (v>>36)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 31 ;
        aux |=(numero_longo) ( (v>>36)%2 )<< 32 ;
        aux |=(numero_longo) ( ( ( (v>>16)%2 ) & ! ( (v>>23)%2 ) ) & ! ( (v>>19)%2 ) ) | ( (v>>36)%2 & ( ( ( (v>>0)%2 ) ) ) )<< 33 ;
        aux |=(numero_longo) ( (v>>5)%2 )<< 34 ;
        aux |=(numero_longo) ( (v>>1)%2 & ( ( ( (v>>5)%2 ) ) ) )<< 35 ;
        aux |=(numero_longo) ( ( ( (v>>13)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>27)%2 ) ) | ( ( ( (v>>12)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>27)%2 ) ) | ( ( ( (v>>0)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>27)%2 ) ) | ( ( ( (v>>1)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>27)%2 ) )<< 36 ;
        aux |=(numero_longo) ( (v>>7)%2 ) | ( (v>>8)%2 )<< 37 ;
        aux |=(numero_longo) ( (v>>15)%2 ) | ( (v>>14)%2 )<< 38 ;
        aux |=(numero_longo) ( (v>>33)%2 ) | ( (v>>32)%2 )<< 39 ;
        aux |=(numero_longo) ( ( ( (v>>5)%2 ) & ! ( (v>>30)%2 ) ) & ! ( (v>>26)%2 ) )<< 40 ;
        aux |=(numero_longo) ( (v>>40)%2 )<< 41 ;
        aux |=(numero_longo) ( (v>>7)%2 & ( ( ( (v>>21)%2 & (v>>37)%2 ) ) ) )<< 42 ;
        aux |=(numero_longo) ( (v>>8)%2 & ( ( ( (v>>21)%2 ) ) & ( ( (v>>8)%2 ) ) & ( ( (v>>37)%2 ) ) ) )<< 43 ;
        aux |=(numero_longo) ( (v>>42)%2 )<< 44 ;
        aux |=(numero_longo) ( (v>>43)%2 )<< 45 ;
        aux |=(numero_longo) ( ( (v>>7)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>21)%2 ) )<< 46 ;
        aux |=(numero_longo) ( ( (v>>8)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>21)%2 ) )<< 47 ;
        aux |=(numero_longo) ( (v>>46)%2 )<< 48 ;
        aux |=(numero_longo) ( (v>>47)%2 )<< 49 ;
        aux |=(numero_longo) ( (v>>7)%2 & ( ( ( (v>>41)%2 ) ) & ( ( (v>>37)%2 ) ) ) )<< 50 ;
        aux |=(numero_longo) ( (v>>50)%2 )<< 51 ;
        aux |=(numero_longo) ( (v>>52)%2 )<< 52 ;

        estado[i] = aux;
    }
    return;
}

void passo_tlf_6(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( ( ( (v>>29)%2 ) * 6 + ( (v>>0)%2 ) * 2 + 0 * 2 + ( (v>>31)%2 ) * -6 + ( (v>>33)%2 ) * -6) >= 8 ) << 0 ;
        aux |=(numero_longo) ( ( ( (v>>2)%2 ) * 6 + ( (v>>44)%2 ) * 10 + ( (v>>31)%2 ) * 10 + ( (v>>5)%2 ) * 10 + ( (v>>30)%2 ) * 2 + ( (v>>6)%2 ) * 2) >= 34 ) << 1 ;
        aux |=(numero_longo) ( ( ( (v>>26)%2 ) * 2 + ( (v>>5)%2 ) * 6 + ( (v>>30)%2 ) * 2) >= 8 ) << 2 ;
        aux |=(numero_longo) ( ( ( (v>>37)%2 ) * 2 + ( (v>>3)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(numero_longo) ( ( ( (v>>4)%2 ) * 2 + ( (v>>37)%2 ) * 2) >= 2 ) << 4 ;
        aux |=(numero_longo) ( ( ( (v>>5)%2 ) * 2 + ( (v>>35)%2 ) * -2) >= 2 ) << 5 ;
        aux |=(numero_longo) ( ( ( (v>>2)%2 ) * 6 + ( (v>>30)%2 ) * 6 + ( (v>>5)%2 ) * 6 + ( (v>>34)%2 ) * -6) >= 6 ) << 6 ;
        aux |=(numero_longo) ( ( ( (v>>9)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(numero_longo) ( ( ( (v>>10)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(numero_longo) ( ( ( (v>>18)%2 ) * 2 + ( (v>>5)%2 ) * 6 + ( (v>>36)%2 ) * 2) >= 8 ) << 9 ;
        aux |=(numero_longo) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(numero_longo) ( ( ( (v>>32)%2 ) * 2 + ( (v>>40)%2 ) * 2) >= 4 ) << 11 ;
        aux |=(numero_longo) ( ( ( (v>>5)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(numero_longo) ( ( 0 * 2 + ( (v>>0)%2 ) * 2) >= 2 ) << 13 ;
        aux |=(numero_longo) ( ( 0 * 2 + ( (v>>15)%2 ) * -2) >= 2 ) << 14 ;
        aux |=(numero_longo) ( ( ( (v>>28)%2 ) * 2 + ( (v>>25)%2 ) * 6 + ( (v>>22)%2 ) * 2) >= 8 ) << 15 ;
        aux |=(numero_longo) ( ( ( (v>>18)%2 ) * 2 + ( (v>>45)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(numero_longo) ( ( ( (v>>18)%2 ) * 2 + ( (v>>16)%2 ) * 2) >= 2 ) << 17 ;
        aux |=(numero_longo) ( ( ( (v>>9)%2 ) * 14 + ( (v>>31)%2 ) * 14 + ( (v>>44)%2 ) * 2 + ( (v>>20)%2 ) * -2 + ( (v>>23)%2 ) * -2) >= 2 ) << 18 ;
        aux |=(numero_longo) ( ( ( (v>>20)%2 ) * 2 + ( (v>>49)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(numero_longo) ( ( ( (v>>51)%2 ) * 6 + ( (v>>31)%2 ) * 6 + ( (v>>48)%2 ) * 2 + ( (v>>40)%2 ) * 2) >= 4 ) << 20 ;
        aux |=(numero_longo) ( ( ( (v>>7)%2 ) * 2 + ( (v>>37)%2 ) * 6 + ( (v>>24)%2 ) * -6 + ( (v>>8)%2 ) * 2) >= 8 ) << 21 ;
        aux |=(numero_longo) ( ( ( (v>>48)%2 ) * 6 + ( (v>>49)%2 ) * 6 + ( (v>>15)%2 ) * 6 + ( (v>>14)%2 ) * 2 + ( (v>>52)%2 ) * 2) >= 4 ) << 22 ;
        aux |=(numero_longo) ( ( ( (v>>24)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(numero_longo) ( ( ( (v>>15)%2 ) * 202 + ( (v>>46)%2 ) * 10 + ( (v>>16)%2 ) * -54 + ( (v>>21)%2 ) * -54 + ( (v>>47)%2 ) * 10 + ( (v>>7)%2 ) * 2 + ( (v>>37)%2 ) * 6 + ( (v>>8)%2 ) * 2) >= 8 ) << 24 ;
        aux |=(numero_longo) ( ( ( (v>>15)%2 ) * 2 + ( (v>>47)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(numero_longo) ( ( ( (v>>3)%2 ) * 2 + ( (v>>5)%2 ) * 6 + ( (v>>26)%2 ) * 2) >= 8 ) << 26 ;
        aux |=(numero_longo) ( ( 0 * 2 + ( (v>>4)%2 ) * 2) >= 4 ) << 27 ;
        aux |=(numero_longo) ( ( ( (v>>22)%2 ) * 2 + ( (v>>4)%2 ) * 6 + ( (v>>24)%2 ) * 2) >= 8 ) << 28 ;
        aux |=(numero_longo) ( ( ( (v>>4)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(numero_longo) ( ( ( (v>>3)%2 ) * 2 + ( (v>>30)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(numero_longo) ( ( ( (v>>18)%2 ) * 2 + ( (v>>5)%2 ) * 6 + ( (v>>36)%2 ) * 2) >= 8 ) << 31 ;
        aux |=(numero_longo) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(numero_longo) ( ( ( (v>>16)%2 ) * 6 + ( (v>>23)%2 ) * -6 + ( (v>>19)%2 ) * -6 + ( (v>>36)%2 ) * 14 + ( (v>>0)%2 ) * 14) >= 6 ) << 33 ;
        aux |=(numero_longo) ( ( ( (v>>5)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(numero_longo) ( ( ( (v>>1)%2 ) * 2 + ( (v>>5)%2 ) * 2) >= 4 ) << 35 ;
        aux |=(numero_longo) ( ( ( (v>>13)%2 ) * 2 + ( (v>>19)%2 ) * -30 + ( (v>>27)%2 ) * -30 + ( (v>>12)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>1)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(numero_longo) ( ( ( (v>>7)%2 ) * 2 + ( (v>>8)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(numero_longo) ( ( ( (v>>15)%2 ) * 2 + ( (v>>14)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(numero_longo) ( ( ( (v>>33)%2 ) * 2 + ( (v>>32)%2 ) * 2) >= 2 ) << 39 ;
        aux |=(numero_longo) ( ( ( (v>>5)%2 ) * 2 + ( (v>>30)%2 ) * -2 + ( (v>>26)%2 ) * -2) >= 2 ) << 40 ;
        aux |=(numero_longo) ( ( ( (v>>40)%2 ) * 2) >= 2 ) << 41 ;
        aux |=(numero_longo) ( ( ( (v>>7)%2 ) * 2 + ( (v>>21)%2 ) * 2 + ( (v>>37)%2 ) * 2) >= 6 ) << 42 ;
        aux |=(numero_longo) ( ( ( (v>>8)%2 ) * 2 + ( (v>>21)%2 ) * 2 + ( (v>>37)%2 ) * 2) >= 6 ) << 43 ;
        aux |=(numero_longo) ( ( ( (v>>42)%2 ) * 2) >= 2 ) << 44 ;
        aux |=(numero_longo) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 45 ;
        aux |=(numero_longo) ( ( ( (v>>7)%2 ) * 2 + ( (v>>37)%2 ) * 2 + ( (v>>21)%2 ) * -2) >= 4 ) << 46 ;
        aux |=(numero_longo) ( ( ( (v>>8)%2 ) * 2 + ( (v>>37)%2 ) * 2 + ( (v>>21)%2 ) * -2) >= 4 ) << 47 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 48 ;
        aux |=(numero_longo) ( ( ( (v>>47)%2 ) * 2) >= 2 ) << 49 ;
        aux |=(numero_longo) ( ( ( (v>>7)%2 ) * 2 + ( (v>>41)%2 ) * 2 + ( (v>>37)%2 ) * 2) >= 6 ) << 50 ;
        aux |=(numero_longo) ( ( ( (v>>50)%2 ) * 2) >= 2 ) << 51 ;
        aux |=(numero_longo) ( (v>>52)%2 )<< 52 ;

        estado[i] = aux;
    }
    return;
}

void passo_bool_7(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( ( (v>>28)%2 ) & !( (v>>33)%2 ) )<< 0 ;
        aux |=(numero_longo) ( (v>>20)%2 & ( ( ( (v>>12)%2 | (v>>2)%2 ) ) ) )<< 1 ;
        aux |=(numero_longo) ( (v>>19)%2 ) | ( (v>>46)%2 )<< 2 ;
        aux |=(numero_longo) ( (v>>49)%2 )<< 3 ;
        aux |=(numero_longo) ( ( ( (v>>13)%2 & ( ( ( (v>>47)%2 ) ) ) ) & !( (v>>5)%2 ) ) & !( (v>>10)%2 ) )<< 4 ;
        aux |=(numero_longo) ( (v>>6)%2 & ( ( ( (v>>0)%2 ) ) ) )<< 5 ;
        aux |=(numero_longo) ( (v>>25)%2 )<< 6 ;
        aux |=(numero_longo) ( (v>>6)%2 )<< 7 ;
        aux |=(numero_longo) ( ( ( (v>>50)%2 ) & !( (v>>30)%2 ) ) & !( (v>>17)%2 ) ) | ( ( ( (v>>40)%2 ) & !( (v>>30)%2 ) ) & !( (v>>17)%2 ) )<< 8 ;
        aux |=(numero_longo) ( (v>>46)%2 ) | ( (v>>19)%2 ) | ( (v>>10)%2 )<< 9 ;
        aux |=(numero_longo) ( (v>>24)%2 )<< 10 ;
        aux |=(numero_longo) ( ( ( (v>>51)%2 ) & !( (v>>17)%2 ) ) & !( (v>>30)%2 ) )<< 11 ;
        aux |=(numero_longo) ( (v>>10)%2 & ( ( ( (v>>37)%2 ) & ( ( ( (v>>9)%2 | (v>>6)%2 ) ) ) ) ) )<< 12 ;
        aux |=(numero_longo) ( ( (v>>19)%2 ) & !( (v>>0)%2 ) )<< 13 ;
        aux |=(numero_longo) ( ( ( (v>>11)%2 ) & !( (v>>40)%2 ) ) & !( (v>>17)%2 ) )<< 14 ;
        aux |=(numero_longo) ( (v>>29)%2 ) | ( (v>>17)%2 )<< 15 ;
        aux |=(numero_longo) ( (v>>47)%2 ) | ( (v>>38)%2 )<< 16 ;
        aux |=(numero_longo) ( (v>>14)%2 ) | ( (v>>43)%2 ) | ( (v>>8)%2 )<< 17 ;
        aux |=(numero_longo) ( (v>>45)%2 )<< 18 ;
        aux |=(numero_longo) ( (v>>41)%2 & ( ( ( (v>>42)%2 ) ) ) ) | ( (v>>21)%2 & ( ( ( (v>>52)%2 ) ) ) ) | ( (v>>26)%2 & ( ( ( (v>>52)%2 ) ) ) ) | ( (v>>42)%2 & ( ( ( (v>>26)%2 ) ) ) )<< 19 ;
        aux |=(numero_longo) ( (v>>19)%2 )<< 20 ;
        aux |=(numero_longo) ( (v>>36)%2 )<< 21 ;
        aux |=(numero_longo) ( (v>>46)%2 )<< 22 ;
        aux |=(numero_longo) ( ( (v>>0)%2 ) & !( (v>>44)%2 ) ) | ( ( (v>>47)%2 ) & !( (v>>44)%2 ) )<< 23 ;
        aux |=(numero_longo) ( ( ( (v>>35)%2 ) & !( (v>>1)%2 ) ) & !( (v>>32)%2 ) ) | ( ( ( (v>>21)%2 ) & !( (v>>1)%2 ) ) & !( (v>>32)%2 ) )<< 24 ;
        aux |=(numero_longo) ( (v>>46)%2 ) | ( (v>>10)%2 )<< 25 ;
        aux |=(numero_longo) ( (v>>16)%2 )<< 26 ;
        aux |=(numero_longo) ( (v>>25)%2 & ( ( ( (v>>0)%2 ) ) ) )<< 27 ;
        aux |=(numero_longo) ( (v>>29)%2 )<< 28 ;
        aux |=(numero_longo) ( (v>>15)%2 ) | ( (v>>36)%2 & ( ( ( (v>>39)%2 ) ) ) )<< 29 ;
        aux |=(numero_longo) ( (v>>31)%2 )<< 30 ;
        aux |=(numero_longo) ( (v>>8)%2 ) | ( (v>>11)%2 )<< 31 ;
        aux |=(numero_longo) ( (v>>46)%2 )<< 32 ;
        aux |=(numero_longo) ( (v>>47)%2 )<< 33 ;
        aux |=(numero_longo) ( ( (v>>48)%2 & ( ( ( (v>>27)%2 ) ) ) ) & !( (v>>45)%2 ) )<< 34 ;
        aux |=(numero_longo) ( ( ( (v>>36)%2 ) & !( (v>>0)%2 ) ) & !( (v>>10)%2 ) ) | ( ( ( (v>>30)%2 ) & !( (v>>0)%2 ) ) & !( (v>>10)%2 ) )<< 35 ;
        aux |=(numero_longo) ( (v>>39)%2 ) | ( (v>>31)%2 )<< 36 ;
        aux |=(numero_longo) ( (v>>10)%2 )<< 37 ;
        aux |=(numero_longo) ( (v>>43)%2 )<< 38 ;
        aux |=(numero_longo) ( ( (v>>17)%2 ) & !( (v>>37)%2 ) )<< 39 ;
        aux |=(numero_longo) ( (v>>10)%2 )<< 40 ;
        aux |=(numero_longo) ( (v>>43)%2 )<< 41 ;
        aux |=(numero_longo) ( (v>>3)%2 )<< 42 ;
        aux |=(numero_longo) ( (v>>53)%2 )<< 43 ;
        aux |=(numero_longo) ( (v>>27)%2 )<< 44 ;
        aux |=(numero_longo) ( ( (v>>47)%2 ) & !( (v>>0)%2 ) )<< 45 ;
        aux |=(numero_longo) ( (v>>41)%2 & ( ( ( (v>>52)%2 ) ) ) ) | ( (v>>21)%2 & ( ( ( (v>>26)%2 ) ) ) ) | ( (v>>26)%2 & ( ( ( (v>>52)%2 ) ) ) ) | ( (v>>42)%2 & ( ( ( (v>>21)%2 ) ) ) )<< 46 ;
        aux |=(numero_longo) ( (v>>46)%2 & ( ( ( (v>>54)%2 ) ) ) ) | ( (v>>3)%2 & ( ( ( (v>>54)%2 ) ) ) )<< 47 ;
        aux |=(numero_longo) ( (v>>28)%2 & ( ( ( (v>>10)%2 ) ) ) )<< 48 ;
        aux |=(numero_longo) ( (v>>49)%2 )<< 49 ;
        aux |=(numero_longo) ( (v>>50)%2 )<< 50 ;
        aux |=(numero_longo) ( (v>>51)%2 )<< 51 ;
        aux |=(numero_longo) ( (v>>52)%2 )<< 52 ;
        aux |=(numero_longo) ( (v>>53)%2 )<< 53 ;
        aux |=(numero_longo) ( (v>>54)%2 )<< 54 ;

        estado[i] = aux;
    }
    return;
}

void passo_tlf_7(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( ( ( (v>>28)%2 ) * 2 + ( (v>>33)%2 ) * -2) >= 2 ) << 0 ;
        aux |=(numero_longo) ( ( ( (v>>20)%2 ) * 6 + ( (v>>12)%2 ) * 2 + ( (v>>2)%2 ) * 2) >= 8 ) << 1 ;
        aux |=(numero_longo) ( ( ( (v>>19)%2 ) * 2 + ( (v>>46)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(numero_longo) ( ( ( (v>>49)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(numero_longo) ( ( ( (v>>13)%2 ) * 2 + ( (v>>47)%2 ) * 2 + ( (v>>5)%2 ) * -2 + ( (v>>10)%2 ) * -2) >= 4 ) << 4 ;
        aux |=(numero_longo) ( ( ( (v>>6)%2 ) * 2 + ( (v>>0)%2 ) * 2) >= 4 ) << 5 ;
        aux |=(numero_longo) ( ( ( (v>>25)%2 ) * 2) >= 2 ) << 6 ;
        aux |=(numero_longo) ( ( ( (v>>6)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(numero_longo) ( ( 0 * 2 + ( (v>>30)%2 ) * -6 + ( (v>>17)%2 ) * -6 + ( (v>>40)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) * 2 + ( (v>>19)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(numero_longo) ( ( ( (v>>24)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(numero_longo) ( ( 0 * 2 + ( (v>>17)%2 ) * -2 + ( (v>>30)%2 ) * -2) >= 2 ) << 11 ;
        aux |=(numero_longo) ( ( ( (v>>10)%2 ) * 6 + ( (v>>37)%2 ) * 6 + ( (v>>9)%2 ) * 2 + ( (v>>6)%2 ) * 2) >= 14 ) << 12 ;
        aux |=(numero_longo) ( ( ( (v>>19)%2 ) * 2 + ( (v>>0)%2 ) * -2) >= 2 ) << 13 ;
        aux |=(numero_longo) ( ( ( (v>>11)%2 ) * 2 + ( (v>>40)%2 ) * -2 + ( (v>>17)%2 ) * -2) >= 2 ) << 14 ;
        aux |=(numero_longo) ( ( ( (v>>29)%2 ) * 2 + ( (v>>17)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(numero_longo) ( ( ( (v>>47)%2 ) * 2 + ( (v>>38)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(numero_longo) ( ( ( (v>>14)%2 ) * 2 + ( (v>>43)%2 ) * 2 + ( (v>>8)%2 ) * 2) >= 2 ) << 17 ;
        aux |=(numero_longo) ( ( ( (v>>45)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(numero_longo) ( ( ( (v>>41)%2 ) * 6 + ( (v>>42)%2 ) * 14 + ( (v>>21)%2 ) * 6 + 0 * 14 + ( (v>>26)%2 ) * 10) >= 20 ) << 19 ;
        aux |=(numero_longo) ( ( ( (v>>19)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(numero_longo) ( ( ( (v>>36)%2 ) * 2) >= 2 ) << 21 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(numero_longo) ( ( ( (v>>0)%2 ) * 2 + ( (v>>44)%2 ) * -6 + ( (v>>47)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(numero_longo) ( ( ( (v>>35)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>32)%2 ) * -6 + ( (v>>21)%2 ) * 2) >= 2 ) << 24 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(numero_longo) ( ( ( (v>>16)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(numero_longo) ( ( ( (v>>25)%2 ) * 2 + ( (v>>0)%2 ) * 2) >= 4 ) << 27 ;
        aux |=(numero_longo) ( ( ( (v>>29)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(numero_longo) ( ( ( (v>>15)%2 ) * 6 + ( (v>>36)%2 ) * 2 + ( (v>>39)%2 ) * 2) >= 4 ) << 29 ;
        aux |=(numero_longo) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(numero_longo) ( ( ( (v>>8)%2 ) * 2 + ( (v>>11)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(numero_longo) ( ( ( (v>>47)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(numero_longo) ( ( ( (v>>48)%2 ) * 2 + ( (v>>27)%2 ) * 2 + ( (v>>45)%2 ) * -2) >= 4 ) << 34 ;
        aux |=(numero_longo) ( ( ( (v>>36)%2 ) * 2 + ( (v>>0)%2 ) * -6 + ( (v>>10)%2 ) * -6 + ( (v>>30)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(numero_longo) ( ( ( (v>>39)%2 ) * 2 + ( (v>>31)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(numero_longo) ( ( ( (v>>10)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(numero_longo) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(numero_longo) ( ( ( (v>>17)%2 ) * 2 + ( (v>>37)%2 ) * -2) >= 2 ) << 39 ;
        aux |=(numero_longo) ( ( ( (v>>10)%2 ) * 2) >= 2 ) << 40 ;
        aux |=(numero_longo) ( ( ( (v>>43)%2 ) * 2) >= 2 ) << 41 ;
        aux |=(numero_longo) ( ( ( (v>>3)%2 ) * 2) >= 2 ) << 42 ;
        aux |=(numero_longo) ( ( ( (v>>53)%2 ) * 2) >= 2 ) << 43 ;
        aux |=(numero_longo) ( ( ( (v>>27)%2 ) * 2) >= 2 ) << 44 ;
        aux |=(numero_longo) ( ( ( (v>>47)%2 ) * 2 + ( (v>>0)%2 ) * -2) >= 2 ) << 45 ;
        aux |=(numero_longo) ( ( ( (v>>41)%2 ) * 6 + 0 * 14 + ( (v>>21)%2 ) * 14 + ( (v>>26)%2 ) * 10 + ( (v>>42)%2 ) * 6) >= 20 ) << 46 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) * 2 + 0 * 6 + ( (v>>3)%2 ) * 2) >= 8 ) << 47 ;
        aux |=(numero_longo) ( ( ( (v>>28)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 4 ) << 48 ;
        aux |=(numero_longo) ( (v>>49)%2 )<< 49 ;
        aux |=(numero_longo) ( (v>>50)%2 )<< 50 ;
        aux |=(numero_longo) ( (v>>51)%2 )<< 51 ;
        aux |=(numero_longo) ( (v>>52)%2 )<< 52 ;
        aux |=(numero_longo) ( (v>>53)%2 )<< 53 ;
        aux |=(numero_longo) ( (v>>54)%2 )<< 54 ;

        estado[i] = aux;
    }
    return;
}

void passo_bool_8(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) )<< 0 ;
        aux |=(numero_longo) ( (v>>6)%2 ) | ( (v>>1)%2 )<< 1 ;
        aux |=(numero_longo) ( ( ( ( (v>>6)%2 ) & ! ( (v>>30)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>3)%2 ) ) | ( ( ( ( (v>>19)%2 ) & ! ( (v>>30)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>3)%2 ) )<< 2 ;
        aux |=(numero_longo) ( ( ( ( ( (v>>46)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>2)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>9)%2 ) ) | ( ( ( ( ( (v>>33)%2 ) & ! ( (v>>19)%2 ) ) & ! ( (v>>2)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>9)%2 ) )<< 3 ;
        aux |=(numero_longo) ( ( (v>>10)%2 & ( ( ( (v>>21)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 4 ;
        aux |=(numero_longo) ( ( (v>>48)%2 ) & ! ( (v>>1)%2 ) )<< 5 ;
        aux |=(numero_longo) ( ( ( (v>>19)%2 & ( ( ( (v>>2)%2 ) ) ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>20)%2 ) ) | ( ( (v>>9)%2 ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>51)%2 & ( ( ( (v>>2)%2 ) ) ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>20)%2 ) )<< 6 ;
        aux |=(numero_longo) ( ( ( (v>>13)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>42)%2 ) )<< 7 ;
        aux |=(numero_longo) ( ( (v>>12)%2 ) & ! ( (v>>1)%2 ) )<< 8 ;
        aux |=(numero_longo) ( ( (v>>15)%2 & ( ( ( (v>>7)%2 ) ) | ( ( (v>>13)%2 ) & ( ( ( ! (v>>11)%2 ) ) ) ) | ( ( (v>>13)%2 & (v>>23)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 9 ;
        aux |=(numero_longo) ( ( (v>>31)%2 & ( ( ( (v>>37)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 10 ;
        aux |=(numero_longo) ( ( ( (v>>33)%2 ) & ! ( (v>>9)%2 ) ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>4)%2 & ( ( ( (v>>21)%2 ) ) ) ) & ! ( (v>>9)%2 ) ) & ! ( (v>>1)%2 ) )<< 11 ;
        aux |=(numero_longo) ( ( (v>>48)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>26)%2 ) & ! ( (v>>1)%2 ) )<< 12 ;
        aux |=(numero_longo) ( ( ( (v>>15)%2 & ( ( ( (v>>14)%2 ) ) ) ) & ! ( (v>>53)%2 ) ) & ! ( (v>>1)%2 ) )<< 13 ;
        aux |=(numero_longo) ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>32)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>10)%2 ) & ! ( (v>>1)%2 ) )<< 14 ;
        aux |=(numero_longo) ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) )<< 15 ;
        aux |=(numero_longo) ( ( ( ( (v>>36)%2 & ( ( ( (v>>16)%2 ) ) ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>23)%2 ) ) & ! ( (v>>54)%2 ) ) | ( ( ( ( (v>>41)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>23)%2 ) ) & ! ( (v>>54)%2 ) )<< 16 ;
        aux |=(numero_longo) ( ( (v>>42)%2 ) & ! ( (v>>1)%2 ) )<< 17 ;
        aux |=(numero_longo) ( ( (v>>26)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>52)%2 ) & ! ( (v>>1)%2 ) )<< 18 ;
        aux |=(numero_longo) ( ( (v>>47)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>4)%2 & ( ( ( (v>>21)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 19 ;
        aux |=(numero_longo) ( ( ( (v>>33)%2 ) & ! ( (v>>2)%2 ) ) & ! ( (v>>1)%2 ) )<< 20 ;
        aux |=(numero_longo) ( ( ( ( (v>>54)%2 & ( ( ( (v>>22)%2 ) ) ) ) & ! ( (v>>34)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>43)%2 ) ) | ( ( ( ( (v>>23)%2 & ( ( ( (v>>22)%2 ) ) ) ) & ! ( (v>>34)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>43)%2 ) ) | ( ( ( ( (v>>55)%2 & ( ( ( (v>>22)%2 ) ) ) ) & ! ( (v>>34)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>43)%2 ) )<< 21 ;
        aux |=(numero_longo) ( ( (v>>47)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>32)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) )<< 22 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>47)%2 ) ) | ( ( ( (v>>32)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>47)%2 ) ) | ( ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>47)%2 ) )<< 23 ;
        aux |=(numero_longo) ( ( ( (v>>23)%2 & ( ( ( (v>>25)%2 ) ) ) ) & ! ( (v>>24)%2 ) ) & ! ( (v>>1)%2 ) )<< 24 ;
        aux |=(numero_longo) ( ( (v>>23)%2 & ( ( ( (v>>46)%2 | (v>>33)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 25 ;
        aux |=(numero_longo) ( ( (v>>27)%2 & ( ( ( (v>>23)%2 | (v>>54)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 26 ;
        aux |=(numero_longo) ( ( (v>>10)%2 & ( ( ( (v>>47)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 27 ;
        aux |=(numero_longo) ( ( ( ( (v>>21)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>56)%2 ) ) & ! ( (v>>44)%2 ) ) | ( ( ( ( (v>>40)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>56)%2 ) ) & ! ( (v>>44)%2 ) ) | ( ( ( ( (v>>24)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>56)%2 ) ) & ! ( (v>>44)%2 ) ) | ( ( ( ( (v>>26)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>56)%2 ) ) & ! ( (v>>44)%2 ) )<< 28 ;
        aux |=(numero_longo) ( ( (v>>56)%2 ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>48)%2 ) & ! ( (v>>52)%2 ) ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>26)%2 ) & ! ( (v>>52)%2 ) ) & ! ( (v>>1)%2 ) )<< 29 ;
        aux |=(numero_longo) ( ( ( (v>>26)%2 & ( ( ( (v>>46)%2 & (v>>37)%2 & (v>>33)%2 ) ) ) ) & ! ( (v>>9)%2 ) ) & ! ( (v>>1)%2 ) )<< 30 ;
        aux |=(numero_longo) ( ( (v>>41)%2 ) & ! ( (v>>1)%2 ) )<< 31 ;
        aux |=(numero_longo) ( ( (v>>37)%2 ) & ! ( (v>>1)%2 ) )<< 32 ;
        aux |=(numero_longo) ( ( (v>>37)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>50)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>11)%2 & ( ( ( (v>>51)%2 & (v>>20)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 33 ;
        aux |=(numero_longo) ( ( ( (v>>21)%2 ) & ! ( (v>>57)%2 ) ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>34)%2 ) & ! ( (v>>57)%2 ) ) & ! ( (v>>1)%2 ) )<< 34 ;
        aux |=(numero_longo) ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) )<< 35 ;
        aux |=(numero_longo) ( ( (v>>58)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>42)%2 ) & ! ( (v>>1)%2 ) )<< 36 ;
        aux |=(numero_longo) ( ( (v>>36)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>41)%2 ) & ! ( (v>>1)%2 ) )<< 37 ;
        aux |=(numero_longo) ( ( (v>>36)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>18)%2 ) & ! ( (v>>1)%2 ) )<< 38 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>35)%2 ) )<< 39 ;
        aux |=(numero_longo) ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) )<< 40 ;
        aux |=(numero_longo) ( ( ( (v>>18)%2 ) & ! ( (v>>16)%2 ) ) & ! ( (v>>1)%2 ) ) | ( ( ( (v>>38)%2 ) & ! ( (v>>16)%2 ) ) & ! ( (v>>1)%2 ) )<< 41 ;
        aux |=(numero_longo) ( ( ( (v>>45)%2 ) & ! ( (v>>7)%2 ) ) & ! ( (v>>1)%2 ) )<< 42 ;
        aux |=(numero_longo) ( ( (v>>17)%2 ) & ! ( (v>>1)%2 ) )<< 43 ;
        aux |=(numero_longo) ( ( ( ( (v>>28)%2 ) & ! ( (v>>54)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>23)%2 ) )<< 44 ;
        aux |=(numero_longo) ( ( (v>>36)%2 ) & ! ( (v>>1)%2 ) )<< 45 ;
        aux |=(numero_longo) ( ( (v>>28)%2 ) & ! ( (v>>1)%2 ) )<< 46 ;
        aux |=(numero_longo) ( ( (v>>47)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>28)%2 ) & ! ( (v>>1)%2 ) )<< 47 ;
        aux |=(numero_longo) ( ( ( (v>>55)%2 ) & ! ( (v>>5)%2 ) ) & ! ( (v>>1)%2 ) )<< 48 ;
        aux |=(numero_longo) ( ( (v>>33)%2 ) & ! ( (v>>1)%2 ) )<< 49 ;
        aux |=(numero_longo) ( ( (v>>59)%2 ) & ! ( (v>>1)%2 ) ) | ( ( (v>>37)%2 & ( ( ( (v>>49)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 50 ;
        aux |=(numero_longo) ( ( ( ( (v>>49)%2 ) & ! ( (v>>20)%2 ) ) & ! ( (v>>1)%2 ) ) & ! ( (v>>0)%2 ) )<< 51 ;
        aux |=(numero_longo) ( ( ( (v>>29)%2 ) & ! ( (v>>1)%2 ) ) & ! ( (v>>12)%2 ) )<< 52 ;
        aux |=(numero_longo) ( ( (v>>15)%2 & ( ( ( (v>>42)%2 ) ) ) ) & ! ( (v>>1)%2 ) )<< 53 ;
        aux |=(numero_longo) ( (v>>54)%2 )<< 54 ;
        aux |=(numero_longo) ( (v>>55)%2 )<< 55 ;
        aux |=(numero_longo) ( (v>>56)%2 )<< 56 ;
        aux |=(numero_longo) ( (v>>57)%2 )<< 57 ;
        aux |=(numero_longo) ( (v>>58)%2 )<< 58 ;
        aux |=(numero_longo) ( (v>>59)%2 )<< 59 ;

        estado[i] = aux;
    }
    return;
}

void passo_tlf_8(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( ( ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 0 ;
        aux |=(numero_longo) ( ( ( (v>>6)%2 ) * 2 + ( (v>>1)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(numero_longo) ( ( ( (v>>6)%2 ) * 2 + ( (v>>30)%2 ) * -6 + ( (v>>1)%2 ) * -6 + ( (v>>3)%2 ) * -6 + ( (v>>19)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) * 2 + ( (v>>19)%2 ) * -6 + ( (v>>2)%2 ) * -6 + ( (v>>1)%2 ) * -6 + ( (v>>9)%2 ) * -6 + ( (v>>33)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(numero_longo) ( ( ( (v>>10)%2 ) * 2 + ( (v>>21)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 4 ) << 4 ;
        aux |=(numero_longo) ( ( ( (v>>48)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 5 ;
        aux |=(numero_longo) ( ( ( (v>>19)%2 ) * 2 + ( (v>>2)%2 ) * 6 + ( (v>>1)%2 ) * -38 + ( (v>>20)%2 ) * -6 + ( (v>>9)%2 ) * 26 + ( (v>>51)%2 ) * 2) >= 8 ) << 6 ;
        aux |=(numero_longo) ( ( ( (v>>13)%2 ) * 2 + ( (v>>1)%2 ) * -2 + ( (v>>42)%2 ) * -2) >= 2 ) << 7 ;
        aux |=(numero_longo) ( ( ( (v>>12)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 8 ;
        aux |=(numero_longo) ( ( ( (v>>15)%2 ) * 22 + ( (v>>7)%2 ) * 10 + ( (v>>13)%2 ) * 6 + ( (v>>11)%2 ) * -2 + ( (v>>23)%2 ) * 2 + ( (v>>1)%2 ) * -22) >= 28 ) << 9 ;
        aux |=(numero_longo) ( ( ( (v>>31)%2 ) * 2 + ( (v>>37)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 4 ) << 10 ;
        aux |=(numero_longo) ( ( ( (v>>33)%2 ) * 6 + ( (v>>9)%2 ) * -10 + ( (v>>1)%2 ) * -10 + ( (v>>4)%2 ) * 2 + ( (v>>21)%2 ) * 2) >= 4 ) << 11 ;
        aux |=(numero_longo) ( ( ( (v>>48)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>26)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(numero_longo) ( ( ( (v>>15)%2 ) * 2 + ( (v>>14)%2 ) * 2 + ( (v>>53)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 4 ) << 13 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) * 2 + ( (v>>1)%2 ) * -30 + ( (v>>32)%2 ) * 2 + ( (v>>33)%2 ) * 2 + ( (v>>10)%2 ) * 2) >= 2 ) << 14 ;
        aux |=(numero_longo) ( ( ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 15 ;
        aux |=(numero_longo) ( ( ( (v>>36)%2 ) * 2 + ( (v>>16)%2 ) * 2 + ( (v>>1)%2 ) * -10 + ( (v>>23)%2 ) * -10 + 0 * -10 + ( (v>>41)%2 ) * 6) >= 4 ) << 16 ;
        aux |=(numero_longo) ( ( ( (v>>42)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 17 ;
        aux |=(numero_longo) ( ( ( (v>>26)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>52)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(numero_longo) ( ( ( (v>>47)%2 ) * 6 + ( (v>>1)%2 ) * -10 + ( (v>>4)%2 ) * 2 + ( (v>>21)%2 ) * 2) >= 4 ) << 19 ;
        aux |=(numero_longo) ( ( ( (v>>33)%2 ) * 2 + ( (v>>2)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 2 ) << 20 ;
        aux |=(numero_longo) ( ( 0 * 2 + ( (v>>22)%2 ) * 14 + ( (v>>34)%2 ) * -14 + ( (v>>1)%2 ) * -14 + ( (v>>43)%2 ) * -14 + ( (v>>23)%2 ) * 2 + ( (v>>55)%2 ) * 2) >= 16 ) << 21 ;
        aux |=(numero_longo) ( ( ( (v>>47)%2 ) * 2 + ( (v>>1)%2 ) * -14 + ( (v>>32)%2 ) * 2 + ( (v>>46)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) * 2 + ( (v>>1)%2 ) * -14 + ( (v>>47)%2 ) * -14 + ( (v>>32)%2 ) * 2 + ( (v>>33)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(numero_longo) ( ( ( (v>>23)%2 ) * 2 + ( (v>>25)%2 ) * 2 + ( (v>>24)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 4 ) << 24 ;
        aux |=(numero_longo) ( ( ( (v>>23)%2 ) * 6 + ( (v>>46)%2 ) * 2 + ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -6) >= 8 ) << 25 ;
        aux |=(numero_longo) ( ( ( (v>>27)%2 ) * 6 + ( (v>>23)%2 ) * 2 + 0 * 2 + ( (v>>1)%2 ) * -6) >= 8 ) << 26 ;
        aux |=(numero_longo) ( ( ( (v>>10)%2 ) * 2 + ( (v>>47)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 4 ) << 27 ;
        aux |=(numero_longo) ( ( ( (v>>21)%2 ) * 2 + ( (v>>1)%2 ) * -30 + 0 * -30 + ( (v>>44)%2 ) * -30 + ( (v>>40)%2 ) * 2 + ( (v>>24)%2 ) * 2 + ( (v>>26)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(numero_longo) ( ( 0 * 10 + ( (v>>1)%2 ) * -22 + ( (v>>48)%2 ) * 2 + ( (v>>52)%2 ) * -6 + ( (v>>26)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(numero_longo) ( ( ( (v>>26)%2 ) * 2 + ( (v>>46)%2 ) * 2 + ( (v>>37)%2 ) * 2 + ( (v>>33)%2 ) * 2 + ( (v>>9)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 8 ) << 30 ;
        aux |=(numero_longo) ( ( ( (v>>41)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 31 ;
        aux |=(numero_longo) ( ( ( (v>>37)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 32 ;
        aux |=(numero_longo) ( ( ( (v>>37)%2 ) * 14 + ( (v>>1)%2 ) * -50 + ( (v>>50)%2 ) * 14 + ( (v>>11)%2 ) * 2 + ( (v>>51)%2 ) * 2 + ( (v>>20)%2 ) * 2) >= 6 ) << 33 ;
        aux |=(numero_longo) ( ( ( (v>>21)%2 ) * 2 + 0 * -6 + ( (v>>1)%2 ) * -6 + ( (v>>34)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 35 ;
        aux |=(numero_longo) ( ( 0 * 2 + ( (v>>1)%2 ) * -6 + ( (v>>42)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(numero_longo) ( ( ( (v>>36)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>41)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(numero_longo) ( ( ( (v>>36)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>18)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) * 2 + ( (v>>1)%2 ) * -2 + ( (v>>35)%2 ) * -2) >= 2 ) << 39 ;
        aux |=(numero_longo) ( ( ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 40 ;
        aux |=(numero_longo) ( ( ( (v>>18)%2 ) * 2 + ( (v>>16)%2 ) * -6 + ( (v>>1)%2 ) * -6 + ( (v>>38)%2 ) * 2) >= 2 ) << 41 ;
        aux |=(numero_longo) ( ( ( (v>>45)%2 ) * 2 + ( (v>>7)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 2 ) << 42 ;
        aux |=(numero_longo) ( ( ( (v>>17)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 43 ;
        aux |=(numero_longo) ( ( ( (v>>28)%2 ) * 2 + 0 * -2 + ( (v>>1)%2 ) * -2 + ( (v>>23)%2 ) * -2) >= 2 ) << 44 ;
        aux |=(numero_longo) ( ( ( (v>>36)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 45 ;
        aux |=(numero_longo) ( ( ( (v>>28)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 46 ;
        aux |=(numero_longo) ( ( ( (v>>47)%2 ) * 2 + ( (v>>1)%2 ) * -6 + ( (v>>28)%2 ) * 2) >= 2 ) << 47 ;
        aux |=(numero_longo) ( ( 0 * 2 + ( (v>>5)%2 ) * -2 + ( (v>>1)%2 ) * -2) >= 2 ) << 48 ;
        aux |=(numero_longo) ( ( ( (v>>33)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 2 ) << 49 ;
        aux |=(numero_longo) ( ( 0 * 6 + ( (v>>1)%2 ) * -10 + ( (v>>37)%2 ) * 2 + ( (v>>49)%2 ) * 2) >= 4 ) << 50 ;
        aux |=(numero_longo) ( ( ( (v>>49)%2 ) * 2 + ( (v>>20)%2 ) * -2 + ( (v>>1)%2 ) * -2 + ( (v>>0)%2 ) * -2) >= 2 ) << 51 ;
        aux |=(numero_longo) ( ( ( (v>>29)%2 ) * 2 + ( (v>>1)%2 ) * -2 + ( (v>>12)%2 ) * -2) >= 2 ) << 52 ;
        aux |=(numero_longo) ( ( ( (v>>15)%2 ) * 2 + ( (v>>42)%2 ) * 2 + ( (v>>1)%2 ) * -2) >= 4 ) << 53 ;
        aux |=(numero_longo) ( (v>>54)%2 )<< 54 ;
        aux |=(numero_longo) ( (v>>55)%2 )<< 55 ;
        aux |=(numero_longo) ( (v>>56)%2 )<< 56 ;
        aux |=(numero_longo) ( (v>>57)%2 )<< 57 ;
        aux |=(numero_longo) ( (v>>58)%2 )<< 58 ;
        aux |=(numero_longo) ( (v>>59)%2 )<< 59 ;

        estado[i] = aux;
    }
    return;
}

void passo_bool_9(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( (v>>44)%2 )<< 0 ;
        aux |=(numero_longo) ( (v>>18)%2 ) | ( (v>>23)%2 ) | ( (v>>16)%2 ) | ( (v>>24)%2 )<< 1 ;
        aux |=(numero_longo) ( (v>>7)%2 ) | ( (v>>14)%2 )<< 2 ;
        aux |=(numero_longo) ( (v>>42)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 3 ;
        aux |=(numero_longo) ( (v>>22)%2 ) | ( (v>>0)%2 )<< 4 ;
        aux |=(numero_longo) ( (v>>17)%2 )<< 5 ;
        aux |=(numero_longo) ( (v>>43)%2 ) | ( (v>>7)%2 ) | ( (v>>12)%2 )<< 6 ;
        aux |=(numero_longo) ( (v>>0)%2 ) | ( (v>>35)%2 ) | ( (v>>52)%2 )<< 7 ;
        aux |=(numero_longo) ( (v>>46)%2 )<< 8 ;
        aux |=(numero_longo) ( (v>>46)%2 )<< 9 ;
        aux |=(numero_longo) ( (v>>13)%2 )<< 10 ;
        aux |=(numero_longo) ( (v>>39)%2 )<< 11 ;
        aux |=(numero_longo) ( (v>>30)%2 )<< 12 ;
        aux |=(numero_longo) ( (v>>22)%2 ) | ( (v>>12)%2 )<< 13 ;
        aux |=(numero_longo) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 14 ;
        aux |=(numero_longo) ( (v>>21)%2 ) | ( (v>>50)%2 )<< 15 ;
        aux |=(numero_longo) ( (v>>22)%2 ) | ( (v>>0)%2 ) | ( (v>>12)%2 )<< 16 ;
        aux |=(numero_longo) ( (v>>57)%2 )<< 17 ;
        aux |=(numero_longo) ( (v>>22)%2 ) | ( (v>>0)%2 ) | ( (v>>12)%2 )<< 18 ;
        aux |=(numero_longo) ( (v>>40)%2 )<< 19 ;
        aux |=(numero_longo) ( (v>>53)%2 )<< 20 ;
        aux |=(numero_longo) ( (v>>11)%2 )<< 21 ;
        aux |=(numero_longo) ( (v>>34)%2 ) | ( (v>>32)%2 )<< 22 ;
        aux |=(numero_longo) ( (v>>22)%2 ) | ( (v>>0)%2 ) | ( (v>>12)%2 )<< 23 ;
        aux |=(numero_longo) ( (v>>22)%2 ) | ( (v>>12)%2 )<< 24 ;
        aux |=(numero_longo) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 25 ;
        aux |=(numero_longo) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 26 ;
        aux |=(numero_longo) ( (v>>22)%2 ) | ( (v>>0)%2 ) | ( (v>>12)%2 )<< 27 ;
        aux |=(numero_longo) ( (v>>0)%2 ) | ( (v>>12)%2 ) | ( (v>>43)%2 )<< 28 ;
        aux |=(numero_longo) ( (v>>22)%2 ) | ( (v>>43)%2 )<< 29 ;
        aux |=(numero_longo) ( (v>>31)%2 ) | ( (v>>49)%2 )<< 30 ;
        aux |=(numero_longo) ( (v>>48)%2 )<< 31 ;
        aux |=(numero_longo) ( (v>>48)%2 )<< 32 ;
        aux |=(numero_longo) ( (v>>32)%2 )<< 33 ;
        aux |=(numero_longo) ( (v>>31)%2 )<< 34 ;
        aux |=(numero_longo) ( (v>>42)%2 ) | ( (v>>12)%2 )<< 35 ;
        aux |=(numero_longo) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 36 ;
        aux |=(numero_longo) ( (v>>3)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 37 ;
        aux |=(numero_longo) ( (v>>32)%2 )<< 38 ;
        aux |=(numero_longo) ( (v>>47)%2 )<< 39 ;
        aux |=(numero_longo) ( (v>>41)%2 )<< 40 ;
        aux |=(numero_longo) ( (v>>1)%2 )<< 41 ;
        aux |=(numero_longo) ( (v>>38)%2 ) | ( (v>>33)%2 )<< 42 ;
        aux |=(numero_longo) ( (v>>0)%2 ) | ( (v>>22)%2 ) | ( (v>>12)%2 )<< 43 ;
        aux |=(numero_longo) ( (v>>57)%2 )<< 44 ;
        aux |=(numero_longo) ( (v>>8)%2 ) | ( (v>>9)%2 )<< 45 ;
        aux |=(numero_longo) ( (v>>57)%2 ) | ( (v>>19)%2 )<< 46 ;
        aux |=(numero_longo) ( (v>>59)%2 )<< 47 ;
        aux |=(numero_longo) ( (v>>51)%2 )<< 48 ;
        aux |=(numero_longo) ( (v>>45)%2 ) | ( (v>>51)%2 )<< 49 ;
        aux |=(numero_longo) ( (v>>5)%2 )<< 50 ;
        aux |=(numero_longo) ( (v>>54)%2 )<< 51 ;
        aux |=(numero_longo) ( (v>>12)%2 )<< 52 ;
        aux |=(numero_longo) ( (v>>57)%2 ) | ( (v>>15)%2 )<< 53 ;
        aux |=(numero_longo) ( (v>>20)%2 )<< 54 ;
        aux |=(numero_longo) ( (v>>52)%2 )<< 55 ;
        aux |=(numero_longo) ( (v>>22)%2 ) | ( (v>>12)%2 )<< 56 ;
        aux |=(numero_longo) ( (v>>61)%2 )<< 57 ;
        aux |=(numero_longo) ( (v>>22)%2 ) | ( (v>>12)%2 )<< 58 ;
        aux |=(numero_longo) ( (v>>60)%2 )<< 59 ;
        aux |=(numero_longo) ( (v>>1)%2 )<< 60 ;
        aux |=(numero_longo) ( (v>>61)%2 )<< 61 ;

        estado[i] = aux;
    }
    return;
}

void passo_tlf_9(numero_longo * init_rand, numero_longo * estado, numero_longo nSim)
{
    numero_longo v,aux;
    for(numero_longo i = 0; i < nSim; i++)
    {
        aux = v = 0;

        v = init_rand[i];

        aux |=(numero_longo) ( ( ( (v>>44)%2 ) * 2) >= 2 ) << 0 ;
        aux |=(numero_longo) ( ( ( (v>>18)%2 ) * 2 + ( (v>>23)%2 ) * 2 + ( (v>>16)%2 ) * 2 + ( (v>>24)%2 ) * 2) >= 2 ) << 1 ;
        aux |=(numero_longo) ( ( ( (v>>7)%2 ) * 2 + ( (v>>14)%2 ) * 2) >= 2 ) << 2 ;
        aux |=(numero_longo) ( ( ( (v>>42)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 3 ;
        aux |=(numero_longo) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2) >= 2 ) << 4 ;
        aux |=(numero_longo) ( ( ( (v>>17)%2 ) * 2) >= 2 ) << 5 ;
        aux |=(numero_longo) ( ( ( (v>>43)%2 ) * 2 + ( (v>>7)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 6 ;
        aux |=(numero_longo) ( ( ( (v>>0)%2 ) * 2 + ( (v>>35)%2 ) * 2 + ( (v>>52)%2 ) * 2) >= 2 ) << 7 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 8 ;
        aux |=(numero_longo) ( ( ( (v>>46)%2 ) * 2) >= 2 ) << 9 ;
        aux |=(numero_longo) ( ( ( (v>>13)%2 ) * 2) >= 2 ) << 10 ;
        aux |=(numero_longo) ( ( ( (v>>39)%2 ) * 2) >= 2 ) << 11 ;
        aux |=(numero_longo) ( ( ( (v>>30)%2 ) * 2) >= 2 ) << 12 ;
        aux |=(numero_longo) ( ( ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 13 ;
        aux |=(numero_longo) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 14 ;
        aux |=(numero_longo) ( ( ( (v>>21)%2 ) * 2 + ( (v>>50)%2 ) * 2) >= 2 ) << 15 ;
        aux |=(numero_longo) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 16 ;
        aux |=(numero_longo) ( ( ( (v>>57)%2 ) * 2) >= 2 ) << 17 ;
        aux |=(numero_longo) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 18 ;
        aux |=(numero_longo) ( ( ( (v>>40)%2 ) * 2) >= 2 ) << 19 ;
        aux |=(numero_longo) ( ( ( (v>>53)%2 ) * 2) >= 2 ) << 20 ;
        aux |=(numero_longo) ( ( ( (v>>11)%2 ) * 2) >= 2 ) << 21 ;
        aux |=(numero_longo) ( ( ( (v>>34)%2 ) * 2 + ( (v>>32)%2 ) * 2) >= 2 ) << 22 ;
        aux |=(numero_longo) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 23 ;
        aux |=(numero_longo) ( ( ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 24 ;
        aux |=(numero_longo) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 25 ;
        aux |=(numero_longo) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 26 ;
        aux |=(numero_longo) ( ( ( (v>>22)%2 ) * 2 + ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 27 ;
        aux |=(numero_longo) ( ( ( (v>>0)%2 ) * 2 + ( (v>>12)%2 ) * 2 + ( (v>>43)%2 ) * 2) >= 2 ) << 28 ;
        aux |=(numero_longo) ( ( ( (v>>22)%2 ) * 2 + ( (v>>43)%2 ) * 2) >= 2 ) << 29 ;
        aux |=(numero_longo) ( ( ( (v>>31)%2 ) * 2 + ( (v>>49)%2 ) * 2) >= 2 ) << 30 ;
        aux |=(numero_longo) ( ( ( (v>>48)%2 ) * 2) >= 2 ) << 31 ;
        aux |=(numero_longo) ( ( ( (v>>48)%2 ) * 2) >= 2 ) << 32 ;
        aux |=(numero_longo) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 33 ;
        aux |=(numero_longo) ( ( ( (v>>31)%2 ) * 2) >= 2 ) << 34 ;
        aux |=(numero_longo) ( ( ( (v>>42)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 35 ;
        aux |=(numero_longo) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 36 ;
        aux |=(numero_longo) ( ( ( (v>>3)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 37 ;
        aux |=(numero_longo) ( ( ( (v>>32)%2 ) * 2) >= 2 ) << 38 ;
        aux |=(numero_longo) ( ( ( (v>>47)%2 ) * 2) >= 2 ) << 39 ;
        aux |=(numero_longo) ( ( ( (v>>41)%2 ) * 2) >= 2 ) << 40 ;
        aux |=(numero_longo) ( ( ( (v>>1)%2 ) * 2) >= 2 ) << 41 ;
        aux |=(numero_longo) ( ( ( (v>>38)%2 ) * 2 + ( (v>>33)%2 ) * 2) >= 2 ) << 42 ;
        aux |=(numero_longo) ( ( ( (v>>0)%2 ) * 2 + ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 43 ;
        aux |=(numero_longo) ( ( ( (v>>57)%2 ) * 2) >= 2 ) << 44 ;
        aux |=(numero_longo) ( ( ( (v>>8)%2 ) * 2 + ( (v>>9)%2 ) * 2) >= 2 ) << 45 ;
        aux |=(numero_longo) ( ( ( (v>>57)%2 ) * 2 + ( (v>>19)%2 ) * 2) >= 2 ) << 46 ;
        aux |=(numero_longo) ( ( ( (v>>59)%2 ) * 2) >= 2 ) << 47 ;
        aux |=(numero_longo) ( ( ( (v>>51)%2 ) * 2) >= 2 ) << 48 ;
        aux |=(numero_longo) ( ( ( (v>>45)%2 ) * 2 + ( (v>>51)%2 ) * 2) >= 2 ) << 49 ;
        aux |=(numero_longo) ( ( ( (v>>5)%2 ) * 2) >= 2 ) << 50 ;
        aux |=(numero_longo) ( ( ( (v>>54)%2 ) * 2) >= 2 ) << 51 ;
        aux |=(numero_longo) ( ( ( (v>>12)%2 ) * 2) >= 2 ) << 52 ;
        aux |=(numero_longo) ( ( ( (v>>57)%2 ) * 2 + ( (v>>15)%2 ) * 2) >= 2 ) << 53 ;
        aux |=(numero_longo) ( ( ( (v>>20)%2 ) * 2) >= 2 ) << 54 ;
        aux |=(numero_longo) ( ( ( (v>>52)%2 ) * 2) >= 2 ) << 55 ;
        aux |=(numero_longo) ( ( ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 56 ;
        aux |=(numero_longo) ( ( ( (v>>61)%2 ) * 2) >= 2 ) << 57 ;
        aux |=(numero_longo) ( ( ( (v>>22)%2 ) * 2 + ( (v>>12)%2 ) * 2) >= 2 ) << 58 ;
        aux |=(numero_longo) ( ( ( (v>>60)%2 ) * 2) >= 2 ) << 59 ;
        aux |=(numero_longo) ( ( ( (v>>1)%2 ) * 2) >= 2 ) << 60 ;
        aux |=(numero_longo) ( (v>>61)%2 )<< 61 ;


        estado[i] = aux;
    }
    return;
}

void preenche_init_rand(numero_longo * init_rand, numero_longo nSim, unsigned int nEq)
{

    for(numero_longo i = 0; i < nSim; i++)
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
    numero_longo MAX_ESTADO = 0;
    int n;
    string argv2;

    if (argc >= 3) {
        n = atoi(argv[1]);
        argv2 = argv[2];
    } else {
        printf("\nERROR: Number of parameters insufficient\n");
        printf("Example: ./a.out 1 1000\n\n");
        return 1;
    }

    printf("%s, ", NAME[n].c_str());

    for(int i = 0; i < argv2.size(); i++)
        MAX_ESTADO += ((unsigned long int)(argv2[i] - '0'))*pow(10,argv2.size()-i-1);

    //alocando vetores
    numero_longo *init_rand, *estado;
    init_rand = new numero_longo[MAX_ESTADO];
    estado = new numero_longo[MAX_ESTADO];
    double total = 0.0;
    int ntest = 3;

    unsigned int nEq =64;
    // srand(MAX_ESTADO);
    preenche_init_rand(init_rand,MAX_ESTADO,nEq);

    for (int i = 0; i < ntest; ++i){
        auto start = chrono::steady_clock::now();
        switch (n) {
            case 0: passo_bool_1(init_rand,estado,MAX_ESTADO); break;
            case 1: passo_tlf_1(init_rand,estado,MAX_ESTADO); break;
            case 2: passo_bool_2(init_rand,estado,MAX_ESTADO); break;
            case 3: passo_tlf_2(init_rand,estado,MAX_ESTADO); break;
            case 4: passo_bool_3(init_rand,estado,MAX_ESTADO); break;
            case 5: passo_tlf_3(init_rand,estado,MAX_ESTADO); break;
            case 6: passo_bool_5(init_rand,estado,MAX_ESTADO); break;
            case 7: passo_tlf_5(init_rand,estado,MAX_ESTADO); break;
            case 8: passo_bool_6(init_rand,estado,MAX_ESTADO); break;
            case 9: passo_tlf_6(init_rand,estado,MAX_ESTADO); break;
            case 10: passo_bool_7(init_rand,estado,MAX_ESTADO); break;
            case 11: passo_tlf_7(init_rand,estado,MAX_ESTADO); break;
            case 12: passo_bool_8(init_rand,estado,MAX_ESTADO); break;
            case 13: passo_tlf_8(init_rand,estado,MAX_ESTADO); break;
            case 14: passo_bool_9(init_rand,estado,MAX_ESTADO); break;
            case 15: passo_tlf_9(init_rand,estado,MAX_ESTADO); break;
            default: passo_bool_1(init_rand,estado,MAX_ESTADO); break;
        }
        auto end = chrono::steady_clock::now();
        total += (double) chrono::duration_cast<chrono::milliseconds>(end-start).count();
    }

    printf("%lld, Tempo: %.20lf, M Estados/s: %.20lf\n", MAX_ESTADO, total/ntest, (MAX_ESTADO/(total/ntest))/1000);
    return 0;
}
