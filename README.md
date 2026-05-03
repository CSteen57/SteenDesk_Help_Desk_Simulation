# SteenCorp Help Desk Simulation Lab

> Simulated help desk lab built on top of the SteenCorp Active Directory domain to demonstrate user support, troubleshooting, documentation, and ticket resolution workflows.

---

## Overview

This project extends the **SteenCorp Enterprise IT Lab** by adding realistic help desk ticket scenarios.

Instead of building a new environment from scratch, this lab uses the existing `steencorp.local` domain to simulate common IT support issues in an established Windows environment.

The focus of this lab is simple:

> Receive a user issue, troubleshoot it, resolve it, validate the fix, and document the work clearly.

---

## Relationship to SteenCorp Lab

This lab is built directly on top of the existing SteenCorp Active Directory environment:

[SteenCorp Enterprise IT Lab](https://github.com/CSteen57/SteenCorp-AD-Lab)

The following components are reused:

- Active Directory Domain: `steencorp.local`
- Windows Server 2022 Domain Controller
- Windows 11 domain-joined client
- Organizational Units
- Security groups
- Group Policy
- NTFS and share permissions
- Department-based access control

---

## Objective

Simulate day-to-day help desk responsibilities by:

- Responding to user-reported issues
- Troubleshooting access and configuration problems
- Using basic Windows and Active Directory tools
- Validating fixes from the user perspective
- Documenting the issue, root cause, resolution, and closure notes

---

## Current Status

This lab is currently in progress.

The first ticket focuses on a common help desk issue:

> A Sales user can sign into the domain but does not see their mapped Sales drive.

Additional tickets will be added over time.

---

## Ticket Priority Guide

| Priority | Description | Example |
|---|---|---|
| High | Multiple users affected or major access outage | Department unable to access shared drive |
| Medium | Single user affected with work impact | One user missing mapped drive |
| Low | Minor issue or request with workaround available | Desktop shortcut request |

---

## Ticket Categories

This lab will include simulated tickets across common help desk scenarios:

- Access issues
- Mapped drive issues
- Group Policy issues
- Account lockouts
- Permission validation
- Basic network troubleshooting

View ticket documentation here:

[Help Desk Ticket Index](./Helpdesk_Tickets/README.md)

---

## Ticket Documentation Format

Each ticket follows a simple support format:

- User Report
- Impact
- Priority
- Troubleshooting Steps
- Root Cause
- Resolution
- Validation
- Closure Notes

---

## Skills Demonstrated

- Active Directory user and group troubleshooting
- Group Policy validation
- Mapped drive troubleshooting
- NTFS and share permission validation
- Command-line troubleshooting using `whoami`, `gpupdate`, `gpresult`, and `net use`
- Help desk-style documentation
- User-focused issue resolution

---
---

## Project Structure

<pre>
Helpdesk-Lab/
│
├── README.md
│
├── Helpdesk_Tickets/
│   ├── README.md
│   └── Tickets/
│       └── Ticket_001_User_Cannot_Access_Shared_Drive.md
│
└── Evidence/
    └── Helpdesk_Tickets/
        └── Ticket_001_User_Cannot_Access_Shared_Drive/
</pre>

---

## Key Concept

This lab is not focused on building infrastructure from scratch.

It is focused on:

> Supporting, troubleshooting, and maintaining an existing environment.

This reflects real-world help desk and MSP roles where systems are already in place and technicians are responsible for resolving user issues, documenting work, and validating fixes.

---

## Future Expansion

Planned additions:

- Account lockout ticket
- Access denied ticket
- Group Policy troubleshooting ticket
- Basic DNS/DHCP troubleshooting ticket
- Escalation notes from Tier 1 to Tier 2
- Remote support simulation
