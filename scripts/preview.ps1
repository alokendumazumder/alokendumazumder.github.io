param(
    [int]$Port = 4000
)

$ErrorActionPreference = 'Stop'
$rubyCommand = Get-Command ruby.exe -ErrorAction SilentlyContinue
$rubyPath = if ($rubyCommand) {
    $rubyCommand.Source
} else {
    Join-Path $env:USERPROFILE 'Ruby32-x64\bin\ruby.exe'
}
if (-not (Test-Path -LiteralPath $rubyPath)) {
    throw 'Install Ruby+DevKit 3.2, then reopen PowerShell and run this script again.'
}

$rubyBin = Split-Path -Parent $rubyPath
$rubyRoot = Split-Path -Parent $rubyBin
$imageMagickBin = Join-Path $rubyRoot 'msys64\ucrt64\bin'
$env:Path = "$rubyBin;$imageMagickBin;" + $env:Path

Push-Location (Split-Path -Parent $PSScriptRoot)
try {
    & $rubyPath -S bundle _2.5.7_ exec jekyll serve --host 127.0.0.1 --port $Port
    if ($LASTEXITCODE -ne 0) {
        throw "Jekyll exited with code $LASTEXITCODE."
    }
} finally {
    Pop-Location
}
