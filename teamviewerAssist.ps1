Add-Type -AssemblyName System.Windows.Forms
$url = "https://customdesignservice.teamviewer.com/download/windows/v15/6a6jvxf/TeamViewerQS.exe?sv=2023-11-03&se=2026-02-11T21%3A42%3A55Z&sr=b&sp=r&sig=r%2B5W0uhNqjjTFKXLtjdh1kt8NOyR2F%2BGmC%2FJMlpdDz4%3D"
$fileName = "TeamViewerQS.exe"
try {
    (New-Object System.Net.WebClient).DownloadFile($url, "$env:TEMP\$fileName")
}
catch {
    <#Do this if a terminating exception happens#>
    [System.Windows.Forms.MessageBox]::Show(
        $_.Exception.Message,
        "Error downloading TeamViewer QuickSupport.",
        [System.Windows.Forms.MessageBoxButtons]::OK,
        [System.Windows.Forms.MessageBoxIcon]::Error
    ) | Out-Null
}
try {
    Start-Process -FilePath "$env:TEMP\$fileName" -verb RunAs
}
catch {
    <#Do this if a terminating exception happens#>
    [System.Windows.Forms.MessageBox]::Show(
        $_.Exception.Message,
        "Error running TeamViewer QuickSupport. Possible download failure. Retry.",
        [System.Windows.Forms.MessageBoxButtons]::OK,
        [System.Windows.Forms.MessageBoxIcon]::Error
    ) | Out-Null
}