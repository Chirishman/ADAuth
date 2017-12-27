function Test-ADGroupMembership {
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
            Position=1,
            Mandatory=$true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]]$TargetGroup
    )
    
    Begin{}
    Process{
        $Groups = Get-ADGroupMembership -User $User
        [bool](($TargetGroup | % { $_ -in $Groups }) | Measure-Object -Sum | Select -ExpandProperty Sum)
    }
    End{}
}