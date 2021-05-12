$a = "<style>"
$a += "BODY{background-color:peachpuff;}"
$a += "TABLE{border-width: 1px; border-style: solid; border-color: magenta; border-collapse: collapse;}"
$a += "TH{border-width: 1px; padding: 0px; border-style: solid; border-color: black; background-color:thistle}"
$a += "TD{border-width: 1px; padding: 0px; border-style: solid; border-color: black; background-color:PaleGoldenrod}"
$a += "</style>"

Get-Service | Select-Object -Property Status,Name,Displayname | ConvertTo-Html -Head $a -Body "<H2>Dienste</H2>" | Out-File -FilePath C:\Testfiles\services.html