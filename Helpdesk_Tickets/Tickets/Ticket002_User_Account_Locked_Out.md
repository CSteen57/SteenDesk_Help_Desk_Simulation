# Ticket #002 – User Account Locked Out

## Ticket Summary

| Field | Details |
|---|---|
| Ticket ID | Ticket #002 |
| Status | In Progress |
| Priority | Medium |
| Impact | Single user affected |
| Category | Account / Authentication |
| User | Kevin Malone |
| Department | Accounting |
| Environment | SteenCorp Windows Domain |
| Affected Resource | Domain user login |
| SLA Response Target | 1 hour |
| SLA Resolution Target | 4 business hours |
| Resolution Status | Pending |

---

## User Report

Kevin Malone from the Accounting department reported that he could not sign into his Windows 11 workstation.

The user stated that he entered his password incorrectly multiple times and was then unable to log in.

---

## Initial Scope

| Check | Result |
|---|---|
| User unable to sign in | Pending |
| Issue affects one user | Pending |
| Workstation is domain joined | Pending |
| Account lockout suspected | Pending |
| Other users affected | Pending |

---

## Priority Classification

| Factor | Assessment |
|---|---|
| Business Impact | Medium |
| User Impact | Single user unable to access workstation and domain resources |
| Workaround Available | No direct workaround until account is unlocked |
| Priority | Medium |
| Reason | User is blocked from signing into domain resources |

---

## Troubleshooting Plan

The issue will be investigated by confirming the sign-in problem, reviewing the user account status in Active Directory, verifying the lockout, unlocking the account, and validating successful login from the client workstation.

| Step | Check Performed | Result |
|---|---|---|
| 1 | Confirmed user could not sign in | Pending |
| 2 | Reviewed user report of repeated failed password attempts | Pending |
| 3 | Checked Kevin Malone’s account in Active Directory | Pending |
| 4 | Confirmed whether the account was locked out | Pending |
| 5 | Verified lockout status using PowerShell | Pending |
| 6 | Unlocked the account in Active Directory | Pending |
| 7 | User attempted sign-in again | Pending |
| 8 | Ran `whoami` to confirm signed-in user | Pending |

---

## Commands Used

| Command | Purpose |
|---|---|
| `Get-ADUser` | Verify account lockout status from PowerShell |
| `whoami` | Confirm the signed-in domain user after remediation |

---

## Evidence

Screenshots will be stored in:

```text
Evidence/Helpdesk_Tickets/Ticket002_User_Account_Lockout/
```

| Evidence | Description |
|---|---|
| Screenshot 1 | Kevin unable to sign in due to account lockout |
| Screenshot 2 | Kevin’s account locked in Active Directory |
| Screenshot 3 | PowerShell lockout verification |
| Screenshot 4 | Kevin’s account unlocked |
| Screenshot 5 | Kevin successfully signed in after remediation |

---

## Screenshot Evidence

### 1. Account Lockout Sign-In Error

Pending screenshot.

![Kevin Account Locked Sign-In Error](../../Evidence/Helpdesk_Tickets/Ticket002_User_Account_Lockout/01_Kevin_Account_Locked_SignIn_Error.png)

---

### 2. Active Directory Account Lockout Confirmed

Pending screenshot.

![ADUC Kevin Account Locked](../../Evidence/Helpdesk_Tickets/Ticket002_User_Account_Lockout/02_ADUC_Kevin_Account_Locked.png)

---

### 3. PowerShell Lockout Verification

Pending screenshot.

![PowerShell Lockout Verification](../../Evidence/Helpdesk_Tickets/Ticket002_User_Account_Lockout/03_PowerShell_Lockout_Verification.png)

---

### 4. Account Unlocked

Pending screenshot.

![Kevin Account Unlocked](../../Evidence/Helpdesk_Tickets/Ticket002_User_Account_Lockout/04_Kevin_Account_Unlocked.png)

---

### 5. Successful Login Validation

Pending screenshot.

![Kevin Whoami Successful Login](../../Evidence/Helpdesk_Tickets/Ticket002_User_Account_Lockout/05_Kevin_Whoami_Successful_Login.png)

---

## Root Cause

Pending investigation.

Expected root cause:

Kevin Malone’s domain account was locked after reaching the SteenCorp domain lockout threshold of 5 failed password attempts.

---

## Resolution

Pending remediation.

Expected resolution:

Kevin Malone’s account will be unlocked in Active Directory. After the account is unlocked, the user will attempt to sign into the Windows 11 workstation again using the correct password.

---

## Validation

Pending user-side validation.

Expected validation:

- Kevin Malone’s account lockout status is confirmed in Active Directory.
- The account is unlocked by help desk/admin action.
- Kevin successfully signs into the Windows 11 workstation.
- The `whoami` command confirms the signed-in user as `steencorp\kmalone`.

---

## Final Ticket Notes

Pending completion.

This ticket is being used to demonstrate a common help desk workflow involving user intake, account lockout investigation, Active Directory account review, remediation, and user-side login validation.

---

## Skills Demonstrated

- Active Directory account support
- Account lockout troubleshooting
- User authentication troubleshooting
- PowerShell account verification
- Help desk ticket documentation
- User-side validation
- SLA-aware support handling
