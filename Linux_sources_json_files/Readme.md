This sources.json file describes the following sources to be collected by the Sumo Logic agent on a Linux based EC2 instance:

- Linux OS logs
  - Audit log: /var/log/audit/*.log*
  - Messages log: /var/log/messages*
  - Secure log: /var/log/secure*
- Cron log: /var/log/cron*
- Host Metrics: CPU, Memory, TCP, Network, Disk metrics

You must locally download this file (wget the file with UserData, for example) before you start the collector so that it know what sources to scan.

For more documentation, see the official Sumo Logic Documentation here:

- Local Configuration File Management for Existing Collectors and Sources: https://help.sumologic.com/Send-Data/Sources/03Use-JSON-to-Configure-Sources/Local-Configuration-File-Management/Local-Configuration-File-Management-for-Existing-Collectors-and-Sources
- Use JSON to Configure Sources: https://help.sumologic.com/Send-Data/Sources/03Use-JSON-to-Configure-Sources

