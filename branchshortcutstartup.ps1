$goodLink="c:\users\public\desktop\branch suite live.lnk"

If (Test-Path $goodlink){
Return}
Copy-Item "\\contoso01\data\telleradv\Branch Suite Live.lnk" "c:\users\public\desktop\Branch Suite Live.lnk"