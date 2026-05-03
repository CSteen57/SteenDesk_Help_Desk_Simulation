# Ticket #004 – New Workstation Missing Mapped Drives

## Ticket Summary

| Field | Details |
|---|---|
| Ticket ID | Ticket #004 |
| Status | Planned |
| Priority | Medium |
| Impact | Single user affected |
| Category | Group Policy / Workstation OU |
| User | Jim Halpert |
| Department | Sales |
| Environment | SteenCorp Windows Domain |
| Affected Resource | Department mapped drives |
| SLA Response Target | 1 hour |
| SLA Resolution Target | 4 business hours |
| Resolution Status | Pending |

---

## User Report

Jim Halpert from the Sales department reported that he signed into a new SteenCorp workstation, but his expected department mapped drives were missing.

The user can sign into the domain, but the workstation does not appear to be receiving the expected drive mapping configuration.

---

## Initial Scope

| Check | Result |
|---|---|
| User can sign in | Pending |
| Issue affects one user/workstation | Pending |
| Workstation is domain joined | Pending |
| Department mapped drives missing | Pending |
| Group Policy issue suspected | Pending |

---

## Priority Classification

| Factor | Assessment |
|---|---|
| Business Impact | Medium |
| User Impact | Single user unable to access expected department drive mappings |
| Workaround Available | Limited workaround may exist through direct UNC path access |
| Priority | Medium |
| Reason | User can sign in, but expected work resources are missing |

---

## Planned Troubleshooting Steps

| Step | Check Performed | Result |
|---|---|---|
| 1 | Confirm user can sign in | Pending |
| 2 | Run `whoami` to confirm signed-in user | Pending |
| 3 | Run `net use` to review mapped drives | Pending |
| 4 | Check computer object location in Active Directory | Pending |
| 5 | Confirm workstation is in the correct Workstations OU | Pending |
| 6 | Move workstation to correct OU if needed | Pending |
| 7 | Run `gpupdate /force` | Pending |
| 8 | Sign out and sign back in | Pending |
| 9 | Confirm mapped drives are restored | Pending |

---

## Commands Used

| Command | Purpose |
|---|---|
| `whoami` | Confirm the signed-in domain user |
| `net use` | Review mapped network drives |
| `gpupdate /force` | Refresh Group Policy on the workstation |

---

## Evidence

Screenshots will be stored in:

```text
Evidence/Helpdesk_Tickets/Ticket004_Workstation_Missing_Mapped_Drives/
```

| Evidence | Description |
|---|---|
| Screenshot 1 | Jim signed in as domain user |
| Screenshot 2 | Mapped drive status reviewed |
| Screenshot 3 | Workstation located in wrong AD container or OU |
| Screenshot 4 | Workstation moved to correct Workstations OU |
| Screenshot 5 | Group Policy refreshed |
| Screenshot 6 | Mapped drives restored after remediation |

---

## Screenshot Evidence

### 1. Confirmed User Context

Pending screenshot.

![Jim Whoami](../../Evidence/Helpdesk_Tickets/Ticket004_Workstation_Missing_Mapped_Drives/01_Jim_Whoami.png)

---

### 2. Mapped Drive Status Reviewed

Pending screenshot.

![Net Use No Mapped Drives](../../Evidence/Helpdesk_Tickets/Ticket004_Workstation_Missing_Mapped_Drives/02_Net_Use_No_Mapped_Drives.png)

---

### 3. Workstation Location Reviewed in Active Directory

Pending screenshot.

![Workstation In Default Computers Container](../../Evidence/Helpdesk_Tickets/Ticket004_Workstation_Missing_Mapped_Drives/03_Workstation_In_Default_Computers_Container.png)

---

### 4. Workstation Moved to Correct OU

Pending screenshot.

![Workstation Moved To Workstations OU](../../Evidence/Helpdesk_Tickets/Ticket004_Workstation_Missing_Mapped_Drives/04_Workstation_Moved_To_Workstations_OU.png)

---

### 5. Group Policy Refreshed

Pending screenshot.

![GPUpdate Force](../../Evidence/Helpdesk_Tickets/Ticket004_Workstation_Missing_Mapped_Drives/05_GPUpdate_Force.png)

---

### 6. Mapped Drives Restored

Pending screenshot.

![Mapped Drives Restored](../../Evidence/Helpdesk_Tickets/Ticket004_Workstation_Missing_Mapped_Drives/06_Mapped_Drives_Restored.png)

---

## Root Cause

Pending investigation.

Expected root cause:

The workstation computer object may be located outside the correct SteenCorp Workstations OU, preventing the expected Group Policy drive mapping settings from applying.

---

## Resolution

Pending remediation.

Expected resolution:

Move the workstation object into the correct Workstations OU, refresh Group Policy, sign the user out and back in, and validate that the mapped drives appear.

---

## Validation

Pending user-side validation.

Expected validation:

- Jim can sign into the Windows 11 workstation.
- `whoami` confirms the signed-in user.
- `net use` shows the expected mapped drives after remediation.
- The user can access the expected department mapped drive.

---

## Final Ticket Notes

Pending completion.

This ticket is being used to demonstrate a common help desk workflow involving Group Policy troubleshooting, workstation OU placement, mapped drive validation, and user-side confirmation.

---

## Skills Demonstrated

- Group Policy troubleshooting
- Workstation OU placement
- Mapped drive troubleshooting
- Active Directory computer object review
- Command-line validation
- User-side validation
- Help desk ticket documentation
