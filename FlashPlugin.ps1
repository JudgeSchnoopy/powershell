$target = Read-Host -Prompt "Enter the target computer name: "

'Script has started...'

# COPY FILE

'Moving installation file to target PC...'

$location = "\\contoso01\data\apps\adobe flash plugin\install_flash_player_20_plugin.msi"

If ($target -match "aperv"){
$location = "\\naperville8\c$\Software\install_flash_player_20_plugin.msi"
"Installer found on Naperville8"}

If ($target -match "owners"){
$location = "\\downers6\c$\Software\install_flash_player_20_plugin.msi"
"Installer found on Downers6"}

If ($target -match "heaton"){
$location = "\\wheaton2\c$\Software\install_flash_player_20_plugin.msi"
"Installer found on Wheaton2"}

If ($location -eq "\\contoso01\data\apps\adobe flash plugin\install_flash_player_20_plugin.msi"){
"Using installer from CONTOSO01\Data\Apps\Adobe Flash Plugin\"}

Copy-Item $location "\\$target\c$\software\flash_player_20_plugin.msi"

# CONNECT

'Starting session with target computer...'

$s = New-PSSession -computername $target

Invoke-Command -Session $s -Scriptblock{

# INSTALL

'Installing Plugin...'
$installPlugin = Get-WmiObject -List 'Win32_Product'
$installPlugin.Install("c:\software\flash_player_20_plugin.msi") | Out-Null
'Finished Installation'

# CONFIGURE

'Creating config file to disable automatic updates...'
New-Item -Path "C:\Windows\System32\Macromed\Flash\mms.cfg" -ItemType 'File' -Value 'AutoUpdateDisable=1' -Force | Out-Null
'Configuration complete'

# DELETE

'Deleting installation file from target PC...'
Remove-Item -Path "c:\software\flash_player_20_plugin.msi"
'File deleted'
}

# DISCONNECT

'Disconnecting from target computer...'
Remove-PSSession $s

'Script is complete.'

Read-Host -Prompt "Press Enter to Exit"