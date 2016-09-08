$days = (Get-Date).AddDays(-2)
$target = "tech8"
$today = get-date -uformat "%m / %d"
$message = "Technology has detected your system went into Sleep mode within the last day.  Sleep mode is an abominable process that should only be used if you hate computers."
$apology = "Not Submitted"
$log = "\\tech8\c$\software\apology.csv"

#write-host "Starting"
If ((get-eventlog -logname system -computername $target -after $days | Where {$_.eventID -eq 42}) -ne $null){
#write-host "Found event, copying script to target"
#copy-item "\\tech8\c$\software\$script" "\\$target\c$\software\$script"
#write-host "Item copied, running script"
#Invoke-WmiMethod -Class win32_process -ComputerName $target -Name create -ArgumentList  "c:\windows\system32\msg.exe * $message" 
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form 
$form.Text = "Sleep Mode Detected"
$form.Size = New-Object System.Drawing.Size(400,260) 
$form.StartPosition = "CenterScreen"

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(80,180)
$OKButton.Size = New-Object System.Drawing.Size(200,23)
$OKButton.Text = "I promise not to do it again"
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20) 
$label.Size = New-Object System.Drawing.Size(350,130) 
$label.Text = "Technology has detected your system went into Sleep mode within the last day.
  
Sleep mode is an abominable process that should only be used if you hate computers.
  
Your system logs have been submitted ot the President of the United States for further review.

Feel free to submit your apology below."
$form.Controls.Add($label) 

$textBox = New-Object System.Windows.Forms.TextBox 
$textBox.Location = New-Object System.Drawing.Point(10,150) 
$textBox.Size = New-Object System.Drawing.Size(350,20) 
$form.Controls.Add($textBox) 


$form.Topmost = $True

$form.Add_Shown({$form.Activate()})
if ($textBox.CanFocus){
   $textBox.Focus()}
else {
   $textBox.Select()}
$result = $form.ShowDialog()
#write-host "Warning box generated"
if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $textBox.Text + "," + $today
    add-content -path $log -value $x
#	write-host "Message box closed!"
}


#write-host "Script completed, reading text"
#$apology = Get-Content \\$target\c$\software\apology.txt
#write-host $apology
#add-content -path "c:\software\apology.csv" -value $apology + "," + $target + "," + $today
#remove-item "\\$target\c$\software\$script"
}
