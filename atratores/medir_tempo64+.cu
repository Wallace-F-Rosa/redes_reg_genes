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


        if(aux != estado_gpu[i]){
            cerr << "Estado : " << init_rand[i] << " Posição :"<<i<<"\n";
            cerr << "GPU : " << estado_gpu[i] << "\n" << "CPU : " << aux << "\n";
            return i;
        } 
    }
    
    return nSim;
}

__global__ void passo_tlf_1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long MAX_ESTADO)
{
    unsigned long long v=0,aux=0, tid = threadIdx.x + blockIdx.x* blockDim.x;
    if(tid < MAX_ESTADO)
    {
        v = init_rand[tid];
    
        

    
        estado[tid] = aux;
    }
}

unsigned long long confere_tlf_1(unsigned long long * init_rand, unsigned long long * estado_gpu, unsigned long long nSim)
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

    for(unsigned long long i = 0; i < MAX_ESTADO; i++)
        h_estado[i] = 0;

    cudaMemcpy(d_init_rand, h_init_rand, sizeof(unsigned long long)*MAX_ESTADO, cudaMemcpyHostToDevice);
    cudaMemcpy(d_estado, h_estado, sizeof(unsigned long long)*MAX_ESTADO, cudaMemcpyHostToDevice);

    passo_tlf_6_parte1<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
    cudaDeviceSynchronize();
    passo_tlf_6_parte2<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
    cudaDeviceSynchronize();
    passo_tlf_6_parte3<<<grid,block>>>(d_init_rand,d_estado,MAX_ESTADO);
    cudaDeviceSynchronize();
    cudaMemcpy(h_estado, d_estado, sizeof(unsigned long long)*MAX_ESTADO, cudaMemcpyDeviceToHost);

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