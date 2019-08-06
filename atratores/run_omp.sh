echo "Compiling"

g++ medirtempo.cpp -std=c++11 -O3 -o cpu_o3.out
g++ medirtempo_omp.cpp -std=c++11 -O3 -fopenmp -o cpu_omp_o3.out

# generating assembler 
echo "Generating assembler"

g++ medirtempo_omp.cpp -std=c++11 -s -S -o assembler/cpu.bc
g++ medirtempo_omp.cpp -std=c++11 -O3 -s -S -o assembler/cpu_o3.bc
g++ medirtempo_omp.cpp -std=c++11 -fopenmp -s -S -o assembler/cpu_omp.bc
g++ medirtempo_omp.cpp -std=c++11 -O3 -fopenmp -s -S -o assembler/cpu_omp_o3.bc

echo "No OMP With O3" > "resultados/results.csv"
echo "Network, states, time (ns), G states/s" >> "resultados/results.csv"
for i in {0..15}; do
	echo "Executing without O3: "${i}
	./cpu_o3.out ${i} 10000000 >> "resultados/results.csv"
done

echo "OMP With O3" >> "resultados_OMP/results.csv"
echo "Network, states, time (ns), G states/s" >> "resultados/results.csv"
for i in {0..15}; do
	echo "Executing without O3: "${i}
	./cpu_omp_o3.out ${i} 10000000 >> "resultados/results.csv"
done

echo "cleanning executables"
rm *.out
