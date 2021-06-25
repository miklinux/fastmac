# disable spotlight indexing
sudo mdutil -i off -a

# configure docker
brew install docker docker-machine
brew install --cask virtualbox
mkdir -p ~/.docker/machine/cache
curl -Lo ~/.docker/machine/cache/boot2docker.iso https://github.com/boot2docker/boot2docker/releases/download/v18.09.1-rc1/boot2docker.iso
docker-machine create --driver virtualbox default
cat << EOF > ~/.bashrc
#!/bin/bash
eval "\$(docker-machine env default)"
EOF

# configure e2e setup script
cat << EOF > ~/e2e-setup.sh
#!/bin/bash
git config --global credential.helper store
read -p "GitHub username: " GIT_USER
read -p "GitHub token: " GIT_TOKEN
echo "https://\${GIT_USER}:\${GIT_TOKEN}@github.com" > ~/.git-credentials
chmod 600 ~/.git-credentials
git clone https://github.com/miklinux/docker-exads-e2e.git
cd docker-exads-e2e
GIT_MODE=http ./build.sh
EOF
chmod +x ~/e2e-setup.sh
