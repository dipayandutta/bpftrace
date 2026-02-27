bpftrace -e '
tracepoint:syscalls:sys_enter_openat
/str(args->filename) == "/etc/shadow"/
{
  printf(
    "%llu ALERT file=/etc/shadow comm=%s pid=%d uid=%d\n",
    nsecs, comm, pid, uid
  );
}' | while read ns rest; do
    ts=$(date +"%F %T")
    echo "[$ts] $rest"
done
