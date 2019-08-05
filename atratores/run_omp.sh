echo "Compiling"
g++ medirtempo_omp.cpp -std=c++11 -fopenmp -o cpu_omp.out

g++ medirtempo_omp.cpp -std=c++11 -O3 -fopenmp -o cpu_omp_o3.out

echo "Executing without O3"

./cpu_omp.out 1 1000 > results_omp.txt
./cpu_omp.out 1 10000 >> results_omp.txt
./cpu_omp.out 1 100000 >> results_omp.txt
./cpu_omp.out 1 1000000 >> results_omp.txt
./cpu_omp.out 1 10000000 >> results_omp.txt
./cpu_omp.out 1 100000000 >> results_omp.txt
./cpu_omp.out 1 1000000000 >> results_omp.txt

echo "Executing with O3"

./cpu_omp_o3.out 1 1000 > results_omp_o3.txt
./cpu_omp_o3.out 1 10000 >> results_omp_o3.txt
./cpu_omp_o3.out 1 100000 >> results_omp_o3.txt
./cpu_omp_o3.out 1 1000000 >> results_omp_o3.txt
./cpu_omp_o3.out 1 10000000 >> results_omp_o3.txt
./cpu_omp_o3.out 1 100000000 >> results_omp_o3.txt
./cpu_omp_o3.out 1 1000000000 >> results_omp_o3.txt

echo "cleanning executables"
rm *.out
