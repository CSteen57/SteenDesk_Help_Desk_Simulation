# Ticket #005 – User Cannot Install Approved Software

## Summary

| Field | Details |
|---|---|
| Status | Resolved |
| Priority | Low |
| Impact | Single user affected |
| Category | Workstation / Software Support |
| User | Oscar Martinez |
| Department | Accounting |
| Affected Resource | 7-Zip installation |
| Software Requested | 7-Zip |
| Environment | SteenCorp Windows Domain |

---

## User Report

Oscar Martinez from Accounting submitted a help desk request for 7-Zip to be installed for approved business use.

Oscar did not have local administrator rights and could not install the software himself.

The issue affected one user and was handled as a low-priority approved software request.

---

## Troubleshooting

The request was first validated from Oscar’s workstation.

```cmd
whoami
```

The signed-in user was confirmed as:

```text
steencorp\omartinez
```

Because Oscar was a standard domain user, the installer required administrator approval before it could be installed.

The approved 7-Zip installer was downloaded from the official vendor source by help desk and staged in SteenCorp’s internal software repository:

```text
\\DC01.steencorp.local\Software
```

Oscar was able to access the internal software share and locate the installer, but Windows required administrative approval to complete the installation.

Help desk approved the installation using administrative credentials without granting Oscar local administrator rights.

After installation, Oscar’s group context was checked with:

```cmd
whoami /groups
```

This confirmed Oscar remained a standard user after the software was installed.

---

## Root Cause

Oscar Martinez was a standard domain user and did not have permission to install software locally without administrator approval.

This behavior was expected and aligned with least privilege. Standard users should not have unrestricted local administrator rights on company workstations.

---

## Resolution

The approved 7-Zip installer was staged in the internal SteenCorp software share.

Help desk used administrative credentials to approve and complete the installation on Oscar’s workstation.

Oscar was not granted local administrator rights.

---

## Validation

Validation was completed from the Windows workstation.

Confirmed:

- Oscar was signed in as `steencorp\omartinez`.
- The approved 7-Zip installer was staged internally.
- Oscar could access `\\DC01.steencorp.local\Software`.
- The installer required administrator approval.
- Help desk approved the installation with admin credentials.
- 7-Zip installed successfully.
- 7-Zip launched successfully for Oscar.
- Oscar remained a standard user after installation.
- Least privilege was maintained.

---

## Evidence

Screenshots are stored in:

```text
Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/
```

### Confirmed Standard User Context

This confirmed Oscar was signed into the workstation as `steencorp\omartinez`.

![Oscar Standard User Whoami](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/01_Oscar_Standard_User_Whoami.png)

---

### Approved Installer Staged on Server

This showed the approved 7-Zip installer staged in the internal software repository.

![Approved 7-Zip Installer Staged On Server](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/02_Approved_7Zip_Installer_Staged_On_Server.png)

---

### Internal Software Share Access

This confirmed Oscar could access the internal software share and locate the approved installer.

![Oscar Accesses Internal Software Share](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/03_Oscar_Accesses_Internal_Software_Share.png)

---

### Administrator Approval Required

This showed Windows requiring administrator approval before the software could be installed.

![7-Zip Install Blocked By Admin Prompt](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/04_7Zip_Install_Blocked_By_Admin_Prompt.png)

---

### Admin Approval Used for Installation

This documented help desk approving the installation using administrative credentials.

![Admin Approval For 7-Zip Install](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/05_Admin_Approval_For_7Zip_Install.png)

---

### Installation Completed Successfully

This confirmed 7-Zip installed successfully after administrator approval.

![7-Zip Installed Successfully](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/06_7Zip_Installed_Successfully.png)

---

### Application Launch Confirmed

This validated that 7-Zip launched successfully for Oscar after installation.

![7-Zip Launch Confirmed](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/07_7Zip_Launch_Confirmed.png)

---

### Least Privilege Confirmed

This confirmed Oscar remained a standard user after the installation.

![Oscar Remains Standard User](../../Evidence/Helpdesk_Tickets/Ticket005_Approved_Software_Install/08_Oscar_Remains_Standard_User.png)

---

## Skills Demonstrated

- Workstation software support
- Approved software request handling
- Internal software share usage
- Administrative elevation handling
- Least privilege enforcement
- User-side validation
- Root cause documentation
