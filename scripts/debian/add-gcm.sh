wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.5.0/gcm-linux_amd64.2.5.0.deb
sudo dpkg -i gcm-linux_amd64.2.5.0.deb

git config --global user.name my-user-name
git config --global user.email my-email@domain

git config --global credential.credentialStore gpg
git config --global credential.helper git-credential-manager

git-credential-manager configure



