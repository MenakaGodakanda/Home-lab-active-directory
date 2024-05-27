# Add users to AD
foreach ($user in $users) {
    $name = "$($user.FirstName) $($user.LastName)"
    $username = $user.Username
    $password = (ConvertTo-SecureString $user.Password -AsPlainText -Force)
    $userPrincipalName = "$username@mydomain.local"

    New-ADUser -Name $name `
               -GivenName $user.FirstName `
               -Surname $user.LastName `
               -SamAccountName $username `
               -UserPrincipalName $userPrincipalName `
               -AccountPassword $password `
               -Enabled $true `
               -PasswordNeverExpires $true `
               -Path "CN=Users,DC=mydomain,DC=local"

    Write-Output "Created user: $name"
}
