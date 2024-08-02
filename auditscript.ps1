# Define Events
$logonEventID = 4624
$logoffEventID = 4634

# Define the filter hash tables for logon and logoff events
$logonFilter = @{
    LogName = 'Security'
    Id = $logonEventID
}
$logoffFilter = @{
    LogName = 'Security'
    Id = $logoffEventID
}

# Retrieve logon events from the Security log
$logonEvents = Get-WinEvent -FilterHashtable $logonFilter -MaxEvents 100
# Retrieve logoff events from the Security log
$logoffEvents = Get-WinEvent -FilterHashtable $logoffFilter -MaxEvents 100

# Display the logon events
Write-Host "Logon Events:"
foreach ($event in $logonEvents) {
    $event.TimeCreated.ToString() + " - " + $event.Properties[5].Value
}

# Display the logoff events
Write-Host "Logoff Events:"
foreach ($event in $logoffEvents) {
    $event.TimeCreated.ToString() + " - " + $event.Properties[5].Value
}
