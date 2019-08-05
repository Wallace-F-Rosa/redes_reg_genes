echo "Compiling"
g++ medirtempo_omp.cpp -lgomp -o cpu_omp.out

g++ medirtempo_omp.cpp -O3 -lgomp -o cpu_omp_o3.out

echo "Executing without O3"

./cpu_omp.out 1 1000
./cpu_omp.out 1 10000
./cpu_omp.out 1 100000
./cpu_omp.out 1 1000000
./cpu_omp.out 1 10000000
./cpu_omp.out 1 100000000
./cpu_omp.out 1 1000000000

echo "Executing with O3"

./cpu_omp_o3.out 1 1000
./cpu_omp_o3.out 1 10000
./cpu_omp_o3.out 1 100000
./cpu_omp_o3.out 1 1000000
./cpu_omp_o3.out 1 10000000
./cpu_omp_o3.out 1 100000000
./cpu_omp_o3.out 1 1000000000

echo "cleanning executables"
rm *.out
