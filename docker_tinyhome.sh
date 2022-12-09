#!/usr/bin/env sh

refresh_tinyhome() {
  while true; do
    echo "refresh_tinyhome: Started"
    temp_file=$(mktemp)
    if /app/tinyhome /config/config.csv > "$temp_file"; then
      if [ ! -f "$temp_file" ]; then
        mv "$temp_file" /usr/share/nginx/html/index.html
        echo "refresh_tinyhome: Succeeded"
      else
        echo "refresh_tinyhome: Failed"
      fi
    else
      echo "refresh_tinyhome: Failed"
    fi
    echo "refresh_tinyhome: Sleep for $REFRESH_INTERVAL"
    sleep "$REFRESH_INTERVAL"
  done
}

refresh_tinyhome &
