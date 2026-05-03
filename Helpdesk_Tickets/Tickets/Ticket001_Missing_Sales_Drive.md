# Ticket #001 – User Missing Sales Drive

## Ticket Summary

| Field | Details |
|---|---|
| Ticket ID | Ticket #001 |
| Status | In Progress |
| Priority | Medium |
| Impact | Single user affected |
| Category | Access / Mapped Drive |
| User | Kelly Kapoor |
| Department | Sales |
| Environment | SteenCorp Windows Domain |
| Affected Resource | Sales mapped drive |
| SLA Response Target | 1 hour |
| SLA Resolution Target | 4 business hours |

---

## User Report

Kelly Kapoor from the Sales department reported that she could sign into her Windows 11 workstation, but her Sales mapped drive was missing from File Explorer.

The user needs access to the Sales drive to reach department files used for daily work.

---

## Initial Scope

| Check | Result |
|---|---|
| User can sign in | Pending |
| Issue affects one user | Pending |
| Workstation is domain joined | Pending |
| Sales drive is missing | Pending |
| Other domain access appears functional | Pending |

---

## Priority Classification

| Factor | Assessment |
|---|---|
| Business Impact | Medium |
| User Impact | Single Sales user unable to access department drive |
| Workaround Available | User can sign in, but cannot access Sales files |
| Priority | Medium |
| Reason | Important department resource unavailable for one user |

---

## Troubleshooting Plan

The issue will be investigated by checking the affected user, mapped drive status, Group Policy application, and Active Directory group membership.

| Step | Check Performed | Result |
|---|---|---|
| 1 | Confirmed affected user can sign in | Pending |
| 2 | Checked File Explorer for Sales mapped drive | Pending |
| 3 | Ran `whoami` to confirm signed-in user | Pending |
| 4 | Ran `net use` to review mapped drives | Pending |
| 5 | Ran `gpresult /r` to review applied Group Policy | Pending |
| 6 | Checked Kelly Kapoor’s group membership in Active Directory | Pending |
| 7 | Confirmed whether user belongs to `Sales_Users` | Pending |
| 8 | Applied required access correction | Pending |
| 9 | Refreshed policy / signed user back in | Pending |
| 10 | Confirmed Sales drive was restored | Pending |

---

## Commands Used

| Command | Purpose |
|---|---|
| `whoami` | Confirm the signed-in domain user |
| `net use` | Review mapped network drives |
| `gpresult /r` | Review applied Group Policy settings |
| `gpupdate /force` | Refresh Group Policy on the client workstation |

---

## Evidence

Screenshots will be stored in:

`Evidence/Helpdesk_Tickets/Ticket_001_Missing_Sales_Drive/`

| Evidence | Description |
|---|---|
| Screenshot 1 | Kelly signed in as domain user |
| Screenshot 2 | Sales drive missing in File Explorer |
| Screenshot 3 | `net use` output showing mapped drive status |
| Screenshot 4 | `gpresult /r` output showing applied policies |
| Screenshot 5 | Active Directory group membership review |
| Screenshot 6 | Kelly added to required Sales security group |
| Screenshot 7 | `gpupdate /force` completed |
| Screenshot 8 | Sales drive restored |
| Screenshot 9 | Sales drive access confirmed |

---

## Investigation Notes

Pending completion.

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
- SLA-aware support documentation
