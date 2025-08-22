#!/bin/bash
IMAGE="myapp:$(date +%Y%m%d%H%M)"
REPO="myrepo/$IMAGE"

docker build -t $IMAGE .
docker tag $IMAGE $REPO
docker push $REPO

echo "✅ Образ $REPO отправлен в registry"
