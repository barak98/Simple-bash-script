$option=$args[0]
$pass=$args[1]
if ($option -eq "-f") {
    if ( ! (Test-Path "./$pass" -PathType Leaf)) {
        Write-Host "file dosent exist"
        exit 1;
    }
    else {
        $pass= Get-Content -Path "./$pass" 
        Write-Host "$pass"
    }
}
elseif (($option -eq "help") -or ($option -eq "Help") -or ($option -eq "HELP")) {
    Write-Host "Option 1: ./passValidator.ps1 <password>"
    Write-Host "Option 2: ./passValidator.ps1 -f <fileName.ext>    ##File MUST be in the same diractory as the script"
    Write-Host "Password must have at least: 10 Characters, One UPPERCASE, one lowercase, and one digit "
    exit 1;
}
else {
    $pass=$args[0]
}




$isOk = 0

if ($Pass.Length -lt 10) {
    $isOk = 1
    Write-Host "pass should be over 10 Characters"
}

if  ( ! ( $Pass -cmatch "[A-Z]")) {
    $isOk = 1
    Write-Host "Pass needs to have at least one uppercase"
}

if  ( ! ( $Pass -cmatch "[a-z]")) {
    $isOk = 1
    Write-Host "Pass needs to have at least one lowercase"
}

if  ( ! ( $Pass -cmatch "[0-9]")) {
    $isOk = 1
    Write-Host "Pass needs to have at least one digit"
}


if ($isOk -eq 1) {
   
    Write-Host "pass is not strong" -ForegroundColor Red
    exit 1
}
else {
    Write-Host "pass is strong" -ForegroundColor Green
    exit 0
}