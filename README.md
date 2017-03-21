# xp5k-lxd

## On Rennes frontend

```
frontend$ oarsub -I -l {"cluster='parasilo'"}/nodes=1,walltime=2
node$ . /grid5000/Modules/modules.sh
node$ module load veertuosa/0.0.1
node$ veertuosa_launch -n xp5k -i /grid5000/images/veertuosa/ubuntu-16.04-x86_64.qcow2
node$ ssh-vm xp5k
vm$ git clone https://github.com/pmorillon/xp5k-lxd.git
vm$ cd xp5k-lxd
vm$ sh ./install.sh
vm$ lxc list
+-------+---------+----------------------+-----------------------------------------------+------------+-----------+
| NAME  |  STATE  |         IPV4         |                     IPV6                      |    TYPE    | SNAPSHOTS |
+-------+---------+----------------------+-----------------------------------------------+------------+-----------+
| lxc01 | RUNNING | 10.66.154.193 (eth0) | fd42:91dd:6608:c8dd:216:3eff:fe43:d865 (eth0) | PERSISTENT | 0         |
+-------+---------+----------------------+-----------------------------------------------+------------+-----------+
| lxc02 | RUNNING | 10.66.154.25 (eth0)  | fd42:91dd:6608:c8dd:216:3eff:fef0:5173 (eth0) | PERSISTENT | 0         |
+-------+---------+----------------------+-----------------------------------------------+------------+-----------+
| lxc03 | RUNNING | 10.66.154.51 (eth0)  | fd42:91dd:6608:c8dd:216:3eff:fe8d:3804 (eth0) | PERSISTENT | 0         |
+-------+---------+----------------------+-----------------------------------------------+------------+-----------+
vm$ rake test
--> Execute task test
Connected to lxc02...
Connected to lxc01...
Connected to lxc03...
[command][lxc01] date && uptime
[command][lxc02] date && uptime
[command][lxc03] date && uptime
[stdout][lxc02] Tue Mar 21 08:18:22 UTC 2017
[stdout][lxc01] Tue Mar 21 08:18:22 UTC 2017
[stdout][lxc02]  08:18:22 up 2 min,  0 users,  load average: 0.08, 0.08, 0.02
[stdout][lxc03] Tue Mar 21 08:18:22 UTC 2017
[stdout][lxc01]  08:18:22 up 2 min,  0 users,  load average: 0.08, 0.08, 0.02
[stdout][lxc03]  08:18:22 up 2 min,  0 users,  load average: 0.08, 0.08, 0.02
---- lxc01 ----------------------------------------------------------------------------------------------------------------------------
Tue Mar 21 08:18:22 UTC 2017
 08:18:22 up 2 min,  0 users,  load average: 0.08, 0.08, 0.02
---- lxc02 ----------------------------------------------------------------------------------------------------------------------------
Tue Mar 21 08:18:22 UTC 2017
08:18:22 up 2 min,  0 users,  load average: 0.08, 0.08, 0.02
---- lxc03 ----------------------------------------------------------------------------------------------------------------------------
Tue Mar 21 08:18:22 UTC 2017
08:18:22 up 2 min,  0 users,  load average: 0.08, 0.08, 0.02
Closing ssh connections...`
vm$
```
