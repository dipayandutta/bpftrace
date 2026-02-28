#!/bin/bash
#check the value with the return probe
bpftrace -e '
	tracepoint:syscalls:sys_exit_openat
	/args->ret < 0/
	{
		printf("FAILED open pid=%d comm=%s ret=%d\n",pid,comm,args->ret)
	}
'
