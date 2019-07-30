#include <iostream>
#include <chrono>
#include <string>
#include <limits>
#include <stdio.h>

#define CLOCKS_PER_SEC_CPU 1100000000
using namespace std;

__global__ void passo_bool_Apoptosis_Network(unsigned long long * d_v)
{
    __shared__ bool etc;
    unsigned long long v=0,aux=0;
    //bool v[4] = {true};
    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    
    v = tid;
    
    aux |= (( v>>3 )%2)<<3;
    aux |= (( v>>2 )%2 <<2);
    aux |= ( ( (v>>1)%2 & ( ( ( (v>>3)%2 & (v>>2)%2 ) ) ) ) & ! ( (v>>1)%2 ) ) << 2;
    aux |= ( (v>>3)%2 ) << 3;
    /*v[4] = ( ( v[38] ) & ! ( v[1] ) );
    v[5] = ( ( v[20] & ( ( ( v[38] ) ) ) ) & ! ( v[6] ) ) | ( ( v[12] & ( ( ( v[38] ) ) ) ) & ! ( v[6] ) );
    v[6] = ( ( ( v[25] ) & ! ( v[4] ) ) & ! ( v[38] ) );
    v[7] = ( v[11] );
    v[8] = ( ( v[2] ) & ! ( v[17] ) ) | ( ( v[12] ) & ! ( v[17] ) ) | ( v[10] );
    v[9] = ( v[8] );
    v[10] = ( ( v[8] ) & ! ( v[17] ) );
    v[11] = ( ( v[2] ) & ! ( v[17] ) ) | ( ( v[12] ) & ! ( v[17] ) );
    v[12] = ( ( v[10] ) & ! ( v[37] ) ) | ( ( v[15] ) & ! ( v[37] ) );
    v[13] = ( ( ( v[8] ) & ! ( v[1] ) ) & ! ( v[17] ) ) | ( ( ( v[7] ) & ! ( v[1] ) ) & ! ( v[17] ) );
    v[14] = ( v[9] & ( ( ( v[8] ) ) ) );
    v[15] = ( v[34] );
    v[16] = ( v[39] );
    v[17] = ( ( ( v[25] ) & ! ( v[24] ) ) & ! ( v[8] & ( ( ( v[10] ) ) ) ) );
    v[18] = ( ( v[1] ) & ! ( v[0] ) ) | ( ( v[26] ) & ! ( v[0] ) );
    v[19] = ( ( v[25] ) & ! ( v[18] ) );
    v[20] = ( v[21] );
    v[21] = ( ( v[22] ) & ! ( v[1] ) );
    v[22] = ( v[35] );
    v[23] = ( v[1] ) | ( v[38] );
    v[24] = ( ( v[5] ) & ! ( v[6] ) );
    v[25] = ! ( ( v[19] ) );
    v[26] = ( v[36] );
    v[27] = ( v[16] );
    v[28] = ( v[16] );
    v[29] = ( ( v[27] & ( ( ( v[28] ) ) ) ) & ! ( v[30] ) );
    v[30] = ( v[38] );
    v[31] = ( v[34] );
    v[32] = ( v[40] );
    v[33] = ( v[40] );
    v[34] = ( v[32] );
    v[35] = ( v[34] );
    v[36] = ( v[31] );
    v[37] = ( v[35] );
    v[38] = ( ( v[20] ) & ! ( v[23] ) ) | ( ( v[14] ) & ! ( v[23] ) ); */
    
    d_v[tid] = aux;
}


