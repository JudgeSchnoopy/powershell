$days = (Get-Date).AddDays(-30)
$target = "10.2.1.29"
$today = get-date -uformat "%m / %d"
$log = "c:\software\FICSRestart.csv"
$check = get-eventlog -logname system -computername $target -after $days | Where {$_.eventID -eq 3201}
write-host "Checking..."

If ($check -ne $null){
ForEach ($i in $check){
$time = $i.TimeGenerated
$report = "$time"
write-host $report
add-content -path $log -value $report
}
write-host "Report generated."
}