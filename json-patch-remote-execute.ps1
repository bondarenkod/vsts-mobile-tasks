$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path



# Import-Module 

# $rndvalue = Get-Date -Format "s"

# $targetFilePath = $(Join-Path -Path $ScriptDir -ChildPath "config.json");

# JsonPatch -FilePath $targetFilePath -PropertyName "appcenter_appsecret" -Value $rndvalue -Log $true


$resp = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/bondarenkod/vsts-mobile-tasks/master/json-patch.psm1" -Method "Get" -Verbose
$tempFilePath = [System.IO.Path]::GetTempFileName();
[System.IO.File]::Move($tempFilePath, "$tempFilePath.psm1");

$tempFilePath = "$tempFilePath.psm1";

Set-Content -Path $tempFilePath -Value $resp;

Import-Module $tempFilePath;

$rndvalue = Get-Date -Format "s"
$targetFilePath = $(Join-Path -Path $ScriptDir -ChildPath "config.json");
JsonPatch -FilePath $targetFilePath -PropertyName "appcenter_appsecret" -Value $rndvalue -Log $true

# Write-Host $resp
# Write-Host $tempFilePath