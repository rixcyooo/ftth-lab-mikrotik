# FTTH Lab Simulation (MikroTik CHR + GNS3)

##  Overview
Lab ini mensimulasikan jaringan FTTH (Fiber To The Home) menggunakan MikroTik CHR dalam lingkungan virtual GNS3.

Topologi ini mencakup implementasi PPPoE dan Hotspot dalam satu jaringan dengan segmentasi VLAN serta komunikasi antar router.

---

##  Topology
topology/Screenshot from 2026-04-15 13-13-38.png

---

##  Environment
- GNS3
- MikroTik CHR
- Ubuntu Server (Client)

---

##  Fitur yang Diimplementasikan
- VLAN segmentation
- PPPoE Server (multi client)
- Hotspot authentication
- DHCP Server
- NAT (internet access)
- Routing antar jaringan (core & branch)

---

##  Setup Client

### Hotspot Client (Ubuntu)
apt update
apt install lynx -y

### PPPoE Client (Ubuntu)
apt update
apt install ppp pppoe -y


