#!/bin/bash
IMAGE=${1:-'diginc/pi-hole:alpine'}
ALREADY_RUNNING=$(docker ps -a --filter "name=pihole" | grep pihole | awk '{print $1}')

if [ ! -z "$ALREADY_RUNNING" ]; then
  echo "Pi-hole container already running, removing it now..."
  docker stop "$ALREADY_RUNNING"
  echo "Removing container..."
  docker rm "$ALREADY_RUNNING"
fi

# Default ports + daemonized docker container
echo "Launching Pi-hole container..."
docker run -p 53:53/tcp -p 53:53/udp -p 80:80 \
  --cap-add=NET_ADMIN \
  -e ServerIP="0.0.0.0" \
  --name pihole \
-d "$IMAGE"
