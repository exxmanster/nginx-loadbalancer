include_dir=/etc/nginx/includes/


echo build starting NGINX config
echo
echo
echo

sed -i "s/___NGINX_PORT___/$NGINX_PORT/g" /etc/nginx/nginx.conf

if test -z "$PROXY_HOST1"

then
      echo " PROXY_HOST1 ENV is not define! "
else
      cat <<EOF >"$include_dir"/$PROXY_HOST1
location /$PROXY_HOST1 {
proxy_pass '$PROXY_PASS1';
}
EOF
sed -i "21i include $include_dir$PROXY_HOST1;" /etc/nginx/nginx.conf
fi

if test -z "$PROXY_HOST2"
then
      echo " PROXY_HOST2 ENV is not define! "
else
      cat <<EOF >"$include_dir"/$PROXY_HOST2
location /$PROXY_HOST2 {
proxy_pass '$PROXY_PASS2';
}
EOF
sed -i "22i include "$include_dir"$PROXY_HOST2;" /etc/nginx/nginx.conf
fi

if test -z "$PROXY_HOST3"
then
      echo " PROXY_HOST3 ENV is not define! "
else
      cat <<EOF >"$include_dir"/$PROXY_HOST3
location /$PROXY_HOST3 {
proxy_pass '$PROXY_PASS3';
}
EOF
sed -i "23i include "$include_dir"$PROXY_HOST3;" /etc/nginx/nginx.conf
fi

if test -z "$PROXY_HOST4"
then
      echo " PROXY_HOST4 ENV is not define! "
else
      cat <<EOF >"$include_dir"/$PROXY_HOST4
location /$PROXY_HOST4 {
proxy_pass '$PROXY_PASS4';
}
EOF
sed -i "24i include "$include_dir"$PROXY_HOST4;" /etc/nginx/nginx.conf
fi

if test -z "$PROXY_HOST5"
then
      echo " PROXY_HOST5 ENV is not define! "
else
      cat <<EOF >"$include_dir"/$PROXY_HOST5
location /$PROXY_HOST5 {
proxy_pass '$PROXY_PASS5';
}
EOF
sed -i "25i \include "$include_dir"$PROXY_HOST5;" /etc/nginx/nginx.conf
fi


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