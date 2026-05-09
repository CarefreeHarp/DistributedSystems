# HDFS — Hadoop Distributed File System LAN Deployment Guide

A documentation-oriented subproject focused on deploying **Apache Hadoop HDFS and YARN** on a **heterogeneous LAN cluster** using **Ubuntu and Rocky Linux**. The complete report is available in [HDFS-LAN-Implementation-Guide-Ubuntu-RockyLinux.pdf](HDFS-LAN-Implementation-Guide-Ubuntu-RockyLinux.pdf).

## Architecture

```mermaid
graph LR
    User["💻 CLI User"] -->|"hdfs dfs / yarn"| Master["🧠 NameNode + ResourceManager"]
    Master -->|"metadata + scheduling"| U1["🖥️ Ubuntu Node\nDataNode + NodeManager"]
    Master -->|"metadata + scheduling"| U2["🖥️ Ubuntu Node\nDataNode + NodeManager"]
    Master -->|"metadata + scheduling"| R1["🖥️ Rocky Linux Node\nDataNode + NodeManager"]
    U1 <-->|block replication| U2
    U2 <-->|block replication| R1
```

## Document Scope

| Topic | Description |
|-------|-------------|
| HDFS fundamentals | NameNode/DataNode roles, metadata handling, block distribution, and replication |
| YARN integration | ResourceManager, NodeManagers, and the relationship between storage and distributed processing |
| Heterogeneous deployment | Compatibility considerations for Ubuntu and Rocky Linux in the same cluster |
| Cluster setup | Hostnames, SSH without passwords, Java, Hadoop installation, and XML configuration |
| Validation | Upload/download tests, block and replica verification, and basic fault-tolerance checks |
| Troubleshooting | Common issues such as missing DataNodes, SSH prompts, and `JAVA_HOME` errors |

## Implementation Workflow

```mermaid
sequenceDiagram
    participant Admin as Cluster Admin
    participant Master as NameNode
    participant Workers as DataNodes

    Admin->>Master: Define hostnames and shared name resolution
    Admin->>Master: Install Java and Hadoop
    Admin->>Workers: Copy Hadoop and create shared user
    Master->>Workers: Configure passwordless SSH
    Admin->>Master: Set core-site.xml and hdfs-site.xml
    Admin->>Master: Set workers, YARN, and MapReduce files
    Master->>Master: Format HDFS
    Master->>Workers: Start HDFS and YARN services
    Admin->>Master: Validate uploads, replicas, and node health
```

## Representative Operational Commands

```bash
# Format the filesystem (first run only)
hdfs namenode -format

# Start distributed storage and processing services
start-dfs.sh
start-yarn.sh

# Create a user directory and upload a file
hdfs dfs -mkdir -p /user/hadup2
hdfs dfs -put sample.txt /user/hadup2/

# Validate cluster status and block placement
hdfs dfsadmin -report
hdfs fsck / -files -blocks -locations
```

## Laboratory Validation Highlights

The report documents a successful laboratory execution with the following observed results:

| Check | Observed result |
|-------|------------------|
| NameNode web interface | Active |
| Live nodes | 5 |
| Dead nodes | 0 |
| Under-replicated blocks | 0 |
| YARN validation | Containers distributed across cluster nodes |

## Project Structure

```text
HDFS/
├── README.md
└── HDFS-LAN-Implementation-Guide-Ubuntu-RockyLinux.pdf
```

## Technologies

- **Apache Hadoop HDFS** — Distributed file storage
- **YARN** — Cluster resource management
- **Java** — Runtime required by Hadoop
- **Linux (Ubuntu + Rocky Linux)** — Heterogeneous deployment environment
- **SSH** — Remote orchestration between nodes
