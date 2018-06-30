$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path

$json = Get-Content -Path  $(Join-Path -Path $ScriptDir -ChildPath "config.json") | Out-String

$fieldName = "appcenter_appsecret";

$object = ConvertFrom-Json $json
Write-Host $object 
$object.$fieldName = "new value";
Write-Host $object