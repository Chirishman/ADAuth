function Get-ADGroupMembership { 
    Param(
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Alias('UserName','UN')]
        [String]
        $User,
        [Parameter(
            Position = 1,
            Mandatory = $false,
            ValueFromPipelineByPropertyName = $true
        )]
        [switch]$AuthorizationGroups
    )

    $DS = Get-DirectoryServicesContext
    $UserObject = [System.DirectoryServices.AccountManagement.UserPrincipal]::FindByIdentity($DS, $User)
    if ($AuthorizationGroups){
        $Groups = $UserObject.GetAuthorizationGroups()
    } else {
        $Groups = $UserObject.GetGroups()
    }
    $Groups | select -ExpandProperty Name
}
