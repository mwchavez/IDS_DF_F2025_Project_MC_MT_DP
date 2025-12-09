## IDS-13 – Enable Zeek for conn, DNS, HTTP, SSL/TLS

For IDS-13, I verified that Zeek was enabled on the Security Onion sensor and that it was producing the core protocol logs required for this milestone.

- In the SOC web UI, I confirmed that the Zeek service was reported as healthy.
- On the Security Onion VM, I checked the Zeek log directory at `/nsm/bro/logs/current/` and verified that the following files were present and actively updating:
  - `conn.log` – connection metadata
  - `dns.log` – DNS queries and responses
  - `http.log` – HTTP requests and responses
  - `ssl.log` and `x509.log` – TLS handshake and certificate information
- This confirmed that Zeek was enabled and monitoring the same traffic seen by Suricata on the lab network.

---

## IDS-14 – Generate Sample HTTP, DNS, and TLS Traffic and Confirm Logs

For IDS-14, I generated representative HTTP, DNS, and TLS traffic from the Kali VM and verified that Zeek produced corresponding log entries.

### HTTP Traffic

- From Kali (10.10.10.5), I generated HTTP requests to hosts on the monitored network and, if available, external HTTP sites, for example:
  - `curl http://10.10.10.1/`
  - `curl http://example.com/`
- In `http.log`, I confirmed entries with:
  - `id.orig_h` = 10.10.10.5 (Kali)
  - `id.resp_h` = the HTTP server IP (for example 10.10.10.1 or the external site’s IP)
  - Fields such as `method`, `host`, `uri`, and `status_code` populated with the expected values.

### DNS Traffic

- From Kali, I generated DNS queries such as:
  - `dig example.com`
  - `dig securityonion.net`
- In `dns.log`, I confirmed entries with:
  - `id.orig_h` = 10.10.10.5
  - `query` matching the requested domains
  - `qtype_name` and `rcode_name` showing the query type (for example A) and the response code (for example NOERROR).

### TLS Traffic

- From Kali, I generated TLS traffic, for example:
  - `curl https://example.com`
- In the Zeek logs, I confirmed:
  - `conn.log` entries where `service` was identified as `ssl`.
  - Corresponding `ssl.log` entries for those connections, including fields such as `server_name` (SNI), `version`, and `cipher`.
  - `x509.log` entries with certificate subject and issuer information for the same TLS sessions.

These checks confirmed that Zeek was successfully capturing HTTP, DNS, and TLS activity associated with the lab traffic generated from the Kali VM.

---

