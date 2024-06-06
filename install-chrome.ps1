$chromeInstallerUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$chromeInstallerPath = "$env:TEMP\chrome_installer.exe"
function Is-ChromeInstalled {
    $chrome = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq "Google Chrome" }
    if ($chrome) {
        return $true
    } else {
        return $false
    }
}

function Install-Chrome {
    Write-Output "Downloading Chrome installer..."
    Invoke-WebRequest -Uri $chromeInstallerUrl -OutFile $chromeInstallerPath
    Write-Output "Installing Chrome..."
    Start-Process -FilePath $chromeInstallerPath -ArgumentList "/silent /install" -Wait
    Remove-Item $chromeInstallerPath
    Write-Output "Chrome installation complete."
}
if (Is-ChromeInstalled) {
    Write-Output "Google Chrome is already installed."
} else {
    Write-Output "Google Chrome is not installed. Installing now..."
    Install-Chrome
}