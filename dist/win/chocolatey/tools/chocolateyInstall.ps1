$ErrorActionPreference = 'Stop'

$url = "https://github.com/cryptomator/cryptomator/releases/download/$env:chocolateyPackageVersion/Cryptomator-$env:chocolateyPackageVersion-x64.msi"
$packageArgs = @{
  packageName            = 'cryptomator'
  fileType               = 'msi'
  url64bit               = $url
  checksum64             = '<!-- sha -->'
  checksumType64         = 'sha256'
  silentArgs             = '/qn /norestart'
  validExitCodes         = @(0)
  registryUninstallerKey = 'Cryptomator'
}
Install-ChocolateyPackage @packageArgs

$installLocation = Get-AppInstallLocation $packageArgs.registryUninstallerKey
if ($installLocation)  {
    Write-Host "$packageName installed to '$installLocation'"
}
else { Write-Warning "Can't find $PackageName install location" }
