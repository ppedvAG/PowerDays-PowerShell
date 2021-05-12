if(1 -lt 0)
{
    Write-Host -ForegroundColor Green -BackgroundColor Black -Object "Fehler in der Matrix"
} elseif(0 -gt 1)
{
    Write-Host -ForegroundColor Green -BackgroundColor Black -Object "Fehler in der Matrix"
}elseif(3 -lt 1)
{
    Write-Host -ForegroundColor Green -BackgroundColor Black -Object "Fehler in der Matrix"
}else
{
    Write-Host "Alles in Ordnung"
}


switch(3)
{
    1 {Write-Host -ForegroundColor Green -Object "Ausgabe"}
    2 {Write-Host -ForegroundColor Red -Object "Ausgabe"}
    3 {Write-Host -ForegroundColor Magenta -Object "Ausgabe"}
    4 {Write-Host -ForegroundColor White -Object "Ausgabe"}
    default {Write-Host "Eingabe nicht gültig"}
}