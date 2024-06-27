# Bandwidth-measurements-for-HPC-instances
- Memory bandwidth for different HPC architectures is measured using likwid benchmarks. Likwid benchmarks are a very useful tool for doing a Node level performance study for HPC codes and getting insights about the HPC architecture. More details about likwid can be found here [Likwid benchmarks](https://github.com/RRZE-HPC/likwid).
- Here a triad benchmark, from the likwid benchmark suite is used to measure the peak socket memory bandwidth on different HPC systems, by increasing the core count and eventually saturating the full available socket on a HPC node.
- The script to do these measurements is in the script folder.
  
## Systems compared
- Different AWS HPC based instances and DLR's CARO system (AMD Zen2 Rome) are compared here. AWS Graviton2 and AWS Graviton3 are ARM-based architectures whereas rest all are x86 architectures.
  
| Instance type      | Cores per Node |
|:----------- |:-----------:|
| AWS Graviton2   |   64|
| AWS Graviton3   |   64|
| DLR CARO - AMD Zen2 Rome |   128|
| AWS hpc6a - AMD Zen3 Milan (hpc6a)  |   96|
| AWS hpc7a - AMD Zen4 Genoa (hpc7a)  |   192|
| AWS hpc6id - Intel Icelake  |   64|

- The actual instance names are a bit longer. Graviton2 (c6gn.16xlarge), Graviton3(hpc7g.16xlarge or c7gn.16xlarge), AMD Zen3 Milan (hpc6a.48xlarge), AMD Zen4 Genoa (hpc7a.96xlarge) and Intel Icelake (hpc6id.32xlarge). More information regarding different AWS instances can be found here [AWS instance types](https://aws.amazon.com/ec2/instance-types/)

## Memory bandwidth graph
- The socket memory bandwidth comparison is shown in the following graph ![Socket bandwidth memory comparison](/pics/socket-bandwidth-comparison.png)
- On AWS Graviton2 and AWS Graviton3, there is just one Socket available for a single Node. So it is just a single Node - single Socket system.
- Other AMD and Intel architectures have 2 Sockets per Node. Hence, the peak available memory bandwidth per Node will be twice that for a single socket.
- Graviton3 and hpc7a (AMD Zen4) have a very high per core memory bandwidth - close to 3.9 GB/s. It is due to DDR5 and faster memory peripherals. And also these are the latest architectures available on the AWS cloud.
- The peak available memory bandwidths per node for all architectures are listed in below table

| Instance type      | Peak available memory bandwidth per Node [GB/s]|
|:----------- |:-----------:|
| AWS Graviton2   |  170 |
| AWS Graviton3   |   250|
| DLR CARO - AMD Zen2  |   310|
| AWS hpc6a - AMD Zen3 hpc6a  |   280|
| AWS hpc7a - AMD Zen4 hpc7a  |   750|
| AWS hpc6id - Intel Icelake  |   320|

- It is important to note that the available peak memory bandwidth depends on a lot of factors like; clock frequency, type of compiler used for compiling benchmarks, compiler optimisations, version of the benchmark used etc. Therefore, it is advisable to take these numbers just for reference. As likwid benchmarks are written in assembly language there might be some instructions in some benchmarks that do not run on certain architectures.
- If your HPC application, achieves these memory bandwidth numbers on the above architectures or comes closer to it, then it is very good. You won't need any further optimisations. 

