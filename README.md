## PURGE NONE IMAGES
> docker rmi $(docker images -f “dangling=true" -q) --force
## BUILD IMAGE
> docker build --no-cache -t mle-dockerized-aspnet-core .
## RUN IMAGE
> docker run -it -p 8080:8080 --rm --name helloworld mle-dockerized-aspnet-core