#!/usr/bin/env bash


# Stop the application.
docker-compose down --rmi all --volumes --remove-orphans --timeout 30

# Remove the dandling containers, images and volumes.
# Do not show errors, when no dandling object exist.
docker container rm $(docker container ls -aq --filter status=exited) \
  2>/dev/null;
docker image rm $(docker images -f "dangling=true" -q) 2>/dev/null;
docker volume rm $(docker volume ls -f "dangling=true" -q) 2>/dev/null;
