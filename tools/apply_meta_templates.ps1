$modUnits   = "C:\Users\janni\Documents\Paradox Interactive\Hearts of Iron IV\mod\EmpiresShadow\history\units"
$vanillaUnits = "C:\Program Files (x86)\Steam\steamapps\common\Hearts of Iron IV\history\units"
$metaStdInf = @"
	regiments = {
		infantry = { x = 0 y = 0 }
		infantry = { x = 0 y = 1 }
		infantry = { x = 0 y = 2 }
		infantry = { x = 1 y = 0 }
		infantry = { x = 1 y = 1 }
		infantry = { x = 1 y = 2 }
		infantry = { x = 2 y = 0 }
		infantry = { x = 2 y = 1 }
		infantry = { x = 2 y = 2 }
	}
	support = {
		engineer  = { x = 0 y = 0 }
		artillery = { x = 0 y = 1 }
		anti_air  = { x = 0 y = 2 }
	}
"@
$metaLineArty = @"
	regiments = {
		infantry          = { x = 0 y = 0 }
		infantry          = { x = 0 y = 1 }
		infantry          = { x = 0 y = 2 }
		infantry          = { x = 1 y = 0 }
		infantry          = { x = 1 y = 1 }
		infantry          = { x = 1 y = 2 }
		infantry          = { x = 2 y = 0 }
		infantry          = { x = 2 y = 1 }
		infantry          = { x = 2 y = 2 }
		artillery_brigade = { x = 3 y = 0 }
		artillery_brigade = { x = 3 y = 1 }
		artillery_brigade = { x = 3 y = 2 }
	}
	support = {
		engineer  = { x = 0 y = 0 }
		artillery = { x = 0 y = 1 }
		anti_tank = { x = 0 y = 2 }
	}
"@
$metaOffensive = @"
	regiments = {
		infantry = { x = 0 y = 0 }
		infantry = { x = 0 y = 1 }
		infantry = { x = 0 y = 2 }
		infantry = { x = 0 y = 3 }
		infantry = { x = 0 y = 4 }
		infantry = { x = 1 y = 0 }
		infantry = { x = 1 y = 1 }
		infantry = { x = 1 y = 2 }
		infantry = { x = 1 y = 3 }
		infantry = { x = 1 y = 4 }
		infantry = { x = 2 y = 0 }
		infantry = { x = 2 y = 1 }
		infantry = { x = 2 y = 2 }
		infantry = { x = 2 y = 3 }
		infantry = { x = 2 y = 4 }
		infantry = { x = 3 y = 0 }
		infantry = { x = 3 y = 1 }
		infantry = { x = 3 y = 2 }
		infantry = { x = 3 y = 3 }
		infantry = { x = 3 y = 4 }
	}
	support = {
		assault_engineer = { x = 0 y = 0 }
		field_hospital   = { x = 0 y = 1 }
		anti_air         = { x = 0 y = 2 }
	}
"@
$metaMountain = @"
	regiments = {
		mountaineers      = { x = 0 y = 0 }
		mountaineers      = { x = 0 y = 1 }
		mountaineers      = { x = 0 y = 2 }
		mountaineers      = { x = 1 y = 0 }
		mountaineers      = { x = 1 y = 1 }
		mountaineers      = { x = 1 y = 2 }
		mountaineers      = { x = 2 y = 0 }
		mountaineers      = { x = 2 y = 1 }
		mountaineers      = { x = 2 y = 2 }
		artillery_brigade = { x = 3 y = 0 }
		artillery_brigade = { x = 3 y = 1 }
		artillery_brigade = { x = 3 y = 2 }
	}
	support = {
		engineer  = { x = 0 y = 0 }
		artillery = { x = 0 y = 1 }
		anti_air  = { x = 0 y = 2 }
	}
