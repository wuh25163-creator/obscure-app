$screensDir = Join-Path (Get-Location).Path "lib\screens"
$mainFile = Join-Path (Get-Location).Path "lib\main.dart"

New-Item -Path $screensDir -Name "customer" -ItemType "directory" -Force
New-Item -Path $screensDir -Name "designer" -ItemType "directory" -Force
New-Item -Path $screensDir -Name "shared" -ItemType "directory" -Force

$customer = @("customer_signup_screen.dart", "discovery_feed_screen.dart", "search_categories_screen.dart")
$designer = @("designer_signup_screen.dart", "designer_profile_screen.dart", "daily_planner_screen.dart", "income_dashboard_screen.dart", "portfolio_management_screen.dart")
$shared = @("identity_selection_screen.dart", "commission_status_screen.dart", "message_inbox_screen.dart")

function Move-AndUpdate {
    param ($files, $folderName)
    foreach ($file in $files) {
        $source = Join-Path $screensDir $file
        $dest = Join-Path $screensDir "$folderName\$file"
        if (Test-Path $source) {
            Move-Item -Path $source -Destination $dest -Force
            $content = Get-Content $dest -Raw -Encoding UTF8
            $content = $content -replace "import '../core/app_theme.dart';", "import '../../core/app_theme.dart';"
            Set-Content -Path $dest -Value $content -Encoding UTF8
            Write-Host "Moved and updated: $file"
        }
    }
}

Move-AndUpdate -files $customer -folderName "customer"
Move-AndUpdate -files $designer -folderName "designer"
Move-AndUpdate -files $shared -folderName "shared"

$mainContent = Get-Content $mainFile -Raw -Encoding UTF8
foreach ($c in $customer) {
    $mainContent = $mainContent -replace "import 'screens/$c';", "import 'screens/customer/$c';"
}
foreach ($d in $designer) {
    $mainContent = $mainContent -replace "import 'screens/$d';", "import 'screens/designer/$d';"
}
foreach ($s in $shared) {
    $mainContent = $mainContent -replace "import 'screens/$s';", "import 'screens/shared/$s';"
}
Set-Content -Path $mainFile -Value $mainContent -Encoding UTF8

Write-Host "Done"
