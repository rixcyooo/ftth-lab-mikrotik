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

## 🔧 Konfigurasi Di MikroTik CORE

### VLAN
```bash
/interface vlan add name=vlan10 vlan-id=10 interface=ether2
/interface vlan add name=vlan20 vlan-id=20 interface=ether2
```
### PPPoE Server
```bash
/interface pppoe-server server add interface=vlan10 disabled=no
```
### Hotspot Server
```bash
/ip hotspot setup
```
### NAT
```bash
/ip firewall nat add chain=srcnat action=masquerade
```

## 🧪 Testing

### PPPoE
```bash
pppd call ppp10
```
Expected:
- Client mendapatkan IP
- Koneksi internet berjalan
### Hotspot
```bash
lynx google.com
```
Expected:
- Redirect ke halaman login hotspot
- Setelah login → bisa akses internet

## 🧠 Kesimpulan
Melalui lab ini, saya memahami:
- Implementasi PPPoE dan Hotspot dalam satu topologi
- Pentingnya VLAN untuk segmentasi jaringan
- Peran routing dalam menentukan jalur komunikasi
- Proses troubleshooting jaringan secara lebih terstruktur



