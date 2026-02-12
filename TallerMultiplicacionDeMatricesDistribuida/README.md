# Distributed Matrix Multiplication with MPI

This repository contains the implementation and experiments of **distributed matrix multiplication using MPI (OpenMPI)**, executed on a **cluster of 5 laptops**.

The main objective is to **measure and compare the execution time** of square matrix multiplication for different matrix sizes, varying the number of MPI processes (`-np`).

---

## 📁 Repository Structure

The project is organized by physical node (laptop):

├── LaptopNode0/  
│ ├── matmul.c  
│ ├── matmul  
│ ├── hostfile  
│ ├── benchmark_mpi.pl  
│ ├── results.csv  
│ └── Resultados/  
│ ├── matricesde200_np4.csv  
│ ├── matricesde200_np20.csv  
│ ├── matricesde400_np4.csv  
│ ├── matricesde400_np20.csv  
│ ├── matricesde800_np4.csv  
│ ├── matricesde800_np20.csv  
│ ├── matricesde1600_np4.csv  
│ ├── matricesde1600_np20.csv  
│ ├── matricesde3200_np4.csv  
│ └── matricesde3200_np20.csv  
│  
├── LaptopNode1/  
│ └── (copies of the executable and required files)  
├── LaptopNode2/  
│ └── (copies of the executable and required files)  
├── LaptopNode3/  
│ └── (copies of the executable and required files)  
├── LaptopNode4/  
│ └── (copies of the executable and required files)  


📌 **Note:**
- **Node0 (Laptop)** acts as the master node: it compiles, launches experiments, and stores results.
- The remaining nodes only execute MPI processes.

---

## ⚙️ Implementation

### `matmul.c`

C program that:

- Implements square matrix multiplication `N × N`
- Divides the workload by **rows among MPI processes**
- Uses:
  - `MPI_Scatter` to distribute rows of matrix A
  - `MPI_Bcast` to broadcast matrix B
  - `MPI_Gather` to collect the final result
- **Prints nothing**, except:
  - A single number: the **wall time** measured using `MPI_Wtime()` by process `rank 0`

This allows automated benchmarking without extra output noise.

---

## 🧪 Automated Benchmark

### `benchmark_mpi.pl`

Perl script that automates the experiments:

- Matrix sizes tested:
200 × 200
400 × 400
800 × 800
1600 × 1600
3200 × 3200

- Number of MPI processes:
-np 4
-np 20


- For each combination:
  - Executes the multiplication **30 times**
  - Captures execution time
  - Saves results into `.csv` files

Example generated file:
LaptopNode0/Resultados/matricesde800_np20.csv