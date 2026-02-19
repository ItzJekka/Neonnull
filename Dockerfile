FROM nginx:alpine

COPY . /usr/share/nginx/html

RUN echo 'server { \
    listen $PORT; \
    root /usr/share/nginx/html; \
    index index.html; \
    if ($request_uri ~ ^/index\.html$) { \
        return 301 /; \
    } \
    try_files $uri $uri.html $uri/ =404; \
}' > /etc/nginx/conf.d/default.conf

CMD sh -c "sed -i 's/\$PORT/'$PORT'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"

EXPOSE 80