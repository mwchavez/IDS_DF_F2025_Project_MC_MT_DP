# IDS_DF_2025_Project_MC_MT_DP
A project including the concepts form Intrusion Detection Systems &amp; Digital Forensics. Made by Moses Chavez, Marissa Turner, &amp; Dylan Ponce
from pptx import Presentation
from pptx.util import Inches, Pt

prs = Presentation()

def add_slide(title, bullets):
    slide_layout = prs.slide_layouts[1]  # title and content
    slide = prs.slides.add_slide(slide_layout)
    slide.shapes.title.text = title
    body = slide.shapes.placeholders[1].text_frame
    for b in bullets:
        p = body.add_paragraph()
        p.text = b
        p.level = 0

# Title slide
slide = prs.slides.add_slide(prs.slide_layouts[0])
slide.shapes.title.text = "Digital Forensics Case Study: Suspicious Network Activity"
slide.placeholders[1].text = "Wireshark Analysis • IDS Response • Phishing Impact"

# Case Study Summary
add_slide("Case Study Overview", [
    "Unusual outbound traffic detected from junior accountant's workstation",
    "Strange DNS requests and repeated connections to unknown IP",
    "Spike in encrypted outbound traffic during non-business hours",
    "Antivirus showed no alerts; IDS flagged possible malware C2 traffic",
    "SOC captured PCAP files for forensic analysis"
])

# Phishing → DoS Incident Summary
add_slide("Phishing Attack Impact", [
    "Employee clicked malicious link in phishing email",
    "Initial infection led to suspicious outbound communication",
    "Attack escalated into a DoS attack on company services",
    "Services experienced temporary outage"
])

# Wireshark vs Tshark
add_slide("Why Wireshark Instead of Tshark?", [
    "Wireshark provides a graphical user interface (GUI)",
    "Easier to navigate packet streams during presentation",
    "Tshark is terminal-based and less visual for demonstrations",
    "Wireshark better suited for DFIR teaching and showcasing analysis"
])

# Investigative Questions Slide 1
add_slide("Primary Investigative Questions (1/2)", [
    "Is the workstation communicating with suspicious IPs or domains?",
    "Are there unusual DNS queries or repeated beaconing patterns?",
    "Is there evidence of data exfiltration or unauthorized transfers?",
    "Which protocols are involved, and are they normal for this host?"
])

# Investigative Questions Slide 2
add_slide("Primary Investigative Questions (2/2)", [
    "Does the traffic timeline match a possible infection event?",
    "Is there lateral movement to other internal systems?",
    "What malware family or behavior does the traffic resemble?",
    "What additional logs or evidence should be collected?"
])

# What You’re Investigating (Student View)
add_slide("Short Explanation of the Case Study", [
    "Workstation sending unusual DNS and encrypted traffic late at night",
    "No antivirus alerts, but IDS detected suspicious activity",
    "PCAP files collected for deeper inspection",
    "Your role: Determine malware presence, activity, and exfiltration"
])

# Explanation of Investigative Questions
add_slide("What the Investigative Questions Mean", [
    "Identify suspicious servers or domains in the traffic",
    "Look for indicators of malware communication (C2 patterns)",
    "Determine whether sensitive data was stolen",
    "Assess protocol behavior for anomalies",
    "Check timing for infection clues",
    "Search for lateral movement attempts"
])

# Scope Statement
add_slide("Scope Statement", [
    "Investigate how phishing emails impact business operations",
    "Analyze collected PCAP using Wireshark",
    "Demonstrate digital forensics workflow",
    "Present how IDS contributed to detection and response"
])

# Incident Scope
add_slide("Incident Scope", [
    "Wireshark used for packet-level forensic analysis",
    "Chosen over Tshark due to GUI advantages for demonstration",
    "Online and internal resources used to support investigation",
    "Goal: Identify root cause, malware activity, and impact"
])

# Placeholder Resources Slide
add_slide("Resources Used", [
    "Wireshark Packet Analyzer",
    "Company SOC IDS Logs",
    "Online Threat Intelligence Sources",
    "(Add additional resources as needed)"
])

# Save PPTX
filepath = "/mnt/data/Forensics_Case_Study_Presentation.pptx"
prs.save(filepath)
filepath
