# Schedule task

nohup /bin/sh > /dev/null 2>&1 <<EOF &

sysctl -w kernel.sched_min_granularity_ns=1000000
sysctl -w kernel.sched_wakeup_granularity_ns=2000000
sysctl -w kernel.sched_child_runs_first=1
sysctl -w kernel.sched_tunable_scaling=1
sysctl -w vm.overcommit_memory=1
sysctl -w kernel.sched_migration_cost_ns=5000000
sysctl -w kernel.sched_autogroup_enabled=0
sysctl -w fs.file-max=2097152
sysctl -w fs.inotify.max_user_instances=1024
sysctl -w fs.inotify.max_user_watches=524288
sysctl -w vm.vfs_cache_pressure=500
sysctl -w vm.swappiness=33
sysctl -w vm.dirty_background_ratio=1
sysctl -w vm.dirty_ratio=50

EOF