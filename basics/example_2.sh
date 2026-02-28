#!/bin/bash

bpftrace -e '
	tracepoint:syscalls:sys_enter_openat
	/comm == "ls"/
	{
		printf("ls opend %s\n",str(args->filename))
	}
'
