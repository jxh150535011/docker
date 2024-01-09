alias docker='podman'
name="xxx"
tag="1.0.0"

# 优先清理容器 不然实例可能没有目标镜像名称
ids=$(docker ps -a -f ancestor=$name:$tag -q)
if [ $ids ] ; then
  docker rm -f $ids
fi
docker rmi -f $name:$tag
docker build -f ./Dockerfile  -t $name:$tag .
docker run -it --name $name -d $name:$tag
