$x = "Text vor Ausführung"

function test ($y)
{
    $global:x = $y
    Write-Host -Object $x -ForegroundColor Magenta
}

test("Sktiptausführung")

Write-Host -Object $x -ForegroundColor Green