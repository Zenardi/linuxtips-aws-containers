# Push Registry to ECR
```shell
aws ecr ls
export ECR=""
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin $ECR
# docker pull fidelissauro/chip:v2
docker tag fidelissauro/chip:v2 $ECR/linux-tips-ecs-cluster/chip:latest
docker push $ECR/linux-tips-ecs-cluster/chip:latest
```