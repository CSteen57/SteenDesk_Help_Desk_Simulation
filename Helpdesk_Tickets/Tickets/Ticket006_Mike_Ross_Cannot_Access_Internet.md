# Ticket #006 – Mike Ross Cannot Access Internet

## Ticket Summary

| Field | Details |
|---|---|
| Ticket ID | Ticket #006 |
| Status | Resolved |
| Priority | Medium |
| Impact | One reported user; infrastructure issue validated across multiple workstations |
| Category | Network / Internet Connectivity / VMware NAT |
| User | Mike Ross |
| Environment | SteenCorp Windows Domain |
| Domain | `steencorp.local` |
| Affected Workstation | `SC-WIN11-WK01` |
| Affected Resource | External internet access |
| SLA Response Target | 1 hour |
| SLA Resolution Target | 4 business hours |
| Resolution Status | Resolved within target |

---

## User Report

Mike Ross reported that he could sign into the SteenCorp domain but could not access external websites from his workstation.

The user was able to authenticate to the domain and reach internal SteenCorp resources, but Google Chrome could not reach `google.com`.

Browser error:

```text
This site can't be reached
ERR_CONNECTION_TIMED_OUT
```

---

## Initial Scope

| Check | Result |
|---|---|
| User can sign into domain | Validated |
| Signed-in user | `steencorp\mross` |
| Workstation is domain joined | Validated |
| Client received DHCP lease | Validated |
| Client could reach DC01 | Validated |
| DNS resolution for external names | Working |
| External internet routing | Failed |
| Issue isolated to user account | No |
| Infrastructure issue suspected | Yes |

---

## Priority Classification

| Factor | Assessment |
|---|---|
| Business Impact | Medium |
| User Impact | User could sign in and reach internal resources, but could not access external websites |
| Scope | One reported user; later validated against a second workstation |
| Workaround Available | Limited; internal resources were available, but external internet access was unavailable |
| Priority | Medium |
| Reason | Internet access was unavailable from a domain workstation, but domain authentication and internal connectivity were still functional |

---

## Troubleshooting Summary

The issue was investigated by confirming the signed-in user, reviewing workstation IP configuration, testing internal connectivity, testing gateway and internet routing, validating DNS resolution, reviewing VMware network adapter configuration, correcting the VMware NAT design, updating DC01 network settings, updating DHCP scope options, and validating internet access from multiple workstations.

Mike's workstation could reach DC01 and resolve `google.com` through the SteenCorp DNS server, but it could not reach the configured gateway or external IP addresses. This confirmed that DNS resolution was working, while routing/NAT was failing.

During VMware review, DC01 had two network adapters: one connected to the internal LAN Segment and one connected to NAT. The workstation was only connected to the isolated LAN Segment. DC01 could access the internet through its own NAT adapter, but that NAT connection did not automatically provide internet access to client workstations.

The lab network was corrected by moving DC01, Workstation 1, and Workstation 2 to VMware NAT-backed `VMnet8`, disabling VMware DHCP, keeping DC01 as the DHCP/DNS server, and updating DHCP Scope Option 003 to use the actual VMware NAT gateway.

A secondary DNS configuration issue was also found during Workstation 2 validation. Workstation 2 received the corrected gateway from DHCP but still showed `8.8.8.8` as its DNS server because the workstation adapter had manual DNS configured. The adapter was corrected to obtain DNS automatically, then the lease was renewed and the DNS resolver cache was flushed.

