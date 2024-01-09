alias docker='podman'
name="xxx"
tag="1.0.0"

docker build -f ./Dockerfile  -t $name:$tag .