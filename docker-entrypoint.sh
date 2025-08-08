#!/bin/bash

# Only copy the Laravel scaffold if artisan doesn't exist
if [ ! -f /app/artisan ]; then
  echo "Laravel not found in /app. Copying scaffold..."
  cp -r /tmp/laravel/. /app
fi

cd /app

# If Laravel exists, run it
if [ -f artisan ]; then
  php artisan serve --host=0.0.0.0 --port=8000
else
  echo "Laravel not installed and artisan missing"
  tail -f /dev/null
fi
