# Use the official Nginx image from Docker Hub
FROM nginx:latest

# Install curl
RUN apt-get update && apt-get install -y curl

# Copy the viewer's static files to the Nginx html directory
COPY archViewer.html /usr/share/nginx/html/
COPY archViewer.js /usr/share/nginx/html/
COPY lib /usr/share/nginx/html/lib/

# Copy the nginx configuration template
COPY nginx.conf /etc/nginx/nginx.conf.template

# When the container starts, substitute the environment variables in the nginx configuration
# and start nginx
CMD ["/bin/bash", "-c", "envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"]
