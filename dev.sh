
docker build -f dev.dockerfile -t rep-manager . &&
docker run -p 3000:3000 -v $(pwd):/rails rep-manager

