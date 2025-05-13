
## Submitted batch job 1082707

**Useful commands**
- sacctmgr list user pqr9695
- sbatch run_ragen.sbatch
- sinfo
- sacct -u pqr9695

```
JobID           JobName  Partition    Account  AllocCPUS      State ExitCode
------------ ---------- ---------- ---------- ---------- ---------- --------
1082707      shruti_ra+     gengpu     e32706          0    PENDING      0:0
```
sacct -j 1082707 --format=JobID,JobName,Partition,State,ExitCode,Start,End,Elapsed

### All running jobs of user
squeue --me -t R -l
