$Log = "c:\software\FS1Log.csv"
$root = "\\CONTOSOFS1\dcucorporate\Team Members"

$foldertotal = Get-ChildItem $root | Where-Object {$_.PSisContainer -eq $True}
$foldernumber = 1
$subnumber = 1

Write-progress -id 1 -activity "Running Script" -Status "Overall progress" -percentComplete ($foldernumber / $foldertotal.count * 100) 

ForEach ($Folder in $(Get-ChildItem $root | Where-Object {$_.PSisContainer -eq $True})){

	Write-progress -id 2 -parentId 1 -activity "Gathering data" -Status "From $Folder" 
	$foldernumber++

		ForEach ($sub in $(Get-ChildItem $root | Where-Object {$_.PSisContainer -eq $True})){
		$subCount = (Get-ChildItem $sub.fullname -Recurse | Measure-Object -property length -sum )
		$fileCount = ($subCount | Where-Object {!$_.PSisContainer}).Count + 0
		$fileSize = ($subCount | Where-Object {$_.Property -eq "length"}).Sum + 0
		$subOutInfo = $Folder + "," + $sub + "," + $fileCount + "," + $fileSize 
		Add-Content -Value $subOutInfo -Path $Log
		$subnumber++
		Write-progress -id 3 -parentId 2 -activity "Current Sub Folder" -Status $sub
	
		}
	}