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


