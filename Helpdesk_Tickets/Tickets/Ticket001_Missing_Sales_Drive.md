# Ticket #001 – User Missing Sales Drive

## Ticket Summary

| Field | Details |
|---|---|
| Ticket ID | Ticket #001 |
| Status | In Progress |
| Priority | Medium |
| Impact | Single user affected |
| Urgency | User can sign in, but cannot access department resource |
| Category | Access / Mapped Drive |
| User | Kelly Kapoor |
| Department | Sales |
| Environment | SteenCorp Windows Domain |
| Affected Resource | Sales mapped drive |
| SLA Response Target | 1 hour |
| SLA Resolution Target | 4 business hours |
| Update Cadence | Update user after initial investigation and after resolution |
| Escalation Trigger | Escalate if group membership is correct but drive mapping still fails |
| SLA Status | In Progress |

---

## Scenario

Kelly Kapoor from the Sales department reported that her Sales drive was missing after signing into her Windows 11 workstation.

---

## Simulated Fault

This issue was intentionally created by removing Kelly Kapoor from the `Sales_Users` security group in Active Directory.

This simulates a common help desk access issue where a user loses access to a department resource because of incorrect or missing group membership.

---

## Initial Scope

| Check | Result |
|---|---|
| User can sign in | To be validated |
| Issue affects one user | To be validated |
| Workstation is domain joined | To be validated |
| Other drives/resources available | To be validated |
| Sales drive missing | To be validated |

---
## SLA Classification

| SLA Factor | Assessment |
|---|---|
| Business Impact | Medium |
| User Impact | Single Sales user unable to access department drive |
| Workaround Available | User can sign in, but cannot access Sales shared files |
| Response Requirement | Initial response within 1 hour |
| Resolution Requirement | Resolve within 4 business hours if limited to group membership or drive mapping |
| Escalation Requirement | Escalate if issue affects multiple users, the file server is unreachable, or GPO is not applying after standard troubleshooting |

---

## Troubleshooting Steps

| Step | Check Performed | Result |
|---|---|---|
| 1 | Signed in as affected user | Pending |
| 2 | Checked File Explorer for mapped drives | Pending |
| 3 | Ran `whoami` | Pending |
| 4 | Ran `whoami /groups` | Pending |
| 5 | Ran `gpresult /r` | Pending |
| 6 | Checked user account in Active Directory | Pending |
| 7 | Confirmed group membership issue | Pending |

---

## Evidence

Screenshots will be added after validation.

| Evidence | Description |
|---|---|
| Screenshot 1 | User group membership issue |
| Screenshot 2 | Sales drive missing |
| Screenshot 3 | Troubleshooting command output |
| Screenshot 4 | User added back to security group |
| Screenshot 5 | Sales drive restored |

---

## Root Cause

Pending investigation.

---

## Resolution

Pending remediation.

---

## Validation

Pending user-side validation.

---

## Final Ticket Notes

Pending completion.

---

## Skills Demonstrated

- Active Directory user support
- Security group troubleshooting
- Mapped drive troubleshooting
- Group Policy validation
- User-side issue confirmation
- Root cause documentation
- Help desk ticket formatting
