FROM alpine:3.8

# Install nginx and remove cache  
RUN apk add --update nginx vim && rm -rf /var/cache/apk/*

# Copy files
COPY load_balancer_v2.conf /etc/nginx/nginx.conf
COPY env_replace.sh /env_replace.sh

# Make script executable and launching all stuff 
ENTRYPOINT chmod a+x env_replace.sh && ./env_replace.sh ; sh



###################################################
######################## Debug ####################
###################################################
#CMD ["nginx", "-g", "daemon off;"] 
#ENTRYPOINT chmod a+x env_replace.sh
#EXPOSE 8888
### You can uncoment this part and set your values here!!! ####
ENV NGINX_PORT 8888
ENV PROXY_PASS1 http://192.168.88.59
ENV PROXY_PASS2 http://192.168.88.59
ENV PROXY_PASS3 http://192.168.88.59
#ENV PROXY_PASS4 http://192.168.88.59
ENV PROXY_PASS5 http://192.168.88.59
ENV PROXY_HOST1 192.168.88.61:10001
ENV PROXY_HOST2 192.168.88.61:10002
ENV PROXY_HOST3 192.168.88.61:10003
#ENV PROXY_HOST4 192.168.88.61:10004
#ENV PROXY_HOST5 192.168.88.61:10005