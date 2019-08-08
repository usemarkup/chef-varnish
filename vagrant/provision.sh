#!/bin/bash

yum install epel-release -y
yum install nginx -y

cat << EOF > /etc/nginx/nginx.conf
events {
    worker_connections  1024;
}


http {
    server {
        listen       8080 default_server;
        listen       [::]:8080 default_server;
        server_name  _;
        root         /usr/share/nginx/html;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        location / {
        }

        location /120-sec-cache.html {
            add_header Cache-Control "public, s-maxage=120";
        }

        location /1-hour-cache.html {
            add_header Cache-Control "public, s-maxage=3600";
        }

        error_page 404 /404.html;
            location = /40x.html {
        }

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }
    }
}
EOF

cat << EOF > /usr/share/nginx/html/120-sec-cache.html
<h1>120 second cache response</h1>
EOF

cat << EOF > /usr/share/nginx/html/1-hour-cache.html
<h1>1 hour cache response</h1>
EOF

systemctl restart nginx
