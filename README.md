# UIW IDS / Digital Forensics Group Project

Proposal for Group Project – Cyber Security Systems – University of the Incarnate Word  

---

## Project Status

This repository is an **active course project**.  
It contains configuration files, documentation, PCAPs, and screenshots used to:

- Configure and run **Security Onion / Zeek** for intrusion detection.
- Analyze **PCAP captures** for digital forensics.
- Prepare a **written proposal, final documentation, and presentation**.

As of this version, the repo is focused on completing the semester deliverables. Future updates are expected to be minor corrections, clarifications, and “future work” ideas rather than large new features.

---

## Introduction

This project combines **Intrusion Detection Systems (IDS)** and **Digital Forensics (DF)** into a single end-to-end workflow.

The goals are to:

- Stand up and tune an IDS stack (Security Onion + Zeek/Suricata).
- Capture and analyze network traffic with PCAPs.
- Reconstruct activity and extract evidence for a hypothetical case.
- Document findings and recommendations in a professional format.

The repository is organized around **configuration**, **documentation**, **pcap data**, and **supporting artifacts** such as screenshots and future work notes.

---

## Full Documentation

Full project documentation lives in:

- `docs/` – written proposal, milestone write-ups, runbooks, and final report.
- `futurework` – notes on additional work, improvements, or extensions beyond the current semester.
- `**WORK IN PROGRESS** LINK TO PRESENTATION` – file containing the link to the slide deck / final presentation.

These files describe:

- Project scope and objectives.
- Environment design (Security Onion, Zeek, PCAP workflow).
- Step-by-step procedures used in each milestone.
- Results, analysis, and conclusions.

---

## Repository Structure

Top-level layout (matches the folders in this repo):

- `config/`  
  IDS / Zeek configuration files.  
  Example: `config/Zeek/` for custom Zeek config, scripts, and tuning related to the project.

- `docs/`  
  Documentation for the group project:
  - Proposal and problem statement.
  - Milestone descriptions.
  - Final report (IDS + DF).
  - Any supporting markdown / PDFs requested by the instructor.

- `pcap/`  
  PCAP files used in the labs and analysis.  
  These captures feed both:
  - IDS testing/tuning (Security Onion, Zeek, Suricata).
  - Digital forensics reconstruction in Wireshark.

- `project_pictures/`  
  Screenshots and images for milestones and documentation, such as:
  - Security Onion dashboards.
  - Zeek/Suricata alerts.
  - Wireshark views of interesting traffic.
  - Diagrams used in the report or presentation.

- `futurework`  
  Text/markdown describing future enhancements:
  - Additional detection logic.
  - Alternative tools or configurations.
  - Ways to extend the lab for future semesters.

- `**WORK IN PROGRESS** LINK TO PRESENTATION`  
  Convenience file that stores the link to the group’s slide deck or demo.

- `README.md`  
  This file.

---

## Communication

For course-related questions and grading:

- Use the communication channels specified by the **UIW instructor**  
  (email, Canvas discussion, or office hours).

For technical issues with this repository:

- Use the **GitHub Issues** tab to track bugs, missing files, or suggestions.
- Include:
  - What you tried.
  - Expected vs. actual behavior.
  - Any relevant screenshots or error messages.

If this repo is cloned or forked for another group, update this section with your own contact information.

---

## What does it do?

### 1) IDS: Security Onion / Zeek Configuration

- Stores **Zeek and related configs** under `config/`.
- Uses `pcap/` traffic to:
  - Validate that Zeek scripts and tuning work as expected.
  - Generate logs that support our detection use-cases.
- Provides screenshots in `project_pictures/` to show:
  - Alerts and logs in the Security Onion interface.
  - Evidence that rules and configs are functioning.

### 2) Digital Forensics: PCAP Reconstruction

- Uses PCAP files in `pcap/` as the basis for DF analysis.
- Reconstructs sessions and timelines in Wireshark:
  - HTTP, DNS, and other protocols of interest.
  - Suspicious flows tied back to the project scenario.
- Documents findings and evidence in `docs/`:
  - Timelines.
  - Key events.
  - Extracted artifacts and IOCs.

### 3) Documentation, Pictures, and Future Work

- `docs/` ties everything together into a **coherent narrative**:
  - Project proposal.
  - Methods and tools used.
  - Results and recommendations.
- `project_pictures/` supplies visual proof for milestones.
- `futurework` outlines how this lab could be expanded or improved in the future.

---

## “Hello World” Example

A minimal workflow for using the contents of this repo looks like:

1. **Open a PCAP from `pcap/` in Wireshark**

   ```bash
   wireshark pcap/example_capture.pcap
   - Verify that basic protocols (IP, TCP, HTTP, DNS, etc.) are visible.
   - Use this to confirm that the PCAP files in the repo are valid and useful.

2. **Replay or import the same PCAP into Security Onion / Zeek**

   - Use your course-approved method to:
     - Import the PCAP.
     - Generate Zeek logs.
   - Confirm that:
     - Zeek logs are produced.
     - Any expected alerts or notices fire.

This “Hello World” verifies that the **pcap**, **config**, and **docs** pieces of the project are aligned.

---

## Environment & Dependencies

This project assumes access to:

- **Security Onion** (or Zeek/Suricata in a similar lab environment).
- **Wireshark** for packet analysis.
- A host or VM with enough resources to:
  - Run the IDS stack.
  - Load and inspect PCAPs.

Exact installation steps and IP addressing are documented in the course materials and/or in `docs/`.

---

## Run Demo

A typical end-to-end demo using this repo:

1. Select a representative **PCAP** from `pcap/`.
2. Import or replay it into **Security Onion**, generating Zeek/Suricata output.
3. Capture screenshots of:
   - Dashboards.
   - Alerts.
   - Relevant logs.  
   and store them in `project_pictures/`.
4. Open the same PCAP in **Wireshark**:
   - Reconstruct key conversations.
   - Identify indicators of compromise or suspicious behavior.
5. Update `docs/`:
   - Describe what the IDS saw.
   - Describe what DF analysis confirmed.
   - Connect the findings to your proposal and learning objectives.

The presentation link (stored in `**WORK IN PROGRESS** LINK TO PRESENTATION`) is used to walk through this demo live.

---

## Bugs and Feedback

If you find:

- Broken links in docs.
- Missing PCAPs or images.
- Incorrect configuration paths.

Please:

1. Open an **Issue** in this repository.
2. Add a short description and, if possible, steps to reproduce.

For grading / rubric questions, always contact the **UIW instructor** directly.

---

## License

This repository is created for coursework in the  
**Cyber Security Systems program at the University of the Incarnate Word**.

Unless otherwise stated:

- Copyright © 2025, UIW IDS_DF_F2025_Project_MC_MT_DP Team.  
- All rights reserved.  

You may view and fork this repository for **educational purposes**, but must:

- Follow UIW’s academic integrity policies.
- Not submit this work as your own for any other course without permission.
- Preserve appropriate attribution if reusing material.

