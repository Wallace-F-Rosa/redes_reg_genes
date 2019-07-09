#include <iostream>
#include <vector>
#include <map>
using namespace std;
#include <math.h>

#define DEBUG

#define MAX_IN 1024
#define MAX_STAGE 14
#define MAX_EXTRA 4

char MINA[MAX_IN][MAX_STAGE];
bool MINA_FREE[MAX_IN][MAX_STAGE];


/*
radix 4
IN = 64, ST= 3, EX=1
*/
int ST; // stage number
int IN; // input number
int MASK;

int window(int word, int column) {
 return (word >> (2*(ST)-2*(column+1))) & MASK;
}

int switch_code(int word, int column) {
 return (word >> (2*(2*ST-1)-2*column)) & 3;
}

void clean(int st, int in) {
  for (int i=0; i < in ; i++) {
	for (int j=0; j<(st); j++) {
		MINA_FREE[i][j] = true;
	} // for j
  } // for
} // clean

void init_MIN(int st,int in) {
	ST = st;
	IN = in;
	MASK = IN-1;
	clean(st,in);
} // init_MIN

// multicast, radix4, 2 networks

bool route(int a, int b) {	
bool result = true;
int word;
int line;
int in_switch;
// from out stage to in stage, j is the Column

  result = true;
  word = b | (a << (2*ST)); 
  for (int j=0; j < ST; j++) {
	line = window(word,j);
	cout << "A line " << line << " col " << j <<endl;
	in_switch = switch_code(word,j);
        cout << "code " << in_switch << endl;
        if (!MINA_FREE[line][j]) {
	    //cout << "No free, check mux " << in_switch << endl;
	    result = result && (MINA[line][j]==in_switch);
	} 	
  } // for
  if (result) { // sucessful route in A
	for (int j=0; j < ST; j++) {
	  	line = window(word,j);
		MINA_FREE[line][j] = false;
		in_switch = switch_code(word,j);
        	MINA[line][j] = in_switch; 	
  	} // for
	cout << "OK A" << endl;
	return result;
  } 
return false;
} // route without extra


struct grafo
{
	int nv;//numero de vértices
	int na;
	int * e[2]; //lista de arestas
};

int main ()
{
	
	//o grafo será lido em phyton posteriormente e sera gerada uma lista de vertices e arestas
   //gerar lista de vértices na mao e ler
   //gerar lista de arestas na mao e ler
	grafo g;
	cin >> g.nv;
	string v;
	map<string,int> V;
	int k = 0;
	for(int i=0; i<g.nv; i++)
	{
		cin >> v;
		if(V.count(v) == 0)
			V[v] = k++;
		//cout << v << " ";
	}	
	//cout << "\n";
	
	cin >> g.na;
	string * e[2];
	e[0] = new string[g.na];
	e[1] = new string[g.na];
	g.e[0] = new int[g.na];
	g.e[1] = new int[g.na];
	string n,m;

	for(int i=0; i<g.na; i++)
	{
		cin >> n >> m;
		//cout << n << " " << m <<"\n";
		e[0][i] = n;
		e[1][i] = m;
		g.e[0][i] = V[n];
		g.e[1][i] = V[m];
	}
	
	cout << "input = ";
	IN = g.nv*2;
	cout << IN << "\n";
	cout << "stage = ";
	ST = log2(IN)/log2(4);
	cout << ST << "\n";

	init_MIN(ST, IN);

	int PE[g.nv];
	for(int i = 0; i < g.nv; i++)
		PE[i] = i*2;
	
	bool freePE[g.nv] = {false};

	int sucess = 0;
	for(int i = 0; i < g.na; i++)
	{
		int a,b;
		a = PE[g.e[0][i]];
		b = PE[g.e[1][i]];
		cout << "a b = "<<e[0][i] << " "<<e[1][i] << "("<<g.e[0][i]<<" "<<g.e[1][i] << ")"<<"\n";
		bool r;
		/* do
		{
			
				cin >> a >> b;
		}while(!r && next_PE < g.nv); */
		r = route(a,b);
		if ( !r ) cout << "Fail" << endl;
		else sucess++;
	}
	
	cout <<"Conexoes totais : " << g.na <<"\n";
	cout <<"Conexoes estabelecidas : "<<sucess <<"\n";

	return 0;
}




