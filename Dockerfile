FROM nginx:1.23.2-alpine

# Copy static css and fonts to nginx site
COPY css /usr/share/nginx/html/css
COPY webfonts /usr/share/nginx/html/webfonts

# Copy example config
COPY config.csv /config/

# Copy tinyhome app
COPY tinyhome /app/tinyhome
RUN chmod +x /app/tinyhome

# Copy entrypoint script
COPY docker_tinyhome.sh /docker-entrypoint.d/
RUN chmod +x /docker-entrypoint.d/docker_tinyhome.sh

# Environment variable for refresh frequency
ENV REFRESH_INTERVAL=360

