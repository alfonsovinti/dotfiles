
winget list -q Microsoft.Powershell | Out-Null
if ($?) {  echo "Powershell installed!" } else { winget install --id Microsoft.Powershell --source winget }

winget list -q Neovim.Neovim | Out-Null
if ($?) {  echo "Neovim installed!" } else { winget install --id Neovim.Neovim --source winget }

winget list -q Starship.Starship | Out-Null
if ($?) {  echo "Starship installed!" } else { winget install --id Starship.Starship --source winget }

if (!(Test-Path $PROFILE)) {
  Write-Warning "$PROFILE not exist!"
  New-Item -path "$PROFILE" -type "file" -force
}
