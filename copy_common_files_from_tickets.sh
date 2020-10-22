#!/usr/bin/env bash
#: Description: copy common files from the tickets service to hasten development
#: . ./copy_common_files_from_tickets.sh $1

# echo parameters here "0: $0" "1: $1" "2: $2"

service_name=tickets
new_service=$1

mkdir $new_service && cd $_

service_path=${HOME}/Desktop/personal_learning/microservices/ticketing/${service_name}

cp ${service_path}/{.dockerignore,Dockerfile,package.json,package-lock.json,tsconfig.json} .

mkdir src && cd $_

cp -R ${service_path}/src/{test,app.ts,index.ts,nats-wrapper.ts} .

cd ..

cp ../infra/k8s/${service_name}-depl.yaml ../infra/k8s/${new_service}-depl.yaml
cp ../infra/k8s/${service_name}-mongo-depl.yaml ../infra/k8s/${new_service}-mongo-depl.yaml

sed -i -e "s/${service_name}/${new_service}/g" ../infra/k8s/${new_service}-depl.yaml
sed -i -e "s/${service_name}/${new_service}/g" ../infra/k8s/${new_service}-mongo-depl.yaml

npm i && docker build -t jaykay24/$service_name .