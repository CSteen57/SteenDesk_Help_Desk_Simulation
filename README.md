# SteenCorp Help Desk Simulation Lab

> Simulated help desk environment built on top of the SteenCorp Active Directory domain to demonstrate real-world IT support workflows, ticket handling, and troubleshooting.

---

## Overview

This project extends the **SteenCorp Enterprise IT Lab** by introducing a help desk simulation environment.

It focuses on real-world IT support scenarios, where issues are reported by users, diagnosed, and resolved using structured troubleshooting and SLA-based prioritization.

Rather than building a new environment, this lab leverages the existing `steencorp.local` domain to simulate how support teams operate within an established infrastructure.

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

---

## SLA Policy

| Priority | Description | Response Time | Resolution Time |
|--------|------------|--------------|----------------|
| High | Critical issue (login failure, no access) | 15 minutes | 2 hours |
| Medium | Partial functionality (drive access, permissions) | 1 hour | 4 hours |
| Low | Minor issues or requests | 4 hours | 1 business day |

---

## Ticket Categories

This lab includes simulated tickets across common help desk scenarios:

- Access Issues (RBAC, permissions, mapped drives)
- Group Policy Issues (GPO not applying)
- Account Issues (lockouts, login failures)
- Network Issues (DHCP, DNS misconfigurations)
- System Configuration Issues (local settings, elevation)

---

## Ticket Structure

Each ticket follows a standardized format:

- User Report
- Priority & SLA
- Investigation Steps
- Root Cause
- Resolution
- Validation
- Timeline

---

## Example Skills Demonstrated

- Active Directory user and group management
- Group Policy troubleshooting
- Network diagnostics (DNS, DHCP)
- Command-line troubleshooting (`whoami`, `gpresult`, `ipconfig`)
- Ticket prioritization and SLA awareness
- End-user issue resolution

---

## Project Structure

```plaintext
Helpdesk-Lab/
│
├── README.md
├── Tickets/
│   ├── Ticket_001_Drive_Access.md
│   ├── Ticket_002_GPO_Issue.md
│   ├── Ticket_003_Account_Lockout.md
│
└── Evidence/
```
---

## Key Concept

This lab is not focused on building infrastructure, but on:

> Supporting, troubleshooting, and maintaining an existing environment

This reflects real-world help desk roles where systems are already in place and require ongoing support.

---

## Future Expansion

Planned additions:

- Ticket escalation scenarios (Tier 1 → Tier 2)
- Remote support simulation
- More complex multi-layer troubleshooting
- Integration with logging or monitoring tools

Additional tickets and scenarios will be added over time.
