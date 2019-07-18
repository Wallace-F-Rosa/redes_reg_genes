program =atratores
arch =sm_30
metrics =--metrics all --unified-memory-profiling off #--metrics shared_load_transactions_per_request --metrics shared_store_transactions_per_request

simN =20000000#numero de simulações
rede = Apoptosis network
input ="../rede_pesos/eq_pesos/40-100/$(rede).txt"#grafo
tecnologia =GPU# escolhe se vai rodar a função da CPU ou a função da GPU
output ="resultados_$(tecnologia)/$(rede)_$(simN).txt"#arquivo de saida
REDE =41#sed "1q;d" $(input)
PESOS =75#sed "2q;d" $(input) | awk '{ for(i=1; i<=NF;i++) j+=$i; print j; j=0 }'
all:
	nvcc -DCONSTANTE_REDE=$(REDE) -DCONSTANTE_PESOS=$(PESOS) $(program).cu -o $(program)
	./$(program) $(input) $(simN) $(tecnologia) > $(output)

analise:
	nvprof --device-buffer-size 600 --profiling-semaphore-pool-size 600 ./$(program) $(input) $(simN) $(tecnologia) > $(output)

memcheck:
	cuda-memcheck ./$(program) $(input) $(simN) |more

clean:
	rm -r -f .nvprof
	rm $(program)
