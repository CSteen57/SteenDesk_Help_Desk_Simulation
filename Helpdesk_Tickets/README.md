# SteenDesk Help Desk Ticket Simulation

This section documents simulated help desk tickets built on top of the SteenCorp Active Directory lab.

The goal is to practice real-world support workflows, including user intake, impact assessment, priority classification, troubleshooting, root cause analysis, resolution, validation, and ticket documentation.

---

## Ticket Workflow

| Step | Action | Purpose |
|---|---|---|
| 1 | User Report | Capture the issue from the user’s perspective |
| 2 | Impact & Scope | Determine whether the issue affects one user, one device, one department, or multiple users |
| 3 | Priority Classification | Assign priority based on impact, urgency, and available workaround |
| 4 | Troubleshooting | Validate the issue and gather evidence |
| 5 | Root Cause | Identify what caused the issue |
| 6 | Resolution | Apply the fix |
| 7 | Validation | Confirm the issue is resolved from the user side |
| 8 | Closure | Document the final result and close the ticket |

---

## Priority Guide

| Priority | Impact | Example | Response Target | Resolution Target |
|---|---|---|---|---|
| High | Multiple users or critical business function affected | Department-wide outage, login issue affecting multiple users, server/service unavailable | 15 minutes | 2 business hours |
| Medium | Single user blocked from an important work resource | Missing department drive, account lockout, access issue | 1 hour | 4 business hours |
| Low | Minor issue or request with workaround available | Software request, cosmetic issue, general question | 4 business hours | 1 business day |

---

## Ticket Index

| Ticket | Issue | Category | Priority | Status |
|---|---|---|---|---|
| [Ticket #001](./Tickets/Ticket001_User_Cannot_Access_Shared_Drive.md) | User cannot access Sales shared drive | Access / Permissions | Medium | Resolved |

---

## Skills Practiced

- User support troubleshooting
- Priority-based ticket handling
- Impact and scope assessment
- Active Directory account checks
- Group membership validation
- Mapped drive troubleshooting
- Group Policy validation
- Root cause documentation
- Ticket documentation
