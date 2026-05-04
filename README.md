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
- Windows 11 domain-joined clients
- Organizational Units
- Security groups
- Group Policy
- NTFS and share permissions
- Department-based access control
- DHCP and DNS services
- VMware Workstation virtual networking
- Standard user and admin account separation

---

## Objective

Simulate day-to-day help desk responsibilities by:

- Responding to user-reported issues
- Troubleshooting access and configuration problems
- Supporting Active Directory user accounts
- Validating shared drive and login access
- Troubleshooting DNS, DHCP, and internet connectivity issues
- Using basic Windows, Active Directory, and VMware tools
- Applying least privilege concepts
- Validating fixes from the user perspective
- Documenting the issue, root cause, resolution, and closure notes

---

## Current Status

This lab is currently in progress.

Completed tickets so far include:

- User cannot access Sales shared drive
- User account lockout / sign-in failure
- User forgot password
- User cannot access network share by hostname
- User cannot install approved software
- User cannot access internet

---

## Ticket Progress

| Ticket | Scenario | Status |
|---|---|---|
| Ticket #001 | User cannot access Sales shared drive | Resolved |
| Ticket #002 | User account locked out / sign-in failure | Resolved |
| Ticket #003 | User forgot password | Resolved |
| Ticket #004 | User cannot access network share by hostname | Resolved |
| Ticket #005 | User cannot install approved software | Resolved |
| Ticket #006 | User cannot access internet | Resolved |

---

## Ticket Priority Guide

| Priority | Description | Example |
|---|---|---|
| High | Multiple users affected or major access outage | Department unable to access shared drive |
| Medium | Single user affected with work impact | Account lockout, password reset, shared drive access issue, DNS issue, internet connectivity issue |
| Low | Minor issue or request with workaround available | Approved software installation request |

---

## Ticket Categories

This lab includes simulated tickets across common help desk scenarios:

- Shared drive access issues
- Active Directory group membership issues
- Account lockouts
- Password resets
- Group Policy issues
- DNS and hostname resolution issues
- DHCP and gateway troubleshooting
- Internet connectivity issues
- VMware NAT troubleshooting
- Workstation support
- Approved software installation
- Standard user permission limitations
- Least privilege validation

View ticket documentation here:

[Help Desk Ticket Index](./Helpdesk_Tickets/README.md)

---

## Ticket Documentation Format

Each ticket follows a simple support format:

- User Report
- Impact and Scope
- Priority Classification
- Troubleshooting Steps
- Root Cause
- Resolution
- Validation
- Closure Notes
- Screenshot Evidence

---

## Skills Demonstrated

- Active Directory user and group troubleshooting
- Account lockout troubleshooting
- Password reset handling
- Group Policy validation
- Mapped drive troubleshooting
- NTFS and share permission validation
- DNS troubleshooting
- Hostname resolution testing
- DHCP scope option troubleshooting
- VMware Workstation virtual network troubleshooting
- NAT gateway validation
- Internet connectivity testing
- Standard user permission troubleshooting
- Approved software installation support
- Least privilege awareness
- Command-line troubleshooting using `whoami`, `ipconfig`, `ping`, `nslookup`, `gpupdate`, `gpresult`, `net use`, and PowerShell
- Help desk-style documentation
- User-focused issue resolution
- Root cause documentation

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
│       ├── Ticket001_User_Cannot_Access_Shared_Drive.md
│       ├── Ticket002_User_Account_Lockout.md
│       ├── Ticket003_User_Forgot_Password.md
│       ├── Ticket004_User_Cannot_Access_Network_Share_By_Hostname.md
│       ├── Ticket005_Approved_Software_Install.md
│       └── Ticket006_Mike_Ross_Cannot_Access_Internet.md
│
└── Evidence/
    └── Helpdesk_Tickets/
        ├── Ticket001_User_Cannot_Access_Shared_Drive/
        ├── Ticket002_User_Account_Lockout/
        ├── Ticket003_User_Forgot_Password/
        ├── Ticket004_User_Cannot_Access_Network_Share_by_Hostname/
        ├── Ticket005_Approved_Software_Install/
        └── Ticket006_Mike_Ross_Cannot_Access_Internet/
</pre>

> Note: Ticket evidence folders may be adjusted as tickets are completed and screenshots are added.

---

## Key Concept

This lab is not focused on building infrastructure from scratch.

It is focused on:

> Supporting, troubleshooting, and maintaining an existing environment.

This reflects real-world help desk and MSP roles where systems are already in place and technicians are responsible for resolving user issues, documenting work, validating fixes, and escalating when needed.

---

## Future Expansion

Planned additions:

- Additional help desk tickets
- Remote support simulation
- Printer troubleshooting
- VPN access troubleshooting
- Basic escalation notes from Tier 1 to Tier 2
- Networking-focused lab extension after the help desk tickets are completed
- Security monitoring or SIEM-focused ticket scenarios
