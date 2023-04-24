docker build -t projectapp:v1 .
docker images
docker tag projectapp:v1 joeben21/prod:v1
echo $docker | docker login --username joeben21 --password-stdin
docker push joeben21/prod:v1

scp -o StrictHostKeyChecking=no -i $Key docker-compose.yml ubuntu@13.233.172.93:/home/ubuntu/
ssh -o StrictHostKeyChecking=no -i $Key ubuntu@13.233.172.93 << EOF

echo $docker | docker login --username joeben21 --password-stdin
docker-compose up -d
