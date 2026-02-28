#!/bin/bash

bpftrace -e '
	tracepoint:syscalls:sys_enter_execve
	{
		@c[comm] = count();
	}
	interval:s:2
	{
		print(@c);
		clear(@c);
	}
'
