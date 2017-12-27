function Test-ADCredential {
    Param(
        [Parameter(
        Position=0,
        Mandatory=$true,
        ValueFromPipeline = $true)]
        [pscredential]$Credential
    )
    
    $DS = Get-DirectoryServicesContext
    $Credential.GetNetworkCredential() | % {
        $DS.ValidateCredentials($_.UserName, $_.Password)
    }
}