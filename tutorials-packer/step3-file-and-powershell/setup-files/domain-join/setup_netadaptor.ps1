# On Azure Windows VM, there is only 1 network interface with alias “Ethernet X”. X can be a number.
$netinf = Get-NetIPInterface -AddressFamily IPv4 -InterfaceAlias "Ethernet*" | Select-Object -First 1
# Set DNS server to be the private ip of the ADDC (10.0.0.4) and the Azure DNS service (168.63.129.16).
Set-DnsClientServerAddress -InterfaceAlias $netinf.InterfaceAlias -ServerAddresses ("10.0.0.4","168.63.129.16")