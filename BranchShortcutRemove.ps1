[string]$fullusername = gwmi win32_computersystem | select Username

$user1 = $fullusername.Substring(20)
$user = $user1 -replace ".$"

$badLink1="c:\users\public\desktop\branch suite live.url"
$badLink2="c:\users\$user\desktop\branch suite live.url"
$badLink3="c:\users\default\desktop\branch suite live.url"

If (Test-Path $badLink1){
Remove-Item $badLink1}
If (Test-Path $badLink2){
Remove-Item $badLink2}
If (Test-Path $badLink3){
Remove-Item $badLink3}
