$networkProfile = Get-NetConnectionProfile | Where-Object {$_.InterfaceAlias -ne $null} | Select-Object -First 1

# Obtenir l'état du pare-feu pour le profil actif
$firewallStatus = Get-NetFirewallProfile | Where-Object {$_.Name -eq $networkProfile.NetworkCategory} | Select-Object -ExpandProperty Enabled

# Afficher le résultat
if ($firewallStatus) {
    Write-Host "Profil réseau actif: " -ForegroundColor Green
    Write-Host $networkProfile.Name -ForegroundColor Green
    Write-Host "État du pare-feu: Actif" -ForegroundColor Green
} else {
    Write-Host "Profil réseau actif: " -ForegroundColor Red
    Write-Host $networkProfile.Name -ForegroundColor Red
    Write-Host "État du pare-feu: Inactif" -ForegroundColor Red
    [console]::Beep(1000, 500)
}
