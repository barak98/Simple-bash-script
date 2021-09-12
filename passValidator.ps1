$Pass = $args[0]
$isOk = 0

if ($Pass.Length -lt 10) {
    $isOk = 1
    Write-Host "pass should be over 10 chercters"
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