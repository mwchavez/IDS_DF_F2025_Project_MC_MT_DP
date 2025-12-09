# IDS / Digital Forensics Project

This repository documents a combined **Intrusion Detection Systems (IDS)** and **Digital Forensics (DF)** project.  
It covers the full lifecycle of detecting malicious activity on the network (Security Onion / Suricata / Zeek) and then reconstructing and analyzing the evidence (Wireshark / DF workflows).

The repo is organized around two main tracks:

- **IDS Track** – Building, tuning, and validating an IDS sensor stack.
- **DF Track** – Reconstructing incidents, preserving evidence, and writing a final case report.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Repository Structure](#repository-structure)
- [Technologies Used](#technologies-used)
- [IDS Track – Milestones](#ids-track--milestones)
- [Digital Forensics Track – Milestones](#digital-forensics-track--milestones)
- [How to Reproduce / Run Labs](#how-to-reproduce--run-labs)
- [Learning Objectives](#learning-objectives)
- [How This Maps to User Stories & Issues](#how-this-maps-to-user-stories--issues)
- [License](#license)

---

## Project Overview

This project is structured as two parallel “mini–projects” that are tightly connected:

1. **Intrusion Detection Systems (IDS)**  
   - Work is performed primarily in **Security Onion** (Suricata + Zeek).
   - Focuses on:
     - Bringing the sensor online.
     - Capturing baseline network traffic.
     - Writing and testing custom Suricata rules.
     - Validating Zeek logs and building a hunt runbook.
     - Tuning noise vs signal and demonstrating live detections.

2. **Digital Forensics (DF)**  
   - Work is centered around **case-driven investigation**.
   - Focuses on:
     - Defining case scope and following chain-of-custody.
     - Hashing and preserving evidence.
     - Reconstructing activity from PCAPs with Wireshark.
     - (Optionally) performing memory/disk triage.
     - Producing a final written report, IOC list, and recommendations.

The goal is to show that:

> The IDS side can **detect** malicious or suspicious behavior in near real time,  
> and the DF side can **reconstruct, explain, and document** what actually happened.

---
