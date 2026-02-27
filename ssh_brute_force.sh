#!/bin/bash
# ssh_brute_force.sh

sudo bpftrace -e '
tracepoint:syscalls:sys_enter_accept
/comm == "sshd"/
{
  @ssh_attempts = count();
}

interval:s:5
{
  if (@ssh_attempts > 5) {
    printf(
      "%llu ALERT ssh_bruteforce attempts=%lld\n",
      nsecs, (int64)@ssh_attempts
    );
  }
  clear(@ssh_attempts);
}
' | while read ns rest; do
    ts=$(date +"%F %T")
    echo "[$ts] $rest"
done