| Step | Check Performed | Result |
|---|---|---|
| 1 | Confirmed signed-in user with `whoami` | Confirmed `steencorp\mross` |
| 2 | Reviewed Mike's IP configuration with `ipconfig /all` | Client had valid domain DHCP lease |
| 3 | Tested internal connectivity to DC01 | Successful |
| 4 | Tested original default gateway `192.168.10.1` | Failed |
| 5 | Tested external IP connectivity with `ping 8.8.8.8` | Failed |
| 6 | Tested external DNS resolution with `nslookup google.com` | Successful through DC01 |
| 7 | Tested `ping google.com` | Name resolved, but traffic failed |
| 8 | Reviewed VMware adapter configuration | DC01 had LAN Segment + NAT; workstation had LAN Segment only |
| 9 | Reconfigured VMware NAT network | VMnet8 set to NAT on `192.168.10.0/24` |
| 10 | Disabled VMware DHCP on VMnet8 | Completed |
| 11 | Confirmed VMware NAT gateway | Gateway confirmed as `192.168.10.2` |
| 12 | Moved DC01 to VMnet8 | Completed |
| 13 | Moved Workstation 1 to VMnet8 | Completed |
| 14 | Moved Workstation 2 to VMnet8 | Completed |
| 15 | Updated DC01 static gateway | Set to `192.168.10.2` |
| 16 | Validated DC01 gateway and internet access | Successful |
| 17 | Updated DHCP Scope Option 003 Router | Set to `192.168.10.2` |
| 18 | Renewed Mike's DHCP lease | Gateway updated to `192.168.10.2` |
| 19 | Validated Mike's internal and external connectivity | Successful |
| 20 | Validated browser internet access as Mike | Successful |
| 21 | Validated Workstation 2 DHCP lease | Gateway correct, DNS issue found |
| 22 | Found manual DNS configuration on Workstation 2 | DNS manually set to `8.8.8.8` |
| 23 | Corrected Workstation 2 DNS to automatic | Completed |
| 24 | Renewed Workstation 2 lease and flushed DNS | Completed |
| 25 | Validated Workstation 2 DNS and internet access | Successful |
| 26 | Validated browser internet access on Workstation 2 | Successful |

---

## Commands Used

| Command | Purpose |
|---|---|
| `whoami` | Confirm the signed-in domain user |
| `ipconfig /all` | Review IP, DHCP, DNS, and gateway configuration |
| `ipconfig /release` | Release current DHCP lease |
| `ipconfig /renew` | Request updated DHCP lease |
| `ipconfig /flushdns` | Clear local DNS resolver cache |
| `ping 192.168.10.10` | Test internal connectivity to DC01 |
| `ping 192.168.10.1` | Test original/default gateway from the initial Phase 3 design |
| `ping 192.168.10.2` | Test corrected VMware NAT gateway |
| `ping 8.8.8.8` | Test external IP connectivity |
| `nslookup google.com` | Test external DNS resolution |
| `ping google.com` | Test external name resolution and connectivity |
| `ncpa.cpl` | Open Windows network adapter settings |

---

## Evidence

Screenshots are stored in:

```text
Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/
```

| Evidence | Description |
|---|---|
| Screenshot 1 | Mike signed in, IP configuration shown, browser internet failure |
| Screenshot 2 | Internal DC01 connectivity works, gateway and internet fail |
| Screenshot 3 | DNS resolves Google, but routing to Google fails |
| Screenshot 4 | DC01 has LAN Segment and NAT adapters before fix |
| Screenshot 4B | Workstation uses isolated LAN Segment before fix |
| Screenshot 5 | VMware VMnet8 configured as NAT with DHCP disabled |
| Screenshot 6 | VMware NAT gateway confirmed as `192.168.10.2` |
| Screenshot 7A | DC01 adapter moved to VMnet8 |
| Screenshot 7B | Workstation 1 adapter moved to VMnet8 |
| Screenshot 7C | Workstation 2 adapter moved to VMnet8 |
| Screenshot 8A | DC01 static IP updated with VMware NAT gateway |
| Screenshot 8B | DC01 gateway and external IP connectivity validated |
| Screenshot 8C | DC01 DNS and Google connectivity validated |
| Screenshot 8D | DHCP Scope Option 003 Router updated |
| Screenshot 9A | Mike's workstation receives corrected DHCP configuration |
| Screenshot 9B | Workstation 2 receives corrected gateway but wrong DNS remains |
| Screenshot 9B2 | Workstation 2 DNS still shows `8.8.8.8` |
| Screenshot 9C | Workstation 2 manual DNS setting found |
| Screenshot 9D | Workstation 2 DNS changed to automatic |
| Screenshot 9E | Workstation 2 receives corrected DNS after remediation |
| Screenshot 10A | Mike can ping DC01, gateway, and external IP |
| Screenshot 10B | Mike can resolve and ping Google |
| Screenshot 10C | Workstation 2 can ping DC01, gateway, and external IP |
| Screenshot 10D | Workstation 2 can resolve and ping Google |
| Screenshot 11A | Mike browser internet access restored |
| Screenshot 11B | Workstation 2 browser internet access restored |

---

## Screenshot Evidence

### 1. Mike Ross IP Configuration and Browser Failure

Mike Ross was signed into the workstation as `steencorp\mross`. The workstation had a valid domain DHCP lease, but Chrome could not reach Google.

