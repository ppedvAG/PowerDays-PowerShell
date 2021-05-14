[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateLength(5,200)]
    [string]$Text
)

#Zum laden von DLL / Assemblies
Add-Type -AssemblyName System.Speech

#erstellen einer Instanz 
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

<#
#Abfragen der installierten Sprachpakete
($speak.GetInstalledVoices()).voiceinfo

#Setzen eines installierten Sprachpaketes
$speak.SelectVoice("Microsoft Zira Desktop")

#>
$speak.Rate = 0
[System.Console]::Beep(500,300)
$speak.Speak($Text)
[System.Console]::Beep(2000,500)