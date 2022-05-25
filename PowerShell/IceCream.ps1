#                                                                   xx                  xx    xx  
# xxxxxxxxx                                                xxx  x  xxx                 xxx   xxx  
#   xx    xx                                              xx  xxx   xx                  xx    xx  
#   xx     xx                                            xx    xx   xx                  xx    xx  
#   xx     xx                                            xx     x   xx                  xx    xx  
#   xx     xx     xxx    xxxx  xxxx  xxx   xxxx   xx xxx xxx    x   xx  xxx     xxxx    xx    xx  
#   xx     xx   xx  xxx   xx    xx    x   xx  xx xxxx xx  xxx       xxxx  xx   xx  xx   xx    xx  
#   xx    xx    x    xx   xx    xx    x  xx    xx xx       xxxx     xx    xx  xx    xx  xx    xx  
#   xxxxxxx    xx     xx   xx   xxx  x   xxxxxxxx xx         xxx    xx    xx  xxxxxxxx  xx    xx  
#   xx         xx     xx   xx  x xx  x   xx       xx          xxx   xx    xx  xx        xx    xx  
#   xx         xx     xx   xx  x xx x    xx       xx     x     xxx  xx    xx  xx        xx    xx  
#   xx         xx     xx    xxx   xxx    xx       xx     x      xx  xx    xx  xx        xx    xx  
#   xx          xx    x     xxx   xxx    xxx    x xx     xx     xx  xx    xx  xxx    x  xx    xx  
#   xx          xx   xx     xx    xx      xxxxxx  xx     xxx   xx   xx    xx   xxxxxx   xx    xx  
# xxxxxx         xxxx        x     x       xxxx  xxxx    x  xxxx   xxxx  xxxx   xxxx   xxxx  xxxx 
Write-Host "Ice Cream Split Up Calculator"

$peeps = New-Object System.Collections.ArrayList

[int]$numPeeps = Read-Host "Enter number of people contributing"

[int]$numGals = Read-Host "Enter number of gallons being acquired"
[int]$numDol = Read-Host "Enter total number of dollars being contributed"
for($i = 1; $i -lt $numPeeps + 1; $i++)
{
    $peep = New-Object System.Object
    $peepName = Read-Host "Enter person $i's name"
    $peep | Add-Member -MemberType NoteProperty -Name "Name" -Value $peepName
    [int]$peepDollars = Read-Host "Enter how much person $i is contributing"
    $peep | Add-Member -MemberType NoteProperty -Name "Dollars" -Value $peepDollars
    $peepGals = $numGals * ($peepDollars / $numDol )
    $peep | Add-Member -MemberType NoteProperty -Name "Gallons" -Value $peepGals
    $peeps.Add($peep) | Out-Null
}
$peeps