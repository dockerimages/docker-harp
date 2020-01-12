docker-harp
===========

Dockerimage Running Harp

Usage
-----

To serve current working directory:

    docker run --rm -v $(pwd):/var/www -p 8080:80 dockerimages/harp