![Mike Ross IPConfig Internet Failure Before Fix](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/01_Mike_Ross_IPConfig_Internet_Failure_Before_Fix.png)

---

### 2. Internal Connectivity Works, Gateway Fails

The workstation successfully reached DC01 at `192.168.10.10`, confirming internal domain connectivity. However, the configured gateway `192.168.10.1` and external IP connectivity failed.

![Internal Connectivity Works Gateway Fails](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/02_Internal_Connectivity_Works_Gateway_Fails.png)

---

### 3. DNS Resolves, Routing Fails

`nslookup google.com` resolved through `dc01.steencorp.local` at `192.168.10.10`, but pinging Google failed. This confirmed DNS resolution was working while external routing/NAT was failing.

![Internet Access Fails DNS Resolves Routing Fails](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/03_Internet_Access_Fails_DNS_Resolves_Routing_Fails.png)

---

### 4. DC01 Dual Network Adapters Before Fix

DC01 had one adapter connected to the internal LAN Segment and a second adapter connected to NAT. This allowed the server to access the internet, but did not route internet access for client workstations.

![DC01 Dual Network Adapters Before Fix](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/04_DC01_Dual_Network_Adapters_Before_Fix.png)

---

### 5. Workstation LAN Segment Before Fix

The client workstation was connected only to the isolated `SteenCorp_Internal` LAN Segment, which had no working NAT/default gateway path to the internet.

![Workstation LAN Segment Before Fix](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/04B_Workstation_LAN_Segment_Before_Fix.png)

---

### 6. VMware NAT VMnet8 Configuration

VMware `VMnet8` was configured as a NAT network using the SteenCorp subnet `192.168.10.0/24`. VMware DHCP was disabled so DC01 could remain the only DHCP server for the lab.

![VMware Custom NAT VMnet Config](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/05_VMware_Custom_NAT_VMnet_Config.png)

---

### 7. VMware NAT Gateway Confirmed

VMware NAT settings confirmed the actual NAT gateway as `192.168.10.2`.

![VMware DHCP Disabled NAT Gateway Confirmed](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/06_VMware_DHCP_Disabled_NAT_Gateway_Confirmed.png)

---

### 8. DC01 Moved to VMnet8

DC01 was moved from the previous LAN Segment/NAT adapter design to the corrected VMware NAT-backed `VMnet8` network.

![DC01 Adapter Moved To VMnet8](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/07A_DC01_VMware_Adapter_Moved_To_VMnet8.png)

---

### 9. Workstation 1 Moved to VMnet8

Workstation 1 was moved from the isolated LAN Segment to `VMnet8`.

![Workstation 1 Adapter Moved To VMnet8](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/07B_Workstation_VMware_Adapter_Moved_To_VMnet8.png)

---

### 10. Workstation 2 Moved to VMnet8

Workstation 2 was also moved to `VMnet8` so the fix could be validated beyond the original reporting user.

![Workstation 2 Adapter Moved To VMnet8](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/07C_Workstation2_VMware_Adapter_Moved_To_VMnet8.png)

---

### 11. DC01 Static IP Updated

DC01 retained its static IP address `192.168.10.10`, while the default gateway was updated to the VMware NAT gateway `192.168.10.2`.

![DC01 Static IP With VMware NAT Gateway](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/08A_DC01_Static_IP_With_VMware_NAT_Gateway.png)

---

### 12. DC01 Gateway and Internet Validation

DC01 successfully reached the VMware NAT gateway and external IP address `8.8.8.8`.

![DC01 Gateway And Internet Validation](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/08B_DC01_Gateway_And_Internet_Validation.png)

---

### 13. DC01 DNS and Google Validation

DC01 successfully resolved and reached Google after the NAT-backed network correction.

![DC01 DNS And Google Validation](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/08C_DC01_Gateway_And_Internet_Validation.png)

---

### 14. DHCP Scope Option 003 Updated

DHCP Scope Option 003 Router was updated from the original gateway to the actual VMware NAT gateway `192.168.10.2`.

![DHCP Scope Option 003 Updated](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/08D_DHCP_Scope_Option_003_Updated.png)

---

### 15. Mike Ross IP Configuration After Fix

After renewing the DHCP lease, Mike's workstation received the corrected default gateway `192.168.10.2`, while continuing to use DC01 for DHCP and DNS.

![Mike Ross IPConfig After Fix](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/09A_Mike_Ross_Workstation1_IPConfig_After_Fix.png)

---

### 16. Workstation 2 DNS Issue Found During Validation

