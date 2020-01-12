param(
    [string] $DatabaseName = $env:DATABASE_NAME,
    [string] $HostName = $env:HOST_NAME,
    [string] $UserID = $env:USER_ID,
    [string] $Password = $env:PASSWORD
)

# Path conventions
$WebRootPath = 'C:\Inetpub\wwwroot'
$TargetPath = Join-Path -Path $WebRootPath -ChildPath 'config'
$AppSettingsPath = Join-Path -Path $TargetPath -ChildPath 'appSettings.config'
$ConnectionStringsPath = Join-Path -Path $TargetPath -ChildPath 'connectionStrings.config'

# Write appSettings.config
$AppSettingsValues = [ordered]@{
  'PictureFolder' = Join-Path -Path $WebRootPath -ChildPath 'Pictures\';
  'PhoneRep' = '213-471-2913';
  'SMTPServer' = 'TrendyRags.com';
  'SSLRoot' = '~/';
  'NONSSLRoot' = '~/';
  'WelcomeLetter' = Join-Path -Path $WebRootPath -ChildPath 'Login\Welcome.txt';
  'WelcomeLetter_WS' = Join-Path -Path $WebRootPath -ChildPath 'Login\Welcome_WS.txt';
  'ApprovalLetter_WS' = Join-Path -Path $WebRootPath -ChildPath 'Login\Approval_WS.txt';
  'Text.Packaging' = Join-Path -Path $WebRootPath -ChildPath 'Admin\adminText\Packaging.txt';
  'Text.Cancelled' = Join-Path -Path $WebRootPath -ChildPath 'Admin\adminText\Cancelled.txt';
  'Text.Refunded' = Join-Path -Path $WebRootPath -ChildPath 'Admin\adminText\Refund.txt';
  'Text.Returned' = Join-Path -Path $WebRootPath -ChildPath 'Admin\adminText\Returned.txt';
  'Text.Shipped' = Join-Path -Path $WebRootPath -ChildPath 'Admin\adminText\Shipped.txt';
  'Text.Error' = Join-Path -Path $WebRootPath -ChildPath 'Admin\adminText\Error.txt';
  'SellerIDFolder' = Join-Path -Path $WebRootPath -ChildPath 'Login\SellerID\';
  'SellerIDURL' = '../Login/SellerID/';
  'Wholesale.Minimum.Order' = '1';
  'API Login ID for Authorize.net' = '48PN2twJS5SZ';
  'Transaction Key for Authorize.net' = '9Sr352BXtm3rNg62';
  'California Tax Rate' = '0.0825';
  'Box Factor for Wholesale' = '1.15';
}

# XmlWriter setup (to avoid BOM presentation and use clean formatting)
$settings = New-Object -TypeName 'System.Xml.XmlWriterSettings'
$settings.Encoding = New-Object -TypeName 'System.Text.UTF8Encoding' -ArgumentList @($false)
$settings.Indent = $true

# Write appSettings.config
$xmlDoc = New-Object -TypeName 'System.Xml.XmlDocument'
$xmlDoc.AppendChild($xmlDoc.CreateXmlDeclaration('1.0', 'utf-8', $null))
$appSettings = $xmlDoc.CreateElement('appSettings')
foreach ($Key in $AppSettingsValues.Keys) {
  $add = $xmlDoc.CreateElement('add')
  $add.SetAttribute('key', $Key)
  $add.SetAttribute('value', $AppSettingsValues[$Key])
  $appSettings.AppendChild($add)
}
$xmlDoc.AppendChild($appSettings)
$xmlWriter = [System.Xml.XmlWriter]::Create($AppSettingsPath, $settings)
$xmlDoc.Save($xmlWriter)
$xmlWriter.Close()

# Write connectionStrings.config
$xmlDoc = New-Object -TypeName 'System.Xml.XmlDocument'
$xmlDoc.AppendChild($xmlDoc.CreateXmlDeclaration('1.0', 'utf-8', $null))
$connectionStrings = $xmlDoc.CreateElement('connectionStrings')
$add = $xmlDoc.CreateElement('add')
$add.SetAttribute('name', 'TrendyRags')
$add.SetAttribute('connectionString', "Data Source=$HostName;Initial Catalog=$DatabaseName;Persist Security Info=True;User ID=$UserID;Password=$Password")
$add.SetAttribute('providerName', 'System.Data.SqlClient')
$connectionStrings.AppendChild($add)
$xmlDoc.AppendChild($connectionStrings)
$xmlWriter = [System.Xml.XmlWriter]::Create($ConnectionStringsPath, $settings)
$xmlDoc.Save($xmlWriter)
$xmlWriter.Close()
