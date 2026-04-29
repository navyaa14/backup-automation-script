# Network Troubleshooting Script (Bash)

This project is a simple Bash script that performs basic network debugging checks on a target domain.

## 🚀 Features

- Checks DNS resolution (domain → IP)
- Verifies connectivity using ping
- Shows routing path to the target
- Scans common ports (80, 443)
- Performs HTTP status check
- Logs all results into a report file

## 🛠️ Tech Used

- Bash scripting
- Linux networking commands:
  - dig
  - ping
  - ip route
  - nmap
  - curl

## ▶️ How to Run

```bash
chmod +x network.sh
./network.sh