Workstation 2 received the corrected gateway `192.168.10.2`, but DNS still showed `8.8.8.8`. This indicated a secondary workstation-level DNS configuration issue.

![Workstation 2 DNS Issue Found](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/09B_Workstation2_IPConfig_After_Renew_DNS_Issue_Found.png)

---

### 17. Workstation 2 DNS Still Shows 8.8.8.8

Further review confirmed Workstation 2 was still using `8.8.8.8` instead of DC01 for DNS.

![Workstation 2 IPConfig Shows DNS 8.8.8.8](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/09B2_Workstation2_IPConfig_Shows_DNS_8.8.8.8.png)

---

### 18. Manual DNS Setting Found

The Workstation 2 IPv4 configuration showed manual DNS configured as `8.8.8.8`.

![Workstation 2 Manual DNS Found](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/09C_Workstation2_Manual_DNS_8.8.8.8_Found.png)

---

### 19. DNS Set to Automatic

Workstation 2 was corrected to obtain DNS server settings automatically.

![Workstation 2 DNS Set To Automatic](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/09D_Workstation2_DNS_Set_To_Automatic.png)

---

### 20. Workstation 2 DNS Corrected

After releasing and renewing the DHCP lease and flushing DNS, Workstation 2 received DC01 `192.168.10.10` as its DNS server.

![Workstation 2 IPConfig After DNS Correction](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/09E_Workstation2_IPConfig_After_DNS_Correction.png)

---

### 21. Mike Ross Internal and External Connectivity Restored

Mike's workstation successfully reached DC01, the VMware NAT gateway, and external IP address `8.8.8.8`.

![Mike Ross Connectivity Restored](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/10A_Mike_Ross_Workstation1_Connectivity_Restored.png)

---

### 22. Mike Ross DNS and Google Connectivity Restored

Mike's workstation resolved `google.com` through DC01 and successfully pinged Google.

![Mike Ross DNS And Google Connectivity Restored](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/10B_Mike_Ross_Workstation1_Connectivity_Restored.png)

---

### 23. Workstation 2 Internal and External Connectivity Restored

Workstation 2 successfully reached DC01, the VMware NAT gateway, and external IP address `8.8.8.8`.

![Workstation 2 Connectivity Restored](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/10C_Csteen_Workstation2_Connectivity_Restored.png)

---

### 24. Workstation 2 DNS and Google Connectivity Restored

Workstation 2 successfully resolved and pinged Google after the DNS correction.

![Workstation 2 DNS And Google Connectivity Restored](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/10D_Csteen_Workstation2_Connectivity_Restored.png)

---

### 25. Mike Ross Browser Internet Access Restored

Chrome successfully loaded Google search results while signed in as Mike Ross.

![Mike Ross Browser Internet Success](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/11A_Mike_Ross_Browser_Internet_Success.png)

---

### 26. Workstation 2 Browser Internet Access Restored

Browser internet access was also validated successfully on Workstation 2.

![Workstation 2 Browser Internet Success](../../Evidence/Helpdesk_Tickets/Ticket006_Mike_Ross_Cannot_Access_Internet/11B_Workstation2_Browser_Internet_Success.png)

---

## Root Cause

The primary root cause was an isolated VMware LAN Segment with no working NAT/default gateway path to the internet.

Mike's workstation was connected to the `SteenCorp_Internal` LAN Segment. Internal domain services worked because the workstation could reach DC01 on the same internal network. However, the LAN Segment did not provide internet routing.

DC01 had a second NAT adapter, which allowed the server itself to access the internet. However, that adapter did not automatically provide NAT or routing for the client workstations. Because DC01 was not configured as a router/NAT server, the clients had no valid path to external networks.

The original DHCP gateway value was `192.168.10.1`, but VMware NAT settings confirmed that the actual NAT gateway for the corrected VMnet8 network was `192.168.10.2`.

A secondary issue was also found on Workstation 2. The workstation received the corrected gateway but still used `8.8.8.8` as its DNS server because DNS had been manually configured on the workstation adapter. This bypassed the intended Active Directory DNS design.

---

## Resolution

The network design was corrected by moving the lab from an isolated LAN Segment to VMware NAT-backed `VMnet8`.

VMware `VMnet8` was configured for the SteenCorp subnet:

```text
192.168.10.0/24
```

VMware DHCP was disabled so DC01 would remain the only DHCP server for the domain network.

The VMware NAT gateway was confirmed as:

