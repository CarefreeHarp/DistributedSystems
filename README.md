# Distributed Systems & Initial Studies for High Performance Computing - By: Daniel Felipe Ramírez Vargas  

This repository contains the projects developed related to *Distributed Systems*, *High Performance Computing (HPC)*, and *Parallel Programming*.  

Each directory corresponds to a subproject with its own implementation, experiments, and documentation.  
Please see below the structure and description of each directory.

---

## Repository Structure

- **MatrixMultiplicationDistributed-Workshop**:  
  Distributed square matrix multiplication implemented in **C using MPI (OpenMPI)** and executed on a **5-laptop cluster**.  
  The project evaluates execution time while varying matrix sizes and the number of MPI processes.

  - Work division by rows across MPI ranks  
  - Communication using `MPI_Scatter`, `MPI_Bcast`, and `MPI_Gather`  
  - Wall-time measurement with `MPI_Wtime()`  
  - Automated benchmarking (30 runs per configuration)  
  - CSV result generation for performance analysis  

---
