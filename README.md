# Distributed Systems & Initial Studies for High Performance Computing

This repository contains the projects developed related to Distributed Systems, High Performance Computing (HPC), and Parallel Programming.

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

- **ZeroMQ-LibrarySystem-Workshop**:  
  Distributed library management system implemented with **Python, ZeroMQ, Flask, and HTMX**, following a **client–server architecture** with JSON-based message exchange.

  The system provides a web interface that sends HTTP requests to a Flask client, which communicates with a ZeroMQ server responsible for processing operations and persisting data.

  - REQ–REP communication pattern using ZeroMQ  
  - Loan by ISBN or title, book query, and return operations  
  - JSON-based persistence  
  - Configurable ports and IPs for LAN deployment  
  - Decoupled web client and service layer  

---

## Technologies Used

Across the different subprojects:

- **C / MPI (OpenMPI)**
- **Python**
- **ZeroMQ**
- **Flask + HTMX**
- **JSON / CSV for data handling**
- **Linux-based cluster environments**
