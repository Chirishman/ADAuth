function Get-ADGroupMembership { 
    Param(
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Alias('UserName','UN')]
        [String]
        $User
    )

    $DS = Get-DirectoryServicesContext
    $UserObject = [System.DirectoryServices.AccountManagement.UserPrincipal]::FindByIdentity($DS, $User)
    $Groups = $UserObject.GetAuthorizationGroups()
    $Groups | select -ExpandProperty Name
}