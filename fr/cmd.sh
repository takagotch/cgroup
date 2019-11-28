mkdir /sys/fs/cgroup/memory/groupname
echo 1000 > /sys/fs/group/memory/groupname/memory.limit_in_bytes
echo pid > /sys/fs/cgroup/memory/groupname/cgroup.procs
cgcreate -a user -t memory,cpu:groupme

cgm create memory groupname
cgmchow memory groupname 1000 0
cgm create cpu groupname 
cgm chown cpu groupname 1000 0
chown user /sys/fs/cgroup/{memory,cpu}/groupname/*

ls -l /sys/fs/cgroup/memory/groupname

cgcreate -g memory,cpu:groupname/foo
cgexec -g memory,cpu:groupname/foo bash

cgm create memory groupname/foo
cgm create cpu groupname/foo
bash
cgm movepid meory groupname/foo $pid_of_bash
cgm movepid cpu groupname/foo $pid_of_bash

cat /proc/self/cgroup
echo 10000 > /sys/fs/cgroup/memory/groupname/foo/memory.limit_in_bytes

cgm setvalue memory groupname.limit_in_bytes 10000
echo 100 > /sys/cgroup/cpu/groupname/foo/cpu.shares

pidof bash
cgclassify -g memory,cpu:groupname/foo `pidof bash`
cat /proc/13244/cgroup

mkdir /tky/path/grouupname
mount -t /your/path -o cpuset groupname /tky/path/groupname

cgexec -g memory,cpuset:mealab /opt/MATLAB/2012b/bin/matlab --desktop



