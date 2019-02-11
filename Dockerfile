FROM alpine:3.8

# Install nginx and remove cache  
RUN apk add --update nginx vim && rm -rf /var/cache/apk/* && mkdir /etc/nginx/includes



# Copy files
COPY load_balancer_v2.conf /etc/nginx/nginx.conf
COPY env_replace.sh /env_replace.sh

# Make script executable and launching all stuff 
ENTRYPOINT chmod a+x env_replace.sh && ./env_replace.sh


###################################################
######################## Debug ####################
###################################################
#CMD ["nginx", "-g", "daemon off;"] 
#ENTRYPOINT chmod a+x env_replace.sh
#EXPOSE 8888
### You can uncoment this part and set your values here!!! ####
