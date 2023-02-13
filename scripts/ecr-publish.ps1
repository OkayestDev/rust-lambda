$ecr = "931168083238.dkr.ecr.us-east-2.amazonaws.com"

$password = aws ecr get-login-password --profile flipper --region us-east-2;

docker login --username AWS -p $password $ecr

docker-compose -f ./docker-compose.yaml build


docker tag rust-lambda_rust-lambda "$ecr/rust-lambda-image:latest"
docker push "$ecr/rust-lambda-image:latest"