<#
.Synopsis
   Skript zur Abfrage von AnmeldeEvents
.DESCRIPTION
   Dieses Skript kann verwendet werden um User Session bezogene Events abzufragen wie zb An und Abmeldevorgänge
.PARAMETER EventID
   Mit diesem Parameter wird die abzufragenden EventID festgelegt
   4624 | Anmeldevorgang
   4625 | fehlgeschlagene Anmeldung
   4634 | Abmeldevorgang
.NOTES
   Dieses Skript wurde erstellt von: StefanO (12.05.2021) 
   Zuletzt bearbeitet von: StefanO am 12.05.2021
.EXAMPLE
   GetSecEvents.ps1 -Eventid 4624

   Bei dieser Verwendung wir das Anmeldevent abgefragt. Standardmäßig werden die aktuellesten 10 Vorgänge ausgegeben und es wird folgende Ausgabe erzeugt:


   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
   95210 Mai 12 14:38  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   95207 Mai 12 14:37  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   95204 Mai 12 14:37  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   95201 Mai 12 14:37  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   95198 Mai 12 14:36  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   95195 Mai 12 14:36  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   95192 Mai 12 14:35  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   95188 Mai 12 14:34  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   95187 Mai 12 14:34  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   95181 Mai 12 14:34  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....

.EXAMPLE
   GetSecEvents.ps1 -Eventid 4634 -Newest 2

   Bei dieser Verwendung werden die aktuellsten zwei Abmeldevorgänge ausgegeben wie in folgender Ausgabe zu sehen ist.

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
   95235 Mai 12 14:39  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
   95234 Mai 12 14:39  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....

#>
[cmdletBinding()]
param(
[string]$LogName = "Security",

[string]$Computername = "localhost",

[Parameter(Mandatory=$true)] #Durch Mandatory True wird der Parameter zu einem Pflicht Parameter
[int]$EventId,

[int]$Newest = 10
)

#Write-Verbose bietet eine Zusatzausgabe welche nur bei BEdarf mit -Verbose ausgegeben wird
Write-Verbose -Message "Vom User wurde angegeben. $Logname, $Computername, $EventId, $Newest"
Get-EventLog -LogName $LogName -ComputerName $Computername | Where-Object EventId -eq $EventId | Select-Object -First $Newest


