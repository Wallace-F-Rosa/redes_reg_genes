echo "Compiling"

g++ medirtempo_omp.cpp -std=c++11 -O3 -fopenmp -o cpu_omp_o3.out

echo "OMP With O3" >> "resultados_OMP/results.csv"
echo "Network, states, time (ns), G states/s" > "resultados/results.csv"
for i in {0..15}; do
	echo "Executing without O3: "${i}
	./cpu_omp_o3.out ${i} 10000000 >> "resultados/results.csv"
done

echo "cleanning executables"
rm *.out
