# Ticket #002 – User Account Locked Out

## Summary

| Field | Details |
|---|---|
| Status | Resolved |
| Priority | Medium |
| Impact | Single user affected |
| Category | Account / Authentication |
| User | Kevin Malone |
| Department | Accounting |
| Affected Resource | Domain user login |
| Environment | SteenCorp Windows Domain |

---

## User Report

Kevin Malone from Accounting reported that he could not sign into his Windows 11 workstation.

The user stated that he entered his password incorrectly multiple times and was then unable to log in.

The issue affected one user and blocked access to the workstation and domain resources.

---

## Troubleshooting

The issue was first validated from the Windows 11 sign-in screen.

Kevin was unable to sign in after repeated invalid credential attempts, so his account was reviewed in Active Directory Users and Computers.

PowerShell was also used to check failed password attempt information:

```powershell
Get-ADUser kmalone -Properties BadPwdCount,LockedOut
```

The account showed repeated failed password attempts, with `BadPwdCount` showing a value of `6`.

Since the issue matched an account lockout scenario, the account lockout condition was cleared in Active Directory.

---

## Root Cause

Kevin Malone’s account was locked after repeated invalid password attempts.

The failed attempts may have been caused by the wrong password being entered multiple times, Caps Lock, or an outdated saved credential.

---

## Resolution

Kevin Malone’s account was reviewed in Active Directory Users and Computers.

The account lockout condition was cleared, and the user attempted to sign in again using the correct password.

After remediation, the user successfully signed into the Windows 11 workstation.

---

## Validation

Validation was completed from the Windows 11 client.

Confirmed:

- Kevin was unable to sign in before remediation.
- Active Directory showed the account required unlock action.
- PowerShell showed repeated failed password attempts with `BadPwdCount` at `6`.
- The account lockout condition was cleared.
- Kevin successfully signed into the workstation after remediation.
- `whoami` confirmed the signed-in user as `steencorp\kmalone`.

---

## Evidence

Screenshots are stored in:

```text
Evidence/Helpdesk_Tickets/Ticket002_User_Account_Locked_Out/
```

### Sign-In Failure

This confirmed Kevin Malone could not sign into the workstation after repeated invalid credential attempts.

![Kevin Account Locked Sign-In Error](../../Evidence/Helpdesk_Tickets/Ticket002_User_Account_Locked_Out/01_Kevin_Account_Locked_SignIn_Error.png)

---

### Active Directory Account Review

This showed Kevin Malone’s account being reviewed in Active Directory Users and Computers before remediation.

![ADUC Kevin Account Locked](../../Evidence/Helpdesk_Tickets/Ticket002_User_Account_Locked_Out/02_ADUC_Kevin_Account_Locked.png)

---

### PowerShell Failed Password Verification

This confirmed repeated failed password attempts using PowerShell, with `BadPwdCount` showing a value of `6`.

![PowerShell Lockout Verification](../../Evidence/Helpdesk_Tickets/Ticket002_User_Account_Locked_Out/03_PowerShell_Lockout_Verification.png)

---

### Account Lockout Cleared

This documented the account lockout condition being cleared in Active Directory.

![Kevin Account Unlocked](../../Evidence/Helpdesk_Tickets/Ticket002_User_Account_Locked_Out/04_Kevin_Account_Unlocked.png)

---

### Successful Login Validation

This validated that Kevin Malone could sign in after remediation and confirmed the session with `whoami`.

![Kevin Whoami Successful Login](../../Evidence/Helpdesk_Tickets/Ticket002_User_Account_Locked_Out/05_Kevin_Whoami_Successful_Login.png)

---

## Skills Demonstrated

- Active Directory account support
- Account lockout troubleshooting
- User authentication troubleshooting
- PowerShell account verification
- User-side validation
- Root cause documentation
