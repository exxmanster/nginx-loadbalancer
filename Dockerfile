FROM alpine:3.8

# Install nginx and remove cache  
RUN apk add --update nginx && rm -rf /var/cache/apk/*



# Copy files
COPY load_balancer.conf /etc/nginx/nginx.conf
COPY env_replace.sh /env_replace.sh

# Make script executable and launching all stuff 
ENTRYPOINT chmod a+x env_replace.sh && ./env_replace.sh



###################################################
######################## Debug ####################
###################################################
#CMD ["nginx", "-g", "daemon off;"] 
#ENTRYPOINT [ "sh" ]
#EXPOSE 8888
### ENV replacment test
ENV NGINX_PORT 8888
ENV PROXY_PASS 192.168.88.59
ENV PROXY_HOST1 192.168.88.61:10001
ENV PROXY_HOST2 192.168.88.61:10002
ENV PROXY_HOST3 192.168.88.61:10003
ENV PROXY_HOST4 192.168.88.61:10004
ENV PROXY_HOST5 192.168.88.61:10005
