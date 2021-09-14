#!/usr/bin/bash
scol=$"\e[1;35m"
fcol=$"\e[0m"

clear

# Check OS version
echo -e "${scol}System version:${fcol}" $(lsb_release -ds)

# Check kernel release
echo -e "${scol}Kernel release:${fcol}" $(uname -sr)

# Check CPU model name
echo -e "${scol}CPU model:${fcol}" $(grep -e "model name" /proc/cpuinfo | uniq | cut -d ':' -f 2)

# Check number of CPU cores
echo -e "${scol}Number of CPU cores:${fcol}" $(grep "processor" /proc/cpuinfo | wc -l)

# Check architecture
echo -e "${scol}Architecture:${fcol}" $(arch)

# Check system uptime
echo -e "${scol}System uptime:${fcol}" $(uptime -p)

# Check load averages
echo -e "${scol}Load averages:${fcol}" $(awk '{printf "[1m] %s [5m] %s [10m] %s", $1, $2, $3}' /proc/loadavg)

# Check memory usages
echo -e "${scol}Memory usages:${fcol}" $(awk '/MemTotal/ {t = $2/1048576} /MemFree/ {f = $2/1048576} /MemAvailable/ {a = $2/1048576} END {printf "[%.1f%%] Total: %.2f GB, Free: %.2f GB, Available: %.2f GB", (1 - a / t) * 100, t, f, a}' /proc/meminfo)

# Check swap usages
echo -e "${scol}Swap usages:${fcol}" $(awk '/SwapTotal/ {t = $2/1048576} /SwapCached/ {c = $2/1048576} /SwapFree/ {f = $2/1048576} END {printf "[%.1f%%] Total: %.2f GB, Cached: %.2f GB, Free: %.2f GB", (1 - f / t) * 100, t, c, f}' /proc/meminfo)

# Check disk usages
echo -e "${scol}Disk usages:${fcol}" && df -h --type=ext4 | awk '/\/dev\// {printf "[%4s of %4s] %s -> %s\n", $5, $2, substr($1, 6, length($1)), $6}'

# Check hostname
echo -e "${scol}Hostname:${fcol}" $(hostname)

# Check users logged in
echo -e "${scol}User logged in:${fcol}" $(whoami)

# Check internal IP address
echo -e "${scol}Internal IP address:${fcol}" $(hostname -I)


