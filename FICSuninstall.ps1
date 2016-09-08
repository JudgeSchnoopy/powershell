$Apps = Get-ChildItem HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall | foreach-object {Get-ItemProperty $_.PsPath}

$UninstallLP = $Apps | ? { $_.displayname -match "Loan Producer" } | select UninstallString
If ($uninstallLP){ 
$wshell = new-object -com wscript.shell
$selectedUninstallLP = $UninstallLP.UninstallString
$wshell.run("cmd /c $selectedUninstallLP")
Start-Sleep 7
$wshell.sendkeys("`"OK`"~")
Start-Sleep 10
$Apps = Get-ChildItem HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall | foreach-object {Get-ItemProperty $_.PsPath}
$UninstallLP = $Apps | ? { $_.displayname -match "Loan Producer" } | select UninstallString
If (!$UninstallLP){
Write-Host "Loan Producer has been uninstalled."}
Else {
Write-Host "Failed to uninstall Loan Producer"}
}
Else {
Write-Host "Loan Producer is not installed."}

$UninstallMS = $Apps | ? { $_.displayname -match "Mortgage Servicer" } | select UninstallString
If ($UninstallMS){
$wshell = new-object -com wscript.shell
$selectedUninstallMS = $UninstallMS.UninstallString
$wshell.run("cmd /c $selectedUninstallMS")
Start-Sleep 7
$wshell.sendkeys("`"OK`"~")
Start-Sleep 10
$Apps = Get-ChildItem HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall | foreach-object {Get-ItemProperty $_.PsPath}
$UninstallMS = $Apps | ? { $_.displayname -match "Mortgage Servicer" } | select UninstallString
If (!$UninstallMS){
Write-Host "Mortgage Servicer has been uninstalled."}
Else {
Write-Host "Failed to uninstall Mortgage Servicer"}
}
Else {
Write-Host "Mortgage Servicer is not installed"}

$UninstallMSA = $Apps | ? { $_.displayname -match "MS Admin" } | select UninstallString
If ($UninstallMSA){
$wshell = new-object -com wscript.shell
$selectedUninstallMSA = $UninstallMSA.UninstallString
$wshell.run("cmd /c $selectedUninstallMSA")
Start-Sleep 7
$wshell.sendkeys("`"OK`"~")
Start-Sleep 10
$Apps = Get-ChildItem HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall | foreach-object {Get-ItemProperty $_.PsPath}
$UninstallMSA = $Apps | ? { $_.displayname -match "MS Admin" } | select UninstallString
If (!$UninstallMSA){
Write-Host "Mortgage Servicer Admin has been uninstalled."}
Else {
Write-Host "Failed to uninstall Mortgage Servicer Admin"}
}
Else {
Write-Host "Mortgage Servicer Admin is not installed"}

$UninstallLPA = $Apps | ? { $_.displayname -match "LP Admin" } | select UninstallString
If ($UninstallLPA){
$wshell = new-object -com wscript.shell
$selectedUninstallLPA = $UninstallLPA.UninstallString
$wshell.run("cmd /c $selectedUninstallLPA")
Start-Sleep 7
$wshell.sendkeys("`"OK`"~")
Start-Sleep 10
$Apps = Get-ChildItem HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall | foreach-object {Get-ItemProperty $_.PsPath}
$UninstallLPA = $Apps | ? { $_.displayname -match "LP Admin" } | select UninstallString
If (!$UninstallLPA){
Write-Host "Loan Producer Admin has been uninstalled."}
Else {
Write-Host "Failed to uninstall Loan Producer Admin"}
}
Else {
Write-Host "Loan Producer Admin is not installed"}
