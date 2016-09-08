Import-Module ActiveDirectory

ForEach ($group in $(Get-ADGroup -Filter {GroupCategory -eq 'security'} -SearchBase 'OU=OpCenter,DC=contoso,DC=com')){
	Add-Content -path c:\software\secgroupreport.csv -Value $group.name
	ForEach ($members in $(Get-ADGroupMember -identity $group.Name | Select Name)){
		Add-Content -path c:\software\secgroupreport.csv -Value $members.Name}
	Add-Content -path c:\software\secgroupreport.csv -Value `r`n
}