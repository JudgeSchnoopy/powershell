Import-Module ActiveDirectory
foreach ($i in $(Get-ADComputer -Filter * -Searchbase 'OU=MortgageSales,OU=OpCenter,DC=contoso,DC=com' -Searchscope subtree | select -Expand name)){
$online = test-connection -Computername $i -count 1 -quiet

If ($online -eq "True"){

$printerports = Get-WmiObject Win32_tcpipprinterport -comp $i

# Delete Printers
$printerports | ForEach-Object {
    if ($_.Name -match "172.21.4.2"){
	    write-host "Deleting $_.Name from $i"
        $_.Delete()
    }
}
}
}