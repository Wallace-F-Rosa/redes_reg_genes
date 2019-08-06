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
__global__ void passo_bool_1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{   
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        estado[tid] = aux;
    }
}

unsigned long long confere_bool_1(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];


        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_1(ulonglong3 * init_rand, ulonglong3 * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        

    
        estado[tid] = aux;
    }
}

unsigned long long confere_tlf_1(ulonglong3 * init_rand, ulonglong3 * estado_gpu, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        

        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}



void preenche_init_rand(ulonglong3 * init_rand, unsigned long long nSim, unsigned int nEq)
{
    
    for(unsigned long long i = 0; i < nSim; i++)
    {
        
        init_rand[i] = 0;
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
        h_estado[i] = 0;

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

    unsigned long long i = confere_tlf_6(h_init_rand,h_estado,MAX_ESTADO);
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