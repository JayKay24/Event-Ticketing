#!/usr/bin/env bash
#: Description: copy common files from the auth service to hasten development

cp $( pwd )/../auth/{.dockerignore,Dockerfile,package.json,package-lock.json,tsconfig.json} .

mkdir src && cd $_

cp -R $( pwd )/../auth/src/{test,app.ts,index.ts} .

