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