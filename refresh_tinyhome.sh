#!/usr/bin/env sh

update_tinyhome() {
  while :
  do
    # Call tinyhome to update the static page
    echo "Refreshing tinyhome"
    /app/tinyhome /config/config.csv > index.html
    mv index.html /usr/share/nginx/html/index.html
    # We sleep in the background to make the script interruptible via SIGTERM when running in docker
    sleep "$REFRESH_INTERVAL" &
    wait $!
  done
}

# Start the tinyhome refresher
update_tinyhome &
