#!/bin/bash
set -e

# wait for db
host="${DB_HOST:-db}"
port="${DB_PORT:-3306}"
echo "Waiting for DB ${host}:${port}..."
until nc -z $host $port; do
  sleep 1
done
echo "DB is up - running migrations"

python manage.py migrate --noinput || true

# collectstatic optional (no-op if not configured)
# python manage.py collectstatic --noinput

# run gunicorn
exec gunicorn project.wsgi:application --bind 0.0.0.0:8000 --workers 2
