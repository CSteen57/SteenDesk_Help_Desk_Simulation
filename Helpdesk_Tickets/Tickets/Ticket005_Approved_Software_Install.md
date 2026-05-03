# Ticket #005 – User Cannot Install Approved Software

## Ticket Summary

| Field | Details |
|---|---|
| Ticket ID | Ticket #005 |
| Status | Resolved |
| Priority | Low |
| Impact | Single user affected |
| Category | Workstation / Software Support |
| User | Oscar Martinez |
| Department | Accounting |
| Environment | SteenCorp Windows Domain |
| Affected Resource | 7-Zip installation |
| Software Requested | 7-Zip |
| Source | Official 7-Zip vendor download |
| Internal Deployment Location | `\\DC01.steencorp.local\Software` |
| SLA Response Target | 4 business hours |
| SLA Resolution Target | 1 business day |
| Resolution Status | Resolved within target |

---

## User Report

Oscar Martinez from the Accounting department submitted a help desk request for 7-Zip to be installed for approved business use.

Oscar did not have local administrator rights and could not install the software himself. The workstation also did not have direct internet access, so help desk handled the approved software download and deployment process.

---

## Initial Scope

| Check | Result |
|---|---|
| User can sign in | Validated |
| Issue affects one user/workstation | Validated |
| Software request is approved | Validated |
| User lacks local admin rights | Validated |
| Admin approval required for installation | Validated |
| Internal software share available | Validated |

---

## Priority Classification

| Factor | Assessment |
|---|---|
| Business Impact | Low |
| User Impact | Single user requesting approved software installation |
| Workaround Available | User can continue working without immediate installation |
| Priority | Low |
| Reason | Software request affects one user and is not a critical outage |

---

## Troubleshooting Summary

The issue was handled by confirming Oscar’s signed-in user context, staging the approved 7-Zip installer on the internal SteenCorp software share, confirming Oscar could access the installer, validating that administrator approval was required, and completing the installation using help desk/admin credentials.

The software was obtained from the official 7-Zip vendor download source and placed in SteenCorp’s internal software repository at `\\DC01.steencorp.local\Software`.

Oscar remained a standard domain user throughout the process and was not granted local administrator rights.

| Step | Check Performed | Result |
|---|---|---|
| 1 | Confirmed signed-in user with `whoami` | Confirmed `steencorp\omartinez` |
| 2 | Downloaded approved 7-Zip installer from official vendor source | Completed by help desk/admin |
| 3 | Staged installer in internal software repository | Completed |
| 4 | Confirmed Oscar could access `\\DC01.steencorp.local\Software` | Successful |
| 5 | Attempted to run installer as Oscar | Admin approval required |
| 6 | Approved installation using admin credentials | Completed |
| 7 | Completed 7-Zip installation | Successful |
| 8 | Launched 7-Zip as Oscar | Successful |
| 9 | Confirmed Oscar remained a standard user | Validated with `whoami /groups` |

---

## Commands Used

| Command | Purpose |
|---|---|
| `whoami` | Confirm the signed-in domain user |
| `whoami /groups` | Confirm Oscar’s user group context and least privilege status |

---

## Evidence

Screenshots are stored in:

```text
Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/
```

| Evidence | Description |
|---|---|
| Screenshot 1 | Oscar signed in as standard domain user |
| Screenshot 2 | Approved 7-Zip installer staged on Windows Server |
| Screenshot 3 | Oscar accesses the internal Software share |
| Screenshot 4 | 7-Zip installation requires admin approval |
| Screenshot 5 | Admin credentials used to approve installation |
| Screenshot 6 | 7-Zip installation completed successfully |
| Screenshot 7 | 7-Zip launched successfully for Oscar |
| Screenshot 8 | Oscar remains a standard user |

---

## Screenshot Evidence

### 1. Confirmed Standard User Context

Oscar Martinez was signed into the Windows workstation as a domain user.

![Oscar Standard User Whoami](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/01_Oscar_Standard_User_Whoami.png)

---

### 2. Approved Installer Staged on Server

Help desk downloaded the approved 7-Zip installer from the official vendor source and staged it in the SteenCorp internal software repository on the Windows Server.

![Approved 7-Zip Installer Staged On Server](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/02_Approved_7Zip_Installer_Staged_On_Server.png)

---

### 3. Oscar Accesses Internal Software Share

Oscar accessed the internal software share at `\\DC01.steencorp.local\Software` and located the approved 7-Zip installer.

![Oscar Accesses Internal Software Share](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/03_Oscar_Accesses_Internal_Software_Share.png)

---

### 4. 7-Zip Installation Requires Administrator Approval

When Oscar attempted to run the installer, Windows required administrator approval. This confirmed that Oscar could not install software without elevation.

![7-Zip Install Blocked By Admin Prompt](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/04_7Zip_Install_Blocked_By_Admin_Prompt.png)

---

### 5. Admin Approval Used for Installation

Help desk approved the installation using administrative credentials. The user was not granted local administrator rights.

![Admin Approval For 7-Zip Install](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/05_Admin_Approval_For_7Zip_Install.png)

---

### 6. 7-Zip Installed Successfully

The 7-Zip installation completed successfully after administrator approval.

![7-Zip Installed Successfully](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/06_7Zip_Installed_Successfully.png)

---

### 7. 7-Zip Launch Confirmed

7-Zip launched successfully for Oscar after installation.

![7-Zip Launch Confirmed](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/07_7Zip_Launch_Confirmed.png)

---

### 8. Oscar Remains a Standard User

Oscar remained signed in as `steencorp\omartinez`. The `whoami /groups` output showed standard user context, including domain group membership, without granting unnecessary local administrator privileges.

![Oscar Remains Standard User](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/08_Oscar_Remains_Standard_User.png)

---

## Root Cause

Oscar Martinez is a standard domain user and does not have permission to install software locally without administrator approval.

This behavior is expected under least privilege. Standard users should not have unrestricted local administrator rights on company workstations.

The workstation also did not have direct internet access, so help desk used the Windows Server’s internet access to obtain the approved installer and stage it in the internal software share.

---

## Resolution

Help desk downloaded the approved 7-Zip installer from the official vendor source using the Windows Server.

The installer was staged in SteenCorp’s internal software repository:

```text
\\DC01.steencorp.local\Software
```

Oscar accessed the installer from the internal share. When administrative approval was required, help desk used admin credentials to complete the installation.

Oscar was not granted local administrator rights.

---

## Validation

Validation was completed from the Windows workstation.

Confirmed:

- Oscar Martinez was signed in as `steencorp\omartinez`.
- The approved 7-Zip installer was staged on the Windows Server.
- Oscar could access the internal `Software` share.
- The 7-Zip installer required administrator approval.
- Admin credentials were used to approve the installation.
- 7-Zip installed successfully.
- 7-Zip launched successfully for Oscar.
- Oscar remained a standard user after installation.
- Least privilege was maintained.

---

## Final Ticket Notes

The issue was resolved by deploying approved software through the internal SteenCorp software share and completing the installation with administrative approval.

This ticket demonstrated a common help desk workflow involving approved software requests, internal software staging, administrative elevation, workstation support, and least privilege enforcement.

The user’s request was fulfilled without granting unnecessary local administrator permissions.

---

## Skills Demonstrated

- Workstation software support
- Approved software request handling
- Internal software share usage
- Standard user permission troubleshooting
- Administrative elevation handling
- Least privilege enforcement
- Windows Server file share usage
- Help desk ticket documentation
- User-side validation
