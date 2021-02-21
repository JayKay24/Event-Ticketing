#!/usr/bin/env bash
#: Description: copy common files from the tickets service to hasten development
#: . ./copy_common_files_from_tickets.sh $1

# echo parameters here "0: $0" "1: $1" "2: $2"

service_name=tickets
new_service=$1
docker_id=jaykay24
db_type=$2

if [[ -z $new_service ]];
then
  echo "Please provide a service name"
  exit 1
fi

if [[ -z $db_type ]];
then
  echo "Please provide a database type"
  exit 1
fi

mkdir $new_service

top_level=$( pwd )
service_path="$top_level/$service_name"

cp -n $service_path/{.dockerignore,Dockerfile,package.json,tsconfig.json} $new_service

src_dir="$new_service/src"

mkdir $src_dir

cp -Rn $service_path/src/{index.ts,nats-wrapper.ts,__mocks__,test} $src_dir

cp -n $top_level/infra/k8s/${service_name}-depl.yaml $top_level/infra/k8s/${new_service}-depl.yaml
cp -n $top_level/infra/k8s/${service_name}-mongo-depl.yaml $top_level/infra/k8s/${new_service}-${db_type}-depl.yaml

sed -i -e "s/${service_name}/${new_service}/g" $top_level/infra/k8s/${new_service}-depl.yaml
sed -i -e "s/${service_name}/${new_service}/g" $top_level/infra/k8s/${new_service}-${db_type}-depl.yaml

if [[ $db_type == "redis" ]];
then
  sed -i -e "s/mongo/redis/g" $top_level/infra/k8s/${new_service}-${db_type}-depl.yaml
  sed -i -e "s/27017/6379/g" $top_level/infra/k8s/${new_service}-${db_type}-depl.yaml
fi


cd $new_service

npm i && docker build -t $docker_id/$new_service . && docker push $docker_id/$new_service
