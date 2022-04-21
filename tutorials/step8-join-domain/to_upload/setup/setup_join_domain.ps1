$domain = "XXX.com"
$password = "XXX" | ConvertTo-SecureString -asPlainText -Force
$username = "XXX\XXX" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential