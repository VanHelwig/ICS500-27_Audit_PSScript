# ICS500-27_Audit_PSScript
Powershell script to pull ICS 500-27 auditable events from windows endpoint

Event ID Mapping to ICS 500-27 Controls

Authentication Events
Logon Events: Event ID 4624
Logoff Events: Event ID 4634

File & Object Events
File Access Events: Event ID 4663
File Create Events: Event ID 4656
File Delete Events: Event ID 4660

Use of Privileged/Special Rights Events
Privilege Escalation Events: Event ID 4672

User & Group Management Events
User Management Events: Event IDs 4720, 4722, 4723, 4724, 4725, 4726, 4738, 4740, 4767
Group Management Events: Event IDs 4731, 4732, 4733, 4734, 4735, 4737

Writes/Downloads to External Devices/Media
External Device Events: Event ID 4656

System Events
System Reboot Events: Event IDs 1074, 6006, 6008

This script saves output locally on the endpoint at C:\path\log_events.txt
