for($i =1;$i -le 5;$i++)
{
    $i *2
}

for($i =1;$i -le 10;$i++)
{
   if($i /2 -is [int])
   {
    Write-Host $i
   }
}

for($i =1;$i -le 10;$i++)
{
   if($i%2 -eq 0)
   {
    Write-Host $i
   }
}



