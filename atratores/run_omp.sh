echo "Compiling"
g++ medirtempo_omp.cpp -std=c++11 -fopenmp -o cpu_omp.out

g++ medirtempo_omp.cpp -std=c++11 -O3 -fopenmp -o cpu_omp_o3.out

FUNC=("passo_bool_1", "passo_tlf_1", "passo_bool_2", "passo_tlf_2", "passo_bool_3", "passo_tlf_3",
      "passo_bool_5", "passo_tlf_5", "passo_bool_6", "passo_tlf_6", "passo_bool_7", "passo_tlf_7",
      "passo_bool_8", "passo_tlf_8", "passo_bool_9", "passo_tlf_9");
VALUES=("1000", "10000", "100000", "1000000", "10000000", "100000000", "1000000000");

for i in {0..15}; do
	echo "Executing without O3: "${FUNC[i]}
	./cpu_omp.out ${i} 1000 > "resultados_OMP/"${FUNC[i]}".txt"
	for j in {1..6}; do
		./cpu_omp.out ${i} ${VALUES[j]} >> "resultados_OMP/"${FUNC[i]}".txt"
	done
done

for i in {0..15}; do
	echo "Executing with O3: "${FUNC[i]}
	./cpu_omp.out ${i} 1000 > "resultados_OMP/"${FUNC[i]}"_O3.txt"
	for j in {1..6}; do
		./cpu_omp.out ${i} ${VALUES[j]} >> "resultados_OMP/"${FUNC[i]}".txt"
	done
done

echo "cleanning executables"
rm *.out
