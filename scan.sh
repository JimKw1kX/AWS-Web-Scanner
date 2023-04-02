#!/bin/sh

## Target definition and cut http&https prefix for later scanning
full_target=${nmap_target}
target=$(echo $full_target | grep -Eo "[a-zA-Z0-9.?=_%:-]*" | sort -u | grep -v 'http\|https')
echo $target

## Making results directory
mkdir /root/results

## Nmap scan
nmap -T4 -A -v -p- ${target} -oN /root/results/nmapscan.txt

## Finalrecon scan
python3 /root/finalrecon/finalrecon.py --full ${full_target} -o finalrecon.txt
cp -r /root/.local/share/finalrecon/dumps /root/results

## Sublist3r subdomain enumeration
python3 /root/Sublist3r/sublist3r.py -d ${target} -o /root/results/sublist3rscan.txt

## host and dig scanning subdomains
host -t ns ${target} > /root/results/hostscan.txt
dig -t axfr ${target} >> /root/results/digscan.txt

## nikto scan
cd /root/results/
perl /root/nikto/program/nikto.pl -h ${target} -C all > /root/results/nikto.txt

