# disable spotlight indexing
sudo mdutil -i off -a

# configure docker
brew install docker docker-machine
brew install --cask virtualbox
curl -Lo ~/.docker/machine/cache/boot2docker.iso https://github.com/boot2docker/boot2docker/releases/download/v18.09.1-rc1/boot2docker.iso
docker-machine create --driver virtualbox default
eval "$(docker-machine env default)"
