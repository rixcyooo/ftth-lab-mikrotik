# FTTH Lab Simulation (MikroTik CHR + GNS3)

## 📌 Overview
Lab ini mensimulasikan jaringan FTTH (Fiber To The Home) menggunakan MikroTik CHR dalam lingkungan virtual GNS3.

Topologi ini mencakup implementasi PPPoE dan Hotspot dalam satu jaringan dengan segmentasi VLAN serta komunikasi antar router.

---

## 🗺️ Topology
topology/

---

## ⚙️ Environment
- GNS3
- MikroTik CHR
- Ubuntu Server (Client)

---

## 🧩 Fitur yang Diimplementasikan
- VLAN segmentation
- PPPoE Server (multi client)
- Hotspot authentication
- DHCP Server
- NAT (internet access)
- Routing antar jaringan (core & branch)

---

## 💻 Setup Client

### PPPoE Client (Ubuntu)
```bash
apt update
apt install ppp pppoe -y
```
### Hotspot Client (Ubuntu)
```bash
apt update
apt install lynx -y
```
---

## Konfigurasi Utama

### Set VLAN pada MikroTik CORE
```bash
/interface vlan add name=vlan10 vlan-id=10 interface=ether2
/interface vlan add name=vlan20 vlan-id=20 interface=ether2
```
