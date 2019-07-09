program = atratores
arch = sm_30
metrics =--metrics all#--metrics shared_load_transactions_per_request --metrics shared_store_transactions_per_request

simN = 10000000 #numero de simulações
input = pesosTabela.txt #grafo
output = saidaGPU.txt #arquivo de saida
tecnologia = GPU # escolhe se vai rodar a função da CPU ou a função da GPU

all:
	nvcc -arch=$(arch) -lineinfo $(program).cu -o $(program)
	#./$(program)
	./$(program) $(input) $(simN) $(tecnologia)

analise:
	nvprof --unified-memory-profiling off  ./$(program) $(input) $(simN) $(tecnologia)

options = 

memcheck:
	cuda-memcheck ./$(program) $(input) $(simN) |more

clean:
	rm $(program) $(output) saidaCPU.txt saidaGPU.txt