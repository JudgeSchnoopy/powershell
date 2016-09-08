import-module ActiveDirectory
foreach ($i in $(Get-ADComputer -Filter * -Searchbase 'OU=DownersGrove,DC=contoso,DC=com' -Searchscope subtree | select -Expand name)){

$online = test-connection -Computername $i -count 1 -quiet
$shortcutlog="c:\software\PST.csv"
If ($online -eq "True"){
[string]$fullusername = gwmi -comp $i win32_computersystem | select Username

If ($fullusername.length -lt 20){
$user = "teamsvcs"}
Else{
$user1 = $fullusername.Substring(20)
$user = $user1 -replace ".$"}
Write-Host "Looking on $i for user $user"
$pstFile = "*.pst"
$root = "\\$i\c$\users\$user\AppData\Local\Microsoft\Outlook"
$root2 = "\\$i\c$\users\$user\Documents"

ForEach ($Hit in $(Get-ChildItem $root -Recurse -Include $pstFile)){

$pstPath = resolve-path $Hit
Add-Content $shortcutlog $pstPath
Write-Host $pstPath
}
ForEach ($Hit in $(Get-ChildItem $root2 -Recurse -Include $pstFile)){

$pstPath = resolve-path $Hit
Add-Content $shortcutlog $pstPath
Write-Host $pstPath
}
Write-Host "Done looking on $i"
$user = ""
}
}