## Build docker image
```bash
docker build -f dev.dockerfile -t rep-manager .
```

## Run container
```bash
docker run -p 3000:3000 -v $(pwd):/rails rep-manager
```

If there's any error running the container, you need to run the following command to allow docker to execute the entrypoint file:
```bash
chmod +x bin/docker-dev-entrypoint
```

## Rebuilding the image
Give permission for running the `dev.sh` file
```bash
chmod +x dev.sh
```

Rebuild the image with the following command:
```bash
./dev.sh
```
