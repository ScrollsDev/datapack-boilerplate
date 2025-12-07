# Datapack Boilerplate Setup Script
# Usage: .\setup.ps1 <your-datapack-name>

param([string]$DatapackName)

if (-not $DatapackName) {
    Write-Host "Error: Please provide a datapack name" -ForegroundColor Red
    Write-Host ""
    Write-Host "Usage: .\setup.ps1 <datapack-name>" -ForegroundColor Yellow
    Write-Host "Example: .\setup.ps1 your_datapack_name" -ForegroundColor Yellow
    exit 1
}

# Validate datapack name (lowercase, no spaces, alphanumeric and underscores only)
if ($DatapackName -notmatch '^[a-z0-9_]+$') {
    Write-Host "Error: Datapack name must be lowercase, alphanumeric, and use underscores only" -ForegroundColor Red
    Write-Host "Example: super_jump (not Super Jump or super-jump)" -ForegroundColor Yellow
    exit 1
}

Write-Host "Setting up datapack: $DatapackName" -ForegroundColor Green

# Check if namespace folder exists
if (-not (Test-Path "data\namespace")) {
    Write-Host "Error: data\namespace folder not found. Are you in the correct directory?" -ForegroundColor Red
    exit 1
}

# Rename namespace folder
Write-Host "Renaming namespace folder..." -ForegroundColor Cyan
Move-Item -Path "data\namespace" -Destination "data\$DatapackName"

# Update load.json
Write-Host "Updating load.json..." -ForegroundColor Cyan
(Get-Content "data\minecraft\tags\function\load.json") -replace "namespace:load", "${DatapackName}:load" | Set-Content "data\minecraft\tags\function\load.json"

# Update tick.json
Write-Host "Updating tick.json..." -ForegroundColor Cyan
(Get-Content "data\minecraft\tags\function\tick.json") -replace "namespace:tick", "${DatapackName}:tick" | Set-Content "data\minecraft\tags\function\tick.json"

Write-Host ""
Write-Host "Setup complete! Your datapack '$DatapackName' is ready to use." -ForegroundColor Green