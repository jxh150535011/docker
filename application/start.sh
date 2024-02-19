alias docker='podman'
name="xxx"
tag="1.0.0"

# 优先清理容器 不然实例可能没有目标镜像名称
ids=$(docker ps -a -f ancestor=$name:$tag -q)
if [ $ids ] ; then
  docker rm -f $ids
fi
# 如果不增加 每次改动 都会生成新的镜像 但是先进行了删除会导致镜像构建无法有效利用缓存
# docker rmi -f $name:$tag

oimageid=$(docker images -q --filter=reference="$name:$tag" | head -n 1)
# | tee build.log
docker build -f ./Dockerfile  -t $name:$tag .
nimageid=$(docker images -q --filter=reference="$name:$tag" | head -n 1)

# # 所以采用先获取到上次的镜像id 
# if [ $oimageid ] && [ $oimageid != $nimageid ] ; then
#   docker rmi -f $oimageid
# fi
# 删除所有为none的镜像
docker rmi -f $(docker images -q --filter "dangling=true")
docker run -p 3000:3000 -it --name $name -d $name:$tag


