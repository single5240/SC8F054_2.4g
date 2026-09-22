# SC8F054 / SCMCU IDE V2.00.17 + XC8 V1.45 command-line build
# Usage:
#   powershell -NoProfile -ExecutionPolicy Bypass -File scripts/build.ps1
#   powershell -NoProfile -ExecutionPolicy Bypass -File scripts/build.ps1 -ProjectDir "E:\path\to\proj"
# Optional:
#   -IdeRoot  override IDE install root
#   -OutDir   output directory name (default: output)

param(
    [string]$ProjectDir = "",
    [string]$IdeRoot = "",
    [string]$OutDir = "output",
    [string]$ScwName = ""
)

$ErrorActionPreference = "Stop"

if (-not $ProjectDir) {
    $ProjectDir = (Get-Location).Path
}
$ProjectDir = (Resolve-Path $ProjectDir).Path

if (-not $IdeRoot) {
    if ($env:SCMCU_IDE_ROOT) {
        $IdeRoot = $env:SCMCU_IDE_ROOT
    } else {
        $IdeRoot = "E:\data\software\SC8F054_DK\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\SCMCU_IDE_V2.00.17_Beta3"
    }
}

$Xc8 = Join-Path $IdeRoot "data\bin\xc8.exe"
if (-not (Test-Path $Xc8)) {
    throw "xc8.exe not found: $Xc8"
}

$scw = $null
if ($ScwName) {
    $scw = Join-Path $ProjectDir $ScwName
} else {
    $found = Get-ChildItem -Path $ProjectDir -Filter "*.scw" -File | Select-Object -First 1
    if (-not $found) { throw "No .scw in $ProjectDir" }
    $scw = $found.FullName
}

$scwText = [System.IO.File]::ReadAllText($scw)
$chip = "SC8F054"
if ($scwText -match "(?m)^Device=(.+)$") { $chip = $Matches[1].Trim() }
$opt = "-local,-asmfile,+asm,+speed,-space,-debug"
if ($scwText -match "(?m)^OptValue=(.+)$") { $opt = $Matches[1].Trim() }
$warn = "-9"
if ($scwText -match "(?m)^WarningValue=(.+)$") { $warn = $Matches[1].Trim() }

$sources = @()
foreach ($m in [regex]::Matches($scwText, "(?m)^SourceFile=(.+)$")) {
    $sources += $m.Groups[1].Value.Trim()
}
if ($sources.Count -eq 0) { throw "No SourceFile entries in $scw" }

$projBase = [IO.Path]::GetFileNameWithoutExtension($scw)
$outPath = Join-Path $ProjectDir $OutDir
if (-not (Test-Path $outPath)) {
    New-Item -ItemType Directory -Path $outPath | Out-Null
}

$env:PATH = "$(Join-Path $IdeRoot 'data\bin');$env:PATH"
Set-Location $ProjectDir

$common = @(
    "--chip=$chip",
    "-Q",
    "--opt=$opt",
    "--warn=$warn",
    "--outdir=$OutDir",
    "--objdir=$OutDir"
)

Write-Host "IDE : $IdeRoot"
Write-Host "PROJ: $ProjectDir"
Write-Host "SCW : $scw"
Write-Host "CHIP: $chip"
Write-Host "OPT : $opt"
Write-Host "SRC : $($sources -join ', ')"
Write-Host ""

foreach ($s in $sources) {
    $srcPath = Join-Path $ProjectDir $s
    if (-not (Test-Path $srcPath)) { throw "Missing source: $srcPath" }
    $base = [IO.Path]::GetFileNameWithoutExtension($s)
    Write-Host "PASS1 $s"
    & $Xc8 @($common + @("--pass1", $s, "-O$OutDir\$base.p1"))
    if ($LASTEXITCODE -ne 0) {
        throw "pass1 failed: $s (exit $LASTEXITCODE)"
    }
}

$p1s = $sources | ForEach-Object {
    "$OutDir\" + [IO.Path]::GetFileNameWithoutExtension($_) + ".p1"
}
$hexRel = "$OutDir\$projBase.hex"
$linkArgs = $common + @(
    "--asmlist",
    "--summary=default,-psect,-class,+mem,-hex,-file",
    "--output=intel",
    "--runtime=default,+clear,+init,-keep,+osccal,-download,-resetbits,+config,+clib,+plib"
) + $p1s + @("-O$hexRel")

Write-Host "LINK $hexRel"
$logFile = Join-Path $outPath "build_log.txt"
& $Xc8 @linkArgs 2>&1 | Tee-Object -FilePath $logFile
if ($LASTEXITCODE -ne 0) {
    throw "link failed (exit $LASTEXITCODE); see $logFile"
}

Write-Host ""
Write-Host "==== Memory Summary ===="
Select-String -Path $logFile -Pattern "Program space|Data space|Data stack space|Memory Summary|Error|error\(|\(908\)" |
    ForEach-Object { $_.Line }

$hexFull = Join-Path $ProjectDir $hexRel
if (-not (Test-Path $hexFull)) {
    throw "HEX missing: $hexFull"
}
Write-Host ""
Write-Host "OK HEX: $hexFull"
Write-Host "NOTE: CLI uses XC8 default CONFIG words; IDE may inject scw config=FEFF,FAEF,... Use IDE build for production CfgCRC."
exit 0
