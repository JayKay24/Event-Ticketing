#!/usr/bin/env bash

command="npm update @jkntickets/common"

cd auth && $command

cd ..

cd expiration && $command

cd ..

cd orders && $command

cd ..

cd payments && $command

cd ..

cd tickets && $command

cd ..
