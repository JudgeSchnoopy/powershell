# $StrFile = Read-Host -Prompt "Enter File/Path String"
$StrFile = 'c:\software\*.txt'
$StrSearch = Read-Host -Prompt "Enter Search String"
$StrResult = Read-Host -Prompt "Enter Result Query"

$ResultField = Get-ChildItem -Recurse $StrFile | Select-String $StrSearch | select-object line

If($ResultField -eq 'Null'){
Exit}

If ($resultfield -match "store"){
$a = 0
$b = 3}
If ($resultfield -match "type"){
$a = 1
$b = 2}
If ($resultfield -match "date"){
$a = 2
$b = 1}
If ($resultfield -match "quantity"){
$a = 3
$b = 0}

write-host $a $b
$resultset = Get-ChildItem -Recurse $StrFile | Select-String $StrSearch -context $a,$b
$precontext = $resultset | %{$_.Context.PreContext}
$postcontext = $resultset | %{$_.Context.PostContext}
write-host $resultfield
write-host $precontext $postcontext