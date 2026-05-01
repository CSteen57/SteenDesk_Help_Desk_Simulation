# SteenCorp Help Desk Simulation Lab

> Simulated help desk environment built on top of the SteenCorp Active Directory domain to demonstrate real-world IT support workflows, ticket handling, SLA awareness, and troubleshooting.

---

## Overview

This project extends the **SteenCorp Enterprise IT Lab** by introducing a help desk simulation environment.

It focuses on real-world IT support scenarios where issues are reported by users, diagnosed, resolved, validated, and documented using structured troubleshooting and SLA-based prioritization.

Rather than building a new environment from scratch, this lab leverages the existing `steencorp.local` domain to simulate how support teams operate within an established infrastructure.

---

## Relationship to SteenCorp Lab

This lab is built directly on top of the existing domain environment:

👉 [SteenCorp Enterprise IT Lab](https://github.com/CSteen57/SteenCorp-AD-Lab)

The following components are reused:

- Active Directory Domain (`steencorp.local`)
- Organizational Unit (OU) structure
- Security groups and RBAC model
- Group Policy configurations
- Domain-joined client systems

This allows for realistic support scenarios instead of isolated test cases.

---

## Objective

Simulate day-to-day help desk responsibilities by:

- Responding to user-reported issues
- Diagnosing system and access problems
- Applying structured troubleshooting methodology
- Resolving incidents within defined SLA targets
- Validating fixes from the user perspective
- Documenting ticket activity clearly and professionally

---

## Current Status

This project is currently in progress.

The first ticket simulation focuses on a user access issue involving a missing mapped drive. Additional tickets will be added as the lab expands into Group Policy, account lockout, DNS/DHCP, and escalation scenarios.

---

## SLA Policy

| Priority | Description | Response Time | Resolution Time |
|--------|------------|--------------|----------------|
| High | Critical issue affecting login, access, or multiple users | 15 minutes | 2 hours |
| Medium | Single-user issue affecting important work resources | 1 hour | 4 hours |
| Low | Minor issue or request with workaround available | 4 hours | 1 business day |

---

## Ticket Categories

This lab includes simulated tickets across common help desk scenarios:

- Access Issues (RBAC, permissions, mapped drives)
- Group Policy Issues (GPO not applying)
- Account Issues (lockouts, login failures)
- Network Issues (DHCP, DNS misconfigurations)
- System Configuration Issues (local settings, elevation)

View ticket documentation here:

👉 [Helpdesk Ticket Index](./Helpdesk_Tickets/README.md)

---

## Ticket Structure

Each ticket follows a standardized support format:

- User Report
- Impact & Scope
- Priority & SLA Classification
- Investigation Steps
- Root Cause
- Resolution
- Validation
- Ticket Closure Notes

---

## Example Skills Demonstrated

- Active Directory user and group management
- Group Policy troubleshooting
- Network diagnostics involving DNS and DHCP
- Command-line troubleshooting using `whoami`, `gpresult`, and `ipconfig`
- Ticket prioritization and SLA awareness
- End-user issue resolution
- Technical documentation

---

## Project Structure

```plaintext
Helpdesk-Lab/
│
├── README.md
│
├── Helpdesk_Tickets/
│   ├── README.md
│   └── Tickets/
│       ├── Ticket_001_Missing_Sales_Drive.md
│       ├── Ticket_002_GPO_Issue.md
│       └── Ticket_003_Account_Lockout.md
│
└── Evidence/
    └── Helpdesk_Tickets/
        ├── Ticket_001_Missing_Sales_Drive/
        ├── Ticket_002_GPO_Issue/
        └── Ticket_003_Account_Lockout/
