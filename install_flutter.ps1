$ErrorActionPreference = 'Stop'
Write-Host 'Fetching Flutter releases info...'
$repoInfo = Invoke-RestMethod -Uri 'https://storage.googleapis.com/flutter_infra_release/releases/releases_windows.json'
$latestStableHash = $repoInfo.current_release.stable
$latestStableRelease = $repoInfo.releases | Where-Object { $_.hash -eq $latestStableHash } | Select-Object -First 1
$downloadUrl = $repoInfo.base_url + '/' + $latestStableRelease.archive
$zipPath = "$PWD\flutter.zip"
$extractPath = "$PWD\flutter_sdk"

Write-Host "Downloading $($latestStableRelease.version) from $downloadUrl..."
Invoke-WebRequest -Uri $downloadUrl -OutFile $zipPath

Write-Host "Extracting to $extractPath. This might take a few minutes..."
Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force
Remove-Item $zipPath

Write-Host "Adding Flutter to User PATH..."
$flutterBin = "$extractPath\flutter\bin"
[System.Environment]::SetEnvironmentVariable('PATH', [System.Environment]::GetEnvironmentVariable('PATH','User') + ';'+ $flutterBin, 'User')
$env:PATH += ";$flutterBin"

Write-Host "Running flutter --version to initialize..."
& "$flutterBin\flutter.bat" --version --suppress-analytics
Write-Host "Flutter Installation Done."
