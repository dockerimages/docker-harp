FROM dockerimages/nave:latest
ENV DOCKER_BUILD docker build -t dockerimages/blog_dspeed git://github.com/dockerimages/harp-git
ENV DOCKER_RUN docker run -d --restart=always --name=WEB_blog.dspeed.eu --env HAPROXY_DOMAIN=blog.dspeed.eu --env HAPROXY_PORT=80 --env REPO=https://github.com/DirektSPEED/blog_dspeed  dockerimages/harp-git
ENV REPO "https://github.com/dockerimages/testpage"
ENV NODE_ENV production
WORKDIR ["/var/www"]
RUN nave use stable npm install -g harp
RUN git clone $REPO /var/www
ADD init-harp-git /usr/bin/init-harp-git
RUN chmod +x /usr/bin/init-harp-git /usr/bin/nave
CMD nave use stable /.nave/installed/0.10.32/bin/harp server /var/www --port 80
