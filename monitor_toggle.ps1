# Indigo Hartsell | 2024-02-10
# Toggles between single and extended display mode.
#
# for displayswitch.exe, 1 = internal, 3 = extend
# attach.todesktop: 1 = extend, 0 = internal

# Found key thru Regshot, not sure if it is permanent
$registryKeyPath = 'HKLM:SYSTEM\ControlSet001\Control\UnitedVideo\CONTROL\VIDEO\{AD8AF7CE-A597-11EE-B4E6-FF0842410EF3}\0001'

# Get the value of the registry key (1 = extended mode, 0 = single mode)
$regValue = (Get-ItemProperty -LiteralPath $registryKeyPath -Name "Attach.ToDesktop")."Attach.ToDesktop"
Write-Host "Attach.ToDesktop: $regValue"

# If extended mode, switch to single mode, and vice versa
if ($regValue -eq 1) {
    DisplaySwitch.exe 1
} else {
    DisplaySwitch.exe 3
}