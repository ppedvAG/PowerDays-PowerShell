1..100 | ForEach-Object -process {
        Write-Progress -Activity Berechner -Status "Berechne Aufgabe $PSItem" -PercentComplete $PSItem
        Start-Sleep -Milliseconds 40
        $PSItem
} | Get-Member 


#installieren etwas

Restart-Computer -ComputerName RemotePC
do
{
    Start-Sleep -Seconds 5
}while(Test-NetConnection -ComputerName RemotePC -CommonTCPPort WINRM -InformationLevel Quiet)

do
{
    Start-Sleep -Seconds 30 
}until(Test-NetConnection -ComputerName RemotePC -CommonTCPPort WINRM -InformationLevel Quiet)