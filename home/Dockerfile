FROM nginx:alpine
COPY ./home /usr/share/nginx/html
# Create nginx config that uses Railway's PORT
RUN echo 'server { \
    listen $PORT; \
    root /usr/share/nginx/html; \
    index index.html; \
    try_files $uri $uri.html $uri/ =404; \
}' > /etc/nginx/conf.d/default.conf

CMD sh -c "sed -i 's/\$PORT/'$PORT'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"

EXPOSE 80