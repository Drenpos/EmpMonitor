#!/bin/sh
set -e

# # Copy .env if it does not exist
# if [ ! -f .env ]; then
#     cp sample_docker.env .env
# fi

# Install PHP dependencies (optional: only if vendor is not present)
if [ ! -d vendor ]; then
    composer install --no-interaction --prefer-dist --optimize-autoloader
fi

# Start Laravel development server
exec php artisan serve --host=0.0.0.0 --port=8000 