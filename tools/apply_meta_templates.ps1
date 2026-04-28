# =============================================================
# apply_meta_templates.ps1
# Replaces all division_template regiment/support blocks in
# all HOI4 mod ground unit files with 2026 meta templates.
# Names and division_names_groups are preserved so that
# existing units = {} references stay intact.
# =============================================================

$modUnits   = "C:\Users\janni\Documents\Paradox Interactive\Hearts of Iron IV\mod\EmpiresShadow\history\units"
$vanillaUnits = "C:\Program Files (x86)\Steam\steamapps\common\Hearts of Iron IV\history\units"

# ──────────────────────────────────────────────
# META TEMPLATE CONTENT (regiments + support)
# ──────────────────────────────────────────────

# 1) Standard Infantry – 18W (9x inf)
$metaStdInf = @"
	# Standard Infantry 18W (9 inf)
	# No special doctrine required.
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

# 2) Line Artillery Infantry – ~30W  (9 inf + 3 arty brigade)
# Needs: Fire Concentration sub-doctrine → arty drops 4W→3W
$metaLineArty = @"
	# Line Artillery Infantry ~30W (9 inf + 3 arty brigade)
	# Needs: Fire Concentration sub-doctrine (effective ~27W)
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

# 3) Offensive Infantry (Massed) – ~35.7W  (20x inf)
# Needs: Large Unique Tactics doctrine
$metaOffensive = @"
	# Offensive Infantry (Massed) 40W→~35.7W (20x inf)
	# Needs: Large Unique Tactics doctrine for ~-10% combat-width
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
		assault_engineer = { x = 0 y = 0 }  # Needs NSB/LaR DLC; fallback: engineer
		field_hospital   = { x = 0 y = 1 }
		anti_air         = { x = 0 y = 2 }
	}
"@

# 4) Mountaineers + Line Arty – ~30W
# Needs: Special Forces Doctrine (Arms Against Tyranny) + Fire Concentration
$metaMountain = @"
	# Special Forces: Mountaineers + Line Arty ~30W
	# Needs: Special Forces Doctrine (AaT) + Fire Concentration sub-doctrine
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

# 5) Elite Motorized / Mechanized – 18W
# Speed: design all vehicles to exactly 8 km/h
$metaMotorized = @"
	# Elite Motorized/Mechanized 18W
	# Speed: design all vehicles to exactly 8 km/h (Mech Inf Tier 1 speed)
	# Upgrade motorized -> mechanized when available
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

# 6) Space Marines – ~20W  (9 inf + 1 medium_sp_artillery)
# Tank design: 4 km/h, Wet Ammo, Howitzer barrel
$metaSpaceMarine = @"
	# Space Marines ~20W (9 inf + 1 Medium SP-Artillery)
	# Tank design: cap speed 4 km/h, Wet Ammo (Reliability), Howitzer (Soft Attack)
	# SPG is ~20% cheaper than regular tanks
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

# 7) Garrison / Border Guard – 6W  (6 inf, minimal cost)
$metaGarrison = @"
	# Garrison / Border Guard 6W (minimal cost/equipment)
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

# 8) Paratrooper – 9W  (paratrooper regiments)
$metaParatrooper = @"
	# Paratroopers 9W
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

# ──────────────────────────────────────────────
# CLASSIFICATION FUNCTION
# ──────────────────────────────────────────────

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
    return $metaStdInf  # fallback
}

# ──────────────────────────────────────────────
# TEMPLATE BLOCK REPLACEMENT FUNCTION
# ──────────────────────────────────────────────

function Replace-TemplateBlocks {
    param([string]$fileContent)

    # We find each `division_template = {` and process it
    $result     = [System.Text.StringBuilder]::new()
    $pos        = 0
    $len        = $fileContent.Length
    $marker     = 'division_template'

    while ($pos -lt $len) {
        $idx = $fileContent.IndexOf($marker, $pos)
        if ($idx -lt 0) {
            # No more templates – append remainder
            [void]$result.Append($fileContent.Substring($pos))
            break
        }

        # Find the next { or " after 'division_template'
        # If we hit a " first it's a reference (division_template = "Name"), not a block definition
        $nextBrace  = $fileContent.IndexOf('{', $idx + $marker.Length)
        $nextQuote  = $fileContent.IndexOf('"', $idx + $marker.Length)

        # It's a reference if a quote comes before the brace (or no brace follows)
        $isReference = ($nextBrace -lt 0) -or (($nextQuote -ge 0) -and ($nextQuote -lt $nextBrace))

        if ($isReference) {
            # Not a block definition – copy up to and including the marker and continue
            [void]$result.Append($fileContent.Substring($pos, $idx - $pos + $marker.Length))
            $pos = $idx + $marker.Length
            continue
        }

        $braceOpen = $nextBrace
        [void]$result.Append($fileContent.Substring($pos, $braceOpen - $pos + 1))

        # Walk braces to find the END of this division_template block
        $depth     = 1
        $scan      = $braceOpen + 1
        while ($scan -lt $len -and $depth -gt 0) {
            if     ($fileContent[$scan] -eq '{') { $depth++ }
            elseif ($fileContent[$scan] -eq '}') { $depth-- }
            $scan++
        }
        # $scan now points one past the closing '}'
        $blockBody = $fileContent.Substring($braceOpen + 1, $scan - $braceOpen - 2)  # content between outer braces

        # ── Extract name line ──
        $nameLine  = ''
        if ($blockBody -match '(?m)^\s*name\s*=\s*"[^"]*".*$') {
            $nameLine = $Matches[0]
        }

        # ── Extract division_names_group line ──
        $nameGroup = ''
        if ($blockBody -match '(?m)^\s*division_names_group\s*=\s*\S+.*$') {
            $nameGroup = $Matches[0]
        }

        # ── Extract regiment types from regiments block for classification ──
        $regsBlock = ''
        if ($blockBody -match '(?s)regiments\s*=\s*\{(.+?)\}') {
            $regsBlock = $Matches[1]
        }
        # Also grab support block text for garrison detection via name
        $classText = $blockBody  # classify on full body (includes name comments)

        $metaContent = Get-MetaContent -regSupText $classText

        # ── Rebuild the template block ──
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

# ──────────────────────────────────────────────
# PROCESS ALL EXISTING MOD FILES
# ──────────────────────────────────────────────

$groundFiles = Get-ChildItem -Path $modUnits -Filter "*.txt" |
    Where-Object { $_.Name -notmatch 'air|naval|nsb|bba' }

foreach ($f in $groundFiles) {
    Write-Host "Processing: $($f.Name) ..."
    $raw     = Get-Content -Raw -Encoding UTF8 $f.FullName
    $updated = Replace-TemplateBlocks -fileContent $raw
    Set-Content -Path $f.FullName -Value $updated -Encoding UTF8 -NoNewline
    Write-Host "  Done."
}

# ──────────────────────────────────────────────
# COPY MISSING KEY VANILLA FILES
# ──────────────────────────────────────────────

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
