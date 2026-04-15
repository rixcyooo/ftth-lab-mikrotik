# apr/15/2026 23:30:36 by RouterOS 6.49.19
# software id = 
#
#
#
/interface ethernet
set [ find default-name=ether1 ] comment=INTERNET disable-running-check=no
set [ find default-name=ether2 ] comment=Uplink-Switch disable-running-check=\
    no
set [ find default-name=ether3 ] comment=Link-Cabang disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
/interface vlan
add comment=PPPOE interface=ether2 name=vlan-10 vlan-id=10
add comment=HOTSPOT interface=ether2 name=vlan-20 vlan-id=20
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] dns-name=hotspot.local
add dns-name=hotspot.local hotspot-address=192.168.20.1 login-by=\
    http-chap,http-pap,mac-cookie name=hsprof1
/ip pool
add comment=PPPOE name=pool1-PPPOE ranges=192.168.10.2-192.168.10.254
add comment=HS name=hs-pool-6 ranges=192.168.20.2-192.168.20.254
add name=dhcp_pool7 ranges=192.168.1.2-192.168.1.6
/ip dhcp-server
add address-pool=hs-pool-6 disabled=no interface=vlan-20 name=dhcp2
/ip hotspot
add address-pool=hs-pool-6 disabled=no interface=vlan-20 name=hotspot1 \
    profile=hsprof1
/ppp profile
add dns-server=8.8.8.8 local-address=192.168.10.1 name=ppp10 only-one=yes \
    rate-limit=5M/5M remote-address=pool1-PPPOE
/interface pppoe-server server
add default-profile=ppp10 disabled=no interface=vlan-10 one-session-per-host=\
    yes service-name=pppoe10
/ip address
add address=192.168.20.1/24 interface=vlan-20 network=192.168.20.0
add address=10.10.10.1/30 interface=ether3 network=10.10.10.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=192.168.10.0/24 gateway=192.168.10.1
add address=192.168.20.0/24 comment="hotspot network" dns-server=192.168.20.1 \
    gateway=192.168.20.1
/ip dns
set allow-remote-requests=yes servers=8.8.8.8
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat out-interface=ether1
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.168.20.0/24
/ip hotspot user
add name=admin password=admin
/ip route
add distance=1 dst-address=192.168.30.0/30 gateway=10.10.10.2
/ppp secret
add comment=user10 name=user10 password=12345 profile=ppp10 service=pppoe
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=MikroTik-PPPOE
/system ntp client
set enabled=yes primary-ntp=202.162.32.12 secondary-ntp=103.169.192.230
/tool romon
set enabled=yes
