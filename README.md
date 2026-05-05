![SteenDesk Help Desk Simulation Banner](./SteenDesk_Help_Desk_Banner.jpg)

# SteenDesk Help Desk Simulation

SteenDesk is a help desk ticket simulation built on top of my SteenCorp Active Directory lab.

The project documents common entry-level IT support issues in a Windows domain environment, including account lockouts, password resets, mapped drive issues, DNS troubleshooting, approved software installation, and internet connectivity problems.

[View the full ticket workflow and ticket index](./Helpdesk_Tickets/README.md)

---

## Project Overview

This project focuses on documenting support tickets from the perspective of a help desk technician.

Each ticket includes the user issue, impact, troubleshooting steps, root cause, resolution, validation, and closure notes.

The goal is to show practical troubleshooting, clear documentation, and the ability to work through common support issues in a structured way.

---

## Lab Foundation

This project uses the SteenCorp Active Directory lab as the underlying environment.

| Component | Details |
|---|---|
| Domain | `steencorp.local` |
| Domain Controller | `DC01` |
| Client OS | Windows 11 |
| Server OS | Windows Server 2022 |
| Core Services | Active Directory, DNS, DHCP, Group Policy |
| Virtualization | VMware Workstation |

[View the SteenCorp Active Directory Lab](https://github.com/CSteen57/SteenCorp-AD-Lab)

---

## Ticket Scenarios

| Ticket | Scenario | Focus |
|---|---|---|
| Ticket #001 | User cannot access Sales shared drive | Mapped drives / permissions |
| Ticket #002 | User account locked out | Account lockout troubleshooting |
| Ticket #003 | User forgot password | Password reset workflow |
| Ticket #004 | User cannot access network share by hostname | DNS / hostname resolution |
| Ticket #005 | User cannot install approved software | Software support / least privilege |
| Ticket #006 | User cannot access internet | VMware NAT / gateway troubleshooting |

[Open the ticket directory](./Helpdesk_Tickets/README.md)

---

## Skills Demonstrated

- Help desk ticket documentation
- Active Directory user support
- Password reset and account unlock workflows
- Mapped drive troubleshooting
- DNS and hostname resolution testing
- DHCP and gateway validation
- Group Policy troubleshooting
- Standard user permission validation
- Root cause documentation

---

## Status

Six help desk tickets have been completed and documented.

Future tickets may include printer support, Microsoft 365 troubleshooting, VPN access, endpoint security alerts, and escalation examples.
