[cmdletBinding()]
param(
$LogName = "Security",

$Computername = "localhost",

[Parameter(Mandatory=$true)] #Durch Mandatory True wird der Parameter zu einem Pflicht Parameter
$EventId,

$Newest = 10
)

Get-EventLog -LogName $LogName -ComputerName $Computername | Where-Object EventId -eq $EventId | Select-Object -First $Newest


