# Distributed Systems & Initial Studies for High Performance Computing

This repository contains the projects developed related to Distributed Systems, High Performance Computing (HPC), and Parallel Programming.

Each directory corresponds to a subproject with its own implementation, experiments, and documentation.  
Please see below the structure and description of each directory.

The repository combines both **implementation-oriented workshops** and **performance-focused experimental studies**.

---

## General Overview

```mermaid
graph TB
    Repo["📦 Distributed Systems\nRepository"]

    subgraph P1["MatrixMultiplicationDistributed-Workshop"]
        direction LR
        MPI1["C + MPI"]
        Cluster1["5-Laptop Cluster"]
        MPI1 --- Cluster1
    end

    subgraph P2["ZeroMQ-Workshop"]
        direction LR
        ZMQ["Python + ZeroMQ"]
        Flask["Flask + HTMX"]
        ZMQ --- Flask
    end

    subgraph P3["MPI&OpenMP-PerformanceStudy"]
        direction LR
        Hybrid["C + MPI + OpenMP"]
        Bench["Benchmark FxC vs FxT"]
        Hybrid --- Bench
    end

    subgraph P4["SmartSemaphoreManagement"]
        direction LR
        ZMQ2["Python + ZeroMQ"]
        Traffic["Traffic Sim + Failover"]
        ZMQ2 --- Traffic
    end

    Repo --> P1
    Repo --> P2
    Repo --> P3
    Repo --> P4
```

At a high level, the repository includes four main lines of work:

- **Distributed matrix multiplication with MPI**, executed in a small cluster environment
- **A distributed library system with ZeroMQ**, exposed through a lightweight web interface
- **A hybrid MPI + OpenMP performance study**, focused on comparing parallelization strategies
- **A smart semaphore management platform**, combining simulation, analytics, replication, and failover

This means the repository covers topics related to:

- Distributed Systems
- Parallel Programming
- High Performance Computing
- Experimental performance evaluation (Benchmarks)
- Event-driven architectures, replication, and service continuity

---

## Repository Structure

### 1. MatrixMultiplicationDistributed-Workshop

Distributed square matrix multiplication implemented in **C using MPI (OpenMPI)** and executed on a **5-laptop cluster**.  
The project evaluates execution time while varying matrix sizes and the number of MPI processes.

```mermaid
graph LR
    Master["💻 Master"]
    W1["💻 Worker 1"]
    W2["💻 Worker 2"]
    W3["💻 Worker 3"]
    W4["💻 Worker 4"]
    
    Master -->|"Scatter rows of A\nBcast B"| W1 & W2 & W3 & W4
    W1 & W2 & W3 & W4 -->|"Gather C"| Master
```

**Mini-sample of results:**

| N | np | Average time (s) |
|---:|---:|---:|
| 200 | 4 | ~0.013 |
| 800 | 4 | ~0.35 |
| 3200 | 20 | ~12.5 |

  - Work division by rows across MPI ranks  
  - Communication using `MPI_Scatter`, `MPI_Bcast`, and `MPI_Gather`  
  - Wall-time measurement with `MPI_Wtime()`  
  - Automated benchmarking (30 runs per configuration)  
  - CSV result generation for performance analysis  
  - **[Full README](MatrixMultiplicationDistributed-Workshop/README.md)** with architecture diagrams and execution details

---

### 2. ZeroMQ-Workshop

Distributed library management system implemented with **Python, ZeroMQ, Flask, and HTMX**, following a **client–server architecture** with JSON-based message exchange.

```mermaid
graph LR
    Browser["🌐 Browser"] -->|HTTP| Client["🖥️ Flask\n+ HTMX"]
    Client <-->|"ZMQ REQ-REP\n(JSON)"| Server["⚙️ ZMQ Server"]
    Server -->|R/W| DB[("📁 DB.json")]
```

**Mini protocol sample:**
```json
// Request
{ "action": "Prestamo por ISBN", "isbn": "9780307474278", "borrower": "Juan" }
// Response
{ "success": true, "message": "Préstamo exitoso: 'Cien años de soledad'" }
```

  - REQ–REP communication pattern using ZeroMQ  
  - Loan by ISBN or title, book query, and return operations  
  - JSON-based persistence and configurable ports/IPs  
  - **[Full README](ZeroMQ-Workshop/README.md)** with architecture, data model, and execution guide

---

### 3. MPI&OpenMP-PerformanceStudy

Hybrid parallel matrix multiplication performance study implemented in **C using MPI and OpenMP**, comparing a **classic row-by-column approach** against a **transposed-matrix variant**.

```mermaid
graph LR
    subgraph FxC["Classical (FxC)"]
        A1["Row A"] -.->|"stride N"| B1["Column B"]
    end
    subgraph FxT["Transposed (FxT)"]
        A2["Row A"] -.->|"stride 1 ✓"| BT["Row B^T"]
    end
```

**Experimental design:**

| Case | Variable | Values |
|------|----------|---------|
| 1 | MPI processes | np = 5, 17, 33 (threads=1) |
| 2 | OpenMP threads | nH = 1, 4, 8 (np=5) |
| 3 | Baseline | np=2, nH=1 (same node) |

  - Hybrid parallelism with MPI across nodes and OpenMP within each worker  
  - Two multiplication strategies: classical and transposed  
  - Automated benchmarking with 30 repetitions per configuration  
  - `.dat` result generation and Makefile-based build  
  - **[Full README](MPI&OpenMP-PerformanceStudy/README.md)** with architecture diagrams and all experimental details

---

### 4. SmartSemaphoreManagement

Distributed smart traffic control system implemented in **Python using ZeroMQ and SQLite**, combining **traffic simulation, logical sensors, semaphore analytics, operational replication, and failover support** across four logical computers (`PC0` to `PC3`).

```mermaid
graph LR
    PC0["PC0\nSimulation + Historic DB"] -->|"Operational snapshots"| PC1["PC1\nSensors + Broker"]
    PC1 -->|"Sensor events"| PC2["PC2\nAnalytics + Replica + Backup Backend"]
    PC2 -->|"Semaphore commands"| PC0
    PC0 -->|"Operational state"| PC3["PC3\nMain DB + Primary Backend"]
    PC3 -->|"Manual control"| PC2
    PC3 -->|"Ambulance requests"| PC0
```

**Core deployment roles:**

| PC | Main responsibility |
|------|----------------------|
| `PC0` | Authoritative traffic simulation and historical persistence |
| `PC1` | Logical sensors and ZeroMQ broker |
| `PC2` | Traffic analytics, semaphore control, operational replica, and backup backend |
| `PC3` | Main database, monitoring, and primary backend |

  - Camera, inductive-loop, and GPS logical sensors over instrumented roads  
  - Score-based traffic control with one decision per intersection and simulation tick  
  - ZeroMQ-based communication with fully configurable endpoints  
  - Operational replication in `PC2` to keep the system available if `PC3` fails  
  - **[Full README](SmartSemaphoreManagement/README.md)** with design decisions, architecture, and execution details

---

## Technologies Used

Across the different subprojects:

- **C / MPI (OpenMPI) / OpenMP**
- **Python**
- **ZeroMQ**
- **Flask + HTMX**
- **SQLite / JSON / CSV for data handling**
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

- Each subproject contains its own detailed `README.md` with architecture diagrams and execution instructions.
- Experimental result files (`.csv`, `.dat`) are preserved in the repository as part of the analysis workflow.
- The `ZeroMQ-Workshop` subproject already includes a dedicated README with setup and architecture details.
- PDF reports included in the repository complement the implementation with methodology and performance discussion.
