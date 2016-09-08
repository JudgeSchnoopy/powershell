$shortcutlog="c:\software\PST.csv"
$pstFile = "*.pst"
$root = "\\contosofs1\dcucorporate\team members"

ForEach ($Hit in $(Get-ChildItem $root -Recurse -Include $pstFile)){

$pstPath = resolve-path $Hit
Add-Content $shortcutlog $pstPath
Write-Host $pstPath
}