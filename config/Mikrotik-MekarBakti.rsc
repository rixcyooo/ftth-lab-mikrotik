# apr/15/2026 16:33:42 by RouterOS 6.49.19
# software id = 
#
#
#
/interface ethernet
set [ find default-name=ether1 ] comment=Link-Core disable-running-check=no
set [ find default-name=ether2 ] comment=PC disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip address
add address=10.10.10.2/30 interface=ether1 network=10.10.10.0
add address=192.168.30.1/30 interface=ether2 network=192.168.30.0
/ip dns
set allow-remote-requests=yes servers=8.8.8.8
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/ip route
add distance=1 gateway=10.10.10.1
/system identity
set name=Mikrotik-MekarBakti
/tool romon
set enabled=yes
