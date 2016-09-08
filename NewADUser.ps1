#Add New users to the contoso domain
import-module activedirectory

#Set User Data

$account = "taccount"
$first = "Test"
$last = "Account"
$email = "taccount@contoso.com"
$department = "Testing"
$phone = "123456789"
$initials = "TEST"

#Account Creation and Department Groups

If ($department -eq "Collections"){
New-ADUser -name $account -SamAccountName $account -userPrincipalName ($account + "@contoso.com") `
	-GivenName $first -Surname $last -DisplayName ($first + " " + $last) -OtherAttributes @{'Info'=$initials} `
	-Path 'OU=Users,OU=AssetRecovery,OU=OpCenter,DC=contoso,DC=com' `
	-Department $department -EmailAddress $email -Office "Op Center" -OfficePhone $phone `
	-AccountPassword (Read-Host -AsSecureString "AccountPassword")
Add-ADGroupMember ARDeptG $account
Add-ADGroupMember OpCenter $account
}

ElseIf ($department -eq "Card Sales"){
New-ADUser -name $account -SamAccountName $account -userPrincipalName ($account + "@contoso.com") `
	-GivenName $first -Surname $last -DisplayName ($first + " " + $last) -OtherAttributes @{'Info'=$initials} `
	-Path 'OU=Users,OU=CardSales,OU=OpCenter,DC=contoso,DC=com' `
	-Department $department -EmailAddress $email -Office "Op Center" -OfficePhone $phone `
	-AccountPassword (Read-Host -AsSecureString "AccountPassword")
Add-ADGroupMember CardSalesDeptG $account
Add-ADGRoupMember cardsales $account
Add-ADGroupMember OpCenter $account
}

ElseIf ($department -eq "Consumer Lending"){
New-ADUser -name $account -SamAccountName $account -userPrincipalName ($account + "@contoso.com") `
	-GivenName $first -Surname $last -DisplayName ($first + " " + $last) -OtherAttributes @{'Info'=$initials} `
	-Path 'OU=Users,OU=ConsumerLoans,OU=OpCenter,DC=contoso,DC=com' `
	-Department $department -EmailAddress $email -Office "Op Center" -OfficePhone $phone `
	-AccountPassword (Read-Host -AsSecureString "AccountPassword")
Add-ADGroupMember CLDeptG $account
Add-ADGroupMember OpCenter $account
}

ElseIf ($department -eq "Contact Center"){
New-ADUser -name $account -SamAccountName $account -userPrincipalName ($account + "@contoso.com") `
	-GivenName $first -Surname $last -DisplayName ($first + " " + $last) -OtherAttributes @{'Info'=$initials} `
	-Path 'OU=Users,OU=ContactCenter,OU=OpCenter,DC=contoso,DC=com' `
	-Department $department -EmailAddress $email -Office "Op Center" -OfficePhone $phone `
	-AccountPassword (Read-Host -AsSecureString "AccountPassword")
Add-ADGroupMember CCDeptG $account
Add-ADGroupMember OpCenter $account
}

ElseIf ($department -eq "Ed&Dev"){
New-ADUser -name $account -SamAccountName $account -userPrincipalName ($account + "@contoso.com") `
	-GivenName $first -Surname $last -DisplayName ($first + " " + $last) -OtherAttributes @{'Info'=$initials} `
	-Path 'OU=Users,OU=Ed&Dev,OU=OpCenter,DC=contoso,DC=com' `
	-Department $department -EmailAddress $email -Office "Op Center" -OfficePhone $phone `
	-AccountPassword (Read-Host -AsSecureString "AccountPassword")
Add-ADGroupMember EdDevDeptG $account
Add-ADGroupMember OpCenter $account
}

ElseIf ($department -eq "Human Resources"){
New-ADUser -name $account -SamAccountName $account -userPrincipalName ($account + "@contoso.com") `
	-GivenName $first -Surname $last -DisplayName ($first + " " + $last) -OtherAttributes @{'Info'=$initials} `
	-Path 'OU=Users,OU=HumanResources,OU=OpCenter,DC=contoso,DC=com' `
	-Department $department -EmailAddress $email -Office "Op Center" -OfficePhone $phone `
	-AccountPassword (Read-Host -AsSecureString "AccountPassword")
Add-ADGroupMember HRDeptG $account
Add-ADGroupMember OpCenter $account
}

