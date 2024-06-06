$chromeInstallerUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$chromeInstallerPath = "$env:TEMP\chrome_installer.exe"
function Is-ChromeInstalled {
    $chromePath = "C:\Users\Milanotje\AppData\Local\Google\Chrome\Application\chrome.exe"
    if (Test-Path $chromePath) {
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