#/bin/bash



# ########## ENV Check ##########
if test -z "$NGINX_PORT" 
then
      echo "\$NGINX_PORT ENV is not define! ERORR!!!"
else
      echo "\$NGINX_PORT ENV is OK!"
fi

if test -z "$PROXY_PASS" 
then
      echo "\$PROXY_PASS ENV is not define! ERORR!!!"
else
      echo "\$PROXY_PASS ENV is OK!"
fi

if test -z "$PROXY_HOST1" 
then
      echo "\$PROXY_HOST1 ENV is not define! ERORR!!!"
else
      echo "\$PROXY_HOST1 ENV is OK!"
fi


# sleep 1

# echo build starting NGINX config

for c in {1..5}
    do
        
        echo replacing ___PROXY_PASS"$c"___/$PROXY_PASS$c
        #echo replacing ___PROXY_HOST"$c"___/$PROXY_HOST"$c"

    done    


echo replacing ___NGINX_PORT___/$NGINX_PORT





### Nginx port replacment part
sed -i "s/___NGINX_PORT___/$NGINX_PORT/g" /etc/nginx/nginx.conf




 ### Proxy pass and upstream name replacment part 

    
        sed -i "s/___PROXY_PASS"$i"___/{$PROXY_PASS"$j"}/g" /etc/nginx/nginx.conf
 




# sed -i "s/___PROXY_PASS___/$PROXY_PASS/g" /etc/nginx/nginx.conf

# ### Server part replace 
# sed -i "s/___PROXY_HOST1___/$PROXY_HOST1/g" /etc/nginx/nginx.conf
# sed -i "s/___PROXY_HOST2___/$PROXY_HOST2/g" /etc/nginx/nginx.conf
# sed -i "s/___PROXY_HOST3___/$PROXY_HOST3/g" /etc/nginx/nginx.conf
# sed -i "s/___PROXY_HOST4___/$PROXY_HOST4/g" /etc/nginx/nginx.conf
# sed -i "s/___PROXY_HOST5___/$PROXY_HOST5/g" /etc/nginx/nginx.conf

### Nginx start
nginx -g 'daemon off;'
cat /etc/nginx/nginx.conf