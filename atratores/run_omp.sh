echo "Compiling"
g++ medirtempo_omp.cpp -std=c++11 -fopenmp -o cpu_omp.out

g++ medirtempo_omp.cpp -std=c++11 -O3 -fopenmp -o cpu_omp_o3.out

mkdir resultados_OMP

VALUES=("1000" "10000" "100000" "1000000" "10000000" "100000000" "1000000000");

for i in {0..15}; do
	echo "Executing without O3: "${i}
	echo "Without O3" > "resultados_OMP/results.csv"
	echo "Network, states, time (ns), G states/s" >> "resultados_OMP/results.csv"
	for j in {0..6}; do
		./cpu_omp.out ${i} ${VALUES[j]} >> "resultados_OMP/results.csv"
	done
done

for i in {0..15}; do
	echo "Executing without O3: "${i}
	echo "With O3" >> "resultados_OMP/results.csv"
	echo "Network, states, time (ns), G states/s" >> "resultados_OMP/results.csv"
	for j in {0..6}; do
		./cpu_omp_o3.out ${i} ${VALUES[j]} >> "resultados_OMP/results.csv"
	done
done

echo "cleanning executables"
rm *.out
