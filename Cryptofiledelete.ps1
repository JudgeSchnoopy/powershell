$badFile = "*+REcovER+dbjmf*"
$cryptofilelog = "c:\software\cryptofilelog.csv"
$root = "\\CONTOSOFS1\corporate\team members\user"
ForEach ($Hit in $(Get-ChildItem $root -Recurse -Include $badFile)){

$badPath = resolve-path $Hit
Add-Content $cryptofilelog $badPath
Remove-Item $badPath
}