"@
$metaMotorized = @"
	regiments = {
		motorized = { x = 0 y = 0 }
		motorized = { x = 0 y = 1 }
		motorized = { x = 0 y = 2 }
		motorized = { x = 1 y = 0 }
		motorized = { x = 1 y = 1 }
		motorized = { x = 1 y = 2 }
		motorized = { x = 2 y = 0 }
		motorized = { x = 2 y = 1 }
		motorized = { x = 2 y = 2 }
	}
	support = {
		engineer            = { x = 0 y = 0 }
		anti_air            = { x = 0 y = 1 }
		logistics_company   = { x = 0 y = 2 }
		maintenance_company = { x = 0 y = 3 }
	}
"@
$metaSpaceMarine = @"
	regiments = {
		infantry            = { x = 0 y = 0 }
		infantry            = { x = 0 y = 1 }
		infantry            = { x = 0 y = 2 }
		infantry            = { x = 1 y = 0 }
		infantry            = { x = 1 y = 1 }
		infantry            = { x = 1 y = 2 }
		infantry            = { x = 2 y = 0 }
		infantry            = { x = 2 y = 1 }
		infantry            = { x = 2 y = 2 }
		medium_sp_artillery = { x = 3 y = 0 }
	}
	support = {
		engineer            = { x = 0 y = 0 }
		maintenance_company = { x = 0 y = 1 }
		anti_air            = { x = 0 y = 2 }
	}
"@
$metaGarrison = @"
	regiments = {
		infantry = { x = 0 y = 0 }
		infantry = { x = 0 y = 1 }
		infantry = { x = 0 y = 2 }
		infantry = { x = 1 y = 0 }
		infantry = { x = 1 y = 1 }
		infantry = { x = 1 y = 2 }
	}
	support = {
		engineer = { x = 0 y = 0 }
	}
"@
$metaParatrooper = @"
	regiments = {
		paratrooper = { x = 0 y = 0 }
		paratrooper = { x = 0 y = 1 }
		paratrooper = { x = 0 y = 2 }
		paratrooper = { x = 1 y = 0 }
		paratrooper = { x = 1 y = 1 }
		paratrooper = { x = 1 y = 2 }
		paratrooper = { x = 2 y = 0 }
		paratrooper = { x = 2 y = 1 }
		paratrooper = { x = 2 y = 2 }
	}
	support = {
		engineer = { x = 0 y = 0 }
		anti_air = { x = 0 y = 1 }
	}
