param(
    [string] $sa_password = $env:sa_password,
    [string] $data_path = $env:data_path,
    [string] $TargetServerName = '.',
    [string[]] $TargetDatabaseNames = @(),
    [string] $TargetUser = 'sa',
    [string] $TargetPassword = $env:sa_password
)

Start-Service MSSQLSERVER
if ($sa_password -ne "_") {
    Write-Host 'Changing SA login credentials'
    $sqlcmd = "ALTER LOGIN sa with password='$sa_password'; ALTER LOGIN sa ENABLE;"
    Invoke-SqlCmd -Query $sqlcmd -ServerInstance "." 
}

$SqlPackagePath = 'C:\Program Files\Microsoft SQL Server\140\DAC\bin\SqlPackage.exe'
$ParsedDatabaseNames = $TargetDatabaseNames.Split(",", [System.StringSplitOptions]::RemoveEmptyEntries) | % {$_.Trim()}

foreach ($TargetDatabaseName in $ParsedDatabaseNames) {
    Write-Host "Processing $TargetDatabaseName..."
    $mdfPath = Join-Path -Path $data_path -ChildPath "$TargetDatabaseName`_Primary.mdf"
    $ldfPath = Join-Path -Path $data_path -ChildPath "$TargetDatabaseName`_Primary.ldf"

    Write-Host "MDF Path: $mdfPath"
    Write-Host "LDF Path: $ldfPath"

    # attach data files if they exist: 
    if ((Test-Path $mdfPath) -eq $true) {
        Write-Host "Attaching $mdfPath database."
        $sqlcmd = "IF DB_ID('$TargetDatabaseName') IS NULL BEGIN CREATE DATABASE $TargetDatabaseName ON (FILENAME = N'$mdfPath')"
        if ((Test-Path $ldfPath) -eq $true) {
            $sqlcmd = "$sqlcmd, (FILENAME = N'$ldfPath')"
        }
        $sqlcmd = "$sqlcmd FOR ATTACH; END"
        Write-Host 'Data files exist - will attach and upgrade database'
        Invoke-Sqlcmd -Query $sqlcmd -ServerInstance "."
    }
    else {
        Write-Host 'No data files - will create new database'
    }

    # deploy or upgrade the database:
    & $SqlPackagePath  `
        /sf:$TargetDatabaseName.dacpac `
        /a:Script /op:"$TargetDatabaseName`_deploy.sql" /p:CommentOutSetVarDeclarations=true `
        /TargetServerName:$TargetServerName /TargetDatabaseName:$TargetDatabaseName `
        /TargetUser:$TargetUser /TargetPassword:$TargetPassword 

    $SqlCmdVars = "DatabaseName=$TargetDatabaseName", "DefaultFilePrefix=$TargetDatabaseName", "DefaultDataPath=$data_path\", "DefaultLogPath=$data_path\"  
    Invoke-Sqlcmd -InputFile "$TargetDatabaseName`_deploy.sql" -Variable $SqlCmdVars -Verbose

    Write-Host "Deployed $TargetDatabaseName database, data files at: $data_path"
}

$lastCheck = (Get-Date).AddSeconds(-2) 
while ($true) { 
    Get-EventLog -LogName Application -Source "MSSQL*" -After $lastCheck | Select-Object TimeGenerated, EntryType, Message	 
    $lastCheck = Get-Date 
    Start-Sleep -Seconds 2 
}
