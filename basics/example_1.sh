#!/bin/bash

bpftrace -e '
tracepoint:syscalls:sys_enter_execve{
	printf("execve call by %s (pid=%d)\n",comm,pid)
}
'
