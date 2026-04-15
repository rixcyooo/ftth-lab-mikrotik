# apr/15/2026 16:32:34 by RouterOS 6.49.19
# software id = 
#
#
#
/interface bridge
add name=bridge1 vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/interface bridge port
add bridge=bridge1 interface=ether1
add bridge=bridge1 comment=PPPOE interface=ether2 pvid=10
add bridge=bridge1 comment=HOTSPOT interface=ether3 pvid=20
/interface bridge vlan
add bridge=bridge1 tagged=ether1 untagged=ether2 vlan-ids=10
add bridge=bridge1 tagged=ether1 untagged=ether3 vlan-ids=20
/ip dhcp-client
# DHCP client can not run on slave interface!
add disabled=no interface=ether1
/system identity
set name=MikroTik-Switch
/tool romon
set enabled=yes
