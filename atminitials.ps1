import-module activedirectory

ForEach($user in $users){
	$old_info = $user.info
	Set-ADUser -Identity $user -Replace @{info="$old_info, DTM, TMA, TMN"}
	Add-ADGroupMember iMMTiCTeller $user
}