/* __global__ void passo_bool_IL_6_Signaling(bool * d_v)
{
    __shared__ bool etc;
    bool v[87] = {true};

    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;
    
    for(int i = 0; i < 87; i++)
        v[i] = (tid>>i)%2;

    v[0] = ( ( v[63] ) & !( v[71] ) );
    v[1] = ( ( ( v[72] & ( ( ( v[42] & v[46] ) ) ) ) & !( v[73] ) ) & !( v[74] ) );
    v[2] = ( ( ( ( v[63] ) & !( v[27] ) ) & !( v[7] ) ) & !( v[3] ) );
    v[3] = ( !( ( v[1] ) ) ) | !( v[1] );
    v[4] = ( v[30] );
    v[5] = ( v[4] );
    v[6] = ( v[5] );
    v[7] = ( !( ( v[1] ) ) ) | !( v[1] );
    v[8] = ( v[63] ) | ( v[43] );
    v[9] = ( v[63] );
    v[10] = ( v[63] );
    v[11] = ( v[63] );
    v[12] = ( ( v[10] & ( ( ( v[63] ) ) ) ) & !( v[71] ) );
    v[13] = ( v[8] ) | ( v[9] );
    v[14] = ( v[34] ) | ( v[75] );
    v[15] = ( v[24] ) | ( v[25] );
    v[16] = ( v[29] ) | ( v[26] );
    v[17] = ( v[47] ) | ( v[41] );
    v[18] = ( v[47] ) | ( v[6] );
    v[19] = ( v[36] );
    v[20] = ( !( ( v[1] ) ) ) | !( v[1] );
    v[21] = ( v[26] ) | ( v[19] & ( ( ( v[46] ) ) ) );
    v[22] = ( v[21] & ( ( ( v[14] ) ) ) );
    v[23] = ( !( ( v[6] ) | ( v[40] ) ) ) | !( v[40] | v[6] );
    v[24] = ( v[76] );
    v[25] = ( ( v[76] ) & !( v[23] ) );
    v[26] = ( v[29] ) | ( v[56] );
    v[27] = ( !( ( v[1] ) ) ) | !( v[1] );
    v[28] = ( v[77] & ( ( ( v[15] ) ) ) );
    v[29] = ( ( ( v[28] & ( ( ( v[34] ) ) ) ) & !( v[57] ) ) & !( v[56] ) );
    v[30] = ( v[48] );
    v[31] = ( !( ( v[59] ) | ( v[58] ) ) ) | !( v[58] | v[59] );
    v[32] = ( v[47] ) | ( v[19] );
    v[33] = ( !( ( v[32] ) | ( v[56] ) | ( v[57] ) ) ) | !( v[32] | v[56] | v[57] );
    v[34] = ( !( ( v[58] ) | ( v[56] ) | ( v[57] ) | ( v[59] ) ) ) | !( v[56] | v[58] | v[57] | v[59] );
    v[35] = ( v[63] );
    v[36] = ( v[52] );
    v[37] = ( v[39] );
    v[38] = ( v[29] );
    v[39] = ( v[51] );
    v[40] = ( v[43] );
    v[41] = ( v[78] );
    v[42] = ( v[78] );
    v[43] = ( v[38] );
    v[44] = ( v[41] ) | ( v[1] ) | ( v[19] );
    v[45] = ( v[22] & ( ( ( v[79] ) ) ) ) | ( v[53] );
    v[46] = ( ( v[45] ) & !( v[80] ) );
    v[47] = ( v[37] );
    v[48] = ( v[22] );
    v[49] = ( v[9] ) | ( v[8] );
    v[50] = ( ( v[63] ) | ( v[44] ) | ( v[6] ) | ( v[19] ) ) | !( v[8] | v[63] | v[44] | v[20] | v[19] | v[6] );
    v[51] = ( v[70] );
    v[52] = ( v[53] );
    v[53] = ( ( v[26] ) & !( v[54] ) );
    v[54] = ( ( v[22] ) & !( v[57] ) );
    v[55] = ( v[13] & ( ( ( v[71] & v[63] ) ) ) );
    v[56] = ( ( ( ( v[29] & ( ( ( v[34] ) ) ) ) & !( v[81] ) ) & !( v[59] ) ) & !( v[82] ) );
    v[57] = ( ( ( v[22] & ( ( ( v[56] ) ) ) ) & !( v[82] ) ) & !( v[81] ) );
    v[58] = ( v[63] );
    v[59] = ( v[43] ) | ( v[71] ) | ( v[63] ) | ( v[19] );
    v[60] = ( ( ( ( v[29] & ( ( ( v[34] ) ) ) ) & !( v[56] ) ) & !( v[83] ) ) & !( v[57] ) );
    v[61] = ( ( ( v[18] & ( ( ( v[60] ) ) ) ) & !( v[84] ) ) & !( v[85] ) );
    v[62] = ( ( ( ( v[29] & ( ( ( v[34] ) ) ) ) & !( v[56] ) ) & !( v[83] ) ) & !( v[57] ) );
    v[63] = ( ( ( v[17] & ( ( ( v[62] ) ) ) ) & !( v[84] ) ) & !( v[86] ) );
    v[64] = ( v[56] ) | ( v[57] );
    v[65] = ( v[56] ) | ( v[57] );
    v[66] = ( v[56] ) | ( v[57] );
    v[67] = ( v[58] );
    v[68] = ( v[59] );
    v[69] = ( v[8] ) | ( v[9] );
    v[70] = ( ( v[16] ) & !( v[58] ) );
    for(int i = 0; i < 87; i++)
        etc ^= v[i];
}



__global__ void passo_bool_CD4_T_cell_signaling(bool * d_v)
{
    
    bool v[188]={true};

    unsigned long long tid = threadIdx.x + blockIdx.x* blockDim.x;

    for(int i = 0; i < 188; i++)
        v[i] = (tid>>i)%2;

    v[0] = ( v[105] );
    v[1] = ( v[131] ) | ( v[86] ) | ( v[24] );
    v[2] = ( v[103] );
    v[3] = ( v[101] ) | ( v[147] );
    v[4] = ( v[9] );
    v[5] = ( v[120] );
    v[6] = ( v[4] & ( ( ( v[9] ) ) ) );
    v[7] = ( v[154] ) | ( v[141] );
    v[8] = ( v[20] );
    v[9] = ( v[11] ) | ( v[109] );
    v[10] = ( v[138] ) | ( v[155] ) | ( v[7] );
    v[11] = ( v[10] );
    v[12] = ( v[156] ) | ( v[157] );
    v[13] = ( v[141] );
    v[14] = ( v[141] & ( ( ( v[158] & v[13] ) ) ) );
    v[15] = ( v[76] );
    v[16] = ( v[15] );
    v[17] = ( v[26] & ( ( ( v[7] ) ) ) );
    v[18] = ( v[8] ) | ( v[123] );
    v[19] = ( ! ( ( v[88] ) ) ) | ! ( v[88] );
    v[20] = ( v[17] ) | ( v[112] );
    v[21] = ( v[110] ) | ( v[111] );
    v[22] = ( v[34] );
    v[23] = ( v[150] );
    v[24] = ( v[90] );
    v[25] = ( v[131] );
    v[26] = ( v[27] & ( ( ( v[138] ) ) ) );
    v[27] = ( v[7] );
    v[28] = ( ( ( v[126] & ( ( ( v[132] & v[97] ) ) ) ) & ! ( v[130] & ( ( ( v[118] ) ) ) ) ) & ! ( v[129] ) ) | ( v[97] & ( ( ( v[28] & v[132] ) ) ) );
    v[29] = ( v[13] & ( ( ( v[141] ) ) ) ) | ( v[10] );
    v[30] = ( v[3] & ( ( ( v[37] ) ) ) );
    v[31] = ( v[136] & ( ( ( v[43] ) ) ) );
    v[32] = ( v[159] & ( ( ( v[141] ) ) ) );
    v[33] = ( v[13] ) | ( v[159] );
    v[34] = ( v[22] ) | ( ( v[134] ) & ! ( v[140] ) );
    v[35] = ( v[141] ) | ( v[134] );
    v[36] = ( ! ( ( v[0] ) ) ) | ! ( v[0] );
    v[37] = ( v[113] );
    v[38] = ( v[87] );
    v[39] = ( v[160] );
    v[40] = ( v[161] );
    v[41] = ( v[162] );
    v[42] = ( v[163] );
    v[43] = ( v[87] ) | ( v[136] );
    v[44] = ( v[140] );
    v[45] = ( v[156] );
    v[46] = ( v[164] );
    v[47] = ( ( ( v[131] & ( ( ( v[151] & v[97] ) ) ) ) & ! ( v[28] ) ) & ! ( v[130] ) ) | ( ( ( v[2] ) & ! ( v[28] ) ) & ! ( v[130] ) ) | ( ( ( v[1] & ( ( ( v[131] ) ) ) ) & ! ( v[28] ) ) & ! ( v[130] ) ) | ( ( ( v[119] & ( ( ( v[140] & v[151] & v[97] ) ) ) ) & ! ( v[28] ) ) & ! ( v[130] ) ) | ( ( ( v[44] ) & ! ( v[28] ) ) & ! ( v[130] ) );
    v[48] = ( v[47] & ( ( ( v[165] & v[166] ) ) ) ) | ( v[167] & ( ( ( v[165] & v[166] ) ) ) );
    v[49] = ( ! ( ( v[50] ) ) ) | ! ( v[50] );
    v[50] = ( v[6] ) | ( v[99] ) | ( v[141] );
    v[51] = ( v[97] & ( ( ( v[34] | v[130] ) & ( ( ( v[151] ) ) ) ) ) );
    v[52] = ( v[51] & ( ( ( v[168] & v[169] ) ) ) ) | ( v[170] & ( ( ( v[168] & v[169] ) ) ) );
    v[53] = ( v[78] ) | ( v[159] );
    v[54] = ( v[159] );
    v[55] = ( v[171] & ( ( ( v[172] & v[173] & v[174] ) ) ) );
    v[56] = ( ( ( ( v[97] & ( ( ( v[130] & v[98] & v[151] & v[118] ) ) ) ) & ! ( v[129] & ( ( ( v[28] ) ) ) ) ) & ! ( v[134] & ( ( ( v[28] ) ) ) ) ) & ! ( v[132] & ( ( ( v[28] ) ) ) ) );
    v[57] = ( v[175] );
    v[58] = ( ( ( v[97] & ( ( ( ! v[28] ) ) ) ) & ! ( v[140] & ( ( ( v[98] ) ) ) ) ) & ! ( v[132] & ( ( ( v[134] ) ) ) ) ) | ( ( ( v[98] ) & ! ( v[140] & ( ( ( v[98] ) ) ) ) ) & ! ( v[132] & ( ( ( v[134] ) ) ) ) );
    v[59] = ( v[97] & ( ( ( v[130] & v[151] ) ) ) );
    v[60] = ( v[176] & ( ( ( v[177] & v[171] ) ) ) ) | ( v[59] & ( ( ( v[177] & v[171] ) ) ) );
    v[61] = ( v[131] ) | ( v[129] ) | ( v[132] ) | ( v[130] );
    v[62] = ( v[178] );
    v[63] = ( v[97] & ( ( ( v[130] & v[151] ) ) ) );
    v[64] = ( v[63] & ( ( ( v[53] & v[177] & v[130] & v[118] ) ) ) ) | ( v[179] & ( ( ( v[53] & v[177] & v[130] & v[118] ) ) ) );
    v[65] = ( v[177] & ( ( ( v[180] & v[181] ) ) ) );
    v[66] = ( v[58] & ( ( ( v[171] & v[173] ) & ( ( ( ! v[67] ) ) ) ) ) ) | ( v[182] & ( ( ( v[171] & v[173] ) & ( ( ( ! v[67] ) ) ) ) ) );
    v[67] = ( v[28] & ( ( ( v[97] ) ) ) ) | ( v[132] & ( ( ( v[97] ) ) ) ) | ( v[126] & ( ( ( v[97] ) ) ) ) | ( v[98] & ( ( ( v[97] ) ) ) );
    v[68] = ( v[58] & ( ( ( v[67] & v[171] & v[173] ) ) ) ) | ( v[182] & ( ( ( v[67] & v[171] & v[173] ) ) ) );
    v[69] = ( v[79] ) | ( ( ( ( v[34] & ( ( ( v[151] & v[97] ) ) ) ) & ! ( v[28] ) ) & ! ( v[140] & ( ( ( v[119] ) ) ) ) ) & ! ( v[78] ) );
    v[70] = ( v[69] & ( ( ( v[71] & v[171] ) ) ) ) | ( v[183] & ( ( ( v[71] & v[171] ) ) ) );
    v[71] = ( ! ( ( v[133] ) ) ) | ! ( v[133] );
    v[72] = ( v[133] );
    v[73] = ( v[69] & ( ( ( v[171] & v[72] ) ) ) ) | ( v[183] & ( ( ( v[171] & v[72] ) ) ) );
    v[74] = ( v[177] & ( ( ( v[184] & v[185] ) ) ) );
    v[75] = ( v[186] ) | ( v[85] );
    v[76] = ( v[111] );
    v[77] = ( v[57] );
    v[78] = ( v[129] );
    v[79] = ( v[34] );
    v[80] = ( v[152] );
    v[81] = ( v[89] );
    v[82] = ( v[125] );
    v[83] = ( ( v[85] ) & ! ( v[128] ) ) | ( ( v[66] ) & ! ( v[128] ) ) | ( ( v[75] ) & ! ( v[128] ) ) | ( ( v[62] ) & ! ( v[128] ) );
    v[84] = ( v[53] & ( ( ( v[54] ) ) ) );
    v[85] = ( v[66] );
    v[86] = ( v[152] & ( ( ( v[20] ) ) ) ) | ( v[92] ) | ( v[95] );
    v[87] = ( v[148] );
    v[88] = ( v[104] ) | ( v[117] );
    v[89] = ( v[12] ) | ( v[85] & ( ( ( v[173] ) ) ) ) | ( v[14] );
    v[90] = ( v[114] ) | ( v[5] ) | ( v[104] );
    v[91] = ( v[94] );
    v[92] = ( v[94] );
    v[93] = ( v[94] );
    v[94] = ( v[32] & ( ( ( v[33] ) ) ) );
    v[95] = ( v[139] );
    v[96] = ( v[117] );
    v[97] = ( v[12] & ( ( ( v[141] ) ) ) ) | ( v[141] & ( ( ( v[12] ) ) ) ) | ( ( v[16] & ( ( ( v[103] ) ) ) ) & ! ( v[36] ) );
    v[98] = ( ! ( ( v[49] ) | ( v[28] ) ) ) | ! ( v[28] | v[49] );
    v[99] = ( v[144] );
    v[100] = ( v[10] );
    v[101] = ( v[18] ) | ( v[102] & ( ( ( v[146] ) ) ) );
    v[102] = ( v[125] );
    v[103] = ( v[91] ) | ( v[93] );
    v[104] = ( v[152] ) | ( v[18] ) | ( v[102] );
    v[105] = ( v[107] );
    v[106] = ( v[12] & ( ( ( v[45] ) ) ) ) | ( v[66] ) | ( v[124] ) | ( v[31] ) | ( v[121] ) | ( v[26] );
    v[107] = ( v[106] );
    v[108] = ( v[150] );
    v[109] = ( v[21] );
    v[110] = ( v[41] );
    v[111] = ( v[148] ) | ( v[82] ) | ( v[87] );
    v[112] = ( v[26] );
    v[113] = ( v[116] );
    v[114] = ( v[121] );
    v[115] = ( v[21] );
    v[116] = ( v[120] );
    v[117] = ( v[122] );
    v[118] = ( v[143] & ( ( ( v[130] ) ) ) ) | ( v[118] & ( ( ( v[143] | v[130] ) ) ) );
    v[119] = ( ( v[140] ) & ! ( v[34] ) );
    v[120] = ( v[23] ) | ( v[8] & ( ( ( v[20] ) ) ) ) | ( v[108] );
    v[121] = ( v[137] ) | ( v[115] );
    v[122] = ( v[123] ) | ( v[10] );
    v[123] = ( v[39] ) | ( v[26] );
    v[124] = ( v[31] ) | ( v[173] );
    v[125] = ( v[148] ) | ( v[38] );
    v[126] = ( v[143] );
    v[127] = ( v[134] ) | ( v[130] );
    v[128] = ( v[130] );
    v[129] = ( ( v[46] ) & ! ( v[127] ) ) | ( ( v[48] ) & ! ( v[127] ) ) | ( ( v[65] ) & ! ( v[127] ) );
    v[130] = ( v[60] ) | ( v[65] ) | ( v[74] ) | ( v[64] ) | ( v[52] );
    v[131] = ( ( v[103] & ( ( ( v[145] ) ) ) ) & ! ( v[34] ) ) | ( ( v[84] ) & ! ( v[34] ) );
    v[132] = ( v[66] ) | ( v[70] ) | ( v[55] ) | ( v[135] ) | ( v[89] ) | ( v[83] );
    v[133] = ( v[73] ) | ( v[68] );
    v[134] = ( v[70] );
    v[135] = ( v[66] );
    v[136] = ( v[29] ) | ( v[173] & ( ( ( v[66] ) ) ) );
    v[137] = ( v[43] );
    v[138] = ( v[7] ) | ( v[27] );
    v[139] = ( v[144] );
    v[140] = ( ( v[140] ) & ! ( v[34] ) ) | ( ( v[129] ) & ! ( v[34] ) );
    v[141] = ( v[156] & ( ( ( v[12] ) ) ) );
    v[142] = ( v[28] & ( ( ( v[151] & v[97] ) ) ) );
    v[143] = ( v[142] ) | ( v[187] );
    v[144] = ( v[77] );
    v[145] = ( v[53] & ( ( ( v[54] ) ) ) );
    v[146] = ( v[125] );
    v[147] = ( v[80] & ( ( ( v[152] ) ) ) );
    v[148] = ( v[81] & ( ( ( v[13] ) ) ) );
    v[149] = ( v[40] );
    v[150] = ( v[149] );
    v[151] = ( v[151] ) | ( v[133] );
    v[152] = ( v[153] ) | ( v[100] ) | ( v[20] & ( ( ( v[112] ) ) ) ) | ( v[146] );
    v[153] = ( v[138] );
    for(int i = 0; i < 188; i++)
        d_v[i] = v[i];
}
 */

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
    unsigned long long *d_v;
    cudaMalloc(&d_v,sizeof(unsigned long long)*MAX_ESTADO);
    cudaEvent_t start,stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    float elapsedTime=0;

    cudaEventRecord(start);

    passo_bool_Apoptosis_Network<<<grid,block>>>(d_v);
    cudaEventRecord(stop);

    cudaEventSynchronize(stop);
    cudaEventElapsedTime(&elapsedTime, start, stop);
    cout.precision(20);
    cout <<"\n" << (elapsedTime) << " ms\n";
    
    cudaFree(d_v);
    return 0;
}