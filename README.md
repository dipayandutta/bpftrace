All detections are implemented using **`bpftrace`**, making them easy to understand, audit, and extend.

---

##  Why Runtime Detection?

Traditional Linux security relies on:
- Log parsing (late, noisy, tamperable)
- Agents (performance & operational overhead)
- Signature-based detection (easy to evade)

This project shows how **behavioral detection at the syscall level** provides:
- Faster detection
- Higher signal quality
- Better coverage for containers and ephemeral workloads

---

##  Architecture Overview
# eBPF Runtime IDS for Linux
### Detecting SSH Brute Force & Privilege Abuse at Kernel Runtime

This repository demonstrates how to build a **lightweight runtime Intrusion Detection System (IDS)** on Linux using **eBPF and bpftrace**.

Instead of relying on logs (`/var/log/secure`, `auth.log`) or heavy agents, this project detects **abusive behavior in real time** by observing **kernel syscalls directly**.

> **Logs tell you what happened.
> eBPF tells you what is happening.**

---

##  What This Project Demonstrates

- Real-time **SSH brute-force detection**
- **Rate-based detection** using time windows (IDS-style)
- Kernel-level visibility using **eBPF**
- Zero dependency on authentication logs
- Minimal overhead, no kernel modules, no agents



