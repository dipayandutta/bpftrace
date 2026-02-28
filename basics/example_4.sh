#!/bin/bash

bpftrace -e '
	tracepoint:syscalls:sys_enter_openat{
		printf("pid=%d comm=%s file=%s flags=%d mode=%o\n", pid, comm,str(args->filename),args->flags,args->mode);
	}
'
