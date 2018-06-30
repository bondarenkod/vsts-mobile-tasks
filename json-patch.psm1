
Function JsonPatch{

    [CmdletBinding(SupportsShouldProcess = $true)]
    Param
    (
        [Parameter(Mandatory = $true)]
        [Alias('f')][String]$FilePath, 

        [Parameter(Mandatory = $true)]
        [Alias('p')][String]$PropertyName,

        [Parameter(Mandatory = $true)]
        [Alias('v')][String]$Value,

        [Parameter(Mandatory = $false)]
        [Alias('l')][bool]$Log
    )

    If ($PSCmdlet.ShouldProcess("Patching Json file...")) {
        Write-Host "Patching Start."

        # $p = $PWD.Path;

        # $ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path

        # $targetFilePath = $(Join-Path -Path $ScriptDir -ChildPath $FileName);

        $json = Get-Content -Path $FilePath | Out-String

        $object = ConvertFrom-Json $json

        if ($Log -eq $true) {
            Write-Host $json
        }
       
        $object.$PropertyName = $Value;

        $json = ConvertTo-Json $object -Compress

        if ($Log -eq $true) {
            Write-Host $json 
        }

        Set-Content -Path $FilePath -Value $json
           
        Write-Host "Patching Done."
    }
}