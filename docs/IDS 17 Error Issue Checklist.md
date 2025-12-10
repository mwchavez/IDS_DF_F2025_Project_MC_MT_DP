## IDS-17 – Error / Issue Checklist and Notes from Running the Validation

This section captures the most important issues observed when running the validation checklist and how they were handled or documented.

### Suricata Rule Mismatch / Rule Sync Issues

- [ ] Suricata health status shows `Rule Mismatch` in SOC.
- [ ] Checked **Hunt** logs for `suricata rule mismatch` messages to confirm that:
  - [ ] There were rules “deployed but not enabled” and/or “enabled but not deployed”.
- [ ] Actions taken:
  - [ ] Verified custom rules (`LAB Possible TCP SYN Scan`, `LAB Possible SSH Brute Force`) are syntactically correct and enabled.
  - [ ] Ran a **FULL UPDATE** for Suricata rules from Detections → Options.
  - [ ] If mismatch persists, documented it in the milestone write-up as a known issue.

### HOME_NET / Network Topology Confusion

- [ ] Observed that Security Onion interfaces were on 172.16.x / 172.17.x networks while Kali was on 10.10.10.0/24.
- [ ] Confirmed via `tcpdump` that Suricata was in fact seeing traffic between 10.10.10.5 (Kali) and 10.10.10.1 (gateway/target).
- [ ] Recognized that `$HOME_NET` definition and sensor interface mapping may not perfectly match the lab’s attack path.
- [ ] As a workaround, rules were relaxed (for example, using `-> any` as destination) during troubleshooting.
- [ ] Final outcome:
  - [ ] Packet visibility and Zeek logging are working.
  - [ ] Suricata alerts did not consistently appear for the custom rules, and this is explicitly documented in IDS-12.

### No Alerts Despite Traffic Visible in tcpdump/Zeek

- [ ] Verified with `tcpdump` and Zeek logs (for example, `conn.log`, `http.log`) that the scenarios generated traffic:
  - [ ] SYN scan traffic from Kali to 10.10.10.1.
  - [ ] Repeated SSH connection attempts to 10.10.10.1:22.
  - [ ] HTTP requests to `/nmap.php?target=...`.
- [ ] Checked SOC → Alerts with correct time range (Last 15 minutes) and appropriate filters.
- [ ] Result:
  - [ ] No matching alerts for the custom or SnortReport rules, despite traffic being visible.
- [ ] This behavior is noted in the milestone documentation as a detection gap caused by rule deployment / configuration issues rather than a lack of traffic.

### Checklist Corrections / Lessons Learned

- [ ] Updated commands in the checklist to use the actual lab network (`10.10.10.x`) instead of an abstract `SO_IP`.
- [ ] Added explicit steps to:
  - [ ] Confirm traffic visibility with `tcpdump` on the sensor interface.
  - [ ] Confirm Zeek logging independently of Suricata alerts.
- [ ] Clarified in the documentation that:
  - [ ] The primary goal of the milestone—demonstrating understanding of rule mapping, traffic generation, and validation steps—was achieved.
  - [ ] The missing alerts represent tuning and deployment issues to be improved in later milestones, not a misunderstanding of the IDS process.

### Final IDS-17 Note

After running the validation checklist on a fresh day, the main issues (Suricata rule mismatch status, HOME_NET alignment, and non-firing custom rules) were identified and documented. Although not every scenario produced an alert in the SOC “Alerts” view, the error checklist above now serves as a record of what went wrong, how it was investigated, and what should be revisited in future tuning work.

