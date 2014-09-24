FROM dockerimages/nave:latest
ENV DOCKER_BUILD docker build -t dockerimages/blog_dspeed git://github.com/dockerimages/harp-git
ENV DOCKER_RUN docker run -d --restart=always --name=WEB_blog.dspeed.eu -v /var/www:/var/www dockerimages/docker-harp
ENV NODE_ENV production
WORKDIR ["/var/www"]
RUN nave use stable npm install -g harp
RUN chmod +x /usr/bin/nave
CMD nave use stable /.nave/installed/0.10.32/bin/harp server /var/www --port 80