```text
192.168.10.2
```

DC01 was updated to use the VMware NAT gateway as its default gateway while keeping its static IP address:

| Setting | Value |
|---|---|
| DC01 IP Address | `192.168.10.10` |
| Subnet Mask | `255.255.255.0` |
| Default Gateway | `192.168.10.2` |
| DNS Server | `127.0.0.1` |

DHCP Scope Option 003 Router was updated to provide the corrected gateway to clients:

```text
192.168.10.2
```

The domain clients were moved to `VMnet8`, renewed their DHCP leases, and received the corrected gateway.

During Workstation 2 validation, a manual DNS setting was found and corrected. The adapter was changed to obtain DNS automatically, then the lease was renewed and DNS cache was flushed.

After remediation, Workstation 2 correctly received DC01 as its DNS server:

```text
192.168.10.10
```

---

## Validation

Validation was completed from DC01, Mike Ross's workstation, and Workstation 2.

Confirmed on DC01:

- DC01 retained static IP `192.168.10.10`.
- DC01 used VMware NAT gateway `192.168.10.2`.
- DC01 could ping `192.168.10.2`.
- DC01 could ping `8.8.8.8`.
- DC01 could resolve `google.com`.
- DC01 could ping `google.com`.
- DHCP Scope Option 003 Router was updated to `192.168.10.2`.

Confirmed on Mike Ross's workstation:

- Mike Ross was signed in as `steencorp\mross`.
- Workstation 1 received IP address `192.168.10.101`.
- Workstation 1 received default gateway `192.168.10.2`.
- Workstation 1 received DHCP server `192.168.10.10`.
- Workstation 1 received DNS server `192.168.10.10`.
- Workstation 1 could ping DC01 at `192.168.10.10`.
- Workstation 1 could ping VMware NAT gateway `192.168.10.2`.
- Workstation 1 could ping external IP `8.8.8.8`.
- Workstation 1 could resolve `google.com` through DC01.
- Workstation 1 could ping `google.com`.
- Browser internet access was restored.

Confirmed on Workstation 2:

- Workstation 2 received IP address `192.168.10.100`.
- Workstation 2 received default gateway `192.168.10.2`.
- Workstation 2 received DHCP server `192.168.10.10`.
- A secondary DNS issue was identified when Workstation 2 showed `8.8.8.8`.
- Workstation 2 manual DNS configuration was corrected to automatic.
- Workstation 2 received DNS server `192.168.10.10` after correction.
- Workstation 2 could ping DC01 at `192.168.10.10`.
- Workstation 2 could ping VMware NAT gateway `192.168.10.2`.
- Workstation 2 could ping external IP `8.8.8.8`.
- Workstation 2 could resolve and ping `google.com`.
- Browser internet access was restored.

---

## Final Ticket Notes

The issue was resolved by correcting the VMware virtual network design and updating the DHCP gateway option used by domain clients.

The original Phase 3 design used `192.168.10.1` as the planned gateway. During Ticket #006, VMware NAT settings showed that the actual NAT gateway for the corrected NAT-backed VMnet8 network was `192.168.10.2`. The DHCP scope was updated to reflect the actual gateway.

This ticket demonstrated that the issue was not caused by Mike Ross's domain account, browser, or DNS resolution. Internal connectivity and DNS were working before the fix. The failure was caused by missing external routing/NAT from the isolated LAN Segment.

Additional validation on Workstation 2 confirmed that the fix applied to the shared client network and was not limited to one user profile or endpoint. During that validation, a separate manual DNS setting was discovered and corrected to maintain the intended Active Directory DNS design.

This ticket also created a documented infrastructure change that should be reflected in the Phase 3 networking README: the SteenCorp subnet remained `192.168.10.0/24`, but the active VMware NAT gateway changed from the originally planned `192.168.10.1` to the validated VMware NAT gateway `192.168.10.2`.

---

## Skills Demonstrated

- Help desk internet connectivity troubleshooting
- Network scope and impact assessment
- VMware Workstation virtual network troubleshooting
- NAT gateway validation
- DHCP scope option troubleshooting
- DNS validation
- Active Directory DNS awareness
- Internal vs external connectivity testing
- Command-line troubleshooting with `ipconfig`, `ping`, and `nslookup`
- Windows network adapter configuration
- Domain client DHCP renewal
- Root cause analysis
- Infrastructure change documentation
- Multi-workstation validation
- User-side browser validation
- Help desk ticket documentation
