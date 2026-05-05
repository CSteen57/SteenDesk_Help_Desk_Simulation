# Ticket #004 – User Cannot Access Network Share by Hostname

## Summary

| Field | Details |
|---|---|
| Status | Resolved |
| Priority | Medium |
| Impact | Single user/workstation affected |
| Category | Network / DNS / Shared Resource Access |
| User | Jim Halpert |
| Department | Sales |
| Affected Resource | `\\DC01.steencorp.local\SteenCorp_Shares` |
| Environment | SteenCorp Windows Domain |

---

## User Report

Jim Halpert from Sales reported that he could sign into his Windows 11 workstation, but could not access the company network share using the server hostname.

Affected path:

```text
\\DC01.steencorp.local\SteenCorp_Shares
```

The issue affected one workstation and blocked access to an expected domain shared resource.

---

## Troubleshooting

The issue was first validated from Jim’s workstation.

```cmd
whoami
nslookup dc01.steencorp.local
ipconfig /all
ping 192.168.10.10
ping dc01.steencorp.local
tracert 192.168.10.10
```

The signed-in user was confirmed as:

```text
steencorp\jhalpert
```

The workstation could reach the domain controller by IP address, but hostname resolution failed.

`ipconfig /all` showed the workstation was using external DNS:

```text
8.8.8.8
```

Because Active Directory domain-joined workstations rely on internal DNS, the workstation needed to use the domain controller for DNS resolution.

The DNS server was corrected to:

```text
192.168.10.10
```

The local DNS resolver cache was then flushed:

```cmd
ipconfig /flushdns
```

After correcting DNS, `nslookup dc01.steencorp.local` resolved successfully.

---

## Root Cause

The workstation was using `8.8.8.8` for DNS instead of the SteenCorp domain controller.

Basic IP connectivity to DC01 was working, but the workstation could not resolve the internal hostname `dc01.steencorp.local`.

This confirmed the issue was DNS-related rather than a general network connectivity failure.

---

## Resolution

The workstation DNS server was corrected to use the SteenCorp domain controller at `192.168.10.10`.

After the DNS correction, the DNS cache was flushed and hostname resolution was tested again.

Jim was then able to access the shared folder path by hostname.

---

## Validation

Validation was completed from the Windows 11 client.

Confirmed:

- Jim was signed in as `steencorp\jhalpert`.
- The share path failed by hostname before remediation.
- The workstation could reach DC01 by IP.
- Hostname resolution failed while DNS was set to `8.8.8.8`.
- DNS was corrected to `192.168.10.10`.
- `nslookup dc01.steencorp.local` resolved successfully.
- Jim could access `\\DC01.steencorp.local\SteenCorp_Shares`.
- Jim could access the Sales folder.
- Jim could not access the IT folder, confirming least privilege permissions remained enforced.

---

## Evidence

Screenshots are stored in:

```text
Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_by_Hostname/
```

### Confirmed User Context

This confirmed Jim was signed into the workstation as `steencorp\jhalpert`.

![Jim Whoami](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_by_Hostname/01_Jim_Whoami.png)

---

### Shared Path Not Accessible

This showed the network share path failing when accessed by hostname.

![Shared Path Not Accessible](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_by_Hostname/02_Shared_Path_Not_Accessible.png)

---

### Hostname Resolution Failure

This showed `nslookup` failing for `dc01.steencorp.local`.

![Nslookup DC01 Fails](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_by_Hostname/03_Nslookup_DC01_Fails.png)

---

### Incorrect DNS Configuration

This showed the workstation using `8.8.8.8` instead of the domain controller for DNS.

![IPConfig Wrong DNS](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_by_Hostname/04_IPConfig_Wrong_DNS.png)

---

### IP Connectivity to Domain Controller Confirmed

This confirmed the workstation could reach DC01 by IP address.

![Ping DC01 IP Success](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_by_Hostname/04A_Ping_DC01_IP_Success.png)

---

### Hostname Connectivity Failed

This showed hostname-based connectivity failing while IP connectivity still worked.

![Hostname Ping and Tracert Fails](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_by_Hostname/04B_Hostname_Ping_&_Tracert_Fails.png)

---

### Route to Domain Controller by IP Confirmed

This confirmed the route to DC01 by IP was working.

![Tracert DC01 IP Success](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_by_Hostname/04C_Tracert_DC01_IP_Success.png)

---

### DNS Corrected and Name Resolution Restored

This showed DNS corrected to `192.168.10.10` and `nslookup` resolving successfully.

![DNS Corrected Nslookup Success](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_by_Hostname/05_DNS_Corrected_Nslookup_Success.png)

---

### Shared Path Access Restored

This validated that Jim could access the main SteenCorp shared folder path by hostname.

![Shared Path Access Restored](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_by_Hostname/06_Shared_Path_Access_Restored.png)

---

### Restricted Folder Access Still Enforced

This confirmed Jim could not access the IT folder, which was expected based on role-based access controls.

![IT Folder Access Denied](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_by_Hostname/06A_Shared_Path_Access_Restored_Correct_Permissions.png)

---

### Sales Folder Access Confirmed

This confirmed Jim could access the Sales folder after hostname resolution was restored.

![Sales Folder Access Confirmed](../../Evidence/Helpdesk_Tickets/Ticket004_User_Cannot_Access_Network_Share_by_Hostname/06B_Shared_Path_Access_Restored_Correct_Permissions.png)

---

## Skills Demonstrated

- DNS troubleshooting
- Hostname resolution testing
- Shared folder access troubleshooting
- Windows workstation network configuration review
- Ping and traceroute testing
- Active Directory domain DNS awareness
- Least privilege validation
- User-side validation
- Root cause documentation