ElseIf ($department -eq "Marketing"){
New-ADUser -name $account -SamAccountName $account -userPrincipalName ($account + "@contoso.com") `
	-GivenName $first -Surname $last -DisplayName ($first + " " + $last) -OtherAttributes @{'Info'=$initials} `
	-Path 'OU=Users,OU=Marketing,OU=OpCenter,DC=contoso,DC=com' `
	-Department $department -EmailAddress $email -Office "Op Center" -OfficePhone $phone `
	-AccountPassword (Read-Host -AsSecureString "AccountPassword")
Add-ADGroupMember MarketingDeptG $account
Add-ADGroupMember Marketing $account
Add-ADGroupMember OpCenter $account
}

ElseIf ($department -eq "Residential Lending"){
New-ADUser -name ($first + " " + $last) -SamAccountName $account -userPrincipalName ($account + "@contoso.com") `
	-GivenName $first -Surname $last -DisplayName ($first + " " + $last) -OtherAttributes @{'Info'=$initials} `
	-Path 'OU=Users,OU=MortgageSales,OU=OpCenter,DC=contoso,DC=com' `
	-Department $department -EmailAddress $email -Office "Op Center" -OfficePhone $phone `
	-AccountPassword (Read-Host -AsSecureString "AccountPassword")
Add-ADGroupMember MtgSalesDeptG $account
Add-ADGroupMember ResLending $account
Add-ADGroupMember OpCenter $account
}

ElseIf ($department -eq "Testing"){
New-ADUser -name $account -SamAccountName $account -userPrincipalName ($account + "@contoso.com") `
	-GivenName $first -Surname $last -DisplayName ($first + " " + $last) -OtherAttributes @{'Info'=$initials + ', DTM, TMA, TMN'} `
	-Path 'OU=Users,OU=Technology,OU=OpCenter,DC=contoso,DC=com' `
	-Department $department -EmailAddress $email -Office "Op Center" -OfficePhone $phone `
	-AccountPassword (Read-Host -AsSecureString "AccountPassword")
Add-ADGroupMember TechDeptG $account
Add-ADGroupMember OpCenter $account
}

ElseIf ($department -eq "Wheaton"){
New-ADUser -name $account -SamAccountName $account -userPrincipalName ($account + "@contoso.com") `
	-GivenName $first -Surname $last -DisplayName ($first + " " + $last) -OtherAttributes @{'Info'=$initials + ', DTM, TMA, TMN'} `
	-Path 'OU=Users,OU=Wheaton,DC=contoso,DC=com' `
	-Department $department -EmailAddress $email -Office "Wheaton Sales Center" `
	-AccountPassword (Read-Host -AsSecureString "AccountPassword")
Add-ADGroupMember iMMTiCTeller $account
}

ElseIf ($department -eq "DownersGrove"){
New-ADUser -name $account -SamAccountName $account -userPrincipalName ($account + "@contoso.com") `
	-GivenName $first -Surname $last -DisplayName ($first + " " + $last) -OtherAttributes @{'Info'=$initials + ', DTM, TMA, TMN'} `
	-Path 'OU=Users,OU=DownersGrove,DC=contoso,DC=com' `
	-Department $department -EmailAddress $email -Office "Downers Grove Sales Office" `
	-AccountPassword (Read-Host -AsSecureString "AccountPassword")
Add-ADGroupMember iMMTiCTeller $account
}

ElseIf ($department -eq "Naperville"){
New-ADUser -name $account -SamAccountName $account -userPrincipalName ($account + "@contoso.com") `
	-GivenName $first -Surname $last -DisplayName ($first + " " + $last) -OtherAttributes @{'Info'=$initials + ', DTM, TMA, TMN'} `
	-Path 'OU=Users,OU=Naperville,DC=contoso,DC=com' `
	-Department $department -EmailAddress $email -Office "Naperville Sales Office" `
	-AccountPassword (Read-Host -AsSecureString "AccountPassword")
Add-ADGroupMember iMMTiCTeller $account
}

Else {
Write-Host "----------------------------------------------------------------------------------"
Write-Host "No matches were found for the department name.  You entered: " $department
Write-Host "Cannot create user.  Exiting script, no changes made."
Write-Host "----------------------------------------------------------------------------------"
exit
}

#Global Commands for All Accounts
#Add to All Team, force password reset on logon, create home folder, enable account
Add-ADGroupMember "All Team" $account
Set-ADUser -Identity $account -ChangePasswordAtLogon $true
$directory = "\\dcuopcfs1\dcucorporate\team members\" + $account
mkdir $directory
$ACL = Get-ACL $directory
$ACL.AddAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule("contoso\$account","Modify", "ContainerInherit, ObjectInherit", "None", "Allow")))
Set-Acl $directory $ACL
Enable-ADAccount -Identity $account
