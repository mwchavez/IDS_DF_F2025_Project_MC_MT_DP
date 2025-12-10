## IDS-16 – Validation Checklist

This checklist is designed so the IDS Milestone 2 lab can be re-run from scratch and validated end-to-end.

### Environment / Services

- [ ] Power on Security Onion VM and Kali VM.
- [ ] From Kali, verify connectivity to the monitored network (for example, ping 10.10.10.1).
- [ ] Log into the Security Onion SOC web UI.
- [ ] Confirm top-right health indicators show Suricata and Zeek as healthy (even if Suricata shows “Rule Mismatch,” proceed as long as services are running).

### Rule Pack Verification (Suricata)

- [ ] In SOC, go to **Detections → Suricata (NIDS)**.
- [ ] Confirm the following rules are present and **Enabled**:
  - [ ] `LAB Possible TCP SYN Scan` (SID 9000001, ruleset `__custom__`).
  - [ ] `LAB Possible SSH Brute Force` (SID 9000002, ruleset `__custom__`).
  - [ ] `ET WEB_SPECIFIC_APPS SnortReport nmap.php target Parameter Arbitrary Command Execution Attempt` (SID 2011555, ruleset `ETOPEN`).
- [ ] If any rule is disabled, enable it and run a Suricata rules update (FULL UPDATE from the Detections → Options menu, if needed).

### Zeek Logging Verification

- [ ] On the Security Onion VM, check `/nsm/bro/logs/current/`.
- [ ] Confirm presence of:
  - [ ] `conn.log`
  - [ ] `dns.log`
  - [ ] `http.log`
  - [ ] `ssl.log` and/or `x509.log`
- [ ] Optionally, `tail` one of the logs to confirm new entries are being written.

### Scenario A – Port Scan (LAB Possible TCP SYN Scan)

- [ ] On Kali, run:  
      `sudo nmap -sS -T4 -p 1-100 10.10.10.1`
- [ ] On Security Onion, confirm traffic is visible (optional):  
      `sudo tcpdump -i <sensor_interface> host 10.10.10.5 -n`
- [ ] In SOC → Alerts, set time range to **Last 15 minutes**.
- [ ] Search/filter for the signature name `LAB Possible TCP SYN Scan`.
- [ ] Check for any alert rows that correspond to this scenario.
- [ ] Capture a screenshot of the Alerts page (even if there are zero hits) and note the approximate time of the scan.

### Scenario B – SSH Brute/Scan (LAB Possible SSH Brute Force)

- [ ] On Kali, run:  
      `for i in $(seq 1 25); do nc -vz 10.10.10.1 22; done`
- [ ] In SOC → Alerts (Last 15 minutes), search/filter for `LAB Possible SSH Brute Force`.
- [ ] Check for any alert rows that correspond to this scenario.
- [ ] Capture a screenshot of the Alerts view, even if no matches are present.
- [ ] Optionally, confirm in `conn.log` that multiple connections from 10.10.10.5 to 10.10.10.1:22 were recorded.

### Scenario C – HTTP Web Attack (SnortReport nmap.php)

- [ ] On Kali, run:  
      `curl "http://10.10.10.1/nmap.php?target=1.2.3.4"`
- [ ] In SOC → Alerts (Last 15 minutes), search/filter for `nmap.php` or the full SnortReport rule title.
- [ ] Check for any alert rows that correspond to this scenario.
- [ ] Capture a screenshot of the Alerts view, even if no matches are present.
- [ ] Optionally, confirm in `http.log` that HTTP requests from 10.10.10.5 to 10.10.10.1 were recorded.

### Wrap-Up

- [ ] Save all screenshots for Scenarios A, B, and C (Alerts view and any tcpdump/Zeek validation).
- [ ] Note whether each scenario produced:
  - [ ] Alerts as expected.
  - [ ] No alerts but visible packets/Zeek logs.
- [ ] Update the write-up to reflect the actual outcome (success/failure) for each scenario.

---


