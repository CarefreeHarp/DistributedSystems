# Distributed Systems & Initial Studies for High Performance Computing

This repository contains the projects developed related to Distributed Systems, High Performance Computing (HPC), and Parallel Programming.

Each directory corresponds to a subproject with its own implementation, experiments, and documentation.  
Please see below the structure and description of each directory.

The repository combines both **implementation-oriented workshops** and **performance-focused experimental studies**.
---

## General Overview

At a high level, the repository includes three main lines of work:

- **Distributed matrix multiplication with MPI**, executed in a small cluster environment
- **A distributed library system with ZeroMQ**, exposed through a lightweight web interface
- **A hybrid MPI + OpenMP performance study**, focused on comparing parallelization strategies

This makes the repository includes topics related to:

- Distributed Systems
- Parallel Programming
- High Performance Computing
- Experimental performance evaluation (Benchmarks)

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
  - Includes execution artifacts, hostfiles, and result datasets for repeated experiments

---

- **ZeroMQ-Workshop**:  
  Distributed library management system implemented with **Python, ZeroMQ, Flask, and HTMX**, following a **client–server architecture** with JSON-based message exchange.

  The system provides a web interface that sends HTTP requests to a Flask client, which communicates with a ZeroMQ server responsible for processing operations and persisting data.

  - REQ–REP communication pattern using ZeroMQ  
  - Loan by ISBN or title, book query, and return operations  
  - JSON-based persistence  
  - Configurable ports and IPs for LAN deployment  
  - Decoupled web client and service layer
  - Includes its own detailed `README.md` with architecture and execution examples

---

- **MPI&OpenMP-PerformanceStudy**:  
  Hybrid parallel matrix multiplication performance study implemented in **C using MPI and OpenMP**, comparing a **classic row-by-column approach** against a **transposed-matrix variant**.

  The project benchmarks different matrix sizes, MPI process counts, and OpenMP thread configurations, storing repeated execution results for later analysis.

  - Hybrid parallelism with MPI across nodes and OpenMP within each worker  
  - Two multiplication strategies: classical and transposed  
  - Automated benchmarking with 30 repetitions per configuration  
  - Hostfile-based execution for process and thread experiments  
  - `.dat` result generation plus supporting performance report documentation  

---

## Technologies Used

Across the different subprojects:

- **C / MPI (OpenMPI) / OpenMP**
- **Python**
- **ZeroMQ**
- **Flask + HTMX**
- **JSON / CSV for data handling**
- **Perl scripts for automated benchmarking**
- **Linux-based cluster environments**

---

## Basic Requirements

Depending on the subproject, the main tools required are:

- **OpenMPI / `mpicc` / `mpirun`**
- **OpenMP-compatible C compiler**
- **Python 3.10+**
- **pip** for Python dependencies

Some experiments were designed for multi-node or multi-machine execution, so hostfile-based setups and Linux environments are assumed in several directories.

---

## Notes

- Each subproject may contain its own execution scripts, datasets, and reports.
- Experimental result files (`.csv`, `.dat`) are preserved in the repository as part of the analysis workflow.
- The `ZeroMQ-Workshop` subproject already includes a dedicated README with setup and architecture details.
- PDF reports included in the repository complement the implementation with methodology and performance discussion.
