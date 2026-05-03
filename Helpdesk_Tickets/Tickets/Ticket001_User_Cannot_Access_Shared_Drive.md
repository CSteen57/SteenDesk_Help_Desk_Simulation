# Ticket #001 – User Cannot Access Sales Drive

## Ticket Summary

| Field | Details |
|---|---|
| Ticket ID | Ticket #001 |
| Status | Resolved |
| Priority | Medium |
| Impact | Single user affected |
| Category | Access / Mapped Drive / Permissions |
| User | Kelly Kapoor |
| Department | Sales |
| Environment | SteenCorp Windows Domain |
| Affected Resource | Sales department drive access |
| SLA Response Target | 1 hour |
| SLA Resolution Target | 4 business hours |
| Resolution Status | Resolved within target |

---

## User Report

Kelly Kapoor from the Sales department reported that she could sign into her Windows 11 workstation and see the Sales mapped drive, but received an access denied error when attempting to open it.

The user needed access to the Sales drive to reach department files used for daily work.

---

## Initial Scope

| Check | Result |
|---|---|
| User can sign in | Validated |
| Issue affects one user | Validated |
| Workstation is domain joined | Validated |
| Sales drive is mapped | Validated |
| Sales drive access is denied | Validated |
| Other domain access appears functional | Validated |

---

## Priority Classification

| Factor | Assessment |
|---|---|
| Business Impact | Medium |
| User Impact | Single Sales user unable to access department drive |
| Workaround Available | Limited workaround available because user can sign in but cannot access Sales files |
| Priority | Medium |
| Reason | Important department resource unavailable for one user |

---

## Troubleshooting Summary

The issue was investigated by checking the affected user, mapped drive status, Active Directory group membership, and user-side access after remediation.

| Step | Check Performed | Result |
|---|---|---|
| 1 | Confirmed affected user could sign in | Completed |
| 2 | Ran `whoami` to confirm signed-in user | Confirmed `steencorp\kkapoor` |
| 3 | Opened Sales drive in File Explorer | Access denied |
| 4 | Ran `net use` to review mapped drives | Sales drive was mapped as `S:` |
| 5 | Checked Kelly Kapoor’s group membership in Active Directory | Completed |
| 6 | Confirmed whether user belonged to `Sales_Users` | User was missing from group |
| 7 | Applied required access correction | Added user to `Sales_Users` |
| 8 | Refreshed Group Policy using `gpupdate /force` | Completed |
| 9 | Confirmed Sales drive access was restored | Completed |

---

## Commands Used

| Command | Purpose |
|---|---|
| `whoami` | Confirm the signed-in domain user |
| `net use` | Review mapped network drives |
| `gpupdate /force` | Refresh Group Policy on the client workstation |

---

## Evidence

Screenshots are stored in:

```text
Evidence/Helpdesk_Tickets/Ticket_001_Missing_Sales_Drive/
```

| Evidence | Description |
|---|---|
| Screenshot 1 | Kelly signed in as domain user |
| Screenshot 2 | Sales drive visible but access denied |
| Screenshot 3 | `net use` showing Sales drive mapped as `S:` |
| Screenshot 4 | Kelly missing from `Sales_Users` group |
| Screenshot 5 | Kelly added back to `Sales_Users` group |
| Screenshot 6 | `gpupdate /force` completed successfully |
| Screenshot 7 | Sales drive access restored |

---

## Screenshot Evidence

### 1. Confirmed User Context

The affected user was confirmed as signed into the domain as `steencorp\kkapoor`.

![Kelly Whoami](../../Evidence/Helpdesk_Tickets/Ticket_001_Missing_Sales_Drive/01_Kelly_Whoami.png)

---

### 2. Sales Drive Access Denied

The Sales drive was visible in File Explorer, but the user received an access denied error when attempting to open it.

![Sales Drive Access Denied](../../Evidence/Helpdesk_Tickets/Ticket_001_Missing_Sales_Drive/02_Sales_Drive_Access_Denied.png)

---

### 3. Mapped Drive Status

The `net use` command confirmed that the Sales drive was mapped as `S:` to `\\DC01\SteenCorp_Shares\Sales`.

![Net Use Mapped Drive Status](../../Evidence/Helpdesk_Tickets/Ticket_001_Missing_Sales_Drive/03_Net_Use_Mapped_Drive_Status.png)

---

### 4. Active Directory Group Membership Review

Kelly Kapoor’s Active Directory group membership was reviewed. The account was only a member of `Domain Users` and was missing the required `Sales_Users` security group.

![AD Group Membership Review](../../Evidence/Helpdesk_Tickets/Ticket_001_Missing_Sales_Drive/04_AD_Group_Membership_Review.png)

---

### 5. User Added to Sales Security Group

Kelly Kapoor was added back to the `Sales_Users` security group.

![Kelly Added To Sales Users](../../Evidence/Helpdesk_Tickets/Ticket_001_Missing_Sales_Drive/05_Kelly_Added_To_Sales_Users.png)

---

### 6. Group Policy Refreshed

Group Policy was refreshed successfully on the Windows 11 client.

![GPUpdate Force](../../Evidence/Helpdesk_Tickets/Ticket_001_Missing_Sales_Drive/06_GPUpdate_Force.png)

---

### 7. Sales Drive Access Restored

After the access correction and policy refresh, Kelly Kapoor was able to open the Sales drive successfully.

![Sales Drive Access Restored](../../Evidence/Helpdesk_Tickets/Ticket_001_Missing_Sales_Drive/07_Sales_Drive_Access_Restored.png)

---

## Root Cause

Kelly Kapoor was missing from the `Sales_Users` security group in Active Directory.

The Sales drive was still mapped to the workstation, but the user did not have the required group-based permissions to access the Sales folder. This caused Windows to return an access denied error when the user attempted to open the mapped drive.

---

## Resolution

Kelly Kapoor was added back to the `Sales_Users` security group in Active Directory.

After updating the group membership, Group Policy was refreshed using `gpupdate /force`, and access to the Sales drive was tested again from the Windows 11 client.

---

## Validation

Validation was completed from the Windows 11 client while signed in as Kelly Kapoor.

Confirmed:

- Kelly Kapoor could sign into the domain successfully.
- The Sales drive was mapped as `S:`.
- The initial access attempt returned a permissions error.
- Kelly was missing from the required `Sales_Users` security group.
- Kelly was added back to the `Sales_Users` security group.
- Group Policy refreshed successfully.
- Kelly could open the Sales drive successfully after remediation.

---

## Final Ticket Notes

The issue was resolved by correcting the user’s Active Directory group membership.

This ticket demonstrated a common help desk workflow involving user intake, scope validation, mapped drive troubleshooting, Active Directory group membership review, permissions-based root cause analysis, remediation, and user-side validation.

---

## Skills Demonstrated

- Active Directory user support
- Security group troubleshooting
- Mapped drive troubleshooting
- NTFS/share permission troubleshooting
- Group Policy refresh and validation
- User-side issue confirmation
- Root cause documentation
- Help desk ticket formatting
- SLA-aware support documentation
