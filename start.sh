#!/usr/bin/env bash
# IMPORTANT: RUN INSIDE WSL OR LINUX 
# MUST BE UNMOUNTED DIR
# OTHERWISE ISSUES
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/securedrop"

TARGET_CONTAINER="securedrop-dev-0"

nohup stdbuf -oL -eL make dev 2>&1 | tee -a make-dev.log >/dev/null &
while true; do
    if docker container list --format '{{.Names}}' | grep -q "^${TARGET_CONTAINER}$"; then
        echo "Container ${TARGET_CONTAINER} is running."
        break
    fi

    echo "Container not found. Looping..."

    echo "Waiting before checking again..."
    sleep 2
done

cd "$SCRIPT_DIR"


 # i think this is just parentdir_projectnetwork
TARGET_NETWORK="securedrop_mynet"
nohup stdbuf -oL -eL docker compose up 2>&1 | tee -a ./make-dev-compose.log  >/dev/null &
while true; do
    if docker network list --format '{{.Name}}' | grep -q "^${TARGET_NETWORK}$"; then
        echo "Net ${TARGET_NETWORK} is running."
        break
    fi

    echo "Net not found..."

    echo "Waiting before checking again..."
    sleep 2
done
docker network connect mydrop_mynet securedrop-dev-0
