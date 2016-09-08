foreach ($i in $(Get-ADComputer -Filter * -Searchbase 'OU=Wheaton,DC=contoso,DC=com' -Searchscope subtree | select -Expand name)){
$online = test-connection -Computername $i -count 1 -quiet
$shortcutlog="c:\software\shortcutlog.csv"
If ($online -eq "True"){
[string]$fullusername = gwmi win32_computersystem | select Username

If ($fullusername.length -lt 20){
$user = "teamsvcs"}
Else{
$user1 = $fullusername.Substring(20)
$user = $user1 -replace ".$"}

$goodLink="\\$i\c$\users\public\desktop\branch suite live.lnk"
$badLink1="\\$i\c$\users\public\desktop\branch suite live.url"
$badLink2="\\$i\c$\users\$user\desktop\branch suite live.url"
$badLink3="\\$i\c$\users\default\desktop\branch suite live.url"
$badLink4="\\$i\c$\users\$user\desktop\branch suite live.lnk"
$removed="False"

If (Test-Path $badLink1){
Remove-Item $badLink1
$removed="True"
Add-Content $shortcutlog "$i,Removed,$badLink1"}
If (Test-Path $badLink2){
Remove-Item $badLink2
$removed="True"
Add-Content $shortcutlog "$i,Removed,$badLink2"}
If (Test-Path $badLink3){
Remove-Item $badLink3
$removed="True"
Add-Content $shortcutlog "$i,Removed,$badLink3"}
If (Test-Path $badLink4){
Remove-Item $badLink4
$removed="True"
Add-Content $shortcutlog "$i,Removed,$badLink4"}
If (Test-Path $goodlink){
Add-Content $shortcutlog "$i,Already There"
$removed="False"
Continue}

If ($removed -eq "True"){
Copy-Item "\\contoso01\data\telleradv\Branch Suite Live.lnk" "\\$i\c$\users\public\desktop\Branch Suite Live.lnk"
Add-Content $shortcutlog "$i,Added,$goodlink"
}
Else{
Add-Content $shortcutlog "$i,No Shortcut"}
}
Else{
Add-Content $shortcutlog "$i,Offline"
Continue}

Start-Sleep -s 1
}
