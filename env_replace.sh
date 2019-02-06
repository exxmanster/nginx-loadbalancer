

echo build starting NGINX config
echo

### Check NGINX PORT
echo replacing ___NGINX_PORT___/$NGINX_PORT

### Check PROXY_PASS
echo replacing ___PROXY_PASS1___/${PROXY_PASS1}
echo replacing ___PROXY_PASS2___/${PROXY_PASS2}
echo replacing ___PROXY_PASS3___/${PROXY_PASS3}
echo replacing ___PROXY_PASS4___/${PROXY_PASS4}
echo replacing ___PROXY_PASS5___/${PROXY_PASS5}

### Check PROXY_HOST 
echo replacing ___PROXY_HOST1___/$PROXY_HOST1
echo replacing ___PROXY_HOST2___/$PROXY_HOST2
echo replacing ___PROXY_HOST3___/$PROXY_HOST3
echo replacing ___PROXY_HOST4___/$PROXY_HOST4
echo replacing ___PROXY_HOST5___/$PROXY_HOST5

### Nginx port replacment part
    sed -i "s?___NGINX_PORT___?$NGINX_PORT?g" /etc/nginx/nginx.conf

### Proxy pass and upstream name replacment part 
sed -i "s?___PROXY_PASS1___?${PROXY_PASS1}?g" /etc/nginx/nginx.conf
sed -i "s?___PROXY_PASS2___?${PROXY_PASS2}?g" /etc/nginx/nginx.conf
sed -i "s?___PROXY_PASS3___?${PROXY_PASS3}?g" /etc/nginx/nginx.conf
sed -i "s?___PROXY_PASS4___?${PROXY_PASS4}?g" /etc/nginx/nginx.conf
sed -i "s?proxy_pass" ""/"'___PROXY_PASS5___'?proxy_pass" ""/"'${PROXY_PASS5}'?g" /etc/nginx/nginx.conf

### Server part replace 
sed -i "s?___PROXY_HOST1___?$PROXY_HOST1?g" /etc/nginx/nginx.conf
sed -i "s?___PROXY_HOST2___?$PROXY_HOST2?g" /etc/nginx/nginx.conf
sed -i "s?___PROXY_HOST3___?$PROXY_HOST3?g" /etc/nginx/nginx.conf
sed -i "s?___PROXY_HOST4___?$PROXY_HOST4?g" /etc/nginx/nginx.conf
sed -i "s?___PROXY_HOST5___?$PROXY_HOST5?g" /etc/nginx/nginx.conf



###Debug
echo
echo
echo
cat /etc/nginx/nginx.conf
echo
echo
echo
### Nginx start
nginx -g 'daemon off;'