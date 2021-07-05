#!/usr/bin/env bash

echo docker build -t test .
docker build -t test .
echo docker run -itp 80:80 -p 443:443 test
docker run -itp 80:80 -p 443:443 test