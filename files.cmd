@echo off
set "server_url=http://192.168.1.10:5000/report"  :: Replace with your actual IP address
set "temp_file=%TEMP%\system_info.json"
powershell -Command ^
    "$headers = @{ 'Content-Type' = 'application/json' }; " ^
    "Get-ComputerInfo | ConvertTo-Json | Out-File -FilePath '%temp_file%'; " ^
    "Invoke-RestMethod -Uri '%server_url%' -Method Post -InFile '%temp_file%' -Headers $headers"

del "%temp_file%"

echo System information sent to the server.
pause
