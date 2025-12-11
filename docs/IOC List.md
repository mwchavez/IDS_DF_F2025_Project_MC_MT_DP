# Indicators of Compromise (IOCs) – Ursnif / Gozi (2021-05-14 PCAP)

This document summarizes the main Indicators of Compromise (IOCs) for the
Ursnif (Gozi/ISFB) infection associated with the
**2021-05-14 – Email attachment from 10 days prior still pushing Ursnif** case.
IOCs are grouped into email, file, network, and host-artifact categories.

---

## 1. Email IOCs

- **Campaign:** Reply-style malspam delivering Ursnif / Gozi banking trojan  
- **Approximate subject:** `Re: Your [redacted] Application`  
- **Email client in screenshot:** Mozilla Thunderbird  
- **Lure theme:** Fake “application update / payment accepted” message
  encouraging the user to open the attached Excel file.

These items help identify similar malspam in mail gateways, archives, or EDR
email telemetry.

---

## 2. File IOCs

The Malware-Traffic-Analysis case provides the following files for this
infection:

- `2021-05-03-malspam-pushing-Ursnif.eml`
- `I8m7XluZbbj10J53.xlsb` – malicious Excel attachment (macro-enabled)
- `block.dll` – Ursnif DLL payload
- `2021-05-14-Ursnif-infection-traffic.pcap`
- `2021-05-14-IOCs-for-Ursnif-infection.txt` – original IOC text file

### 2.1 Filenames & Paths (expected on victim host)

| Type        | Value / Pattern                                                      | Notes                                              |
|------------|-----------------------------------------------------------------------|---------------------------------------------------|
| Email file | `2021-05-03-malspam-pushing-Ursnif.eml`                               | Malicious email used in the lab case.            |
| Attachment | `I8m7XluZbbj10J53.xlsb`                                              | Malicious Excel workbook with macros.            |
| Payload    | `block.dll`                                                          | Ursnif DLL loaded after macro execution.         |
| Path       | `C:\Users\<user>\Downloads\I8m7XluZbbj10J53.xlsb`                     | Likely download location from email client.      |
| Path       | `%TEMP%\block.dll`                                                   | Typical drop location for payload DLL.           |
| Path       | `%APPDATA%\[hidden]\[extern].exe` or DLL                 | Common Ursnif persistence location.              |

### 2.2 File Hashes

The exact hashes are provided in `2021-05-14-IOCs-for-Ursnif-infection.txt`.
Record them here once you extract or calculate them in your lab:

```text
I8m7XluZbbj10J53.xlsb
    - SHA256: <HASH_FROM_IOC_FILE>
    - MD5:    <HASH_FROM_IOC_FILE>

block.dll
    - SHA256: <HASH_FROM_IOC_FILE>
    - MD5:    <HASH_FROM_IOC_FILE>

## 3. Network IOCs (from Wireshark / PCAP)

The following network indicators are observed in, or strongly associated with,
the 2021-05-14 Ursnif infection traffic.

### 3.1 Malicious Domains & IPs
Category	Domain / Hostname	IP (lab)	Notes
Payload hosting	docs.atu.ngr.mybluehost.me	162.241.24.7	Delivers payload components such as presentation.dll.
C2 infrastructure	app.buboleinov.com	34.95.142.247	Ursnif C2 domain used after infection.
C2 infrastructure	todo.faroin.at	34.95.142.247	Additional Ursnif C2 domain contacted in the pcap.

### 3.2 HTTP Request Patterns

Common HTTP patterns for this infection (visible in http.request):

GET /presentation.dll (host docs.atu.ngr.mybluehost.me) – payload download

GET /favicon.ico (host app.buboleinov.com) – beacon disguised as favicon

GET /<random path> (host app.buboleinov.com) – C2 check-ins

GET /<random path> and POST /<random path> (host todo.faroin.at) – C2 and/or data exfiltration

When documenting in your report, you can show one or two example HTTP streams

from “Follow TCP Stream” to demonstrate these patterns.
