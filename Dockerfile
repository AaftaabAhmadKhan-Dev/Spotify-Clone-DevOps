#1 A readymade box that already runs Nginx web server inside it
FROM nginx:1.29-alpine

LABEL org.opencontainers.image.title="Spotify Clone DevOps" \
      org.opencontainers.image.description="Production-ready Spotify Clone built with modern DevOps practices" \
      org.opencontainers.image.authors="Aaftaab Ahmad Khan" \
      org.opencontainers.image.source="https://github.com/AaftaabAhmadKhan-Dev/Spotify-Clone-DevOps" \
      org.opencontainers.image.licenses="MIT"

# Patch all os packages to latest security fixes
RUN apk update && apk upgrade --no-cache

#2 Copy all out website files into the folder where Nginx looks for web pages
COPY . /usr/share/nginx/html

#3 Tell docker that this box serves visitors on door(port) 80
EXPOSE 80

#4. Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]

