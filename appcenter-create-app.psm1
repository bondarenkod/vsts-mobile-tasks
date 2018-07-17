

# {
#     "description": "test from api",
#     "display_name": "test-to-delete",
#     "name": "test-to-delete",
#     "os": "iOS",
#     "platform": "Xamarin"
#   }
# curl -X POST "https://api.appcenter.ms/v0.1/orgs/Avantime/apps" -H  "accept: application/json" -H  "X-API-Token: 2cb63562dfsd4fsdf32rfsdf5e7a35" -H  "Content-Type: application/json" -d "{  \"description\": \"test from api\",  \"display_name\": \"test-to-delete\",  \"name\": \"test-to-delete\",  \"os\": \"iOS\",  \"platform\": \"Xamarin\"}"

Function AppCenter-CreateApp {

    [CmdletBinding(SupportsShouldProcess = $true)]
    Param
    (
        [Parameter(Mandatory = $true)]
        [Alias('n')][String]$Name,

        [Parameter(Mandatory = $true)]
        [Alias('dn')][String]$DisplayName,
    
        [Parameter(Mandatory = $true)]
        [Alias('d')][String]$Description,

        [Parameter(Mandatory = $true)]
        [Alias('o')][String]$Os,
    
        [Parameter(Mandatory = $true)]
        [Alias('p')][String]$Platform,
    
        [Parameter(Mandatory = $true)]
        [Alias('a')][String]$apikey,
        
        [Parameter(Mandatory = $true)]
        [Alias('c')][String]$Org
    )

    $Body = @{
        description  = $Description
        display_name = $DisplayName
        name         = $Name
        os           = $Os
        platform     = $Platform
    }
    

    If ($PSCmdlet.ShouldProcess("Convert txt file to Word Document file.")) {
        $Uri = "https://api.appcenter.ms/v0.1/orgs/$org/apps";
        $Method = "Post"
        $Headers = @{
            "X-API-Token"  = $apikey
            "Content-Type" = "application/json"
        };

        $bp = ConvertTo-Json $Body -Compress
        $resp = Invoke-RestMethod -Uri $Uri -Method $Method -Headers $Headers -Body $bp -Verbose

        #Write-Output $resp;

        if ($resp) {
            return $resp.app_secret;
        }
    }

    return [string]::Empty;
}

Function AppCenter-GetApp {

    [CmdletBinding(SupportsShouldProcess = $true)]
    Param
    (
        [Parameter(Mandatory = $true)]
        [Alias('n')][String]$Name, 

        [Parameter(Mandatory = $true)]
        [Alias('c')][String]$Org
    )

    If ($PSCmdlet.ShouldProcess("Convert txt file to Word Document file.")) {
        $Uri = "https://api.appcenter.ms/v0.1/apps/$Org/$Name";
        $Method = "Get"
        $Headers = @{
            "X-API-Token"  = $apikey
            "Accept" = "application/json"
        };

        return Invoke-RestMethod -Uri $Uri -Method $Method -Headers $Headers
    }

    return $null;
}