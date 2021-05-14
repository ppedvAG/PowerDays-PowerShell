function New-TestFilesDir
{
[cmdletBinding()]
param(
    [ValidateScript({Test-Path -Path $PSItem})]
    [Parameter(Mandatory=$true)]
    [string]$Path,

    [ValidateLength(1,15)]
    [string]$DirName = "TestFiles",

    [ValidateRange(0,50)]
    [int]$DirCount = 3,

    [ValidateRange(0,50)]
    [int]$FileCount = 9,

    [switch]$Force
)

if($Path.EndsWith("\") -eq $false)
{
    $Path += "\"
}
$TestFilesPath = $Path + "\$DirName\"

if(Test-Path -Path $TestFilesPath)
{
    if($Force)
    {
        Remove-Item -Path $TestFilesPath -Recurse -Force
    }
    else
    {
        Write-Error -Message "Der Pfad ist vorhanden, verwenden sie -Force zum löschen des Verzeichnisses"
        exit
    }
}

New-Item -Path $TestFilesPath -ItemType Directory

New-TestFiles -Path $TestFilesPath -FileCount $FileCount

for($i = 1; $i -le $DirCount; $i++)
{
    $DirNumber = "{0:D3}" -f $i
    
    New-Item -Path $TestFilesPath -Name "Ordner$DirNumber" -ItemType Directory

    New-TestFiles -Path ("$TestFilesPath" + "\Ordner$DirNumber") -FileCount $FileCount -FileName "Ordner$DirNumber"
}

}

function New-TestFiles
{
[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path -Path $PSItem})]
    [string]$Path,

    [ValidateRange(0,50)]
    [int]$FileCount,

    [ValidateLength(0,15)]
    [string]$FileName = "TestFiles"
)
    for($i = 1; $i -le $FileCount; $i++)
    {
        $FileNumber = "{0:D3}" -f $i
        New-Item -Path $Path -Name "$FileName-$FileNumber.txt" -ItemType File
    }
}