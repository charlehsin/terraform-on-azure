Install-WindowsFeature -name Web-Server -IncludeManagementTools
New-Item C:\upload_files\created_file.txt
Set-Content C:\upload_files\created_file.txt 'Created by PowerShell'