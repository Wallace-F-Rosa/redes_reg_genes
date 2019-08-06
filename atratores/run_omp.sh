echo "Compiling"

g++ medirtempo_omp.cpp -std=c++11 -o cpu.out

g++ medirtempo_omp.cpp -std=c++11 -O3 -o cpu_o3.out

g++ medirtempo_omp.cpp -std=c++11 -fopenmp -o cpu_omp.out

g++ medirtempo_omp.cpp -std=c++11 -O3 -fopenmp -o cpu_omp_o3.out

# generating assembler 
echo "Generating assembler"

g++ medirtempo_omp.cpp -std=c++11 -s -S -o cpu.bc

g++ medirtempo_omp.cpp -std=c++11 -O3 -s -S -o cpu_o3.bc

g++ medirtempo_omp.cpp -std=c++11 -fopenmp -s -S -o cpu_omp.bc

g++ medirtempo_omp.cpp -std=c++11 -O3 -fopenmp -s -S -o cpu_omp_o3.bc

mkdir resultados_OMP

VALUES=("1000" "10000" "100000" "1000000" "10000000");

for i in {0..15}; do
	echo "Executing without O3: "${i}
	echo "No OMP" > "resultados_OMP/results.csv"
	echo "Network, states, time (ns), G states/s" >> "resultados_OMP/results.csv"
	for j in {0..4}; do
		./cpu.out ${i} ${VALUES[j]} >> "resultados_OMP/results.csv"
	done
done

for i in {0..15}; do
	echo "Executing without O3: "${i}
	echo "No OMP With O3" >> "resultados_OMP/results.csv"
	echo "Network, states, time (ns), G states/s" >> "resultados_OMP/results.csv"
	for j in {0..4}; do
		./cpu_o3.out ${i} ${VALUES[j]} >> "resultados_OMP/results.csv"
	done
done

for i in {0..15}; do
	echo "Executing without O3: "${i}
	echo "Without O3 With OMP" >> "resultados_OMP/results.csv"
	echo "Network, states, time (ns), G states/s" >> "resultados_OMP/results.csv"
	for j in {0..4}; do
		./cpu_omp.out ${i} ${VALUES[j]} >> "resultados_OMP/results.csv"
	done
done

for i in {0..15}; do
	echo "Executing without O3: "${i}
	echo "With O3" >> "resultados_OMP/results.csv"
	echo "Network, states, time (ns), G states/s" >> "resultados_OMP/results.csv"
	for j in {0..4}; do
		./cpu_omp_o3.out ${i} ${VALUES[j]} >> "resultados_OMP/results.csv"
	done
done

echo "cleanning executables"
rm *.out
