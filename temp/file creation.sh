#!/bin/sh

nginx_dir=/etc/nginx/
#nginx.conf=/etc/nginx/nginx.conf

if test -z "$PROXY_HOST1"
then
      echo " PROXY_HOST1 ENV is not define! "
else
      cat <<EOF >$nginx_dir/$PROXY_HOST1.conf
location / $PROXY_HOST1 {
proxy_pass '$PROXY_PASS1';
}
EOF && \\
sed -i "s?___PROXY_HOST1___?$PROXY_HOST1?g" /etc/nginx/nginx.conf

fi

if test -z "$PROXY_HOST2"
then
      echo " PROXY_HOST2 ENV is not define! "
else
      cat <<EOF >$nginx_dir/$PROXY_HOST2.conf
location / $PROXY_HOST2 {
proxy_pass '$PROXY_PASS2';
}
EOF
fi

if test -z "$PROXY_HOST3"
then
      echo " PROXY_HOST3 ENV is not define! "
else
      cat <<EOF >$nginx_dir/$PROXY_HOST3.conf
location / $PROXY_HOST3 {
proxy_pass '$PROXY_PASS3';
}
EOF
fi

if test -z "$PROXY_HOST4"
then
      echo " PROXY_HOST4 ENV is not define! "
else
      cat <<EOF >$nginx_dir/$PROXY_HOST4.conf
location / $PROXY_HOST4 {
proxy_pass '$PROXY_PASS4';
}
EOF
fi

if test -z "$PROXY_HOST5"
then
      echo " PROXY_HOST5 ENV is not define! "
else
      cat <<EOF >$nginx_dir/$PROXY_HOST5.conf
location / $PROXY_HOST5 {
proxy_pass '$PROXY_PASS5';
}
EOF
fi

### Server part replace 
sed -i "s?___PROXY_HOST1___?$PROXY_HOST1.conf?g" /etc/nginx/nginx.conf
sed -i "s?___PROXY_HOST2___?$PROXY_HOST2.conf?g" /etc/nginx/nginx.conf
sed -i "s?___PROXY_HOST3___?$PROXY_HOST3.conf?g" /etc/nginx/nginx.conf
sed -i "s?___PROXY_HOST4___?$PROXY_HOST4.conf?g" /etc/nginx/nginx.conf
sed -i "s?___PROXY_HOST5___?$PROXY_HOST5.conf?g" /etc/nginx/nginx.conf
