#/bin/bash

sleep 1

echo build starting nginx config


echo replacing ___NGINX_PORT___/$NGINX_PORT
echo replacing ___PROXY_PASS___/$PROXY_PASS
echo replacing ___PROXY_HOST1___/$PROXY_HOST1
echo replacing ___PROXY_HOST2___/$PROXY_HOST2
echo replacing ___PROXY_HOST3___/$PROXY_HOST3
echo replacing ___PROXY_HOST4___/$PROXY_HOST4
echo replacing ___PROXY_HOST5___/$PROXY_HOST5

### Nginx port replacment part
sed -i "s/___NGINX_PORT___/$NGINX_PORT/g" /etc/nginx/nginx.conf

### Proxy pass and upstream name replacment part 
sed -i "s/___PROXY_PASS___/$PROXY_PASS/g" /etc/nginx/nginx.conf

### Server part replace 
sed -i "s/___PROXY_HOST1___/$PROXY_HOST1/g" /etc/nginx/nginx.conf
sed -i "s/___PROXY_HOST2___/$PROXY_HOST2/g" /etc/nginx/nginx.conf
sed -i "s/___PROXY_HOST3___/$PROXY_HOST3/g" /etc/nginx/nginx.conf
sed -i "s/___PROXY_HOST4___/$PROXY_HOST4/g" /etc/nginx/nginx.conf
sed -i "s/___PROXY_HOST5___/$PROXY_HOST5/g" /etc/nginx/nginx.conf


### Checking part
cat /etc/nginx/nginx.conf

# if [ -z "$NGINX_PORT" ]; then
#     echo "Need to set NGINX_PORT"
#     exit 1
# fi  
### Nginx start
nginx -g 'daemon off;'