#!/usr/bin/env bash

#       __  ___      ___
#      /""\|"  \    /"  |
#     /    \\   \  //  /    Alfonso Vinti (alfonsovinti)
#    /' /\  \\\  \/. ./     https://www.alfonsovinti.it
#   //  __'  \\.    //      https://github.com/alfonsovinti
#  /   /  \\  \\\   /
# (___/    \___)\__/
#
# check-installed-npm-packages.sh

packages=(
    "typescript-language-server"
    "typescript"
    "vscode-json-languageserver"
    "bash-language-server"
    "vscode-css-languageserver-bin"
    "vscode-html-languageserver-bin"
    "unified-language-server"
    #"intelephense"
    "pyright"
    "yaml-language-server"
)

_isInstalled() {
    package="$1";
    check="$(sudo npm list -g "${package}" | grep "${package}")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

# The packages that are not installed will be added to this array.
toInstall=();

for package in "${packages[@]}"; do
    # If the package IS installed:
    if [[ $(_isInstalled "${package}") == 0 ]]; then
        echo "[${package}] is already installed.";
    fi;

    # If the package is NOT installed:
    if [[ $(_isInstalled "${package}") == 1 ]]; then
        toInstall+=("${package}");
        #echo "[${package}] is not installed.";
    fi;
done

# If no packages were added to the "${toInstall[@]}" array,
#     don't do anything and stop this function.
if [[ "${toInstall[@]}" == "" ]] ; then
    echo "All packages are already installed.";
else
    printf -v toInstallList "%s " "${toInstall[@]}";
    # Otherwise, install all the packages that have been added to the "${toInstall[@]}" array.
    printf "\nPackages not installed:\n%s\n\n" "${toInstallList}";
    sudo npm i -g "${toInstall[@]}";
fi;