"@
function Get-MetaContent {
    param([string]$regSupText)
    $hasMountaineers  = $regSupText -match '\bmountaineers\b'
    $hasParatroopers  = $regSupText -match '\bparatrooper\b'
    $hasInfantry      = $regSupText -match '\binfantry\b'
    $hasMotorized     = $regSupText -match '\bmotorized\b'
    $hasCavalry       = $regSupText -match '\bcavalry\b'
    $hasArmor         = $regSupText -match '\b(light_armor|medium_armor|heavy_armor|modern_armor|light_sp_aa|medium_sp_artillery)\b'
    $hasMechanized    = $regSupText -match '\bmechanized\b'
    $hasArtyBrigade   = $regSupText -match '\bartillery_brigade\b'
    $isGarrison       = $regSupText -match '\b(GAR|garrison|pogranichnaya|bogazi|sicherungs|guard)\b'
    $infCount = ([regex]::Matches($regSupText, '\binfantry\s*=\s*\{')).Count
    if ($isGarrison -and -not $hasArmor) { return $metaGarrison }
    if ($hasParatroopers)    { return $metaParatrooper }
    if ($hasMountaineers)    { return $metaMountain }
    if ($hasArmor -and $hasInfantry)         { return $metaSpaceMarine }
    if ($hasArmor -or $hasMechanized)        { return $metaMotorized }
    if ($hasCavalry -or $hasMotorized)       { return $metaMotorized }
    if ($hasArtyBrigade -and $hasInfantry)   { return $metaLineArty }
    if ($infCount -ge 15)                    { return $metaOffensive }
    if ($hasInfantry)                        { return $metaStdInf }
    return $metaStdInf
}
function Replace-TemplateBlocks {
    param([string]$fileContent)
    $result     = [System.Text.StringBuilder]::new()
    $pos        = 0
    $len        = $fileContent.Length
    $marker     = 'division_template'
    while ($pos -lt $len) {
        $idx = $fileContent.IndexOf($marker, $pos)
        if ($idx -lt 0) {
            [void]$result.Append($fileContent.Substring($pos))
            break
        }
        $nextBrace  = $fileContent.IndexOf('{', $idx + $marker.Length)
        $nextQuote  = $fileContent.IndexOf('"', $idx + $marker.Length)
        $isReference = ($nextBrace -lt 0) -or (($nextQuote -ge 0) -and ($nextQuote -lt $nextBrace))
        if ($isReference) {
            [void]$result.Append($fileContent.Substring($pos, $idx - $pos + $marker.Length))
            $pos = $idx + $marker.Length
            continue
        }
        $braceOpen = $nextBrace
        [void]$result.Append($fileContent.Substring($pos, $braceOpen - $pos + 1))
        $depth     = 1
        $scan      = $braceOpen + 1
        while ($scan -lt $len -and $depth -gt 0) {
            if     ($fileContent[$scan] -eq '{') { $depth++ }
            elseif ($fileContent[$scan] -eq '}') { $depth-- }
            $scan++
        }
        $blockBody = $fileContent.Substring($braceOpen + 1, $scan - $braceOpen - 2)
        $nameLine  = ''
        if ($blockBody -match '(?m)^\s*name\s*=\s*"[^"]*".*$') {
            $nameLine = $Matches[0]
        }
        $nameGroup = ''
        if ($blockBody -match '(?m)^\s*division_names_group\s*=\s*\S+.*$') {
            $nameGroup = $Matches[0]
        }
        $regsBlock = ''
        if ($blockBody -match '(?s)regiments\s*=\s*\{(.+?)\}') {
            $regsBlock = $Matches[1]
        }
        $classText = $blockBody
        $metaContent = Get-MetaContent -regSupText $classText
        $newBlock = "`n"
        if ($nameLine)  { $newBlock += "$nameLine`n" }
        if ($nameGroup) { $newBlock += "$nameGroup`n`n" }
        $newBlock += $metaContent
        [void]$result.Append($newBlock)
        [void]$result.Append('}')
        $pos = $scan
    }
    return $result.ToString()
}
$groundFiles = Get-ChildItem -Path $modUnits -Filter "*.txt" |
    Where-Object { $_.Name -notmatch 'air|naval|nsb|bba' }
foreach ($f in $groundFiles) {
    Write-Host "Processing: $($f.Name) ..."
    $raw     = Get-Content -Raw -Encoding UTF8 $f.FullName
    $updated = Replace-TemplateBlocks -fileContent $raw
    Set-Content -Path $f.FullName -Value $updated -Encoding UTF8 -NoNewline
    Write-Host "  Done."
}
$toCopy = @('CZE_1936.txt', 'SWI_1936.txt', 'CZE_1936_mun.txt')
foreach ($fname in $toCopy) {
    $dest = Join-Path $modUnits $fname
    if (Test-Path $dest) {
        Write-Host "Already exists, skipping copy: $fname"
        continue
    }
    $src = Join-Path $vanillaUnits $fname
    if (-not (Test-Path $src)) {
        Write-Host "  Vanilla source not found: $fname -- skipping"
        continue
    }
    Copy-Item -Path $src -Destination $dest
    Write-Host "Copied vanilla: $fname"
    $raw     = Get-Content -Raw -Encoding UTF8 $dest
    $updated = Replace-TemplateBlocks -fileContent $raw
    Set-Content -Path $dest -Value $updated -Encoding UTF8 -NoNewline
    Write-Host "  Applied meta templates to $fname"
}
Write-Host ""
Write-Host "=== All done! ==="
