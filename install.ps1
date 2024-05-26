#
#
#
#


# Params
param (
  [switch]$SkipDep
)

# Variables setup
$global:GIT_DIR = git rev-parse --show-toplevel
$global:DOTS_DIR = $GIT_DIR+"/dots"
$global:SCRIPTS_DIR = $GIT_DIR+"/scripts"

# Insall dependencies
function Dotfiles-Dep {
  winget list -q Microsoft.Powershell | Out-Null
  if ($?) {  echo "Powershell installed!" } else { winget install --id Microsoft.Powershell --source winget }

  winget list -q Neovim.Neovim | Out-Null
  if ($?) {  echo "Neovim installed!" } else { winget install --id Neovim.Neovim --source winget }

  winget list -q Starship.Starship | Out-Null
  if ($?) {  echo "Starship installed!" } else { winget install --id Starship.Starship --source winget }
}

# Start script

if (!($SkipDep)) {
  Dotfiles-Dep
} 

#if (!(Test-Path $PROFILE)) {
#  Write-Warning "$PROFILE not exist!"
#  New-Item -Path "$PROFILE" -Type "File" -Force
#}


New-Item -Path "$PROFILE" -ItemType File -Force -Value ". $global:GIT_DIR/power-shell/profile.ps1"

#Copy-Item ".\power-shell\profile.ps1" -Destination "$PROFILE" -Force
#Copy-Item ".\starship\starship.toml" -Destination "$env:USERPROFILE\.config\starship.toml" -Force




