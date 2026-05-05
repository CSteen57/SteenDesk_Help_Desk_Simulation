# Ticket #003 – User Forgot Password

## Summary

| Field | Details |
|---|---|
| Status | Resolved |
| Priority | Medium |
| Impact | Single user affected |
| Category | Account / Password Reset |
| User | Phyllis Vance |
| Department | Sales |
| Affected Resource | Domain user login |
| Environment | SteenCorp Windows Domain |

---

## User Report

Phyllis Vance from Sales reported that she forgot her password and could not sign into her Windows 11 workstation.

The issue affected one user and blocked access to the workstation and domain resources.

---

## Troubleshooting

The issue was handled as a standard Active Directory password reset.

Phyllis Vance’s account was located in Active Directory Users and Computers. Her password was reset with a temporary password, and the account was configured to require a password change at next logon.

After signing in with the temporary password, Phyllis was prompted to create a new password.

During the password change process, the first new password attempt did not meet the domain password policy or password history requirements. Phyllis then created a compliant password and completed the sign-in process successfully.

The signed-in user was confirmed with:

```cmd
whoami
```

The workstation confirmed the signed-in user as:

```text
steencorp\pvance
```

---

## Root Cause

Phyllis Vance could not sign into the domain because she did not know her current password.

A secondary issue occurred when the first new password attempt did not meet the domain password policy or password history requirements.

---

## Resolution

Phyllis Vance’s password was reset in Active Directory Users and Computers.

A temporary password was issued, and the account was configured to require a password change at next logon.

After the first new password attempt failed policy requirements, Phyllis created a compliant password and successfully signed into the workstation.

---

## Validation

Validation was completed from the Windows 11 client.

Confirmed:

- Phyllis could not sign in with her previous or unknown password.
- Her password was reset in Active Directory.
- The account required a password change at next logon.
- The first new password attempt failed policy/history requirements.
- A compliant password was accepted.
- Phyllis successfully signed into the workstation.
- `whoami` confirmed the signed-in user as `steencorp\pvance`.

---

## Evidence

Screenshots are stored in:

```text
Evidence/Helpdesk_Tickets/Ticket003_User_Forgot_Password/
```

### Failed Login Attempt

This confirmed Phyllis could not sign into the workstation with her previous or unknown password.

![Phyllis Failed Login](../../Evidence/Helpdesk_Tickets/Ticket003_User_Forgot_Password/01_Phyllis_Failed_Login.png)

---

### Active Directory Password Reset

This showed the password reset being performed in Active Directory Users and Computers.

![ADUC Reset Password](../../Evidence/Helpdesk_Tickets/Ticket003_User_Forgot_Password/02_ADUC_Reset_Password.png)

---

### Password Change Required at Next Logon

This confirmed the account was configured to require a password change at next logon.

![ADUC Must Change Password Next Logon](../../Evidence/Helpdesk_Tickets/Ticket003_User_Forgot_Password/03_ADUC_Must_Change_Password_Next_Logon.png)

---

### Password Reset Confirmation

This documented Active Directory confirming that the password was changed.

![Password Has Been Reset](../../Evidence/Helpdesk_Tickets/Ticket003_User_Forgot_Password/04_Password_Has_Been_Reset.png)

---

### Password Change Required on Login

This showed the user being prompted to change the temporary password before accessing the workstation.

![Phyllis Password Change Required](../../Evidence/Helpdesk_Tickets/Ticket003_User_Forgot_Password/05_Phyllis_Password_Change_Required.png)

---

### Password Policy / History Requirement

This documented that the first new password attempt did not meet domain password policy or history requirements.

![Password History Requirement](../../Evidence/Helpdesk_Tickets/Ticket003_User_Forgot_Password/06_Password_History.png)

---

### Successful Password Change

This confirmed the user created a compliant password successfully.

![Successful Password Change](../../Evidence/Helpdesk_Tickets/Ticket003_User_Forgot_Password/07_Successful_Password_Change.png)

---

### Successful Login Validation

This validated that Phyllis successfully signed into the workstation after the password reset and password change.

![Phyllis Whoami Successful Login](../../Evidence/Helpdesk_Tickets/Ticket003_User_Forgot_Password/08_Phyllis_Whoami_Successful_Login.png)

---

## Skills Demonstrated

- Active Directory password reset support
- User authentication troubleshooting
- Password change at next logon
- Password policy awareness
- Password history requirement troubleshooting
- User-side validation
- Root cause documentation
