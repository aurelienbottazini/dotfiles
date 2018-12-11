#!/bin/sh
docker stop $(docker ps -q); shutdown -h now
