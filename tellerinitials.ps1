import-module activedirectory

$users = Import-CSV c:\software\tellerinitials.csv
ForEach ($u in $users) {
$ID = $($u.User)
$Init = $($u.Initials)
write-host $Init
Set-ADUser -Identity $ID -Replace @{info=$Init}
}
