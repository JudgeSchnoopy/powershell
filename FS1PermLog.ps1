$Perm1Log = "c:\software\Perm1log.csv"
$root = "\\CONTOSOFS1\dcucorporate\Departments"

ForEach ($Folder in $(Get-ChildItem $root | Where-Object {$_.PSisContainer -eq $True})){

	$ACLs = get-acl $Folder.fullname | ForEach-Object { $_.Access  }
	Foreach ($ACL in $ACLs){
	$OutInfo = $Folder.Fullname + "," + $ACL.IdentityReference  + "," + $ACL.AccessControlType + "," + $ACL.FileSystemRights
	Add-Content -Value $OutInfo -Path $Perm1Log
	}
		ForEach ($sub in $(Get-ChildItem $root\$folder | Where-Object {$_.PSisContainer -eq $True})){

		$ACLs = get-acl $Folder.fullname | ForEach-Object { $_.Access  }
		Foreach ($ACL in $ACLs){
		$OutInfo = $sub.Fullname + "," + $ACL.IdentityReference  + "," + $ACL.AccessControlType + "," + $ACL.FileSystemRights
		Add-Content -Value $OutInfo -Path $Perm1Log
		}
	}
}