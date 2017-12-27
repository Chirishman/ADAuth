function Get-DirectoryServicesContext { 
    Param()
    Add-Type -AssemblyName System.DirectoryServices.AccountManagement
    $AuthLookup = @{
		$true = 'machine'
		$false = 'domain'
	}

    [System.DirectoryServices.AccountManagement.PrincipalContext]::new($AuthLookup[($env:USERDOMAIN -eq $env:COMPUTERNAME)])
}
