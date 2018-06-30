$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path

Import-Module $ScriptDir\json-patch.psm1 -Verbose

$rndvalue = Get-Date -Format "s"


$targetFilePath = $(Join-Path -Path $ScriptDir -ChildPath "config.json");

JsonPatch -FilePath $targetFilePath -PropertyName "appcenter_appsecret" -Value $rndvalue -Log $true