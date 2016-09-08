$target = Read-Host -Prompt "Enter the target computer name: "

'SCRIPT HAS STARTED...'

# Location determination
[int]$location = 4

If ($target -match "aperv"){
[int]$location = 1}

If ($target -match "owners"){
[int]$location = 2}

If ($target -match "heaton"){
[int]$location = 3}


"$location"