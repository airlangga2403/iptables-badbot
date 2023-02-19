import subprocess

with open('ip.txt', 'r') as f:
    for ip_address in f:
        # Strip any whitespace characters (e.g. newline) from the IP address
        ip_address = ip_address.strip()

        # Run the iptables command for this IP address
        cmd = ['sudo', 'iptables', '-A', 'INPUT', '-s', ip_address, '-j', 'DROP']
        subprocess.run(cmd)
        print(f"Blocking IP address: {ip_address}")
