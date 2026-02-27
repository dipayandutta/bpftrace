#!/bin/bash

LOG_FILE="/var/log/ssh_bruteforce.log"

sudo bpftrace -q -e '
tracepoint:syscalls:sys_enter_accept
/comm == "sshd"/
{
  @ssh_attempts = count();
}

interval:s:5
{
  if (@ssh_attempts > 0) {
    printf("%lld\n", (int64)@ssh_attempts);
  }
  clear(@ssh_attempts);
}
' | while read attempts; do
    ts=$(date +"%F %T")

    # Ensure file exists
    echo "{\"time\":\"$ts\",\"event\":\"ssh_bruteforce\",\"attempts\":$attempts}" \
      | sudo tee -a "$LOG_FILE" >/dev/null
done
