cd ./securedrop
make dev
cd ..
docker compose up
docker network connect mydrop_mynet securedrop-dev-0