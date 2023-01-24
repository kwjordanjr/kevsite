FROM nginx:stable

# remove the default configuration
RUN rm /etc/nginx/conf.d/default.conf

# copy in our own configuration
COPY /deployment/nginx.conf /etc/nginx/conf.d/default.conf
