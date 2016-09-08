import-module activedirectory

$users = Get-ADUser -Properties info -Searchbase "ou=users,ou=Wheaton,dc=contoso,dc=com" -filter *
ForEach($user in $users){
	$old_info = $user.info
	Set-ADUser -Identity $user -Replace @{info="$old_info, DTM, TMA, TMN"}
	Add-ADGroupMember iMMTiCTeller $user
}