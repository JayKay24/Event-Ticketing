#!/usr/bin/env bash

cp $( pwd )/../auth/{.dockerignore,Dockerfile,package.json,package-lock.json,tsconfig.json} .

mkdir src && cd $_

cp -R $( pwd )/../auth/src/{test,app.ts,index.ts} .

