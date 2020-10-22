#!/usr/bin/env bash

rm ./infra/k8s/{"$1-depl.yaml","$1-mongo-depl.yaml"}
rm -rf $1
