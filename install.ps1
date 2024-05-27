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
$global:CONFIG_DIR = $GIT_DIR+"/config"
$global:ASSETS_DIR = $GIT_DIR+"/assets"
$global:SCRIPTS_DIR = $GIT_DIR+"/scripts"

# Insall dependencies
function Dotfiles-Dep {
  $dep_list = @(
    'Microsoft.Powershell'
    'Neovim.Neovim'
    'Starship.Starship'
  )

  foreach($dep in $dep_list) {
    winget list -q $dep | Out-Null
    if ($?) {  
      Write-Warning "$dep installed!"
    } else {
      Write-Host "Installing $dep..."
      winget install --id $dep --source winget
    }
  }
}

# Start script
if (!($SkipDep)) {
  Dotfiles-Dep
} 

$OFS = "`r`n"
$profile_value = @(
  ". $CONFIG_DIR/windows/power-shell/profile.ps1"
  '$ENV:STARSHIP_CONFIG="'+"$CONFIG_DIR/shared/starship/starship.toml"+'"'
)
$profile_value -join "$OFS"

if (!(Test-Path $PROFILE)) {
  Write-Host "Make $PROFILE"
} else {
  Write-Warning "Override $PROFILE"
}

New-Item -Path "$PROFILE" -ItemType File -Force -Value "$profile_value"

#Copy-Item ".\power-shell\profile.ps1" -Destination "$PROFILE" -Force
#Copy-Item ".\starship\starship.toml" -Destination "$env:USERPROFILE\.config\starship.toml" -Force

# Istall fonts
Write-Host "Installing fonts"
.$SCRIPTS_DIR/windows/install-fonts.ps1 "$ASSETS_DIR/shared/fonts"

