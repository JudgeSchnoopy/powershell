import-module activedirectory

$days = (Get-Date).AddDays(-7)
$target = "computer"
$today = get-date -uformat "%m / %d"
$log = "c:\software\sleepreport.csv"
$check = get-eventlog -logname system -computername $target -after $days | Where {$_.eventID -eq 42}
write-host "Checking..."

If ($check -ne $null){
write-host "Sleep mode detected, generating report..."
ForEach ($i in $check){
$time = $i.TimeGenerated
$report = "$target" + "," + "$time"
write-host $report
add-content -path $log -value $report
}
write-host "Report generated."
}