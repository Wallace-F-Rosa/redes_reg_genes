#include <iostream>
#include <chrono>
#include <cmath>
#include <string>
#include <limits>
#include <stdio.h>

#define CLOCKS_PER_SEC_CPU 1100000000
using namespace std;

struct ulonglong3{
    unsigned long long x,y,z;
}

const string NAME[] = {"passo_bool_1", "passo_tlf_1", "passo_bool_2", "passo_tlf_2", "passo_bool_3", "passo_tlf_3",
                       "passo_bool_5", "passo_tlf_5", "passo_bool_6", "passo_tlf_6", "passo_bool_7", "passo_tlf_7",
                       "passo_bool_8", "passo_tlf_8", "passo_bool_9", "passo_tlf_9"};

void passo_bool_1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        

        estado[i] = aux;
    }
}


void passo_tlf_1(unsigned long long * init_rand, unsigned long long * estado, unsigned long long nSim)
{  
    unsigned long long v,aux;
    for(unsigned long long i = 0; i < nSim; i++)
    {   
        aux = v = 0;
        
        v = init_rand[i];

        

        estado[i] = aux;

    }
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
    unsigned long long *init_rand, *estado;
    init_rand = new unsigned long long[MAX_ESTADO];
    estado = new unsigned long long[MAX_ESTADO];
    double total = 0.0;
    int ntest = 3;
    
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
        total += (double) chrono::duration_cast<chrono::nanoseconds>(end-start).count();
    }

    printf("%lld, %.20lf, %.20lf\n", MAX_ESTADO, total/ntest, MAX_ESTADO/(total/ntest));
    return 0;
}
