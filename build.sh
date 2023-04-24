ls -al
docker rmi $(docker images -a -q)
docker build -t projectapp:v1 .
docker images
docker tag  projectapp:v1 joeben21/dev:v1
echo $docker | docker login --username joeben21 --password-stdin
docker push joeben21/dev:v1
