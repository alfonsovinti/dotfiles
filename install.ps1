#### START ELEVATE TO ADMIN #####
param(
    [Parameter(Mandatory=$false)]
    [switch]$shouldAssumeToBeElevated,

    [Parameter(Mandatory=$false)]
    [String]$workingDirOverride
)

if (!(Get-Command 'pwsh' -errorAction SilentlyContinue))
{
    Write-Error "Require PowerShell 7, try to install..."
    winget install --id 'Microsoft.Powershell' --source winget
    exit
}

# If parameter is not set, we are propably in non-admin execution. We set it to the current working directory so that
#  the working directory of the elevated execution of this script is the current working directory
if(-not($PSBoundParameters.ContainsKey('workingDirOverride')))
{
    $workingDirOverride = (Get-Location).Path
}

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# If we are in a non-admin execution. Execute this script as admin
if ((Test-Admin) -eq $false)  {
    if ($shouldAssumeToBeElevated) {
        Write-Output "Elevating did not work :("

    } else {
        #                                                         vvvvv add `-noexit` here for better debugging vvvvv 
        Start-Process pwsh -Verb RunAs -ArgumentList ('-noprofile -file "{0}" -shouldAssumeToBeElevated -workingDirOverride "{1}"' -f ($myinvocation.MyCommand.Definition, "$workingDirOverride"))
    }
    exit
}

Set-Location "$workingDirOverride"
##### END ELEVATE TO ADMIN #####

# Variables setup
$global:GIT_DIR = git rev-parse --show-toplevel
$global:CONFIG_DIR = $GIT_DIR+"/config"
$global:ASSETS_DIR = $GIT_DIR+"/assets"
$global:SCRIPTS_DIR = $GIT_DIR+"/scripts"
$global:USERNAME = $env:UserName
$global:OFS = "`r`n"

# Insall dependencies
$dep_list = @(
  'zig.zig'
  'Git.Git'
  'Neovim.Neovim'
  'Starship.Starship'
  'BurntSushi.ripgrep.MSVC'
  'fzf'
  'LLVM.LLVM'
)

foreach($dep in $dep_list) {
  winget list -q $dep | Out-Null
  if ($?) {  
    Write-Warning "$dep installed!"
  } else {
    write-output "Installing $dep..."
    winget install --id $dep --source winget
  }
}

# Istall fonts
Write-Host "Installing fonts"
.$SCRIPTS_DIR/windows/install-fonts.ps1 "$ASSETS_DIR/shared/fonts"

# install config
$profile_value = @(
  ". $CONFIG_DIR/windows/power-shell/profile.ps1"
  '$ENV:STARSHIP_CONFIG="'+"$CONFIG_DIR/shared/starship/starship.toml"+'"'
)
# ToDo suppress output
$profile_value -join "$OFS"

if (!(Test-Path $PROFILE)) {
  Write-Host "Make $PROFILE"
} else {
  Write-Warning "Override $PROFILE"
}

New-Item -Path "$PROFILE" -ItemType File -Force -Value "$profile_value"
New-Item -ItemType SymbolicLink -Path "C:/Users/$USERNAME/AppData/Local/nvim/init.lua" -Target "$CONFIG_DIR/shared/nvim/init.lua" -Force

#Copy-Item ".\power-shell\profile.ps1" -Destination "$PROFILE" -Force
#Copy-Item ".\starship\starship.toml" -Destination "$env:USERPROFILE\.config\starship.toml" -Force


