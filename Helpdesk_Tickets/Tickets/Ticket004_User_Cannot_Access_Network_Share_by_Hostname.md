# Ticket #004 – User Cannot Access Network Share by Hostname

## Ticket Summary

| Field | Details |
|---|---|
| Ticket ID | Ticket #004 |
| Status | Planned |
| Priority | Medium |
| Impact | Single user affected |
| Category | Network / DNS / Shared Resource Access |
| User | Jim Halpert |
| Department | Sales |
| Environment | SteenCorp Windows Domain |
| Affected Resource | `\\dc01.steencorp.local\SteenCorp_Shares` |
| SLA Response Target | 1 hour |
| SLA Resolution Target | 4 business hours |
| Resolution Status | Pending |

---

## User Report

Jim Halpert from the Sales department reported that he could not access the company network share using the server hostname.

The user could sign into the workstation, but the shared folder path was not opening.

Affected path:

```text
\\dc01.steencorp.local\SteenCorp_Shares
```

---

## Initial Scope

| Check | Result |
|---|---|
| User can sign into workstation | Pending |
| Issue affects one user/workstation | Pending |
| Shared folder path inaccessible by hostname | Pending |
| DNS issue suspected | Pending |
| Other users affected | Pending |

---

## Priority Classification

| Factor | Assessment |
|---|---|
| Business Impact | Medium |
| User Impact | Single user unable to access shared company resource by hostname |
| Workaround Available | Possible direct IP access, but hostname access is expected in the domain |
| Priority | Medium |
| Reason | User can sign in, but cannot access an expected network resource |

---

## Planned Troubleshooting Steps

| Step | Check Performed | Result |
|---|---|---|
| 1 | Confirm user is signed in | Pending |
| 2 | Attempt to access network share by hostname | Pending |
| 3 | Test hostname resolution with `nslookup` | Pending |
| 4 | Review workstation DNS settings with `ipconfig /all` | Pending |
| 5 | Correct workstation DNS server settings | Pending |
| 6 | Flush DNS cache | Pending |
| 7 | Confirm hostname resolution works | Pending |
| 8 | Confirm network share access is restored | Pending |

---

## Commands Used

| Command | Purpose |
|---|---|
| `whoami` | Confirm the signed-in domain user |
| `nslookup dc01.steencorp.local` | Test DNS name resolution for the domain controller |
| `ipconfig /all` | Review workstation IP and DNS configuration |
| `ipconfig /flushdns` | Clear local DNS resolver cache |
| `Set-DnsClientServerAddress` | Correct workstation DNS server settings |

---

## Evidence

Screenshots will be stored in:

```text
Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_By_Hostname/
```

| Evidence | Description |
|---|---|
| Screenshot 1 | Jim signed in as domain user |
| Screenshot 2 | Network share path not accessible by hostname |
| Screenshot 3 | `nslookup` fails for `dc01.steencorp.local` |
| Screenshot 4 | Workstation DNS settings show incorrect DNS server |
| Screenshot 5 | DNS corrected and hostname resolution restored |
| Screenshot 6 | Network share access restored |

---

## Screenshot Evidence

### 1. Confirmed User Context

Pending screenshot.

![Jim Whoami](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_By_Hostname/01_Jim_Whoami.png)

---

### 2. Shared Path Not Accessible

Pending screenshot.

![Shared Path Not Accessible](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_By_Hostname/02_Shared_Path_Not_Accessible.png)

---

### 3. Hostname Resolution Failure

Pending screenshot.

![Nslookup DC01 Fails](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_By_Hostname/03_Nslookup_DC01_Fails.png)

---

### 4. Incorrect DNS Configuration

Pending screenshot.

![IPConfig Wrong DNS](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_By_Hostname/04_IPConfig_Wrong_DNS.png)

---

### 5. DNS Corrected and Name Resolution Restored

Pending screenshot.

![DNS Corrected Nslookup Success](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_By_Hostname/05_DNS_Corrected_Nslookup_Success.png)

---

### 6. Shared Path Access Restored

Pending screenshot.

![Shared Path Access Restored](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_By_Hostname/06_Shared_Path_Access_Restored.png)

---

## Root Cause

Pending investigation.

Expected root cause:

The workstation was using incorrect DNS settings, preventing the client from resolving the internal domain controller hostname.

Because Active Directory domain environments rely on internal DNS, the workstation should use the domain controller as its DNS server.

---

## Resolution

Pending remediation.

Expected resolution:

The workstation DNS settings will be corrected to use the domain controller for DNS. After flushing the DNS cache, hostname resolution will be tested again and access to the network share will be validated.

---

## Validation

Pending user-side validation.

Expected validation:

- Jim Halpert can sign into the workstation.
- The workstation fails to access the share by hostname before remediation.
- `nslookup` confirms DNS resolution is failing.
- `ipconfig /all` confirms incorrect DNS settings.
- DNS is corrected to use the domain controller.
- `nslookup` successfully resolves `dc01.steencorp.local`.
- The user can access `\\dc01.steencorp.local\SteenCorp_Shares`.

---

## Final Ticket Notes

Pending completion.

This ticket is being used to demonstrate a common help desk workflow involving shared resource access, DNS troubleshooting, workstation network configuration review, remediation, and user-side validation.

---

## Skills Demonstrated

- DNS troubleshooting
- Hostname resolution testing
- Shared folder access troubleshooting
- Windows workstation network configuration review
- PowerShell network configuration
- Command-line validation
- Help desk ticket documentation
- User-side validation
