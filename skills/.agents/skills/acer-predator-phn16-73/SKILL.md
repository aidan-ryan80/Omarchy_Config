---
name: acer-predator-phn16-73
description: >
  Reference for Acer Predator Helios Neo 16 AI (PHN16-73) hardware specs.
  Use when answering questions about this laptop's components, thermal system,
  storage layout, or dual-boot configuration.
---

# Acer Predator Helios Neo 16 AI (PHN16-73) Hardware Reference

## System Identifiers

| Field | Value |
|-------|-------|
| Model | Acer Predator Helios Neo 16 AI |
| Model Number | PHN16-73 |
| BIOS | InsydeH20 Rev 5.0, firmware v1.26 (2026-02-23) — hidden options: Ctrl+S for VMD, Ctrl+D for Customization Key/Keyboard |

## Core Components

| Component | Spec |
|-----------|------|
| **CPU** | Intel Core Ultra 9 275HX (Arrow Lake-HX, 2nm, 24 cores: 8P+16E, up to 5.4 GHz, 36 MiB L3) |
| **iGPU** | Intel Graphics (Arrow Lake-S) |
| **dGPU** | NVIDIA GeForce RTX 5070 Max-Q / Mobile (GB206M, 8GB GDDR7, 140W TGP) |
| **RAM** | 32 GB DDR5-6400 (2x SODIMM slots, upgradable; ~30 GiB available, ~2 GiB reserved) |
| **Display** | 16" WQXGA (2560×1600), IPS or OLED option, 240 Hz, 16:10 — panel: AU Optronics B160QAN03.Y |

## Storage

This machine has dual-disk setup:

| Disk | Model | Size | OS | Notes |
|------|-------|------|----|-------|
| nvme0n1 | SK Hynix HFS001TEJ9X125N 1TB | 953.9G | **Windows** | Factory SSD (broken BCD) |
| nvme1n1 | Predator SSD GM7000 1TB | 953.9G | **Linux (Arch/Omarchy)** | User-added SSD |

Both slots are M.2 PCIe Gen4. The factory Windows SSD has a corrupted BCD from a Limine chainload attempt and drops to recovery loop.

## Thermal System

| Component | Detail |
|-----------|--------|
| **CPU TIM** | Liquid metal (factory-applied) |
| **GPU TIM** | Standard thermal paste |
| **Fans** | AeroBlade 3D Gen 5 (all-metal, dual fans) |
| **Heat pipes** | Shared heat pipe assembly (CPU + GPU) |
| **Vents** | Bottom intake, rear/side exhaust |

**Liquid metal notes:**
- Electrically conductive — a spill can short motherboard components
- Gallium alloys with copper heatsink over time (~2-3 years), degrading thermal performance
- Keep laptop horizontal when hot to prevent migration
- If repasting, PTM7950 phase-change pad is the recommended safer alternative to LM (non-conductive, no copper degradation)

## Connectivity

| Port/Slot | Type | GPU Routing |
|-----------|------|-------------|
| USB-C (TB4) | USB4 40 Gbps + Thunderbolt 4, DP over USB-C, PD 100W | **iGPU** (Intel Arrow Lake) — via TB4 controller |
| USB-C (DP) | USB 3.2 Gen2 10 Gbps, DP over USB-C, PD 100W | **iGPU** (Intel Arrow Lake) |
| USB-A | 3x USB 3.2 Gen2 | N/A |
| HDMI | 2.1 | **dGPU** (NVIDIA RTX 5070) — per Notebookcheck review, not documented in Acer manuals |
| Ethernet | 2.5 Gb (Killer E3100G) | N/A |
| Wi-Fi | Intel Arrow Lake PCH CNVi (Wi-Fi 7) | N/A |
| Bluetooth | 5.3/5.4 | N/A |
| Audio | 3.5mm combo jack | N/A |
| Card Reader | microSD | N/A |
| DC-in | Barrel plug (245W/330W adapter) | N/A |

**GPU Routing Summary:**
- **HDMI 2.1** → directly connected to NVIDIA RTX 5070 dGPU. Only port confirmed to route through dGPU.
- **Both USB-C ports** → route through Intel Arrow Lake iGPU. TB4 controller and USB-C DP Alt Mode are integrated into the CPU package.
- **Internal display** → switchable between iGPU and dGPU via MUX switch / Advanced Optimus (controlled through PredatorSense).
- Acer's official documentation **does not mention** GPU routing. dGPU-to-HDMI routing is from third-party hardware reviews.

## Power & Battery

| Component | Spec |
|-----------|------|
| Battery | 90 Wh, 4-cell Li-ion, model SIMPLO AP21A7T |
| Adapter | 245W (RTX 5070 config) or 330W (higher-tier GPU) |
| USB-C charging | Up to 100W (slow charge, suitable for light use) |

## Physical

| Dimension | Value |
|-----------|-------|
| Weight | ~2.7 kg (5.95 lbs) |
| Width | 356.78 mm |
| Depth | 275.5 mm |
| Height | 26.75 mm (rear, tapers forward) |

## Built-in Peripherals

| Device | Model |
|--------|-------|
| Webcam | ACER FHD User Facing (Quanta) |
| Touchpad | HID I2C (2808:0352) |
| Keyboard | AT Translated Set 2 (HID I2C or PS/2, switchable in BIOS) |
| Hotkeys | Acer WMI + Intel HID events |
| Lid switch | Present |

## BIOS

- Enter with `F2` during boot
- Hidden options:
  - `Ctrl+S` on Main tab → shows VMD Controller settings
  - `Ctrl+D` on Main tab → shows Customization Key and Keyboard type options
- **Customization Key**: Reassigns dedicated Copilot key
- **Keyboard**: Switch between HID I2C (default) and PS/2 interface
- **Display Language**: Select BIOS language

## Known Issues

- Windows BCD is corrupted (0xc000000f) from Limine chainload attempt — needs WinRE recovery: mount EFI partition, `bcdboot C:\Windows /s S: /f UEFI`
- Liquid metal may need attention at ~2-3 year mark (replace with PTM7950 recommended)
- Glossy OLED variant has high reflectivity

## Boot Configuration

Current boot stack on the Linux disk (`nvme1n1`):
- **Bootloader**: Limine (`/boot/limine.conf`)
- **Kernel**: Standard Arch Linux
- **Initramfs**: mkinitcpio
- **Root**: LUKS encrypted (`/dev/nvme1n1p2`)

Windows disk layout (`nvme0n1`): ESP at `nvme0n1p1` (vfat), main partition `nvme0n1p3`, recovery `nvme0n1p4`.
