#Script queries a top-level folder for all subfolders and files.
#Returns full directory, time last changed, and file size.

$path = "g:\"

Get-ChildItem -Path $path -recurse | select directory, name, lastaccesstime, lastwritetime, length | export-csv c:\software\marketingUSBaudit.csv