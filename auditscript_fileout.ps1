# Define the output file path
$outputFilePath = 'C:\OutFile.txt'

# Define maximum number of events to retrieve
$maxEvents = 100

# Define Events
$logonEventID = 4624
$logoffEventID = 4634
$failedLogonEventID = 4625
$userInitiatedLogoffEventID = 4647

# Define the filter hash tables for each event type
$logonFilter = @{
    LogName = 'Security'
    Id = $logonEventID
}
$logoffFilter = @{
    LogName = 'Security'
    Id = $logoffEventID
}
$failedLogonFilter = @{
    LogName = 'Security'
    Id = $failedLogonEventID
}
$userInitiatedLogoffFilter = @{
    LogName = 'Security'
    Id = $userInitiatedLogoffEventID
}

# Retrieve events from the Security log
$logonEvents = Get-WinEvent -FilterHashtable $logonFilter -MaxEvents $maxEvents
$logoffEvents = Get-WinEvent -FilterHashtable $logoffFilter -MaxEvents $maxEvents
$failedLogonEvents = Get-WinEvent -FilterHashtable $failedLogonFilter -MaxEvents $maxEvents
$userInitiatedLogoffEvents = Get-WinEvent -FilterHashtable $userInitiatedLogoffFilter -MaxEvents $maxEvents

# Write the logon events to the output file
'Logon Events:' | Out-File -FilePath $outputFilePath -Append
foreach ($event in $logonEvents) {
    $eventOutput = $event.TimeCreated.ToString() + " - " + $event.Properties[5].Value
    $eventOutput | Out-File -FilePath $outputFilePath -Append
}

# Write the logoff events to the output file
'Logoff Events:' | Out-File -FilePath $outputFilePath -Append
foreach ($event in $logoffEvents) {
    $eventOutput = $event.TimeCreated.ToString() + " - " + $event.Properties[5].Value
    $eventOutput | Out-File -FilePath $outputFilePath -Append
}

# Write the failed logon events to the output file
'Failed Logon Events:' | Out-File -FilePath $outputFilePath -Append
foreach ($event in $failedLogonEvents) {
    $eventOutput = $event.TimeCreated.ToString() + " - " + $event.Properties[5].Value
    $eventOutput | Out-File -FilePath $outputFilePath -Append
}

# Write the user-initiated logoff events to the output file
'User-Initiated Logoff Events:' | Out-File -FilePath $outputFilePath -Append
foreach ($event in $userInitiatedLogoffEvents) {
    $eventOutput = $event.TimeCreated.ToString() + " - " + $event.Properties[5].Value
    $eventOutput | Out-File -FilePath $outputFilePath -Append