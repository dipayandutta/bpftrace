#!/usr/bin/env python3

import subprocess
import time

TARGET = "localhost"
USER = "invaliduser"
ATTEMPTS = 20
DELAY = 0.3  # seconds

print(f"[+] Starting SSH brute-force demo against {TARGET}")
print(f"[+] Attempts: {ATTEMPTS}\n")

for i in range(ATTEMPTS):
    print(f"[{i+1}] SSH attempt")

    subprocess.run(
        [
            "ssh",
            "-o", "BatchMode=yes",
            "-o", "StrictHostKeyChecking=no",
            "-o", "ConnectTimeout=2",
            f"{USER}@{TARGET}"
        ],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    )

    time.sleep(DELAY)

print("\n[+] Demo complete")
