bpftrace -e '
tracepoint:syscalls:sys_enter_setuid
{
  printf(
    "[ALERT] setuid attempt comm=%s pid=%d old_uid=%d\n",
    comm, pid, uid
  );
}'
